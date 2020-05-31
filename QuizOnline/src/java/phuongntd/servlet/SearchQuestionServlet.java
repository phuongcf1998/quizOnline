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
import phuongntd.question.QuestionDAO;
import phuongntd.question.QuestionDTO;
import phuongntd.subject.SubjectDAO;
import phuongntd.subject.SubjectDTO;

/**
 *
 * @author Yun
 */
public class SearchQuestionServlet extends HttpServlet {

    private final String SHOW_SEARCH_PAGE = "home_admin.jsp";

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
        int pageIndex = 1;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }
        int status = Integer.parseInt(request.getParameter("slStatus"));

        boolean isContainSubject = false;
        String url = SHOW_SEARCH_PAGE;

        try {
            if (searchValue.length() > 0) {
                int pageSize = 20;
                int endPage = 0;
                QuestionDAO questionDAO = new QuestionDAO();
                SubjectDAO subjectDAO = new SubjectDAO();
                subjectDAO.getAllSubject();
                List<SubjectDTO> listAllSubject = subjectDAO.getListSubject();
                for (SubjectDTO subject : listAllSubject) {
                    if (searchValue.equals(subject.getSubjectID())) {
                        isContainSubject = true;
                        break;
                    }
                }
                if (isContainSubject) {
                    questionDAO.searchQuestionBySubject(searchValue, status, pageIndex, pageSize);

                    List<QuestionDTO> listQuestion = questionDAO.getListQuestion();
                    int countListQuestion = questionDAO.getTotalPageBySubjectID(searchValue, status);

                    endPage = countListQuestion / pageSize;

                    if (countListQuestion % pageSize != 0) {
                        endPage++;
                    }
                    request.setAttribute("SEARCH_RESULT", listQuestion);
                    request.setAttribute("LIST_SUBJECT", listAllSubject);
                    request.setAttribute("END_PAGE", endPage);
                    request.setAttribute("CURRENT_PAGE", pageIndex);
                } else {
                    questionDAO.searchQuestionByName(searchValue, status, pageIndex, pageSize);
                    List<QuestionDTO> listQuestion = questionDAO.getListQuestion();
                    int countListQuestion = questionDAO.getTotalPageByQuestionName(searchValue, status);

                    endPage = countListQuestion / pageSize;

                    if (countListQuestion % pageSize != 0) {
                        endPage++;
                    }

                    request.setAttribute("SEARCH_RESULT", listQuestion);
                    request.setAttribute("LIST_SUBJECT", listAllSubject);
                    request.setAttribute("END_PAGE", endPage);
                    request.setAttribute("CURRENT_PAGE", pageIndex);
                }
            }

        } catch (SQLException ex) {
            log("SearchServlet_SQLException " + ex.getMessage());
        } catch (NamingException ex) {
            log("SearchServlet_NamingException " + ex.getMessage());
        } finally {

//            System.out.println(listQuestionPRJ311);
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
