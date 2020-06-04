<%-- 
    Document   : create_question
    Created on : May 22, 2020, 9:29:42 PM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new question</title>

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
        <c:set var="errors" value="${requestScope.CREATE_QUESTION_ERR}"/>
        <c:set var="admin" value="${sessionScope.ADMIN.name}"/>
        
        <c:if test="${empty admin}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        
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

        <c:if test="${empty errors}">
            <h1 style=" display: flex;justify-content: center;margin-bottom: 50px">Create new question</h1> <br><br>
            <div class="flex-container" >


                <form  action="ProcessServlet" method="POST">
                    <table>
                        <tbody>

                            <tr>
                                <td>Subject ID : </td>
                                <td><select name="slSubjectID" id="subject">
                                        <c:forEach var="row" items="${rs.rows}">
                                            <option  value="${row.subjectID}">${row.subjectID}</option>
                                        </c:forEach>
                                    </select></td>
                            </tr>

                            <tr>
                                <td>Question id : </td>
                                <td><textarea id="questionID" name="txtQuestionId" rows="2" cols="40"></textarea></td>
                            </tr>

                            <tr>
                                <td>Question content : </td>
                                <td><textarea id="questionContent" name="txtQuestionContent" rows="4" cols="50"></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer 1</td>
                                <td><textarea id="txtAns1" rows="3" cols="50" name="txtAns1"></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer 2</td>
                                <td><textarea id="txtAns2" rows="3" cols="50" name="txtAns2"></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer 3</td>
                                <td><textarea id="txtAns3" rows="3"  cols="50" name="txtAns3"></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer 4</td>
                                <td><textarea id="txtAns4" rows="3"  cols="50" name="txtAns4"></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer correct </td>
                                <td>
                                    <input type="radio" id="ans1" name="rdAnsCorrect" value="a1">
                                    <label for="ans1">Answer 1</label><br>
                                    <input type="radio" id="ans2" name="rdAnsCorrect" value="a2">
                                    <label for="ans2">Answer 2</label><br>  
                                    <input type="radio" id="ans3" name="rdAnsCorrect" value="a3">
                                    <label for="ans3">Answer 3</label><br>
                                    <input type="radio" id="ans4" name="rdAnsCorrect" value="a4">
                                    <label for="ans4">Answer 4</label><br>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Create New Question" name="btAction"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <a href="home_admin.jsp">Go back </a> </td>
                            </tr>

                        </tbody>
                    </table>
                </form>
            </div>


        </c:if>

        <c:if test="${not empty errors}">
            <h1 style=" display: flex;justify-content: center;margin-bottom: 50px">Create new question</h1> <br><br>
            <div class="flex-container" >


                <form  action="ProcessServlet" method="POST">
                    <table>
                        <tbody>

                            <tr>
                                <td>Subject ID : </td>
                                <td><select name="slSubjectID" id="subject">
                                        <c:forEach var="row" items="${rs.rows}">
                                            <option  value="${row.subjectID}">${row.subjectID}</option>
                                        </c:forEach>
                                    </select></td>
                            </tr>

                            <tr>
                                <td>Question id : </td>
                                <td><textarea id="questionID" name="txtQuestionId" rows="2" cols="40">${param.txtQuestionId}</textarea></td>
                                    <c:if test="${not empty errors.questionIdEmpty}">
                                    <td> <font color="red">
                                        ${errors.questionIdEmpty}
                                        </font></td>
                                    </c:if>
                                     <c:if test="${not empty errors.questionExceededLength}">
                                    <td> <font color="red">
                                        ${errors.questionExceededLength}
                                        </font></td>
                                    </c:if>
                            </tr>

                            <tr>
                                <td>Question content : </td>
                                <td><textarea id="questionContent" name="txtQuestionContent" rows="4" cols="50">${param.txtQuestionContent}</textarea></td>
                                    <c:if test="${not empty errors.questionContentEmpty}">
                                    <td> <font color="red">
                                        ${errors.questionContentEmpty}
                                        </font></td>
                                    </c:if>
                            </tr>
                            <tr>
                                <td>Answer 1</td>
                                <td><textarea id="txtAns1" rows="3" cols="50" name="txtAns1">${param.txtAns1}</textarea></td>
                                    <c:if test="${not empty errors.answer1Empty}">
                                    <td> <font color="red">
                                        ${errors.answer1Empty}
                                        </font></td>
                                    </c:if>
                            </tr>
                            <tr>
                                <td>Answer 2</td>
                                <td><textarea id="txtAns2" rows="3" cols="50" name="txtAns2">${param.txtAns2}</textarea></td>
                                    <c:if test="${not empty errors.answer2Empty}">
                                    <td> <font color="red">
                                        ${errors.answer2Empty}
                                        </font></td>
                                    </c:if>
                            </tr>
                            <tr>
                                <td>Answer 3</td>
                                <td><textarea id="txtAns3" rows="3"  cols="50" name="txtAns3">${param.txtAns3}</textarea></td>
                                    <c:if test="${not empty errors.answer3Empty}">
                                    <td> <font color="red">
                                        ${errors.answer3Empty}
                                        </font></td>
                                    </c:if>
                            </tr>
                            <tr>
                                <td>Answer 4</td>
                                <td><textarea id="txtAns4" rows="3"  cols="50" name="txtAns4">${param.txtAns4}</textarea></td>
                                    <c:if test="${not empty errors.answer4Empty}">
                                    <td> <font color="red">
                                        ${errors.answer4Empty}
                                        </font></td>
                                    </c:if>
                            </tr>
                            <tr>
                                <td>Answer correct </td>
                                <td>
                                    <input type="radio" id="ans1" name="rdAnsCorrect" value="a1">
                                    <label for="ans1">Answer 1</label><br>
                                    <input type="radio" id="ans2" name="rdAnsCorrect" value="a2">
                                    <label for="ans2">Answer 2</label><br>  
                                    <input type="radio" id="ans3" name="rdAnsCorrect" value="a3">
                                    <label for="ans3">Answer 3</label><br>
                                    <input type="radio" id="ans4" name="rdAnsCorrect" value="a4">
                                    <label for="ans4">Answer 4</label><br>
                                    <c:if test="${not empty errors.answerCorrectEmpty}">
                                        <font color="red">
                                        ${errors.answerCorrectEmpty}
                                        </font><br/><br/>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Create New Question" name="btAction"></td>
                                    <c:if test="${not empty errors.questionIdIsExits}">
                            <font color="red">
                            ${errors.questionIdIsExits}
                            </font><br/><br/>
                        </c:if>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <a href="home_admin.jsp">Go home page </a> </td>
                        </tr>



                        </tbody>
                    </table>
                </form>
            </div>
        </c:if>
    </body>


</html>
