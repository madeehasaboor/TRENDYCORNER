const db = require('../config/db');

// Get all products
exports.list = async (req, res, next) => {
    try {
        const { page = 1, limit = 20, category, search } = req.query;
        const offset = (page - 1) * limit;
        
        let query = `
            SELECT p.*, b.name as brand_name, c.name as category_name, s.name as subcategory_name
            FROM products p
            LEFT JOIN brands b ON p.brand_id = b.id
            LEFT JOIN categories c ON p.category_id = c.id
            LEFT JOIN subcategories s ON p.subcategory_id = s.id
        `;
        let params = [];
        
        if (search) {
            query += ` WHERE p.name LIKE ? OR p.description LIKE ?`;
            params.push(`%${search}%`, `%${search}%`);
        }
        
        if (category) {
            query += search ? ` AND p.category_id = ?` : ` WHERE p.category_id = ?`;
            params.push(category);
        }
        
        query += ` ORDER BY p.created_at DESC LIMIT ? OFFSET ?`;
        params.push(parseInt(limit), offset);
        
        const [products] = await db.execute(query, params);
        
        // Get total count
        let countQuery = 'SELECT COUNT(*) as total FROM products p';
        let countParams = [];
        
        if (search) {
            countQuery += ` WHERE p.name LIKE ? OR p.description LIKE ?`;
            countParams.push(`%${search}%`, `%${search}%`);
        }
        
        if (category) {
            countQuery += search ? ` AND p.category_id = ?` : ` WHERE p.category_id = ?`;
            countParams.push(category);
        }
        
        const [countResult] = await db.execute(countQuery, countParams);
        const total = countResult[0].total;
        
        res.json({
            success: true,
            data: products,
            pagination: {
                page: parseInt(page),
                limit: parseInt(limit),
                total,
                pages: Math.ceil(total / limit)
            }
        });
    } catch (err) { 
        console.error('List products error:', err);
        next(err); 
    }
};

// Get single product by ID
exports.getOne = async (req, res, next) => {
    try {
        const query = `
            SELECT p.*, b.name as brand_name, c.name as category_name, s.name as subcategory_name
            FROM products p
            LEFT JOIN brands b ON p.brand_id = b.id
            LEFT JOIN categories c ON p.category_id = c.id
            LEFT JOIN subcategories s ON p.subcategory_id = s.id
            WHERE p.id = ?
        `;
        const [products] = await db.execute(query, [req.params.id]);
        
        if (products.length === 0) {
            return res.status(404).json({ 
                success: false, 
                message: 'Product not found' 
            });
        }
        
        res.json({
            success: true,
            data: products[0]
        });
    } catch (err) { 
        console.error('Get product error:', err);
        next(err); 
    }
};

// Add new product (for the /add endpoint)
exports.addProduct = async (req, res) => {
    const { name, price, brand, category, subcategory } = req.body;
    const image = req.file ? req.file.filename : null;
    
    try {
        await db.execute(
            "INSERT INTO products (name, price, brand_id, category_id, subcategory_id, image) VALUES (?,?,?,?,?,?)",
            [name, price, brand, category, subcategory, image]
        );
        res.json({ success: true });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, message: "Server error" });
    }
};

exports.getProducts = (req, res) => {
    db.query(`
        SELECT p.*, b.name brand, c.name category, s.name subcategory
        FROM products p
        JOIN brands b ON p.brand_id=b.id
        JOIN categories c ON p.category_id=c.id
        JOIN subcategories s ON p.subcategory_id=s.id
    `, (err, data) => res.json(data));
};

// Create product (alias for addProduct)
exports.create = (req, res) => {
    return exports.addProduct(req, res);
};

// Update product
exports.update = async (req, res) => {
    const { id } = req.params;
    const { name, price } = req.body;

    if (!name || !price) return res.status(400).json({ success: false, message: "Name and price are required" });

    try {
        const [result] = await db.execute(
            "UPDATE products SET name = ?, price = ? WHERE id = ?",
            [name, price, id]
        );

        if (result.affectedRows === 0) return res.status(404).json({ success: false, message: "Product not found" });

        res.json({ success: true, message: "Product updated successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, message: "Server error" });
    }
};

// Delete product
exports.remove = async (req, res) => {
    const { id } = req.params;

    try {
        const [result] = await db.execute("DELETE FROM products WHERE id = ?", [id]);

        if (result.affectedRows === 0) return res.status(404).json({ success: false, message: "Product not found" });

        res.json({ success: true, message: "Product deleted successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, message: "Server error" });
    }
};