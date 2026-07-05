const db = require("../config/db");
const { generateCredentials } = require("../utils/generateCredentials");
const { hashPassword } = require("../utils/passwordUtils");

const getAllEmployees = async ({ page, limit, sortBy, sortOrder, search }) => {
  const offset = (page - 1) * limit;

  // Whitelist sort columns to prevent SQL injection
  const sortColumn = ['name', 'status', 'username', 'id', 'balance'].includes(sortBy) ? sortBy : 'id';
  const order = sortOrder === 'ASC' ? 'ASC' : 'DESC';

  let whereClause = 'WHERE r.role_en != ? OR r.role_en IS NULL';
  const params = ['admin'];

  if (search) {
    whereClause += ' AND (e.name LIKE ? OR e.username LIKE ?)';
    params.push(`%${search}%`, `%${search}%`);
  }

  const listQuery = `
    SELECT 
      e.name,
      e.status,
      e.username,
      e.id,
      e.balance,
      d.name_ar as department_ar,
      d.name_en as department_en,
      m.name as managerName,
      r.role_ar,
      r.role_en
    FROM employees e
    LEFT JOIN departments d ON e.department_id = d.id
    LEFT JOIN employees m ON e.direct_manager_id = m.id
    LEFT JOIN roles r ON e.role_id = r.id
    ${whereClause}
    ORDER BY e.${sortColumn} ${order}
    LIMIT ? OFFSET ?
  `;

  const countQuery = `
    SELECT COUNT(*) as total
    FROM employees e
    LEFT JOIN roles r ON e.role_id = r.id
    ${whereClause}
  `;

  const [rows] = await db.query(listQuery, [...params, limit, offset]);
  const [countResult] = await db.query(countQuery, params);
  const total = countResult[0]?.total || 0;

  return { rows, total };
};

const getEmployeeById = async (id) => {
  const [rows] = await db.query(`
    SELECT 
      e.*, 
      d.name_ar as department_ar,
      d.name_en as department_en,
      m.name as managerName,
      r.role_ar,
      r.role_en,
      ed.id as document_id,
      ed.document_name,
      ed.document_url,
      ed.created_at as document_created_at,
      ed.uploaded_by
    FROM employees e
    LEFT JOIN departments d ON e.department_id = d.id
    LEFT JOIN employees m ON e.direct_manager_id = m.id
    LEFT JOIN roles r ON e.role_id = r.id
    LEFT JOIN employee_documents ed ON e.id = ed.employee_id
    WHERE e.id = ? 
  `, [id]);

  if (rows.length === 0) return null;

  const employee = rows[0];

  // Extract documents and remove duplicates
  const documents = [];
  const documentIds = new Set();

  rows.forEach(row => {
    if (row.document_id && !documentIds.has(row.document_id)) {
      documentIds.add(row.document_id);
      documents.push({
        id: row.document_id,
        document_name: row.document_name,
        document_url: row.document_url,
        created_at: row.document_created_at,
        uploaded_by: row.uploaded_by
      });
    }
  });

  // Remove document fields from employee object
  const cleanEmployee = { ...employee };
  delete cleanEmployee.document_id;
  delete cleanEmployee.document_name;
  delete cleanEmployee.document_url;
  delete cleanEmployee.document_created_at;
  delete cleanEmployee.uploaded_by;

  return {
    ...cleanEmployee,
    departmentId: cleanEmployee.department_id,
    branchId: cleanEmployee.branch_id,
    directManagerId: cleanEmployee.direct_manager_id,
    roleId: cleanEmployee.role_id,
    employeeNumber: cleanEmployee.job_id,
    identityNumber: cleanEmployee.eId,
    passportNumber: cleanEmployee.passport,
    phoneNumber: cleanEmployee.phone,
    residenceExpiryDate: cleanEmployee.residence_end_date,
    residenceEndDate: cleanEmployee.residence_end_date,
    identityExpiryDate: cleanEmployee.id_end_date,
    idEndDate: cleanEmployee.id_end_date,
    passportExpiryDate: cleanEmployee.passport_end_date,
    passportEndDate: cleanEmployee.passport_end_date,
    workPermitExpiryDate: cleanEmployee.labor_card_end_date,
    laborCardEndDate: cleanEmployee.labor_card_end_date,
    insuranceExpiryDate: cleanEmployee.health_insurance_end_date,
    healthInsuranceEndDate: cleanEmployee.health_insurance_end_date,
    contractExpiryDate: cleanEmployee.contract_end_date,
    contractEndDate: cleanEmployee.contract_end_date,
    basicSalary: cleanEmployee.basic_salary,
    anotherAllowance: cleanEmployee.another_allowance,
    housingAllowance: cleanEmployee.housing_allowance,
    transportationAllowance: cleanEmployee.transportation_allowance,
    firstDayOfWork: cleanEmployee.first_day_of_work,
    payType: cleanEmployee.pay_type,
    accountNumber: cleanEmployee.account_number,
    bankName: cleanEmployee.bank_name,
    contractType: cleanEmployee.contract_type,
    registrationExpiryDate: cleanEmployee.registration_expiration_date,
    registrationExpirationDate: cleanEmployee.registration_expiration_date,
    hourlyRate: cleanEmployee.hourly_rate,
    documents
  };
};

