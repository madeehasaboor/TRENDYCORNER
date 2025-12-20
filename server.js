const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();
const productRoutes = require('./routes/productRoutes');
const categoryRoutes = require('./routes/category.routes');
const brandRoutes = require('./routes/brandRoutes');
const subcategoryRoutes = require('./routes/subcategoryRoutes');
const adminRoutes = require('./routes/adminRoutes');

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// API Routes
app.use('/api/products', productRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/brands', brandRoutes);
app.use('/api/subcategories', subcategoryRoutes);
app.use('/api/admin', adminRoutes);

// Serve frontend static files
app.use(express.static(path.join(__dirname, 'public')));

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!', error: err.message });
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`🚀 Trendy Corner API Server running on http://localhost:${PORT}`);
  console.log(`📦 Products API available at /api/products`);
  console.log(`🛒 Cart API available at /api/cart`);
  console.log(`🔍 Categories API available at /api/categories`);
});
