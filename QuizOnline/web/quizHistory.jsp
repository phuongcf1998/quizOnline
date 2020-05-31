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
                flex-direction: column;


            }

            .paging {
                display: flex;
                justify-content: center;
            }
            a:active, a:visited {
                color: blue;
            }
        </style>
    </head>
    <body>
        <h1 style="color: red">Quiz History</h1>    
        <a href="home_student.jsp">Go back</a>
        <c:set var="searchResult" value="${requestScope.SEARCH_RESULT}"/>
        <c:set var="endPage" value="${requestScope.END_PAGE}"/>
        <c:set var="listQuizHistory" value="${requestScope.HISTORY_LIST}"/>
        <c:set var="searchValue" value="${param.txtSearchValue}"/>
        <c:set var="emailUser" value="${sessionScope.STUDENT.email}"/>


        <div class="paging">
            <h1>Search History (subjectID)  </h1>
        </div>

        <form class="paging" action="ProcessServlet">
            <input type="text"  name="txtSearchValue" value="${param.txtSearchValue}" size="53"/><br/><br/>
            <input type="hidden" name="txtEmailUser" value="${emailUser}"/>

            <input type="submit" value="Search History" name="btAction" style="width:110px"/>


        </form><br/>



        <c:if test="${not empty listQuizHistory and empty searchResult   }">

            <div class="flex-container">
                <h3 style="font-size: 20px"> All History Records</h3>
                <table   border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Subject ID</th>
                            <th>Point</th>
                            <th>Correct Answer</th>
                            <th>Time take quiz</th>
                            <th>Date take quiz</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${listQuizHistory}" varStatus="counter">

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
                                <td>
                                    ${dto.date}
                                </td>


                            </tr>


                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>




        <c:if test="${not empty searchValue}">
            <c:if test="${not empty searchResult}">

                <div class="flex-container">
                    <h3 style="font-size: 20px"> Result Search</h3>
                    <table   border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Subject ID</th>
                                <th>Point</th>
                                <th>Correct Answer</th>
                                <th>Time take quiz</th>
                                <th>Date take quiz</th>
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
                                    <td>
                                        ${dto.date}
                                    </td>


                                </tr>


                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </c:if>
            <c:if test="${empty searchResult}">

                <div class="paging">
                    <h1>No record is matched !!!</h1>
                </div>
            </c:if>
        </c:if>

        <c:if test="${empty searchValue and empty listQuizHistory}">

            <c:url var="viewQuizHistoryAgain" value="ProcessServlet">
                <c:param name="btAction" value="View Quiz History" />
            </c:url>


            <div class="paging">
                <a href="${viewQuizHistoryAgain}"><font color="blue"> View All History </font></a><br/>
            </div>

        </c:if>


        <div class="paging">
            <c:forEach begin="1" end="${endPage}" var="i">
                <c:url var="currentPageLink" value="SearchHistoryServlet">
                    <c:param name="txtSearchValue" value="${param.txtSearchValue}"/>
                    <c:param name="page" value="${i}" />
                    <c:param name="txtEmailUser" value="${emailUser}" />

                </c:url>
                <a  style="margin: 5px" href="${currentPageLink}">${i}</a>
            </c:forEach>

        </div>




    </body>
</html>
