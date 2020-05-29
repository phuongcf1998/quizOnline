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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuongntd.question.QuestionCreateErr;
import phuongntd.question.QuestionDAO;

/**
 *
 * @author Yun
 */
public class CreateNewQuestionServlet extends HttpServlet {

    private final String CREATE_ERROR_PAGE = "create_question.jsp";
    private final String SUCCESS_PAGE = "create_question_success.html";

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
        String questionID = request.getParameter("txtQuestionId");
        String questionContent = request.getParameter("txtQuestionContent");
        String ans1 = request.getParameter("txtAns1");
        String ans2 = request.getParameter("txtAns2");
        String ans3 = request.getParameter("txtAns3");
        String ans4 = request.getParameter("txtAns4");
        String ansCorrect = request.getParameter("rdAnsCorrect");

        String url = CREATE_ERROR_PAGE;

        QuestionCreateErr errors = new QuestionCreateErr();
        boolean foundErr = false;
        try {
            if (questionID.equals("")) {
                foundErr = true;
                errors.setQuestionIdEmpty("Question ID is empty");
            }
            if (questionID.length()>30) {
                foundErr = true;
                errors.setQuestionExceededLength("Question ID length must < 30 characters");
            }

            if (questionContent.equals("")) {
                foundErr = true;
                errors.setQuestionContentEmpty("Question Content is empty");
            }
            if (ans1.equals("")) {
                foundErr = true;
                errors.setAnswer1Empty("Answer 1 is empty");
            }

            if (ans2.equals("")) {
                foundErr = true;
                errors.setAnswer2Empty("Answer 2 is empty");
            }

            if (ans3.equals("")) {
                foundErr = true;
                errors.setAnswer3Empty("Answer 3 is empty");
            }

            if (ans4.equals("")) {
                foundErr = true;
                errors.setAnswer4Empty("Answer 4 is empty");
            }
            if (ansCorrect==null) {
                foundErr = true;
                errors.setAnswerCorrectEmpty("Answer Correct is empty");
            }

            if (foundErr) {
                request.setAttribute("CREATE_QUESTION_ERR", errors);

            } else {
                QuestionDAO dao = new QuestionDAO();

                switch (ansCorrect) {
                    case "a1":
                        ansCorrect = ans1;
                        break;
                    case "a2":
                        ansCorrect = ans2;
                        break;
                    case "a3":
                        ansCorrect = ans3;
                        break;
                    case "a4":
                        ansCorrect = ans4;
                        break;
                }

                boolean result = dao.createQuestion(subjectID, questionID, questionContent, ans1, ans2, ans3, ans4, ansCorrect);
                if (result) {
                    url = SUCCESS_PAGE;
                }
            }
        } catch (SQLException ex) {
            log("CreateNewQuestionServlet_SQLException " + ex.getMessage());
            if (ex.getMessage().contains("duplicate")) {
                errors.setQuestionIdIsExits(questionID + " is existed !!!");
                request.setAttribute("CREATE_QUESTION_ERR", errors);
            }
        } catch (NamingException ex) {
            log("CreateNewQuestionServlet_ClassNotFoundException " + ex.getMessage());
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
