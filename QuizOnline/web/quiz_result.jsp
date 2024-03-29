<%-- 
    Document   : quizResult
    Created on : May 27, 2020, 3:44:58 PM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Result</title>
        <style>
             .flex-container {
                display: flex;
                height: 350px;
                justify-content: center;
                align-items: center;
            }
            a:active, a:visited {
                color: blue;
            }
        </style>
    </head>
    <body>
        <c:set var="numberQuestions" value="${requestScope.NUMBER_QUESTION}" />
        <c:set var="point" value="${requestScope.FINAL_POINT}" />
        <c:set var="time" value="${requestScope.TIME_TAKE_QUIZ}" />
        <c:set var="correctsAnswer" value="${requestScope.QUESTIONS_CORRECT}"/>
        <c:set var="subjectID" value="${requestScope.SUBJECT_ID}"/>
        <c:set var="currentDate" value="${requestScope.DATE}"/>
      

        <c:set var="student" value="${sessionScope.STUDENT.name}"/>
        
        <c:if test="${empty student}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        
        <table class="flex-container">
            <tbody>

                <tr>
                    <td>
                        <h1 style="color: red">Quiz Result</h1>
                    </td>
                </tr>
                 <tr>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>Subject Quiz : </td>
                    <td><font color="red">${subjectID}</font></td>
                </tr>

                <tr>
                    <td>Number of questions : </td>
                    <td><font color="red">${numberQuestions}</font></td>
                </tr>

                <tr>
                    <td>Point : </td>
                    <td><font color="red">${point}</font></td>
                </tr>
                <tr>
                    <td>Correct Answer</td>
                    <td><font color="red">${correctsAnswer}</font></td>
                </tr>
                <tr>
                    <td>Time take quiz</td>
                    <td><font color="red">${time}</font></td>
                </tr>
                 <tr>
                    <td>Date</td>
                    <td><font color="red"><fmt:formatDate value="${currentDate}" pattern="dd-MMM-yyyy"/></font></td>
                </tr>
                 <tr>
                    <td>
                        
                    </td>
                </tr>
                
                <tr>
                   
                    <td>
                        <a href="home_student.jsp">Take another quiz </a> </td>
                </tr>

            </tbody>
        </table>
    </body>
</html>
