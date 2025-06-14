<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #e7f6ec;
        color: #333;
    }

    .header {
        background-color: #007bff;
        color: white;
        text-align: center;
        padding: 80px 20px;
    }

    .header h1 {
        font-size: 36px;
        margin-bottom: 10px;
    }

    .header p {
        font-size: 18px;
        margin-bottom: 30px;
    }

    .buttons {
        margin-top: 20px;
    }

    .btn {
        display: inline-block;
        padding: 12px 24px;
        margin: 5px;
        background-color: white;
        color: #007bff;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .btn:hover {
        background-color: #e2e6ea;
    }

    .features {
        padding: 40px 20px;
        text-align: center;
    }

    .features h2 {
        font-size: 28px;
        margin-bottom: 20px;
    }

    .features ul {
        list-style: none;
        padding: 0;
        font-size: 18px;
    }

    .features li {
        margin: 10px 0;
    }

    footer {
        background-color: #222;
        color: white;
        text-align: center;
        padding: 15px 0;
        margin-top: 30px;
    }
    .features {
        padding: 60px 20px;
        text-align: center;
        background-color: #fff;
    }

    .features h2 {
        font-size: 32px;
        margin-bottom: 40px;
    }

    .feature-boxes {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 30px;
    }

    .box {
        background-color: #052459;
        padding: 25px;
        border-radius: 10px;
        width: 280px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
    }

    .box:hover {
        transform: translateY(-5px);
    }

    .box h3 {
        font-size: 20px;
        margin-bottom: 10px;
    }

    </style>
</head>
<body>
<div class="header">
    <h1>Welcome to the Complaint Management System</h1>
    <p>Efficiently manage and resolve public complaints</p>
    <div class="buttons">
        <div class="buttons">
            <a href="<%= request.getContextPath() %>/view/login.jsp" class="btn">Login</a>
            <a href="<%= request.getContextPath() %>/view/register.jsp" class="btn">Register</a>
        </div>

</div>

    <section class="features">
        <h2>Why Choose Us?</h2>
        <div class="feature-boxes">
            <div class="box">
                <h3>📝 Easy Complaint Submission</h3>
                <p>File complaints in just a few clicks with a simple form.</p>
            </div>
            <div class="box">
                <h3>📊 Real-time Tracking</h3>
                <p>Monitor the status of your complaint 24/7.</p>
            </div>
            <div class="box">
                <h3>🔒 Secure & Confidential</h3>
                <p>Your data is protected with strong security standards.</p>
            </div>
        </div>
    </section>
</div>

<footer>
    <p>&copy; 2025 Complaint Management System. All rights reserved.</p>
</footer>
</body>
</html>