const createEmployee = async (employee) => {
  const {
    name,
    roleId,
    email,
    identityNumber,
    passportNumber,
    departmentId,
    directManagerId = null,
    identityExpiryDate,
    passportExpiryDate,
    workPermitExpiryDate,
    insuranceExpiryDate,
    contractExpiryDate,
    basicSalary = 0,
    branchId,
    residenceExpiryDate,
    status = 'active',
    accountCloseDate,
    anotherAllowance = 0,
    accountActivationDate,
    firstDayOfWork,
    housingAllowance = 0,
    transportationAllowance = 0,
    payType,
    iban,
    accountNumber,
    bankName,
    contractType,
    registrationExpirationDate,
    hourlyRate = 0
  } = employee;

  const phoneNumber = employee.phoneNumber || employee.phone || null;

  let username = employee.username;
  if (!username || username.trim() === '') {
    username = Math.floor(100000 + Math.random() * 900000).toString();
  }

  let employeeNumber = employee.employeeNumber || employee.job_id;
  if (!employeeNumber || String(employeeNumber).trim() === '') {
    employeeNumber = 'EMP' + Date.now().toString().slice(-6) + Math.floor(10 + Math.random() * 90);
  }

  const normalizeDate = (date) => {
    if (date === '' || date === undefined || date === null) return null;
    return date;
  };

  const normalizeValue = (value) => {
    if (value === '' || value === undefined) return null;
    return value;
  };

  let password;
  let plainPassword = null;
  if (employee.password && employee.password !== '********') {
    plainPassword = employee.password;
    password = await hashPassword(plainPassword);
  } else {
    const credentials = await generateCredentials();
    plainPassword = credentials.password;
    password = await hashPassword(plainPassword);
  }

  // تم تصحيح ترتيب المصفوفة لتطابق الأعمدة تماماً
  const [result] = await db.query(`
    INSERT INTO employees (
      name, username, password, role_id, job_id, email, eId, passport, phone, department_id, direct_manager_id,
      residence_end_date, id_end_date, passport_end_date, labor_card_end_date,
      health_insurance_end_date, contract_end_date, basic_salary, branch_id, status,
      account_close_date, another_allowance, account_activation_date, first_day_of_work,
      housing_allowance, transportation_allowance, pay_type, iban, account_number, bank_name, contract_type,
      registration_expiration_date, hourly_rate
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `, [
    name,
    username,
    password,
    normalizeValue(roleId),
    normalizeValue(employeeNumber),
    email,
    normalizeValue(identityNumber),
    normalizeValue(passportNumber),
    phoneNumber, // تم نقله إلى الترتيب الصحيح المطابق لعمود phone
    normalizeValue(departmentId),
    normalizeValue(directManagerId),
    normalizeDate(residenceExpiryDate),
    normalizeDate(identityExpiryDate),
    normalizeDate(passportExpiryDate),
    normalizeDate(workPermitExpiryDate),
    normalizeDate(insuranceExpiryDate),
    normalizeDate(contractExpiryDate),
    basicSalary || 0,
    normalizeValue(branchId),
    status,
    normalizeDate(accountCloseDate),
    anotherAllowance || 0,
    normalizeDate(accountActivationDate),
    normalizeDate(firstDayOfWork),
    housingAllowance || 0,
    transportationAllowance || 0,
    normalizeValue(payType),
    normalizeValue(iban),
    normalizeValue(accountNumber),
    normalizeValue(bankName),
    normalizeValue(contractType),
    normalizeDate(registrationExpirationDate),
    hourlyRate || 0
  ]);

  return { insertId: result.insertId, plainPassword };
};

