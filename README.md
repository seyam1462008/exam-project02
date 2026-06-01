# Exam Platform - MCQ Practice for Bangladesh Public Exams

A comprehensive MCQ practice platform for SSC, HSC, Admission, and BCS exams in Bangladesh.

## 🏗️ Architecture Overview

### Tech Stack (100% Free & Open Source)

**Frontend:**
- React 18+ with TypeScript
- Tailwind CSS for styling
- Vite as build tool (faster than Create React App)
- Axios for API calls
- React Router for navigation

**Backend:**
- Node.js with Express.js
- PostgreSQL (free on Railway or Render)
- JWT for authentication
- Multer for file uploads (CSV/Excel import)

**Database:**
- PostgreSQL with free hosting options

**Hosting:**
- Frontend: Vercel (free tier)
- Backend: Railway or Render (free tier)

## 📁 Project Structure

```
exam-project02/
├── frontend/               # React application
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── types/
│   └── package.json
├── backend/                # Express API
│   ├── src/
│   │   ├── routes/
│   │   ├── controllers/
│   │   ├── models/
│   │   ├── middleware/
│   │   ├── utils/
│   │   └── config/
│   └── package.json
├── database/               # Database scripts
│   └── schema.sql
└── docs/                   # Documentation
    └── API_DOCS.md
```

## 🎯 Phase 1: Core Features

1. **Admin Panel** ✅ (Priority)
   - User Management
   - Bulk Question Import (CSV/Excel)
   - Exam Management
   - Analytics Dashboard

2. **Student Interface**
   - Authentication (Sign up / Login)
   - Exam Selection (SSC/HSC/Admission/BCS)
   - MCQ Practice Interface
   - Timer Management
   - Answer Review

3. **Results & Analytics**
   - Score Calculation
   - Performance Analysis
   - Topic-wise Performance

## 📊 Database Schema (Overview)

- **Users**: id, email, password, name, role (admin/student)
- **Exams**: id, name, type (SSC/HSC/Admission/BCS), totalQuestions
- **Questions**: id, examId, questionText, options, correctAnswer, topic
- **StudentAnswers**: id, studentId, questionId, selectedAnswer, isCorrect
- **Results**: id, studentId, examId, score, totalQuestions, timestamp

## 🚀 Getting Started

(Setup instructions coming soon)

---

**Status:** Architecture & Setup Phase
**Last Updated:** 2026-06-01