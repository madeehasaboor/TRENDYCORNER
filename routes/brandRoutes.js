const express = require('express');
const router = express.Router();

// GET all brands
router.get('/', (req, res) => {
  res.json({ message: 'Get all brands' });
});

// GET single brand
router.get('/:id', (req, res) => {
  res.json({ message: `Get brand with id: ${req.params.id}` });
});

// POST create brand
router.post('/', (req, res) => {
  res.json({ message: 'Create new brand' });
});

// PUT update brand
router.put('/:id', (req, res) => {
  res.json({ message: `Update brand with id: ${req.params.id}` });
});

// DELETE brand
router.delete('/:id', (req, res) => {
  res.json({ message: `Delete brand with id: ${req.params.id}` });
});

module.exports = router;