const updateEmployee = async (id, employee) => {
  const {
    name,
    username,
    password,
    roleId,
    employeeNumber,
    email,
    identityNumber,
    passportNumber,
    phoneNumber,
    phone,
    departmentId,
    branchId,
    directManagerId,
    status,
    residenceEndDate,
    residenceExpiryDate,
    idEndDate,
    identityExpiryDate,
    passportEndDate,
    passportExpiryDate,
    laborCardEndDate,
    workPermitExpiryDate,
    healthInsuranceEndDate,
    insuranceExpiryDate,
    contractEndDate,
    contractExpiryDate,
    basicSalary = 0,
    accountCloseDate,
    anotherAllowance = 0,
    accountActivationDate,
    firstDayOfWork,
    housingAllowance = 0,
    transportationAllowance = 0,
    payType,
    iban,
    accountNumber,
    bankName,
    contractType,
    registrationExpirationDate,
    registrationExpiryDate,
    hourlyRate
  } = employee;

  const normalizeDate = (date) => {
    if (date === '' || date === undefined || date === null) return null;
    return date;
  };

  const normalizeValue = (value) => {
    if (value === '' || value === undefined) return null;
    return value;
  };

  const finalPhone = phoneNumber || phone;
  const finalResidenceEndDate = residenceExpiryDate || residenceEndDate;
  const finalIdEndDate = identityExpiryDate || idEndDate;
  const finalPassportEndDate = passportExpiryDate || passportEndDate;
  const finalLaborCardEndDate = workPermitExpiryDate || laborCardEndDate;
  const finalHealthInsuranceEndDate = insuranceExpiryDate || healthInsuranceEndDate;
  const finalContractEndDate = contractExpiryDate || contractEndDate;
  const finalRegistrationExpirationDate = registrationExpiryDate || registrationExpirationDate || employee.registration_expiration_date;

  // 1. التحقق من عدم تكرار الاسم أو الهاتف أو البريد الإلكتروني مع موظف آخر
  if (name || finalPhone || email) {
    const duplicate = await checkDuplicateEmployee(name, finalPhone, email, id);
    if (duplicate) {
      throw new Error(`بيانات مكررة: الموظف متاح بالفعل برقم معرف ${duplicate.id}`);
    }
  }

  // 2. بناء جملة الاستعلام الأساسية لتحديث الحقول المعتادة
  let query = `UPDATE employees SET
    name = ?, username = ?, role_id = ?, job_id = ?, email = ?, 
    eId = ?, passport = ?, phone = ?, department_id = ?, branch_id = ?,
    direct_manager_id = ?, status = ?, residence_end_date = ?, id_end_date = ?,
    passport_end_date = ?, labor_card_end_date = ?, health_insurance_end_date = ?,
    contract_end_date = ?, basic_salary = ?,
    account_close_date = ?, another_allowance = ?, account_activation_date = ?,
    first_day_of_work = ?, housing_allowance = ?, transportation_allowance = ?,
    pay_type = ?, iban = ?, account_number = ?, bank_name = ?, contract_type = ?,
    registration_expiration_date = ?, hourly_rate = ?`;

  let params = [
    normalizeValue(name),
    normalizeValue(username),
    normalizeValue(roleId),
    normalizeValue(employeeNumber),
    normalizeValue(email),
    normalizeValue(identityNumber),
    normalizeValue(passportNumber),
    normalizeValue(finalPhone),
    normalizeValue(departmentId),
    normalizeValue(branchId),
    normalizeValue(directManagerId), // لضمان تحويل السلسلة النصية الفارغة إلى NULL للمدير
    normalizeValue(status) || 'active',
    normalizeDate(finalResidenceEndDate),
    normalizeDate(finalIdEndDate),
    normalizeDate(finalPassportEndDate),
    normalizeDate(finalLaborCardEndDate),
    normalizeDate(finalHealthInsuranceEndDate),
    normalizeDate(finalContractEndDate),
    basicSalary || 0,
    normalizeDate(accountCloseDate),
    anotherAllowance || 0,
    normalizeDate(accountActivationDate),
    normalizeDate(firstDayOfWork),
    housingAllowance || 0,
    transportationAllowance || 0,
    normalizeValue(payType),
    normalizeValue(iban),
    normalizeValue(accountNumber),
    normalizeValue(bankName),
    normalizeValue(contractType),
    normalizeDate(finalRegistrationExpirationDate),
    hourlyRate || 0
  ];

  let plainPassword = null;
  // 3. التحكم الكامل في تعديل كلمة المرور: يتم التحديث فقط إذا تم إرسال كلمة مرور حقيقية وغير مخفية
  if (password && password.trim() !== '' && password !== '********') {
    plainPassword = password;
    const hashedPwd = await hashPassword(plainPassword);
    query += ', password = ?';
    params.push(hashedPwd);
  }

  query += ' WHERE id = ?';
  params.push(id);

  const [result] = await db.query(query, params);
  return { success: result.affectedRows > 0, plainPassword };
};

