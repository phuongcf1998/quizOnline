/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuongntd.user.UserCreateErr;
import phuongntd.user.UserDAO;
import phuongntd.utils.EmailValidate;

/**
 *
 * @author Yun
 */
public class CreateNewAccountServlet extends HttpServlet {
        private final String CREATE_ERROR_PAGE = "create_account.jsp";
        private final String LOGIN_PAGE = "login.html";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.security.NoSuchAlgorithmException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("txtEmail").trim();
        String name = request.getParameter("txtName");
        String password = request.getParameter("txtPassword");
        String confirmPassword = request.getParameter("txtConfirmPassword");

        String url = CREATE_ERROR_PAGE;

        UserCreateErr errors = new UserCreateErr();
        boolean foundErr = false;
        try  {
            if (email.equals("")) {
                foundErr = true;
                errors.setEmailEmpty("Email is empty");
            }
            if (!EmailValidate.validEmail(email) && !email.equals("")) {
                foundErr = true;
                errors.setEmailNotValid("Email is not valid");
            }
            if (name.equals("")) {
                foundErr = true;
                errors.setNameEmpty("Name is empty");
            }
            if (password.equals("")) {
                foundErr = true;
                errors.setPasswordEmpty("Password is empty");
            }
            
            if (confirmPassword.equals("")) {
                foundErr = true;
                errors.setConfirmPasswordNotMatch("Confirm password is empty");
            }

            
            if (!confirmPassword.equals(password)) {
                foundErr = true;
                errors.setConfirmPasswordNotMatch("Password is not match");
            }

            if (foundErr) {
                request.setAttribute("CREATE_ACCOUNT_ERR", errors);

            } else{
                UserDAO dao = new UserDAO();
                boolean result = dao.createNewUser(email, name, password);
                if (result) {
                    url = LOGIN_PAGE;
                }
            }
        } catch (SQLException ex) {
            log("CreateNewAccountServlet_SQLException " + ex.getMessage());
            if (ex.getMessage().contains("duplicate")) {
                errors.setEmailIsExits(email + " is existed !!!");
                request.setAttribute("CREATE_ACCOUNT_ERR", errors);
            }
        } catch (NamingException ex) {
            log("CreateNewAccountServlet_ClassNotFoundException " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(CreateNewAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(CreateNewAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
