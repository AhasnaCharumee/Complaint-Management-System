<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Complaint</title>
    <style>body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e6f0ff;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 500px;
        margin: 80px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    }

    h1 {
        text-align: center;
        color: #004aad;
        margin-bottom: 30px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #003366;
    }

    input[type="text"],
    textarea,
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    textarea:focus,
    select:focus {
        border-color: #007bff;
        outline: none;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    button {
        font-size: 14px;
    }

    span.error {
        color: red;
        font-size: 12px;
    }

    .invalid {
        border-color: red !important;
    }
    </style>

</head>
<body>
<div class="container">
    <form action="<%= request.getContextPath() %>/view/employee-dashboard.jsp" style="position: absolute; right: 10px; top: 10px;">
        <button type="submit" style="background-color: #f44336; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer;">
            DashBoard
        </button>
    </form>
    <h1>Submit Complaint</h1>
    <form action="${pageContext.request.contextPath}/employee/submit-complaint" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" class="${not empty titleError ? 'invalid' : ''}">
        <span class="error" id="titleError">${titleError != null ? titleError : ''}</span>

        <label for="description">Description:</label>
        <textarea name="description" rows="4" id="description"  class="${not empty descriptionError ? 'invalid' : ''}"></textarea>
        <span class="error" id="descriptionError">${descriptionError != null ? descriptionError : ''}</span>

        <label for="department">Department:</label>
        <input type="text" name="department" id="department" class="${not empty departmentError ? 'invalid' : ''}">
        <span class="error" id="departmentError">${departmentError != null ? departmentError : ''}</span>

        <label for="priority">Priority:</label>
        <select name="priority" id="priority" class="${not empty priorityError ? 'invalid' : ''}">
            <option value="LOW">Low</option>
            <option value="MEDIUM">Medium</option>
            <option value="HIGH">High</option>
        </select>
        <span class="error" id="priorityError">${priorityError != null ? priorityError : ''}</span>

        <input type="submit" value="Submit">
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/complaintFormValidation.js"></script>
   </div>
</body>
</html>