const deleteEmployee = async (id) => {
  const [result] = await db.query("DELETE FROM employees WHERE id = ?", [id]);
  return result.affectedRows > 0;
};

// Auth-related functions (replacing user functions)
const getEmployeeByUsername = async (username) => {
  const [rows] = await db.query(`
    SELECT 
      e.*, 
      r.role_ar,
      r.role_en,
      d.name_ar as department_ar,
      d.name_en as department_en
    FROM employees e
    LEFT JOIN roles r ON e.role_id = r.id
    LEFT JOIN departments d ON e.department_id = d.id
    WHERE e.username = ?
  `, [username]);

  if (rows.length === 0) return null;
  const user = rows[0];
  return {
    ...user,
    departmentId: user.department_id,
    branchId: user.branch_id,
    directManagerId: user.direct_manager_id,
    roleId: user.role_id,
    employeeNumber: user.job_id,
    identityNumber: user.eId,
    passportNumber: user.passport,
    phoneNumber: user.phone,
    residenceExpiryDate: user.residence_end_date,
    residenceEndDate: user.residence_end_date,
    identityExpiryDate: user.id_end_date,
    idEndDate: user.id_end_date,
    passportExpiryDate: user.passport_end_date,
    passportEndDate: user.passport_end_date,
    workPermitExpiryDate: user.labor_card_end_date,
    laborCardEndDate: user.labor_card_end_date,
    insuranceExpiryDate: user.health_insurance_end_date,
    healthInsuranceEndDate: user.health_insurance_end_date,
    contractExpiryDate: user.contract_end_date,
    contractEndDate: user.contract_end_date,
    basicSalary: user.basic_salary,
    anotherAllowance: user.another_allowance,
    housingAllowance: user.housing_allowance,
    transportationAllowance: user.transportation_allowance,
    firstDayOfWork: user.first_day_of_work,
    payType: user.pay_type,
    accountNumber: user.account_number,
    bankName: user.bank_name,
    contractType: user.contract_type,
    registrationExpiryDate: user.registration_expiration_date,
    registrationExpirationDate: user.registration_expiration_date,
    hourlyRate: user.hourly_rate
  };
};

const updateEmployeePassword = async (id, newPassword) => {
  const hashedPassword = await hashPassword(newPassword);
  const [result] = await db.query(`
    UPDATE employees SET password = ? WHERE id = ?
  `, [hashedPassword, id]);

  return result.affectedRows > 0;
};

