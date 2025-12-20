const db = require('../config/db');

// Get all subcategories
exports.getAll = async (req, res) => {
    try {
        const [results] = await db.execute('SELECT * FROM subcategories ORDER BY name');
        res.json({
            success: true,
            data: results
        });
    } catch (err) {
        console.error('Subcategories error:', err);
        res.status(500).json({
            success: false,
            message: 'Server error'
        });
    }
};

// Get subcategories by category ID
exports.getByCategory = async (req, res) => {
    try {
        const categoryId = req.params.id;
        const [results] = await db.execute(
            'SELECT * FROM subcategories WHERE category_id = ? ORDER BY name',
            [categoryId]
        );
        res.json({
            success: true,
            data: results
        });
    } catch (err) {
        console.error('Subcategories by category error:', err);
        res.status(500).json({
            success: false,
            message: 'Server error'
        });
    }
};

// Get single subcategory
exports.getById = async (req, res) => {
    try {
        const [results] = await db.execute('SELECT * FROM subcategories WHERE id = ?', [req.params.id]);
        
        if (results.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Subcategory not found'
            });
        }
        
        res.json({
            success: true,
            data: results[0]
        });
    } catch (err) {
        console.error('Subcategory error:', err);
        res.status(500).json({
            success: false,
            message: 'Server error'
        });
    }
};
