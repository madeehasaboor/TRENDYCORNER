# Trendy Corner API Documentation

## Overview
RESTful API for Trendy Corner e-commerce platform built with Node.js, Express, and MySQL.

## Base URL
```
http://localhost:5000/api
```

## Authentication
Currently uses session-based authentication for guest users. Session ID is managed via headers.

## Endpoints

### Products

#### Get All Products
```http
GET /api/products
```

Query Parameters:
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 12)
- `category` (string): Category slug
- `brand` (string): Brand name
- `search` (string): Search query
- `minPrice` (number): Minimum price filter
- `maxPrice` (number): Maximum price filter
- `sizes` (string): Size filter
- `cut` (string): Cut filter
- `fabric` (string): Fabric filter
- `piece` (string): Piece filter
- `season` (string): Season filter
- `sortBy` (string): Sort option (newest, price-low, price-high)

Response:
```json
{
  "success": true,
  "data": {
    "products": [...],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalProducts": 48,
      "hasNext": true
    }
  }
}
```

#### Get Single Product
```http
GET /api/products/:id
```

#### Search Products
```http
GET /api/search?q=query&category=summer
```

### Categories

#### Get All Categories
```http
GET /api/categories
```

Response:
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "Sale",
      "slug": "sale"
    }
  ]
}
```

### Cart

#### Get Cart Items
```http
GET /api/cart
```

Headers:
- `X-Session-ID`: Session identifier

Response:
```json
{
  "success": true,
  "data": {
    "items": [...],
    "summary": {
      "subtotal": 25000,
      "discountAmount": 5000,
      "total": 20000,
      "itemCount": 3
    }
  }
}
```

#### Add to Cart
```http
POST /api/cart
```

Body:
```json
{
  "productId": 1,
  "quantity": 1
}
```

#### Update Cart Item
```http
PUT /api/cart/:id
```

Body:
```json
{
  "quantity": 2
}
```

#### Remove from Cart
```http
DELETE /api/cart/:id
```

#### Clear Cart
```http
DELETE /api/cart
```

#### Get Cart Summary
```http
GET /api/cart/summary
```

## Error Responses

All errors return:
```json
{
  "success": false,
  "message": "Error description"
}
```

## Setup Instructions

1. **Install Dependencies**
```bash
cd BACKEND
npm install
```

2. **Configure Database**
Update `.env` file:
```
DB_HOST=localhost
DB_PORT=3306
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=trendy_corner
```

3. **Run Database Schema**
```bash
mysql -u your_username -p < schema.sql
```

4. **Start Server**
```bash
npm start
```

## Database Schema

### Categories Table
- `id` (INT, Primary Key)
- `name` (VARCHAR)
- `slug` (VARCHAR, Unique)
- `created_at`, `updated_at` (TIMESTAMP)

### Products Table
- `id` (INT, Primary Key)
- `category_id` (INT, Foreign Key)
- `name` (VARCHAR)
- `description` (TEXT)
- `price` (DECIMAL)
- `original_price` (DECIMAL)
- `stock` (INT)
- `image_url` (VARCHAR)
- `size` (VARCHAR) - Comma-separated sizes
- `cut` (VARCHAR) - Basic, Culotte, Raglan
- `fabric` (VARCHAR) - Lawn, Cotton, Silk, etc.
- `piece` (VARCHAR) - 1-pc, 2-piece, 3-piece
- `season` (VARCHAR) - spring-summer-23, etc.
- `discount` (INT) - Percentage
- `created_at`, `updated_at` (TIMESTAMP)

### Cart Items Table
- `id` (INT, Primary Key)
- `session_id` (VARCHAR) - For guest users
- `user_id` (INT) - For future user auth
- `product_id` (INT, Foreign Key)
- `quantity` (INT)
- `added_at`, `updated_at` (TIMESTAMP)

## Frontend Integration

Include these scripts in your HTML:
```html
<script src="js/api.js"></script>
<script src="js/cart-api.js"></script>
<link rel="stylesheet" href="js/cart-popup-styles.css">
```

## Features

- ✅ Product listing with pagination
- ✅ Advanced filtering and search
- ✅ Cart management with session persistence
- ✅ Real-time cart updates
- ✅ Price calculations with discounts
- ✅ Stock management
- ✅ Responsive design
- ✅ Error handling
- ✅ CORS support

## Future Enhancements

- User authentication system
- Order management
- Payment integration
- Wishlist functionality
- Product reviews
- Admin panel
