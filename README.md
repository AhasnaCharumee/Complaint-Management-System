# Complaint Management System (CMS)

A full-stack web-based application developed for managing public complaints within a municipal organization. This project was built as part of the **IJSE GDSE - Advanced API Development Assignment** using **JSP**, **Servlets**, **MySQL**, and **Jakarta EE**.

---

## 🚀 Project Overview

The CMS provides role-based access for employees and admins. Employees can submit and track complaints, while admins manage, update, and resolve them. The system ensures secure complaint handling and presents real-time complaint statistics through a dashboard interface.

---

## ✨ Features

- 📝 **Complaint Submission**: Employees can easily submit complaints through a form.
- 📋 **Complaint List**: Filtered list of complaints by user role.
- 📊 **Dashboard**: Displays real-time complaint statistics (Pending, In Progress, Resolved, Rejected).
- 🔐 **Authentication & Session Management**:
    - Login with session tracking.
    - Role-based UI and functionality (Employee vs Admin).
- 🧩 **Admin Functionalities**:
    - View all complaints.
    - Update status and remarks.
    - Delete any complaint.
- 📂 **Employee Functionalities**:
    - Edit/delete unresolved complaints.
    - View own complaints.

---

## 🛠️ Technologies Used

| Layer        | Technologies                       |
|--------------|------------------------------------|
| Frontend     | JSP, HTML, CSS, JavaScript         |
| Backend      | Jakarta EE (Servlets), JavaBeans   |
| Database     | MySQL (with DBCP connection pool)  |
| Server       | Apache Tomcat                      |
| Build Tool   | Maven                              |

---

## 🧱 Project Structure

src/
├── main/
│ ├── java/
│ │ └── lk/ijse/gdse72/cmsaad/
│ │ ├── controller/ # Servlets
│ │ ├── model/ # DAO, POJOs
│ │ └── db/ # DB connection pool
│ ├── webapp/
│ │ ├── view/ # JSP Views
│ │ ├── css/ # Stylesheets
│ │ ├── js/ # JavaScript (validation only)
│ │ └── index.jsp
├── db/
│ └── schema.sql # MySQL dump
└── test/


---

## 🧪 Setup Instructions

### 🔧 Prerequisites
- JDK 17+
- Apache Tomcat 9+
- MySQL Server
- IntelliJ IDEA or Eclipse
- Maven

### ⚙️ Steps

```bash
# 1. Clone the project
git clone <repository-url>
cd <repository-folder>

# 2. Import project into IntelliJ IDEA or Eclipse

# 3. Configure MySQL
#    - Create a database
#    - Import db/schema.sql
#    - Update DB credentials in DBConnectionPool.java

# 4. Build & Run
mvn clean install
mvn tomcat7:run

# 5. Visit in browser
http://localhost:8080/cms_AAD_war_exploded/
```
## 🔐 Login Roles

| Role     | Features                               |
|----------|----------------------------------------|
| Admin    | Manage all complaints, update statuses |
| Employee | Submit/edit/delete own complaints      |
---

## 🧠 Architecture

### 📐 MVC Pattern

- **Model**:  
  JavaBeans (DTOs) and DAO classes that handle business logic and database interactions.

- **View**:  
  JSP (JavaServer Pages) files render dynamic content using embedded Java.

- **Controller**:  
  Servlets handle incoming HTTP requests and route data between Model and View.  
  Servlet mappings are handled via annotations or `web.xml`.

---

### 📝 Form Handling

| HTTP Method | Purpose                                 | Example Use Case               |
|-------------|-----------------------------------------|--------------------------------|
| **GET**     | For read-only actions                   | Viewing complaint list         |
| **POST**    | For state-changing operations           | Submitting, editing complaints |

⚠️ **Important Constraint**:  
All backend interactions are handled through synchronous HTML `<form>` submissions using **GET** and **POST** methods.  
🚫 No AJAX, `fetch()`, or `XMLHttpRequest` is allowed — as per assignment rules.
