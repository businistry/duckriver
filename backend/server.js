require('dotenv').config();
const connectDB = require('./config/db');

// Connect to MongoDB
connectDB();

const express = require('express');
const path = require('path');
const app = express();
const userRoutes = require('./routes/userRoutes');

app.get('/', (req, res) => {
    res.send('Hello World');
});

// Initialize middleware
app.use(express.json({ extended: false }));

// Define routes
app.use('/api/users', userRoutes);

// Serve the static files from the React app
app.use(express.static(path.join(__dirname, '../frontend/build')));

// Handles any requests that don't match the ones above
app.get('*', (req, res) =>{
    res.sendFile(path.join(__dirname, '../frontend/build/index.html'));
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(‘Server running on port ${PORT}’));