<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.gdse72.cmsaad.model.podos.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Users</title>
    <link rel="stylesheet" href="../css/viewAll.css">

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<h1>All Users</h1>
<table>
    <thead>
    <tr>
        <th>User ID</th>
        <th>Username</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
            for (UserDTO user : users) {
    %>
    <tr>
        <td><%= user.getUserId() %></td>
        <td><%= user.getUsername() %></td>
        <td><%= user.getFullName() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getRole() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5" style="text-align: center;">No users found</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<div style="margin-top: 20px; text-align: center;">
    <a href="${pageContext.request.contextPath}/view/admin-dashboard.jsp" style="padding: 8px 16px; background-color: #2c7aea; color: #fff; text-decoration: none; border-radius: 4px;">
        Back to Dashboard
    </a>
</div>
</body>
</html>