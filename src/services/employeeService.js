const employeeModel = require("../models/employeeModel");
const permissionsModel = require("../models/permissionsModel");
const { logAdd, logUpdate, logDelete } = require('./logsService');

const listEmployees = async (filters = {}) => {
  const { rows, total } = await employeeModel.getAllEmployees(filters);
  return {
    data: rows,
    pagination: {
      total,
      page: filters.page,
      limit: filters.limit,
      totalPages: Math.ceil(total / filters.limit)
    }
  };
};

const getEmployee = async (id) => {
  const employee = await employeeModel.getEmployeeById(id);
  if (!employee) {
    throw new Error("Employee not found");
  }
  return employee;
};

/**
 * Convenience helper that masks password when requested.
 */
const getEmployeeSanitized = async (id) => {
  const employee = await getEmployee(id);
  const rest = { ...employee };
  rest.password = '********';
  return rest;
};

const sanitizeEmployeeInput = (data = {}) => {
  const sanitized = { ...data };
  Object.keys(sanitized).forEach((key) => {
    if (sanitized[key] === '') sanitized[key] = null;
  });
  return sanitized;
};

const addEmployee = async (data, createdBy = null) => {
  const payload = sanitizeEmployeeInput(data);

  // Validate status field (if provided)
  if (payload.status && !['active', 'inactive'].includes(payload.status)) {
    throw new Error("Status must be either 'active' or 'inactive'");
  }

  // Support both phone and phoneNumber field names from frontend
  const phoneForDuplicateCheck = payload.phoneNumber || payload.phone || null;

  // Duplicate check - only check fields that are actually provided
  const duplicate = await employeeModel.checkDuplicateEmployee(
    payload.name,
    phoneForDuplicateCheck,
    payload.email
  );
  if (duplicate) {
    throw new Error('Employee with same name, phone, or email already exists');
  }

  const createResult = await employeeModel.createEmployee(payload);
  const userId = typeof createResult === 'object' ? createResult.insertId : createResult;
  const plainPassword = typeof createResult === 'object' ? createResult.plainPassword : null;

  if (payload.permissions && payload.permissions.length > 0 && userId) {
    for (const permId of payload.permissions) {
      await permissionsModel.addEmployeePermission(userId, permId);
    }
  }

  // Log employee creation
  if (createdBy) {
    await logAdd(
      createdBy,
      'موظف',
      data.name || data.username || 'موظف جديد',
      userId
    );
  }

  return { userId, plainPassword };
};

const addEmployeeWithFetch = async (data, createdBy = null) => {
  const { userId, plainPassword } = await addEmployee(data, createdBy);
  const employee = await getEmployee(userId);
  const rest = { ...employee };
  rest.password = plainPassword || '********';
  return rest;
};

const mapDbEmployeeToFrontend = (dbEmp) => {
  if (!dbEmp) return {};
  return {
    ...dbEmp,
    password: '********',
    roleId: dbEmp.role_id,
    employeeNumber: dbEmp.job_id,
    identityNumber: dbEmp.eId,
    passportNumber: dbEmp.passport,
    phoneNumber: dbEmp.phone,
    departmentId: dbEmp.department_id,
    branchId: dbEmp.branch_id,
    directManagerId: dbEmp.direct_manager_id,
    residenceExpiryDate: dbEmp.residence_end_date,
    residenceEndDate: dbEmp.residence_end_date,
    identityExpiryDate: dbEmp.id_end_date,
    idEndDate: dbEmp.id_end_date,
    passportExpiryDate: dbEmp.passport_end_date,
    passportEndDate: dbEmp.passport_end_date,
    workPermitExpiryDate: dbEmp.labor_card_end_date,
    laborCardEndDate: dbEmp.labor_card_end_date,
    insuranceExpiryDate: dbEmp.health_insurance_end_date,
    healthInsuranceEndDate: dbEmp.health_insurance_end_date,
    contractExpiryDate: dbEmp.contract_end_date,
    contractEndDate: dbEmp.contract_end_date,
    basicSalary: dbEmp.basic_salary,
    anotherAllowance: dbEmp.another_allowance,
    housingAllowance: dbEmp.housing_allowance,
    transportationAllowance: dbEmp.transportation_allowance,
    firstDayOfWork: dbEmp.first_day_of_work,
    payType: dbEmp.pay_type,
    accountNumber: dbEmp.account_number,
    bankName: dbEmp.bank_name,
    contractType: dbEmp.contract_type,
    registrationExpiryDate: dbEmp.registration_expiration_date,
    registrationExpirationDate: dbEmp.registration_expiration_date,
    hourlyRate: dbEmp.hourly_rate
  };
};

