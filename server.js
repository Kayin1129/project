import express from 'express';
import mysql from 'mysql2/promise';
import cors from 'cors';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
app.use(cors({
  origin: '*', // 允許所有來源訪問
  methods: ['GET', 'POST'], // 允許的 HTTP 方法
  allowedHeaders: ['Content-Type'] // 允許的請求頭
}));
app.use(express.json());

// 服務靜態文件
app.use(express.static(path.join(__dirname, 'dist')));

// 創建資料庫連接池
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

// 創建資料表（如果不存在）
async function initializeDatabase() {
  try {
    const connection = await pool.getConnection();
    await connection.query(`
      CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    connection.release();
    console.log('資料表已初始化');
  } catch (error) {
    console.error('資料表初始化失敗:', error);
  }
}

initializeDatabase();

// API 端點：儲存使用者資料
app.post('/api/users', async (req, res) => {
  try {
    const { name, email } = req.body;
    const [result] = await pool.query(
      'INSERT INTO users (name, email) VALUES (?, ?)',
      [name, email]
    );
    res.json({ success: true, id: result.insertId });
  } catch (error) {
    console.error('儲存資料失敗:', error);
    res.status(500).json({ success: false, error: '儲存資料失敗' });
  }
});

// 處理所有其他路由
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => { // 監聽所有網路介面
  console.log(`伺服器運行在 port ${PORT}`);
  console.log(`在區域網路中可以通過 http://<你的IP地址>:${PORT} 訪問`);
});