const db = require("../config/db");

const getAllSalaries = async (filters = {}) => {
  const { employeeId, payPeriod, status, branchId } = filters;
  let query = `
    SELECT 
      s.*, 
      e.name as employee_name,
      e.job_id as employee_number,
      d.name_ar as department_ar,
      d.name_en as department_en
    FROM salaries s
    LEFT JOIN employees e ON s.employee_id = e.id
    LEFT JOIN departments d ON e.department_id = d.id
    WHERE 1=1
  `;
  const params = [];

  if (employeeId) {
    query += " AND s.employee_id = ?";
    params.push(employeeId);
  }
  if (payPeriod) {
    query += " AND s.pay_period = ?";
    if (/^\d{4}-\d{2}$/.test(payPeriod)) {
      params.push(`${payPeriod}-01`);
    } else {
      params.push(payPeriod);
    }
  }
  if (status && status.trim() !== '') {
    query += " AND s.status = ?";
    params.push(status);
  }
  if (branchId) {
    query += " AND e.branch_id = ?";
    params.push(branchId);
  }

  query += " ORDER BY s.pay_period DESC, s.created_at DESC";

  const [rows] = await db.query(query, params);
  return rows;
};

const getSalaryById = async (id) => {
  const [rows] = await db.query(`
    SELECT 
      s.*, 
      e.name as employee_name,
      e.job_id as employee_number,
      e.iban,
      e.bank_name,
      e.account_number,
      d.name_ar as department_ar,
      d.name_en as department_en
    FROM salaries s
    LEFT JOIN employees e ON s.employee_id = e.id
    LEFT JOIN departments d ON e.department_id = d.id
    WHERE s.id = ?
  `, [id]);
  return rows[0];
};

const createSalary = async (salaryData) => {
  const {
    employee_id,
    base_salary,
    allowances = 0,
    deductions = 0,
    incentives = 0,
    bonuses = 0,
    eos_amount = 0,
    housing_allowance = 0,
    transportation_allowance = 0,
    other_allowance = 0,
    overtime_hours = 0,
    overtime_rate = 0,
    overtime_amount = 0,
    net_salary,
    pay_period,
    status = 'pending',
    notes = ''
  } = salaryData;

  // Normalize pay_period from YYYY-MM to YYYY-MM-01
  let finalPayPeriod = pay_period;
  if (typeof finalPayPeriod === 'string' && /^\d{4}-\d{2}$/.test(finalPayPeriod)) {
    finalPayPeriod = `${finalPayPeriod}-01`;
  }

  const [result] = await db.query(`
    INSERT INTO salaries (
      employee_id, base_salary, allowances, deductions, 
      incentives, bonuses, eos_amount, 
      housing_allowance, transportation_allowance, other_allowance,
      overtime_hours, overtime_rate, overtime_amount,
      net_salary, pay_period, status, notes
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `, [
    employee_id, base_salary, allowances, deductions,
    incentives, bonuses, eos_amount,
    housing_allowance, transportation_allowance, other_allowance,
    overtime_hours, overtime_rate, overtime_amount,
    net_salary, finalPayPeriod, status, notes
  ]);

  return result.insertId;
};

const updateSalary = async (id, salaryData) => {
  const fields = [];
  const params = [];

  Object.keys(salaryData).forEach(key => {
    if (key !== 'id' && key !== 'created_at' && key !== 'updated_at') {
      fields.push(`${key} = ?`);
      let val = salaryData[key];
      // Normalize pay_period from YYYY-MM to YYYY-MM-01
      if (key === 'pay_period' && typeof val === 'string' && /^\d{4}-\d{2}$/.test(val)) {
        val = `${val}-01`;
      }
      // Normalize payment_date to YYYY-MM-DD
      if (key === 'payment_date' && val) {
        if (typeof val === 'string' && val.includes('T')) {
          val = val.split('T')[0];
        } else if (val instanceof Date) {
          const year = val.getFullYear();
          let month = '' + (val.getMonth() + 1);
          let day = '' + val.getDate();
          if (month.length < 2) month = '0' + month;
          if (day.length < 2) day = '0' + day;
          val = [year, month, day].join('-');
        }
      }
      params.push(val);
    }
  });

  if (fields.length === 0) return false;

  params.push(id);
  const [result] = await db.query(`
    UPDATE salaries SET ${fields.join(', ')} WHERE id = ?
  `, params);

  return result.affectedRows > 0;
};

const deleteSalary = async (id) => {
  const [result] = await db.query("DELETE FROM salaries WHERE id = ?", [id]);
  return result.affectedRows > 0;
};

module.exports = {
  getAllSalaries,
  getSalaryById,
  createSalary,
  updateSalary,
  deleteSalary
};
