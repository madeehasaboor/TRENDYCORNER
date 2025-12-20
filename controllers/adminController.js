const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../config/db');

// JWT Secret (should be in .env file)
const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key';

// Register new admin
const registerAdmin = async (req, res) => {
    try {
        const { username, email, password, role = 'admin' } = req.body;

        // Check if admin already exists
        const checkQuery = 'SELECT id FROM admins WHERE username = ? OR email = ?';
        const [existing] = await db.execute(checkQuery, [username, email]);
        
        if (existing.length > 0) {
            return res.status(400).json({ 
                success: false, 
                message: 'Admin with this username or email already exists' 
            });
        }

        // Hash password
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // Insert new admin
        const insertQuery = 'INSERT INTO admins (username, email, password, role) VALUES (?, ?, ?, ?)';
        const [result] = await db.execute(insertQuery, [username, email, hashedPassword, role]);

        res.status(201).json({
            success: true,
            message: 'Admin registered successfully',
            data: {
                id: result.insertId,
                username,
                email,
                role
            }
        });

    } catch (error) {
        console.error('Registration error:', error);
        res.status(500).json({ 
            success: false, 
            message: 'Server error during registration' 
        });
    }
};

// Login admin
const login = async (req, res) => {
    try {
        const { email, password } = req.body;

        const [result] = await db.execute("SELECT * FROM admins WHERE email=?", [email]);
        
        if (result.length === 0)
            return res.status(401).json({ message: "Invalid credentials" });

        const admin = result[0];
        const isMatch = await bcrypt.compare(password, admin.password);
        if (!isMatch) return res.status(401).json({ message: "Invalid credentials" });

        const token = jwt.sign(
            { id: admin.id },
            process.env.JWT_SECRET,
            { expiresIn: '1d' }
        );

        res.json({ token });
    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ message: "Server error" });
    }
};

// Get admin profile
const getProfile = async (req, res) => {
    try {
        const adminId = req.admin.id;
        
        const query = 'SELECT id, username, email, role, created_at FROM admins WHERE id = ?';
        const [admins] = await db.execute(query, [adminId]);

        if (admins.length === 0) {
            return res.status(404).json({ 
                success: false, 
                message: 'Admin not found' 
            });
        }

        res.json({
            success: true,
            data: admins[0]
        });

    } catch (error) {
        console.error('Profile error:', error);
        res.status(500).json({ 
            success: false, 
            message: 'Server error' 
        });
    }
};

module.exports = {
    registerAdmin,
    login,
    getProfile
};
