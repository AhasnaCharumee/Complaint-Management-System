<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Complaint Management System</title>
    <style>
        /* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #4786ea; /* light warm background */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Container Styling */
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            position: relative;
        }

        .container h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #007bff;
        }

        /* Form Styling */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Error Styles */
        .error {
            color: red;
            font-size: 12px;
            margin-top: 4px;
        }

        .invalid {
            border-color: red !important;
        }

        /* Submit Button */
        input[type="submit"] {
            margin-top: 20px;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Back Button */
        a {
            font-size: 13px;
        }

        a.back-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #f44336;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a.back-btn:hover {
            background-color: #d32f2f;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>Register</h1>
    <form action="${pageContext.request.contextPath}/registerservlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" value="${oldUsername != null ? oldUsername : ''}" class="${not empty usernameError ? 'invalid' : ''}">
        <span class="error">${usernameError}</span>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password"   class="${not empty passwordError ? 'invalid' : ''}">
        <span class="error">${passwordError}</span>

        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" id="fullName"  value="${oldFullName != null ? oldFullName : ''}" class="${not empty fullNameError ? 'invalid' : ''}">
        <span class="error">${fullNameError}</span>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${oldEmail != null ? oldEmail : ''}" class="${not empty emailError ? 'invalid' : ''}">
        <span class="error">${emailError}</span>

        <label for="number">Phone Number:</label>
        <input type="text" name="number" id="number" value="${oldPhone != null ? oldPhone : ''}" class="${not empty phoneError ? 'invalid' : ''}">
        <span class="error">${phoneError}</span>

        <label for="role">Role:</label>
        <select name="role" id="role">
            <option value="EMPLOYEE">Employee</option>
            <option value="ADMIN">Admin</option>
        </select>
        <span class="error">${roleError}</span>

        <input type="submit" value="Register">
        <a href="<%= request.getContextPath() %>/index.jsp"
           style="position: absolute; right: 10px; top: 10px; background-color: #f44336; color: white; padding: 6px 12px; border-radius: 4px; text-decoration: none; cursor: pointer;">
            Back To Login ...
        </a>

    </form>
</div>
</body>
</html>