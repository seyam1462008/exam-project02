import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import dotenv from 'dotenv';
import { pool } from './config/database.js';

// Load environment variables
dotenv.config();

// Initialize Express app
const app = express();

// Middleware
app.use(helmet());
app.use(cors({
  origin: process.env.CORS_ORIGIN || 'http://localhost:3000',
  credentials: true
}));
app.use(express.json());
app.use(express.urlencoded({ limit: '50mb', extended: true }));

// Routes (will be added)
app.use('/api/auth', (req, res) => res.json({ message: 'Auth routes coming soon' }));
app.use('/api/admin', (req, res) => res.json({ message: 'Admin routes coming soon' }));
app.use('/api/exams', (req, res) => res.json({ message: 'Exam routes coming soon' }));
app.use('/api/questions', (req, res) => res.json({ message: 'Question routes coming soon' }));

// Health check
app.get('/health', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json({ 
      status: 'OK', 
      timestamp: result.rows[0],
      message: 'Server is running and database is connected'
    });
  } catch (err) {
    res.status(500).json({ 
      status: 'ERROR', 
      message: 'Database connection failed',
      error: err.message 
    });
  }
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ 
    message: 'Internal Server Error',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
  console.log(`📡 Environment: ${process.env.NODE_ENV}`);
});

export default app;