const getEmployeePermissions = async (employeeId) => {
  const [rows] = await db.query(`
    SELECT 
      p.id as permission_id,
      p.permission_ar,
      p.permission_en
    FROM permissions p
    INNER JOIN employee_permissions ep ON p.id = ep.permission_id 
    WHERE ep.employee_id = ?
    ORDER BY p.permission_ar ASC
  `, [employeeId]);

  return rows;
};

const updateEmployeeLastLogin = async (employeeId) => {
  const [result] = await db.query(`
    UPDATE employees SET last_login = NOW() WHERE id = ?
  `, [employeeId]);

  return result.affectedRows > 0;
};
const addCaseEmployeeDocument = async (case_id, document_name, document_url, uploaded_by = null) => {
  try {
    const [result] = await db.query(`
      INSERT INTO case_employees_documents (case_id, document_name, document_url, uploaded_by) VALUES (?, ?, ?, ?)
    `, [case_id, document_name, document_url, uploaded_by]);
    return result.insertId;
  } catch (error) {
    console.error('Error adding employee document:', error);
    throw error;
  }
};

const getCaseEmployeeDocuments = async (case_id) => {
  try {
    const [rows] = await db.query(`
      SELECT * FROM case_employees_documents WHERE case_id = ?
    `, [case_id]);
    return rows;
  } catch (error) {
    console.error('Error getting case employee documents:', error);
    throw error;
  }
};

const deleteCaseEmployeeDocument = async (documentId, case_id) => {
  try {
    const [result] = await db.query(`
      DELETE FROM case_employees_documents WHERE id = ? AND case_id = ?
    `, [documentId, case_id]);
    return result.affectedRows > 0;
  } catch (error) {
    console.error('Error deleting case employee document:', error);
    throw error;
  }
};

// Get employee account statement
const getEmployeeAccountStatement = async (employeeId, fromDate, toDate) => {
  try {
    let dateFilter = '';
    const params = [employeeId];

    if (fromDate && toDate) {
      dateFilter = 'AND DATE(created_at) BETWEEN ? AND ?';
      params.push(fromDate, toDate);
    } else if (fromDate) {
      dateFilter = 'AND DATE(created_at) >= ?';
      params.push(fromDate);
    } else if (toDate) {
      dateFilter = 'AND DATE(created_at) <= ?';
      params.push(toDate);
    }

    // Get invoices where employee referred the client
    const invoicesQuery = `
      SELECT 
        i.id,
        i.amount,
        i.invoice_date as transaction_date,
        i.created_at,
        i.created_by,
        'income' as type,
        CONCAT('Invoice ', i.invoice_number, ' - ', c.name) as description,
        i.invoice_number as reference,
        NULL as case_number,
        NULL as file_number,
        creator.name as created_by_name
      FROM invoices i
      LEFT JOIN parties c ON i.client_id = c.id
      LEFT JOIN employees creator ON i.created_by = creator.id
      WHERE i.referred_by_employee_id = ? ${dateFilter.replace(/created_at/g, 'i.created_at')}
    `;

    // Get salaries/payments (if you have a salaries table)
    // This is a placeholder - adjust based on your actual salary/payment structure
    const salariesQuery = `
      SELECT 
        s.id,
        s.amount,
        s.payment_date as transaction_date,
        s.created_at,
        s.created_by,
        'salary' as type,
        CONCAT('Salary for ', DATE_FORMAT(s.payment_date, '%M %Y')) as description,
        s.payment_reference as reference,
        NULL as case_number,
        NULL as file_number,
        creator.name as created_by_name
      FROM employee_salaries s
      LEFT JOIN employees creator ON s.created_by = creator.id
      WHERE s.employee_id = ? ${dateFilter.replace(/created_at/g, 's.created_at')}
    `;

    // Execute queries
    const [invoicesRows] = await db.query(invoicesQuery, params);

    // Try to get salaries (table might not exist)
    let salariesRows = [];
    try {
      const [rows] = await db.query(salariesQuery, params);
      salariesRows = rows;
    } catch (err) {
      // Salaries table might not exist, that's okay
    }

    // Combine all transactions
    const transactions = [...invoicesRows, ...salariesRows].sort((a, b) => {
      return new Date(b.transaction_date || b.created_at) - new Date(a.transaction_date || a.created_at);
    });

    return { success: true, data: transactions };
  } catch (error) {
    console.error('Error getting employee account statement:', error);
    return { success: false, message: error.message };
  }
};

