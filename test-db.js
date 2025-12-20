const db = require('./config/db');

console.log('Testing database connection...');

db.query('SELECT * FROM admins', (err, results) => {
    if (err) {
        console.error('Database error:', err);
    } else {
        console.log('Admins table results:', results);
        console.log('Number of admins:', results.length);
    }
    process.exit();
});
