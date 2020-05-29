<%-- 
    Document   : home_student
    Created on : May 21, 2020, 12:12:33 AM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style>
             .flex-container {
                 display: flex;
                height: 500px;
                justify-content: center;
                align-items: center;
                
            }
            a:active, a:visited {
                color: blue;
            }
        </style>



    </head>
    <body>
        <c:set var="student" value="${sessionScope.STUDENT.name}"/>

        <c:url var="logoutLink" value="ProcessServlet">
            <c:param name="btAction" value="LogOut" />
        </c:url>

        <c:catch var="ex">
            <sql:setDataSource var="con" dataSource="QuizOnline" />
            <c:if test="${not empty con}">
                <sql:query var="rs" dataSource="${con}">
                    Select subjectID from tbl_Subject
                </sql:query>
            </c:if>
        </c:catch>
        <c:if test="${not empty ex}">
            <font color="red"> Subject ID Occurs errors</font>

        </c:if>

        <font style="font-size: 30px" color="red"> Welcome , ${student} </font><br/><br/>   

        <a href="${logoutLink}"><font color="blue" style="font-size: 25px"> Log out </font></a><br/>

        <div class="flex-container">
             <form  action="ProcessServlet" method="POST">
            <table>
                <tbody>

                    <tr>
                        <td>Choose subject to take quiz : </td>
                        <td><select name="slSubjectID" id="subject">
                                <c:forEach var="row" items="${rs.rows}">
                                    <option  value="${row.subjectID}">${row.subjectID}</option>
                                </c:forEach>
                            </select></td>
                    </tr>

                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Take Quiz" name="btAction"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <c:url var="viewQuizHistory" value="ProcessServlet">
                            <c:param name="btAction" value="View Quiz History" />
                        </c:url>
                        
                        <td>
                             <a href="${viewQuizHistory}"><font color="blue"> View Quiz History </font></a><br/>
                        </td>
                    </tr>

                </tbody>
            </table>
        </form>
        </div>
    </body>

</html>
