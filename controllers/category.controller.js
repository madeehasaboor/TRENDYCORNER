const db = require('../config/db');

exports.getAll = async (req, res) => {
    try {
        const [results] = await db.execute('SELECT * FROM categories ORDER BY name');
        res.json({
            success: true,
            data: results
        });
    } catch (err) {
        console.error('Categories error:', err);
        res.status(500).json({
            success: false,
            message: 'Server error'
        });
    }
};
