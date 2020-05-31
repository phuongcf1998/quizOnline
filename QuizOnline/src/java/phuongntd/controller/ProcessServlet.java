/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yun
 */
public class ProcessServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.html";
    private final String LOGOUT_SERVLET = "LogOutServlet";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String CREATE_NEW_ACCOUNT_SERVLET = "CreateNewAccountServlet";
    private final String CREATE_NEW_QUESTION_SERVLET = "CreateNewQuestionServlet";
    private final String SEARCH_QUESTION_SERVLET = "SearchQuestionServlet";
    private final String SEARCH_HISTORY_SERVLET = "SearchHistoryServlet";
    private final String DELETE_SERVLET = "DeleteServlet";
    private final String UPDATE_SERVLET = "UpdateServlet";
    private final String TAKE_QUIZ_SERVLET = "TakeQuizServlet";
    private final String CHECK_QUIZ_SERVLET = "CheckQuizServlet";
    private final String VIEW_QUIZ_HISTORY = "ViewQuizHistoryServlet";

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
        String url = LOGIN_PAGE;
        try {
            String button = request.getParameter("btAction");

            if (button == null) {

            } else if (button.equals("Login")) {
                url = LOGIN_SERVLET;
            } else if (button.equals("LogOut")) {
                url = LOGOUT_SERVLET;
            } else if (button.equals("Create New Account")) {
                url = CREATE_NEW_ACCOUNT_SERVLET;
            } else if (button.equals("Create New Question")) {
                url = CREATE_NEW_QUESTION_SERVLET;
            } else if (button.equals("Search_Question")) {
                url = SEARCH_QUESTION_SERVLET;
            } else if (button.equals("Delete")) {
                url = DELETE_SERVLET;
            } else if (button.equals("Update")) {
                url = UPDATE_SERVLET;
            } else if (button.equals("Take Quiz")) {
                url = TAKE_QUIZ_SERVLET;
            } else if (button.equals("Finish Quiz")) {
                url = CHECK_QUIZ_SERVLET;
            } else if (button.equals("View Quiz History")) {
                url = VIEW_QUIZ_HISTORY;
            } else if (button.equals("Search History")) {
                url = SEARCH_HISTORY_SERVLET;
            }

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