const checkDuplicateEmployee = async (nameOrObj, phone, email, excludeId = null) => {
  let name, username, employeeNumber;
  if (nameOrObj && typeof nameOrObj === 'object') {
    name = nameOrObj.name;
    phone = nameOrObj.phone;
    email = nameOrObj.email;
    username = nameOrObj.username;
    employeeNumber = nameOrObj.employeeNumber || nameOrObj.job_id;
    excludeId = nameOrObj.excludeId;
  } else {
    name = nameOrObj;
  }

  // Build conditions only for fields that are actually provided
  const conditions = [];
  const params = [];

  if (name) {
    conditions.push('name = ?');
    params.push(name);
  }
  // Only check phone/email/username/job_id if they are non-null and non-empty strings
  if (phone && String(phone).trim() !== '') {
    conditions.push('phone = ?');
    params.push(phone);
  }
  if (email && String(email).trim() !== '') {
    conditions.push('email = ?');
    params.push(email);
  }
  if (username && String(username).trim() !== '') {
    conditions.push('username = ?');
    params.push(username);
  }
  if (employeeNumber && String(employeeNumber).trim() !== '') {
    conditions.push('job_id = ?');
    params.push(employeeNumber);
  }

  // If no conditions to check, no duplicate possible
  if (conditions.length === 0) return null;

  let query = `SELECT id, name, phone, email, username, job_id FROM employees WHERE (${conditions.join(' OR ')})`;

  // If excludeId is provided, exclude that employee from the check (for updates)
  if (excludeId) {
    query += ' AND id != ?';
    params.push(excludeId);
  }

  query += ' LIMIT 1';

  const [rows] = await db.query(query, params);
  return rows[0] || null;
};

const getAdminEmployees = async () => {
  const [rows] = await db.query(`
    SELECT 
      e.id,
      e.name,
      e.status
    FROM employees e
    LEFT JOIN roles r ON e.role_id = r.id
    WHERE r.role_en = 'admin' AND e.status = 'active'
  `);
  return rows;
};

/**
 * Lightweight employee lookup for use in auth middleware.
 * Avoids heavy LEFT JOINs (especially employee_documents) to prevent
 * serverless function timeouts on Vercel.
 */
const getEmployeeForAuth = async (id) => {
  const [rows] = await db.query(`
    SELECT 
      e.id,
      e.username,
      e.email,
      e.phone,
      e.name,
      e.status,
      e.role_id,
      e.department_id,
      e.branch_id,
      e.direct_manager_id,
      e.created_at,
      e.updated_at,
      r.role_ar,
      r.role_en,
      d.name_ar as department_ar,
      d.name_en as department_en
    FROM employees e
    LEFT JOIN roles r ON e.role_id = r.id
    LEFT JOIN departments d ON e.department_id = d.id
    WHERE e.id = ?
    LIMIT 1
  `, [id]);
  
  if (rows.length === 0) return null;
  const user = rows[0];
  return {
    ...user,
    departmentId: user.department_id,
    branchId: user.branch_id,
    directManagerId: user.direct_manager_id,
    roleId: user.role_id,
    employeeNumber: user.job_id,
    identityNumber: user.eId,
    passportNumber: user.passport,
    phoneNumber: user.phone
  };
};

module.exports = {
  getAllEmployees,
  getEmployeeById,
  getEmployeeForAuth,
  createEmployee,
  updateEmployee,
  deleteEmployee,
  // Auth functions
  getEmployeeByUsername,
  updateEmployeePassword,
  getEmployeePermissions,
  updateEmployeeLastLogin,
  addCaseEmployeeDocument,
  getCaseEmployeeDocuments,
  deleteCaseEmployeeDocument,
  getEmployeeAccountStatement,
  checkDuplicateEmployee,
  getAdminEmployees
};
