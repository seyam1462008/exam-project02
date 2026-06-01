# 🚀 Complete Setup Guide

## Prerequisites

- Node.js 18+ (download from nodejs.org)
- PostgreSQL 14+ (or use Railway/Render free tier)
- Git
- Code editor (VS Code recommended)

## ⚙️ Step 1: Local Setup

### 1.1 Clone Repository
```bash
git clone https://github.com/seyam1462008/exam-project02.git
cd exam-project02
```

### 1.2 Setup Backend

```bash
# Navigate to backend
cd backend

# Copy environment file
cp .env.example .env

# Install dependencies
npm install

# Create uploads directory
mkdir uploads
```

### 1.3 Setup Frontend

```bash
# In new terminal, navigate to frontend
cd frontend

# Copy environment file
cp .env.example .env

# Install dependencies
npm install
```

## 🗄️ Step 2: Database Setup

### Option A: Local PostgreSQL
```bash
# Create database
createdb exam_platform

# Run schema
psql exam_platform < ../database/schema.sql

# Update .env
DATABASE_URL=postgresql://user:password@localhost:5432/exam_platform
```

### Option B: Free Cloud Database

**Using Railway (Recommended):**
1. Go to https://railway.app
2. Sign up with GitHub
3. Create new project
4. Add PostgreSQL
5. Copy connection string to .env

**Using Render:**
1. Go to https://render.com
2. Sign up
3. Create PostgreSQL database
4. Copy connection string to .env

## 🏃 Step 3: Run Locally

### Terminal 1 - Backend
```bash
cd backend
npm run dev
```
Expected: `✅ Server running on http://localhost:5000`

### Terminal 2 - Frontend
```bash
cd frontend
npm run dev
```
Expected: `VITE v5.x.x ready in xxx ms → Local: http://localhost:5173`

### Terminal 3 - Test
```bash
curl http://localhost:5000/health
```
Should return: `{"status":"OK","message":"Server is running..."}`

## 📦 Current Feature Set (Phase 1)

✅ Backend server setup with Express
✅ Database schema with all tables
✅ PostgreSQL connection configured
✅ CORS enabled for frontend-backend communication
✅ Environment configuration ready
✅ Health check endpoint
❌ Authentication (coming next)
❌ Admin panel (coming next)
❌ Bulk import (coming next)

## 📂 Project Structure After Setup

```
exam-project02/
├── backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── database.js
│   │   └── index.js
│   ├── uploads/          (created after npm install)
│   ├── package.json
│   └── .env
├── frontend/
│   ├── src/
│   ├── package.json
│   └── .env
├── database/
│   └── schema.sql
└── docs/
    └── SETUP_GUIDE.md
```

## 🔧 Troubleshooting

### "Cannot find module 'express'"
```bash
cd backend
npm install
```

### "Connection refused to localhost:5432"
PostgreSQL not running. Start it:
- **macOS:** `brew services start postgresql`
- **Linux:** `sudo systemctl start postgresql`
- **Windows:** Start PostgreSQL service

### "CORS error"
Check CORS_ORIGIN in backend/.env matches frontend URL

### Port already in use
Change PORT in .env or kill process using the port

## 📝 Next Steps (Phase 2)

1. Setup authentication (JWT + bcrypt)
2. Create admin panel UI
3. Build bulk import functionality
4. Create exam interface
5. Build student dashboard

---

**Status:** ✅ Setup complete! Ready for Phase 2 development.