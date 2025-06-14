package lk.ijse.gdse72.cmsaad.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.gdse72.cmsaad.model.UserDAO;
import lk.ijse.gdse72.cmsaad.model.podos.UserDTO;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDTO user = userDAO.authenticate(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            System.out.println("User authenticated: " + user.getUsername() + ", Role: " + user.getRole());

            if (user.isAdmin()) {
                resp.sendRedirect(req.getContextPath() + "/view/admin-dashboard.jsp");
            } else if (user.isEmployee()) {
                resp.sendRedirect(req.getContextPath() + "/view/employee-dashboard.jsp");
            } else {
                System.out.println("Unknown Role");
                resp.sendRedirect(req.getContextPath() + "/index.jsp?error=role");
            }
        } else {
            System.out.println("Invalid Credentials");
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=invalid");
        }
    }
}