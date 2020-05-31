/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuongntd.history.HistoryDAO;
import phuongntd.question.QuestionDAO;
import phuongntd.user.UserDTO;
import phuongntd.utils.TimeCaculator;
import phuongntd.utils.TimeTakeQuiz;

/**
 *
 * @author Yun
 */
public class CheckQuizServlet extends HttpServlet {

    private final String QUIZ_RESULT = "quiz_result.jsp";
    private final String QUIZ_ERROR = "quiz_error.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        double numberQuestionInDouble = Double.parseDouble(request.getParameter("numberQuestion"));
        int numberQuestion = Integer.parseInt(request.getParameter("numberQuestion"));
        double pointPerQuestion = 10 / numberQuestionInDouble;
        double finalPoint = 0;
        int numberQuestionCorrect = 0;
        String timeRemaining = request.getParameter("txtTimeRemaining");
        String timeQuiz = request.getParameter("txtQuizTime");
        Time timeTakeQuiz = null;
        String url = QUIZ_RESULT;
        try {
            timeTakeQuiz = TimeTakeQuiz.convertTotalSecondToTime(timeRemaining, timeQuiz + ":" + "00");
        } catch (ParseException ex) {
            url = QUIZ_ERROR;

        }
        Date currentDate = (Date) TimeCaculator.getCurrentDate();
        String subjectID = request.getParameter("subjectID");

        try {
            QuestionDAO questionDAO = new QuestionDAO();
            System.out.println(timeQuiz);
            System.out.println(numberQuestion);
            for (int i = 1; i <= numberQuestion; i++) {

                String questionID = request.getParameter("txtQuestionID" + i);
                String answerByUser = request.getParameter("rdAnsCorrect" + i);

                String correctAnswer = questionDAO.getQuestionCorrectByQuestionID(questionID);

                if (correctAnswer.equals(answerByUser)) {
                    finalPoint += pointPerQuestion;
                    numberQuestionCorrect++;
                }

            }

            HistoryDAO historyDAO = new HistoryDAO();
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDTO userInfo = (UserDTO) session.getAttribute("STUDENT");

                boolean result = historyDAO.saveQuizStudentTake(userInfo.getEmail(), subjectID, finalPoint, numberQuestionCorrect, timeTakeQuiz, currentDate);
            }
            request.setAttribute("NUMBER_QUESTION", numberQuestion);
            request.setAttribute("FINAL_POINT", finalPoint);
            request.setAttribute("QUESTIONS_CORRECT", numberQuestionCorrect);
            request.setAttribute("TIME_TAKE_QUIZ", timeTakeQuiz);
            request.setAttribute("SUBJECT_ID", subjectID);
            request.setAttribute("DATE", currentDate);

        } catch (NamingException ex) {
            log("CheckQuizServlet_NamingException " + ex.getMessage());
        } catch (SQLException ex) {
            log("CheckQuizServlet_SQLException " + ex.getMessage());
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
        } catch (ParseException ex) {
            Logger.getLogger(CheckQuizServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(CheckQuizServlet.class.getName()).log(Level.SEVERE, null, ex);
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
