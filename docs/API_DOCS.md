# ExamHub - Complete API Documentation

## 🔐 Authentication Endpoints

### POST /api/auth/signup
Create new user account

**Request:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "role": "student" // or "admin"
}
```

**Response:**
```json
{
  "token": "jwt_token_here",
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "role": "student"
  }
}
```

### POST /api/auth/login
Login user

**Request:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**Response:** Same as signup

---

## 📚 Exam Endpoints

### GET /api/exams
Get all available exams

**Response:**
```json
[
  {
    "id": 1,
    "name": "Math Practice",
    "type": "SSC",
    "description": "Math questions for SSC",
    "total_questions": 50,
    "duration_minutes": 60,
    "passing_score": 40
  }
]
```

### GET /api/exams/:id
Get exam details with topics

### GET /api/exams/:id/questions
Get questions for an exam

**Query params:**
- `topic_id`: Filter by topic
- `limit`: Number of questions (default 10)
- `offset`: Pagination offset (default 0)

---

## 👨‍💼 Admin Endpoints (Requires Authentication)

### POST /api/admin/exams
Create new exam

**Headers:** `Authorization: Bearer token`

**Request:**
```json
{
  "name": "Physics Practice",
  "type": "HSC",
  "description": "Physics questions",
  "total_questions": 100,
  "duration_minutes": 90,
  "passing_score": 50
}
```

### GET /api/admin/exams
Get all exams (admin view)

### POST /api/admin/bulk-import
Bulk import questions from CSV

**Headers:**
```
Authorization: Bearer token
Content-Type: multipart/form-data
```

**Form Data:**
- `exam_id`: ID of the exam
- `file`: CSV file

**CSV Format:**
```
topic,question,option_a,option_b,option_c,option_d,correct_answer,explanation,difficulty_level
```

---

## 🔗 Example Usage

### Python
```python
import requests

# Login
response = requests.post('http://localhost:5000/api/auth/login', json={
    'email': 'admin@example.com',
    'password': 'password123'
})
token = response.json()['token']

# Get exams
headers = {'Authorization': f'Bearer {token}'}
exams = requests.get('http://localhost:5000/api/exams', headers=headers).json()

# Upload questions
files = {'file': open('questions.csv', 'rb')}
data = {'exam_id': 1}
result = requests.post(
    'http://localhost:5000/api/admin/bulk-import',
    headers=headers,
    files=files,
    data=data
)
```

### JavaScript
```javascript
// Login
const loginRes = await fetch('http://localhost:5000/api/auth/login', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    email: 'admin@example.com',
    password: 'password123'
  })
});
const { token } = await loginRes.json();

// Get exams
const examsRes = await fetch('http://localhost:5000/api/exams', {
  headers: { 'Authorization': `Bearer ${token}` }
});
const exams = await examsRes.json();
```

---

## Error Responses

### 400 Bad Request
```json
{
  "message": "Validation error message"
}
```

### 401 Unauthorized
```json
{
  "message": "Invalid credentials or token"
}
```

### 500 Server Error
```json
{
  "message": "Server error message"
}
```

---

**API Base URL:** `http://localhost:5000/api` (development) or `https://your-domain.com/api` (production)
