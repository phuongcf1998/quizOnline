<%-- 
    Document   : quizHistory
    Created on : May 28, 2020, 9:33:40 AM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz History</title>
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
        <h1 style="color: red">Quiz History</h1> <br/>

        <a href="home_student.jsp">Go back</a>
        <c:set var="searchResult" value="${requestScope.SEARCH_RESULT}"/>

        <c:set var="listQuizHistory" value="${requestScope.HISTORY_LIST}"/>

        <c:set var="emailUser" value="${sessionScope.STUDENT.email}"/>

        <c:if test="${empty listQuizHistory}">

            <h1 >No records history</h1> <br/>
        </c:if>

        <form action="ProcessServlet">
            <input type="text"  name="txtSearchValue" value="${param.txtSearchValue}" size="53"/><br/><br/>
            <input type="hidden" name="txtEmailUser" value="${emailUser}"/>

            <input type="submit" value="Search History" name="btAction" style="width:110px"/>


        </form><br/>

        <c:if test="${not empty searchResult}">

            <div class="flex-container">
                <table   border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Subject ID</th>
                            <th>Point</th>
                            <th>Correct Answer</th>
                            <th>Time</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${searchResult}" varStatus="counter">

                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.subjectID}
                                </td>
                                <td>
                                    ${dto.point}
                                </td>
                                <td>
                                    ${dto.correctAnswers}
                                </td>
                                <td>
                                    ${dto.time}
                                </td>


                            </tr>


                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>


        <c:if test="${empty searchResult}">

            <h1>No record is matched !!!</h1>
        </c:if>

    </body>
</html>
