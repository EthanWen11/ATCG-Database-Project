const express = require('express');
const http = require('http');

// Import routes
const indexRouter = require('./routes/index');

const app = express();
const port = process.env.PORT || 3001;

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Register the routes
app.use('/', indexRouter);

// Create server
const server = http.createServer(app);
server.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
