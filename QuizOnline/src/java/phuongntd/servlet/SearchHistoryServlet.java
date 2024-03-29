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
import phuongntd.history.HistoryDAO;
import phuongntd.history.HistoryDTO;

/**
 *
 * @author Yun
 */
public class SearchHistoryServlet extends HttpServlet {

    private final String SHOW_SEARCH_PAGE = "quiz_history.jsp";

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
        String searchValue = request.getParameter("txtSearchValue").trim();
        String emailUser = request.getParameter("txtEmailUser");

        int pageIndex = 1;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }

        String url = SHOW_SEARCH_PAGE;
        try {

            if (searchValue.length() > 0) {
                int pageSize = 5;
                int endPage = 0;
                HistoryDAO dao = new HistoryDAO();

                dao.searchHistoryBySubject(searchValue, emailUser, pageIndex, pageSize);
                List<HistoryDTO> listHistory = dao.getListQuizHistory();
                int countListHistory = dao.countHistoryForSearch(searchValue, emailUser);
                endPage = countListHistory / pageSize;

                if (countListHistory % pageSize != 0) {
                    endPage++;
                }

                request.setAttribute("SEARCH_RESULT", listHistory);
                request.setAttribute("END_PAGE_SEARCH", endPage);
                request.setAttribute("CURRENT_PAGE_SEARCH", pageIndex);
            }

        } catch (SQLException ex) {
            log("SearchHistoryServlet_SQLException " + ex.getMessage());
        } catch (NamingException ex) {
            log("SearchHistoryServlet_NamingException " + ex.getMessage());
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
