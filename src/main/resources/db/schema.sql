-- Create the database
CREATE DATABASE complaint_management_system;

-- Use the database
USE complaint_management_system;

-- Create the `users` table
CREATE TABLE users (
                       user_id VARCHAR(50) PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       number VARCHAR(15) NOT NULL,
                       role ENUM('EMPLOYEE', 'ADMIN') NOT NULL,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the `complaints` table
CREATE TABLE complaints (
                            complaint_id VARCHAR(50) PRIMARY KEY,
                            title VARCHAR(255) NOT NULL,
                            description TEXT NOT NULL,
                            department VARCHAR(100) NOT NULL,
                            priority ENUM('LOW', 'MEDIUM', 'HIGH') NOT NULL,
                            status ENUM('PENDING', 'IN_PROGRESS', 'RESOLVED', 'REJECTED') DEFAULT 'PENDING',
                            submitted_by VARCHAR(50) NOT NULL,
                            assigned_to VARCHAR(50),
                            admin_remarks TEXT,
                            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                            updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            FOREIGN KEY (submitted_by) REFERENCES users(user_id),
                            FOREIGN KEY (assigned_to) REFERENCES users(user_id)
);

-- Insert sample data into `users`
INSERT INTO users (user_id, username, password, full_name, email, number, role) VALUES
                                                                                    ('U001', 'admin', 'admin123', 'System Admin', 'admin@example.com', '1234567890', 'ADMIN'),
                                                                                    ('U002', 'employee1', 'emp123', 'John Doe', 'john.doe@example.com', '0987654321', 'EMPLOYEE');

-- Insert sample data into `complaints`
INSERT INTO complaints (complaint_id, title, description, department, priority, status, submitted_by, assigned_to, admin_remarks) VALUES
                                                                                                                                      ('C001', 'Network Issue', 'Internet is not working in the office.', 'IT', 'HIGH', 'PENDING', 'U002', NULL, NULL),
                                                                                                                                      ('C002', 'Printer Issue', 'Printer is not functioning properly.', 'IT', 'MEDIUM', 'IN_PROGRESS', 'U002', 'U001', 'Assigned to IT team.');