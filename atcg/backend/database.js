const mysql = require('mysql');

// Database connection configuration
const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'atcg'
};

// Create a connection pool
const pool = mysql.createPool(dbConfig);

module.exports = pool;
