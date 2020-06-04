/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuongntd.question.QuestionDAO;

/**
 *
 * @author Yun
 */
public class UpdateServlet extends HttpServlet {

//    private final String UPDATE_ERROR_PAGE = "update_error.html";
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
        String questionID = request.getParameter("pk");
        String subjectID = request.getParameter("slSubjectID");
        String status = request.getParameter("status");
        String questionContent = request.getParameter("txtQuestionContent");
        String ans1 = request.getParameter("txtAns1");
        String ans2 = request.getParameter("txtAns2");
        String ans3 = request.getParameter("txtAns3");
        String ans4 = request.getParameter("txtAns4");
        String ansCorrect = request.getParameter("txtAnsCorrect");
        String page = request.getParameter("page");
        String lastSearchValue = request.getParameter("txtLastSearchValue");
        String url = "";
        String searchOption = request.getParameter("searchOption");
        try {
            switch (ansCorrect) {
                case "ans1":
                    ansCorrect = ans1;
                    break;
                case "ans2":
                    ansCorrect = ans2;
                    break;
                case "ans3":
                    ansCorrect = ans3;
                    break;
                case "ans4":
                    ansCorrect = ans4;
                    break;
            }

            QuestionDAO dao = new QuestionDAO();
            boolean result = dao.updateQuestion(questionID, subjectID, questionContent, ans1, ans2, ans3, ans4, ansCorrect);
            if (result) {

                if (searchOption.equals("")) {
                    url = "ProcessServlet?btAction=Search_Question"
                            + "&txtSearchValue="
                            + lastSearchValue + "&slStatus=" + status + "&page=" + page;

                } else {
                    url = "ProcessServlet?btAction=Search_Question"
                            + "&txtSearchValue="
                            + lastSearchValue + "&slStatus=" + status + "&page=" + page + "&chkSearchSubject=" + searchOption;
                }

            }

        } catch (SQLException ex) {
            log("UpdateServlet_SQLException" + ex.getMessage());
        } catch (NamingException ex) {
            log("UpdateServlet_NamingException" + ex.getMessage());

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
