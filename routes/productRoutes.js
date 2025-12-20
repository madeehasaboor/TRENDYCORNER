const express = require('express');
const router = express.Router();
const upload = require('../middleware/upload');
const auth = require('../middleware/auth');
const { addProduct, getProducts, update, remove } = require('../controllers/product.controller');

router.get('/add', (req, res) => {
    res.send("Product add route is working");
});
router.post('/add', auth, upload.single('image'), addProduct);
router.get('/', auth, getProducts);
router.put('/:id', auth, update);
router.delete('/:id', auth, remove);

module.exports = router;
