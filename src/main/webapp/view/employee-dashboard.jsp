<%@ page import="lk.ijse.gdse72.cmsaad.model.ComplaintDAO" %>
<%@ page import="lk.ijse.gdse72.cmsaad.model.podos.ComplaintDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lk.ijse.gdse72.cmsaad.model.podos.UserDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Employee Dashboard</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(to right, #2c7aea, #6fa8dc);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: start;
            padding: 20px;
        }

        .dashboard-container {
            display: flex;
            width: 100%;
            max-width: 1200px;
        }

        .sidebar {
            width: 250px;
            min-height: 100vh;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 30px 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        }

        .logo p {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .welcome-section h2 {
            font-size: 20px;
            margin-bottom: 5px;
        }

        .welcome-section span {
            font-size: 16px;
            color: #eee;
            font-weight: 500;
        }
        .nav-link {
            display: block;
            width: 100%;
            padding: 10px 15px;
            margin-bottom: 10px;
            text-decoration: none;
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid transparent;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: left;
        }

        .nav-link:hover,
        .nav-link.active {
            background-color: rgba(255, 255, 255, 0.3);
            border: 1px solid #fff;
            color: #ffd700;
            transform: scale(1.02);
        }

        .nav-menu {
            list-style: none;
            margin-top: 30px;
        }

        .nav-item {
            margin-bottom: 20px;
        }

        .nav-link {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: 0.3s;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #ffd700;
            font-weight: bold;
        }

        .logout-btn {
            display: inline-block;
            margin-top: 40px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: 0.3s;
        }

        .logout-btn:hover {
            color: #ff4d4d;
        }

        .main-content {
            flex: 1;
            margin-left: 30px;
        }

        .header {
            padding: 20px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.15);
            margin-bottom: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .stat-card {
            padding: 20px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            text-align: center;
            transition: 0.3s ease;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-number {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff;
        }

        .stat-label {
            font-size: 16px;
            color: #ddd;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }

        /* Status Color Coding */
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

    </style>
</head>
<body>
<%
    UserDTO user = (UserDTO) session.getAttribute("user");
    ComplaintDAO complaintDAO = new ComplaintDAO();
    List<ComplaintDTO> complaints = complaintDAO.getComplaintsByUser(user.getUserId());

    int pendingCount = 0;
    int resolvedCount = 0;
    int inProgressCount = 0;
    int rejectedCount = 0;

    List<ComplaintDTO> complaintsWithRemarks = new ArrayList<>();

    if (complaints != null && !complaints.isEmpty()) {
        for (ComplaintDTO complaint : complaints) {
            String status = complaint.getStatus() != null ? complaint.getStatus().toLowerCase() : "pending";

            if ("pending".equals(status)) {
                pendingCount++;
            } else if ("resolved".equals(status)) {
                resolvedCount++;
            } else if ("in_progress".equals(status)) {
                inProgressCount++;
            } else if ("rejected".equals(status)) {
                rejectedCount++;
            }

            if (complaint.getAdminRemarks() != null && !complaint.getAdminRemarks().isEmpty()) {
                complaintsWithRemarks.add(complaint);
            }
        }
    }
%>

<div class="dashboard-container">

    <aside class="sidebar glass">
        <div class="logo">
            <p>Employee Dashboard</p>
        </div>

        <div class="welcome-section">
            <h2>Hello,</h2>
            <span><%= user.getFullName() != null ? user.getFullName() : "User" %></span>
        </div>

        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="#dashboard" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="complaint-form.jsp" class="nav-link">
                        <i class="nav-icon fas fa-plus-circle"></i>
                        <span>New Complaint</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="my-complaints.jsp" class="nav-link">
                        <i class="nav-icon fas fa-list-alt"></i>
                        <span>My Complaints</span>
                    </a>
                </li>
            </ul>
        </nav>

        <a href="<%= request.getContextPath() %>/logout" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </aside>

    <main class="main-content">
        <header class="header glass">
            <h1>Dashboard Overview</h1>
        </header>

        <div class="stats-grid">
            <div class="stat-card glass pending">
                <div class="stat-number"><%= pendingCount %></div>
                <div class="stat-label">
                    <i class="fas fa-clock"></i> Pending
                </div>
            </div>
            <div class="stat-card glass in-progress">
                <div class="stat-number"><%= inProgressCount %></div>
                <div class="stat-label">
                    <i class="fas fa-cog fa-spin"></i> In Progress
                </div>
            </div>
            <div class="stat-card glass resolved">
                <div class="stat-number"><%= resolvedCount %></div>
                <div class="stat-label">
                    <i class="fas fa-check-circle"></i> Resolved
                </div>
            </div>
            <div class="stat-card glass rejected">
                <div class="stat-number"><%= rejectedCount %></div>
                <div class="stat-label">
                    <i class="fas fa-times-circle"></i> Rejected
                </div>
            </div>
        </div>





    </main>
</div>
</body>
</html>
