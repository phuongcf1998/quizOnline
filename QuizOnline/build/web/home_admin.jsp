<%-- 
    Document   : home_admin
    Created on : May 22, 2020, 6:48:03 PM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style>
            .flex-container {

                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;

            }
            .flex-child {
                display: flex;
                flex-direction: row;


            }
            a:active, a:visited {
                color: blue;
            }
        </style>
    </head>
    <body>
        <c:set var="admin" value="${sessionScope.ADMIN.name}"/>
        <c:set var="selectStatus" value=""/>
        <c:set var="searchResult" value="${requestScope.SEARCH_RESULT}"/>
        

        <c:set var="listSubject" value="${requestScope.LIST_SUBJECT}"/>
        <c:set var="searchValue" value="${param.txtSearchValue}"/>

        <c:url var="logoutLink" value="ProcessServlet">
            <c:param name="btAction" value="LogOut" />
        </c:url>

        <c:catch var="ex">
            <sql:setDataSource var="con" dataSource="QuizOnline" />
            <c:if test="${not empty con}">
                <sql:query var="rsSubjectID" dataSource="${con}">
                    Select subjectID from tbl_Subject
                </sql:query>
            </c:if>
        </c:catch>
        <c:if test="${not empty ex}">
            <font color="red"> Subject ID Occurs errors</font>

        </c:if>

        <c:catch var="exx">
            <sql:setDataSource var="cons" dataSource="QuizOnline" />
            <c:if test="${not empty cons}">
                <sql:query var="rsStatus" dataSource="${cons}">
                    Select status,description from tbl_Status order by status offset 1 rows
                </sql:query>
            </c:if>
        </c:catch>
        <c:if test="${not empty exx}">
            <font color="red"> Status Occurs errors</font>

        </c:if>


        <font style="font-size: 30px" color="red"> Welcome , ${admin} </font><br/>

        <a href="${logoutLink}"><font style="font-size: 25px" color="blue"> Log out </font></a><br/>


        <div class="flex-container">
            <div>
                <h1><font color="green">Manage Quiz</font></h1><br/>
            </div>
            <div>
                <h1>Search Question (name or subject)</h1>

                <div class="flex-child">
                    <form action="ProcessServlet">
                        <input type="text"  name="txtSearchValue" value="${param.txtSearchValue}" size="53"/><br/><br/>

                        <input   type="submit" value="Search_Question" name="btAction"/>
                        <br/><br/>
                        <span>Status : </span>
                        <select id="slStatus" name="slStatus">
                            <c:forEach var="row" items="${rsStatus.rows}">
                                <c:choose>
                                    <c:when test="${param.slStatus==row.status}">
                                        <option value= "${row.status}" selected="selected">${row.description} </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="${row.status}">${row.description}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                        </select>

                    </form><br/>

                    <a style="margin-left: 50px" href="create_question.jsp">Create Question</a>
                </div>
            </div>

        </div> </br></br>

        <c:if test="${not empty searchValue}">
            <c:if test="${not empty searchResult}">
                <c:forEach var="subject" items="${listSubject}" >
                    <h3 style="color:red">${subject}</h3> <br/>
                    <table style="width: 100%" border="1">
                        <thead>
                            <tr>
                                
                                <th>Subject ID</th>
                                <th>Question ID</th>
                                <th>Question Content</th>
                                <th>Answer 1</th>
                                <th>Answer 2</th>
                                <th>Answer 3</th>
                                <th>Answer 4</th>
                                <th>Answer Correct</th>
                                    <c:if test="${param.slStatus != 3}">
                                    <th>Delete</th>
                                    </c:if>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${searchResult}" varStatus="counter">
                                <c:if test="${subject == dto.subjectID}">
                                <form action="ProcessServlet">
                                    <tr>
                                       
                                        <td>
                                            <select name="slSubjectID">
                                                <c:forEach var="row" items="${rsSubjectID.rows}">
                                                    <option  value="${row.subjectID}" 
                                                             <c:if test="${row.subjectID == dto.subjectID}"> 
                                                                 selected="selected"
                                                             </c:if> >${row.subjectID}</option>
                                                </c:forEach>

                                            </select>
                                        </td>
                                        <td>
                                            ${dto.id}
                                            <input type="hidden" name="pk" value="${dto.id}" />
                                        </td>
                                        <td>
                                            <textarea style="width: 98%" cols="40" rows="3" name="txtQuestionContent"/>${dto.question_content}</textarea>

                                        </td>
                                        <td>
                                            <textarea style="width: 98%" cols="30" rows="3" name="txtAns1"/>${dto.answer_1}</textarea>

                                        </td>
                                        <td>
                                            <textarea style="width: 98%" cols="30" rows="3" name="txtAns2"/>${dto.answer_2}</textarea>
                                        </td>
                                        <td>
                                            <textarea style="width: 98%" cols="30" rows="3" name="txtAns3"/>${dto.answer_3}</textarea>
                                        </td>
                                        <td>
                                            <textarea style="width: 98%" cols="30" rows="3" name="txtAns4"/>${dto.answer_4}</textarea>
                                        </td>
                                        <td>

                                            <select name="txtAnsCorrect">
                                                <option  value="ans1" 
                                                         <c:if test="${dto.answer_1 == dto.answer_correct}"> 
                                                             selected="selected"
                                                         </c:if> >Answer 1</option>
                                                <option  value="ans2" 
                                                         <c:if test="${dto.answer_2 == dto.answer_correct}"> 
                                                             selected="selected"
                                                         </c:if> >Answer 2</option>
                                                <option  value="ans3" 
                                                         <c:if test="${dto.answer_3 == dto.answer_correct}"> 
                                                             selected="selected"
                                                         </c:if> >Answer 3</option>
                                                <option  value="ans4" 
                                                         <c:if test="${dto.answer_4 == dto.answer_correct}"> 
                                                             selected="selected"
                                                         </c:if> >Answer 4</option>
                                            </select>
                                        </td>
                                        <c:if test="${dto.status != 3}">
                                            <td>

                                                <c:url var="delLink" value="ProcessServlet">
                                                    <c:param name="btAction" value="Delete" />
                                                    <c:param name="pk" value="${dto.id}" />
                                                    <c:param name="lastSearchValue" value="${searchValue}" />
                                                    <c:param name="status" value="${param.slStatus}" />
                                                </c:url>
                                                <a href="${delLink}">Delete</a>

                                            </td>
                                        </c:if>
                                        <td>
                                            <input type="submit" value="Update" name="btAction" />
                                            <input type="hidden" name="txtLastSearchValue" value="${searchValue}" />
                                            <input type="hidden" name="status" value="${param.slStatus}"/>

                                        </td>
                                    </tr>
                                </form>
                            </c:if>

                        </c:forEach>
                    </tbody>
                </table>

            </c:forEach>

            <br/><br/>


        </c:if>


        <c:if test="${empty searchResult}">

            <h1>No record is matched !!!</h1>
        </c:if>
    </c:if>

    <script>

        document.getElementById('slStatus').onchange = function () {
            localStorage.setItem('selectedStatus', document.getElementById('slStatus').value);
        };

        if (localStorage.getItem('selectedStatus')) {
            document.getElementById('slStatus').options[localStorage.getItem('selectedtem')].selected = true;
        }

    </script>
</body>
</html>