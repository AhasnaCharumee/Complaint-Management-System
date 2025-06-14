<%@ page session="true" %>
<%@ page import="lk.ijse.gdse72.cmsaad.model.podos.ComplaintDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Complaint</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background: radial-gradient(circle at center, #e0f7e9, #2c7aea);
        background-attachment: fixed;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #1d1d1d;
    }

    .container {
        background: linear-gradient(135deg,rgba(255, 255, 255, 0.2),rgba(255, 255, 255, 0.1));
        border-radius: 20px;
        box-shadow: 0 12px 40px 0px rgba(0, 0, 0, 0.3);
        backdrop-filter: blur(15px);
        -webkit-backdrop-filter: blur(15px);
        border: 1px solid rgba(255, 255, 255, 0.4);
        padding: 3rem 2.5rem;
        width: 100%;
        max-width: 400px;
        margin: 2rem;
        color: #1d1d1d;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .container:hover {
        transform: translateY(-5px);
        box-shadow: 0 16px 50px 0px rgba(0, 0, 0, 0.4);
    }

    h1, h2, h3 {
        color: #2c7aea;
        text-align: center;
        margin-bottom: 2rem;
        font-weight: 700;
        letter-spacing: 1px;
        text-shadow: 0 1px 3px #0003;
    }

    label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 500;
        color: #1d1d1d;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    textarea,
    select {
        width: 100%;
        padding: 0.9rem;
        margin-bottom: 1.5rem;
        border: none;
        border-radius: 12px;
        background: linear-gradient(145deg, #ffffffcc, #edf7efcc);
        box-shadow: inset 2px 2px 6px #c5c5c5, inset -2px -2px 6px #ffffff;
        transition: all 0.3s ease;
        color: #1d1d1d;
        font-size: 1rem;
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus,
    textarea:focus,
    select:focus {
        outline: none;
        transform: translateY(-2px);
        background: linear-gradient(145deg, #edf7efcc, #ffffffcc);
    }

    button,
    input[type="submit"] {
        width: 100%;
        padding: 0.9rem;
        border: none;
        border-radius: 12px;
        background: linear-gradient(90deg, #2c7aea, #2c7aea);
        color: #1d1d1d;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 1.05rem;
        letter-spacing: 0.5px;
    }

    button:hover,
    input[type="submit"]:hover {
        background: linear-gradient(90deg, #2c7aea, #2c7aea);
        transform: translateY(-3px);
        box-shadow: 0 7px 20px -5px #2c7aea;
    }

    .navbar {
        background: linear-gradient(135deg,rgba(255, 255, 255, 0.1),rgba(255, 255, 255, 0.05));
        padding: 1.5rem;
        text-align: center;
        border-radius: 0 0 20px 20px;
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 20px -5px black;
    }

    .navbar a {
        text-decoration: none;
        color: #2c7aea;
        margin: 0 1.5rem;
        font-weight: bold;
        transition: color 0.3s ease, transform 0.3s ease;
        font-size: 1.05rem;
    }

    .navbar a:hover {
        color: #2c7aea;
        transform: translateY(-2px);
        text-shadow: 0 0 5px #2c7aea;
    }

    .error {
        color: #ff4d4d;
        font-size: 0.9rem;
        margin-bottom: 0.5rem;
        display: block;
        font-weight: 500;
    }

    input.invalid {
        border: 2px solid #ff4d4d;
        background: #ffe5e5;
        transition: 0.3s ease;
    }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Complaint</h1>
    <form action="<%= request.getContextPath() %>/employee/edit-complaint" method="post">
        <%
            ComplaintDTO complaint = (ComplaintDTO) request.getAttribute("complaint");
        %>
        <input type="hidden" name="complaintId" value="<%= complaint.getComplaintId() %>">

        <label for="title">Title:</label>
        <input type="text" name="title" id="title" value="<%= complaint.getTitle() %>" required>

        <label for="description">Description:</label>
        <textarea name="description" rows="4" id="description" required><%= complaint.getDescription() %></textarea>

        <label for="department">Department:</label>
        <input type="text" name="department" id="department" value="<%= complaint.getDepartment() %>" required>

        <label for="priority">Priority:</label>
        <select name="priority" id="priority">
            <option value="LOW" <%= "LOW".equals(complaint.getPriority()) ? "selected" : "" %>>Low</option>
            <option value="MEDIUM" <%= "MEDIUM".equals(complaint.getPriority()) ? "selected" : "" %>>Medium</option>
            <option value="HIGH" <%= "HIGH".equals(complaint.getPriority()) ? "selected" : "" %>>High</option>
        </select>

        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>