const updateEmployee = async (id, data, updatedBy = null) => {
  const payload = sanitizeEmployeeInput(data);
  // Check if employee exists
  const existingEmployee = await employeeModel.getEmployeeById(id);
  if (!existingEmployee) {
    throw new Error("Employee not found");
  }

  // Validate status field (if provided)
  if (payload.status && !['active', 'inactive'].includes(payload.status)) {
    throw new Error("Status must be either 'active' or 'inactive'");
  }

  // Validate email format (if provided and changed)
  if (payload.email && payload.email !== existingEmployee.email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(payload.email)) {
      throw new Error("Invalid email format");
    }
  }

  // Validate phone format (if provided and changed)
  const finalPhone = payload.phone || payload.phoneNumber;
  if (finalPhone && finalPhone !== existingEmployee.phone) {
    if (!/^[0-9+\-\s()]+$/.test(finalPhone)) {
      throw new Error("Invalid phone format");
    }
  }

  // Duplicate check (exclude current ID)
  const duplicate = await employeeModel.checkDuplicateEmployee(
    payload.name,
    payload.phone,
    payload.email,
    id
  );
  if (duplicate) {
    throw new Error('Employee with same name, phone, or email already exists');
  }

  // Validate dates (if provided)
  const dateFields = [
    'residenceEndDate', 'idEndDate', 'passportEndDate', 
    'laborCardEndDate', 'healthInsuranceEndDate', 'contractEndDate',
    'registrationExpirationDate'
  ];
  
  for (const field of dateFields) {
  if (payload[field] && isNaN(Date.parse(payload[field]))) {
    throw new Error(`Invalid date format for ${field}`);
  }
  }

  // Validate salary (if provided)
  if (payload.basicSalary !== undefined && (isNaN(payload.basicSalary) || payload.basicSalary < 0)) {
    throw new Error("Basic salary must be a positive number");
  }

  // Validate allowances and deductions format
  if (payload.allowances && !Array.isArray(payload.allowances)) {
    throw new Error("Allowances must be an array");
  }
  
  if (payload.deductions && !Array.isArray(payload.deductions)) {
    throw new Error("Deductions must be an array");
  }
  // Merge with existing data mapped to camelCase frontend variables
  const mappedExisting = mapDbEmployeeToFrontend(existingEmployee);
  const updatedData = { ...mappedExisting, ...payload };
  const { success, plainPassword } = await employeeModel.updateEmployee(id, updatedData);
  if (!success) {
    throw new Error("Failed to update employee");
  }
  
  // Log employee update
  if (updatedBy) {
    await logUpdate(
      updatedBy,
      'موظف',
      existingEmployee.name || existingEmployee.username || 'موظف',
      id
    );
  }
  
  const updatedEmployee = await employeeModel.getEmployeeById(id);
  if (updatedEmployee) {
    updatedEmployee.password = plainPassword || '********';
  }
  return {
    ...updatedEmployee,
    plainPassword
  };
};

const removeEmployee = async (id, deletedBy = null) => {
  // Check if employee exists
  const existingEmployee = await employeeModel.getEmployeeById(id);
  if (!existingEmployee) {
    throw new Error("Employee not found");
  }

  // Get employee documents before deleting (for AWS S3 cleanup)
  const employeeDocumentsModel = require('../models/employeeDocumentsModel');
  const { deleteDocumentFiles } = require('./storageService');
  const documents = await employeeDocumentsModel.getByEmployeeId(id);

  const success = await employeeModel.deleteEmployee(id);
  if (!success) {
    throw new Error("Failed to delete employee");
  }
  
  // Delete files from AWS S3
  if (documents && documents.length > 0) {
    await deleteDocumentFiles(documents);
  }
  
  // Log employee deletion
  if (deletedBy) {
    await logDelete(
      deletedBy,
      'موظف',
      existingEmployee.name || existingEmployee.username || 'موظف',
      id
    );
  }
  
  return { message: "Employee deleted successfully" };
};

// Get employee account statement
const getEmployeeAccountStatement = async (employeeId, fromDate, toDate) => {
  return await employeeModel.getEmployeeAccountStatement(employeeId, fromDate, toDate);
};

const checkDuplicateEmployee = async (name, phone, email, excludeId = null) => {
  return await employeeModel.checkDuplicateEmployee(name, phone, email, excludeId);
};

const getAdminEmployees = async () => {
  return await employeeModel.getAdminEmployees();
};

module.exports = {
  listEmployees,
  getEmployee,
  getEmployeeSanitized,
  addEmployee,
  addEmployeeWithFetch,
  updateEmployee,
  removeEmployee,
  getEmployeeAccountStatement,
  checkDuplicateEmployee,
  getAdminEmployees
};
