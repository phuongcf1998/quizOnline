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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuongntd.user.UserDAO;
import phuongntd.user.UserDTO;

/**
 *
 * @author Yun
 */
public class LoginServlet extends HttpServlet {

    private final String INVALID_PAGE = "invalid.html";
    private final String ACCESS_DENIED_PAGE = "access_denied.html";
    private final String HOME_STUDENT = "home_student.jsp";
    private final String HOME_ADMIN = "home_admin.jsp";

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
        String username = request.getParameter("txtUserName");
        String url = INVALID_PAGE;
        try {

            String password = request.getParameter("txtPassword");
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkLogin(username, password);

            if (dto != null) {
                if (dto.getStatus() != 1) {
                    switch (dto.getRole()) {
                        case 1: {
                            HttpSession session = request.getSession();
                            session.setAttribute("ADMIN", dto);
                            url = HOME_ADMIN;
                            break;
                        }
                        case 2: {
                            HttpSession session = request.getSession();
                            session.setAttribute("STUDENT", dto);
                            url = HOME_STUDENT;
                            break;
                        }

                        default:
                            url = INVALID_PAGE;
                            break;
                    }
                } else {
                    url = ACCESS_DENIED_PAGE;
                }
            }

        } catch (NumberFormatException ex) {
            url = INVALID_PAGE;
            log("LoginServlet_ NumberFormatException " + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginServlet_ NamingException " + ex.getMessage());
        } catch (SQLException ex) {
            log("LoginServlet_ SQLException " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
