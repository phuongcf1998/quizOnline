/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuongntd.history.HistoryDAO;
import phuongntd.history.HistoryDTO;
import phuongntd.user.UserDTO;

/**
 *
 * @author Yun
 */
public class ViewQuizHistoryServlet extends HttpServlet {

    private final String QUIZ_HISTORY = "quiz_history.jsp";
    private final String LOGIN_PAGE = "login.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int pageIndex = 1;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }
        
        String url = LOGIN_PAGE;
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("STUDENT") != null) {
                int pageSize = 10;
                int endPage = 0;
                UserDTO userInfo = (UserDTO) session.getAttribute("STUDENT");
                HistoryDAO dao = new HistoryDAO();
                int countListHistory = dao.countHistoryForShowAll(userInfo.getEmail());

                endPage = countListHistory / pageSize;

                if (countListHistory % pageSize != 0) {
                    endPage++;
                }
                dao.getAllQuizHistoryByEmail(userInfo.getEmail(), pageIndex, pageSize);
                List<HistoryDTO> listQuizHistory = dao.getListQuizHistory();

                request.setAttribute("HISTORY_LIST", listQuizHistory);
                request.setAttribute("END_PAGE_ALL", endPage);
                request.setAttribute("CURRENT_PAGE_SHOW", pageIndex);
                url = QUIZ_HISTORY;
            } else {
                url = LOGIN_PAGE;

            }
        } catch (SQLException ex) {
            log("ViewQuizHistoryServlet_SQLException " + ex.getMessage());
        } catch (NamingException ex) {
            log("ViewQuizHistoryServlet_NamingException " + ex.getMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
