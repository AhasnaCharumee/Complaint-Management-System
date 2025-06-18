<%@ page import="lk.ijse.gdse72.cmsaad.model.podos.ComplaintDTO" %>
<%@ page import="lk.ijse.gdse72.cmsaad.model.ComplaintDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.gdse72.cmsaad.model.podos.UserDTO" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Complaint Management</title>
    <link rel="stylesheet" href="../css/addminDashboard.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(to right, #2c7aea, #6fa8dc);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: start;
            padding: 20px;
            color: #fff;
        }

        .dashboard-container {
            display: flex;
            width: 100%;
            max-width: 1200px;
        }

        .sidebar {
            width: 250px;
            background: rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            padding: 30px 20px;
            border-radius: 15px;
            height: auto;
            min-height: 100vh;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
        }

        .logo h1 {
            font-size: 26px;
            margin-bottom: 30px;
            color: #fff;
            text-align: center;
        }

        .welcome-section h2 {
            font-size: 18px;
            margin-bottom: 10px;
            text-align: center;
        }

        .nav-menu {
            list-style: none;
            margin-top: 30px;
        }

        .nav-item {
            margin-bottom: 15px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 12px 15px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            transition: 0.3s;
            font-size: 16px;
        }

        .nav-link:hover,
        .nav-link.active {
            background-color: rgba(255, 255, 255, 0.3);
            color: #ffd700;
        }

        .logout-btn {
            display: inline-block;
            margin-top: 40px;
            padding: 10px 15px;
            background-color: #0d438f;
            color: #fff;
            text-align: center;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s ease-in-out;
        }

        .logout-btn:hover {
            background-color: #092f66;
        }

        .main-content {
            flex: 1;
            margin-left: 30px;
        }

        .header {
            background-color: rgba(255, 255, 255, 0.15);
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            padding: 20px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(8px);
            text-align: center;
            transition: 0.3s ease;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-number {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff;
        }

        .stat-label {
            font-size: 16px;
            color: #eee;
        }

        .pending {
            border-left: 5px solid #f0ad4e;
        }

        .in-progress {
            border-left: 5px solid #5bc0de;
        }

        .resolved {
            border-left: 5px solid #5cb85c;
        }

        .rejected {
            border-left: 5px solid #d9534f;
        }

        .image {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .image img {
            max-width: 80%;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

    </style>

</head>
<body>
<div class="dashboard-container" id="dashboard">
    <%
        UserDTO user = (UserDTO) session.getAttribute("user");

        List<ComplaintDTO> users= null;
        if (user != null) {
            ComplaintDAO complaintDAO = new ComplaintDAO();
            users = complaintDAO.getComplaintsByUser(user.getUserId());
        }
    %>

    <nav class="sidebar glass">
        <div class="logo">
            <h1> CMS</h1>
        </div>

        <div class="welcome-section">
            <h2>Welcome,</h2>
            <% if (user != null) { %>
            <h2><span><%= user.getUsername() %></span></h2>
            <% } else { %>
            <h2><span>Guest</span></h2>
            <% } %>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="#dashboard" class="nav-link">
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/view/view-all-complaints.jsp" class="nav-link">
                    All Complaints
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/users" class="nav-link">
                    Users
                </a>
            </li>

        </ul>


        <a href="${pageContext.request.contextPath}/logout" class="logout-btn" style="text-decoration: none; background-color: #0d438f">
            <span class="nav-icon" style=" background-color: #0d438f"></span>
            Logout
        </a>
    </nav>

    <%
        System.out.println("before get complaints: ");
        ComplaintDAO complaintDAO = new ComplaintDAO();
        List<ComplaintDTO> complaints = complaintDAO.getAllComplaints();
        System.out.println("complaints tika: " + complaints);

        int totalComplaints = 0;
        int pendingCount = 0;
        int resolvedCount = 0;
        int inProgressCount = 0;
        int rejectedCount = 0;

        if (complaints != null) {
            totalComplaints = complaints.size();

            for (ComplaintDTO complaint : complaints) {
                String status = complaint.getStatus() != null ? complaint.getStatus().toLowerCase() : "";

                if ("pending".equals(status)) pendingCount++;
                else if ("resolved".equals(status)) resolvedCount++;
                else if ("in_progress".equals(status)) inProgressCount++;
                else if ("rejected".equals(status)) rejectedCount++;
            }
        }
    %>

    <main class="main-content">
        <div class="header glass">
            <h1>Admin Dashboard</h1>
        </div>

        <div class="stats-grid">
            <div class="stat-card glass pending">
                <div class="stat-number"><%= pendingCount %></div>
                <div class="stat-label">Pending</div>
            </div>
            <div class="stat-card glass in-progress">
                <div class="stat-number"><%= inProgressCount %></div>
                <div class="stat-label">In Progress</div>
            </div>
            <div class="stat-card glass resolved">
                <div class="stat-number"><%= resolvedCount %></div>
                <div class="stat-label">Resolved</div>
            </div>
            <div class="stat-card glass rejected">
                <div class="stat-number"><%= rejectedCount %></div>
                <div class="stat-label">Rejected</div>
            </div>
        </div>

        <div class="image" style="justify-content: center">
            <img style="justify-content: center;max-width: 70%;max-height: 50%;" src="https://img.freepik.com/premium-vector/service-customers-support-concept_118813-4309.jpg?semt=ais_items_boosted&w=740">
        </div>



    </main>
</div>
</body>
</html>