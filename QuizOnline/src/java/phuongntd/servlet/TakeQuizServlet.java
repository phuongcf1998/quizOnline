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

/**
 *
 * @author Yun
 */
public class TakeQuizServlet extends HttpServlet {

    private final String QUIZ_PAGE = "quizPage.jsp";

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
        String subjectID = request.getParameter("slSubjectID");
        String url = QUIZ_PAGE;
        try {

            QuestionDAO questionDAO = new QuestionDAO();
            SubjectDAO subjectDAO = new SubjectDAO();
            int quizTime = subjectDAO.getQuizTimeOfSubject(subjectID);
            int numberQuestion = subjectDAO.getNumberQuestionOfSubject(subjectID);
            questionDAO.getRandomQuestions(numberQuestion, subjectID);
            List<QuestionDTO> listRandomQuestions = questionDAO.getListQuestion();
            request.setAttribute("LIST_QUESTION", listRandomQuestions);
            request.setAttribute("QUIZ_TIME", quizTime);
            request.setAttribute("SUBJECT_ID", subjectID);

        } catch (SQLException ex) {
            log("TakeQuizServlet_SQLException " + ex.getMessage());
        } catch (NamingException ex) {
            log("TakeQuizServlet_NamingException " + ex.getMessage());
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
