const express = require('express');
const router = express.Router();
const { getAll, getByCategory, getById } = require('../controllers/subcategory.controller');

// GET all subcategories
router.get('/', getAll);

// GET subcategories by category ID
router.get('/:id', getByCategory);

module.exports = router;
