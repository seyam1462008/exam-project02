-- Users Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('admin', 'student')) DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Exams Table (SSC, HSC, Admission, BCS)
CREATE TABLE exams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) CHECK (type IN ('SSC', 'HSC', 'Admission', 'BCS')) NOT NULL,
    description TEXT,
    total_questions INT NOT NULL,
    duration_minutes INT DEFAULT 60,
    passing_score INT DEFAULT 40,
    created_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Topics/Subjects Table
CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    exam_id INT REFERENCES exams(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Questions Table
CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    exam_id INT REFERENCES exams(id) ON DELETE CASCADE,
    topic_id INT REFERENCES topics(id) ON DELETE SET NULL,
    question_text TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_answer VARCHAR(1) CHECK (correct_answer IN ('A', 'B', 'C', 'D')) NOT NULL,
    explanation TEXT,
    difficulty_level VARCHAR(20) CHECK (difficulty_level IN ('Easy', 'Medium', 'Hard')) DEFAULT 'Medium',
    imported_from VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Student Exam Attempts
CREATE TABLE exam_attempts (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES users(id) ON DELETE CASCADE,
    exam_id INT REFERENCES exams(id) ON DELETE CASCADE,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP,
    total_score INT,
    total_questions INT,
    attempted_questions INT,
    correct_answers INT,
    status VARCHAR(20) CHECK (status IN ('In Progress', 'Completed', 'Abandoned')) DEFAULT 'In Progress',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Student Answers Table
CREATE TABLE student_answers (
    id SERIAL PRIMARY KEY,
    attempt_id INT REFERENCES exam_attempts(id) ON DELETE CASCADE,
    question_id INT REFERENCES questions(id),
    student_id INT REFERENCES users(id),
    selected_answer VARCHAR(1) CHECK (selected_answer IN ('A', 'B', 'C', 'D', 'N') ),
    is_correct BOOLEAN,
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bulk Import History (for CSV/Excel uploads)
CREATE TABLE bulk_imports (
    id SERIAL PRIMARY KEY,
    admin_id INT REFERENCES users(id),
    exam_id INT REFERENCES exams(id) ON DELETE CASCADE,
    file_name VARCHAR(255),
    total_records INT,
    successful_imports INT,
    failed_imports INT,
    import_status VARCHAR(20) CHECK (import_status IN ('Pending', 'Processing', 'Completed', 'Failed')) DEFAULT 'Pending',
    error_log TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_questions_exam_id ON questions(exam_id);
CREATE INDEX idx_questions_topic_id ON questions(topic_id);
CREATE INDEX idx_exam_attempts_student_id ON exam_attempts(student_id);
CREATE INDEX idx_exam_attempts_exam_id ON exam_attempts(exam_id);
CREATE INDEX idx_student_answers_attempt_id ON student_answers(attempt_id);
CREATE INDEX idx_student_answers_student_id ON student_answers(student_id);
CREATE INDEX idx_bulk_imports_admin_id ON bulk_imports(admin_id);
CREATE INDEX idx_bulk_imports_exam_id ON bulk_imports(exam_id);