// departmentsRoute.js
// Routes for departments

const express = require('express');
const router = express.Router();
const departmentsController = require('../controllers/departmentsController');
const { authenticateToken } = require('../middlewares/authMiddleware');

// Apply authentication middleware to all routes
router.use(authenticateToken);

// Get all departments
router.get('/', departmentsController.getAllDepartments);

// Get department by ID
router.get('/:id', departmentsController.getDepartmentById);

// Create a new department
router.post('/', departmentsController.createDepartment);

// Update a department by ID
router.put('/:id', departmentsController.updateDepartment);

// Delete a department by ID
router.delete('/:id', departmentsController.deleteDepartment);

module.exports = router;