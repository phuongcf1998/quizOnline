<%-- 
    Document   : quizPage
    Created on : May 25, 2020, 11:29:22 PM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>
        <style>


            .container-question{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-bottom: 50px;


            }
            .hiddenQuestion {
                display: none;
            }

            a:visited {
                color: red;
            }

            .container-btn{
                display: flex;

                flex-direction: row;
                justify-content: space-around;
            }

        </style>
    </head>
    <body>

        <c:set var="listQuestion" value="${requestScope.LIST_QUESTION}"/>
        <c:set var="quizTime" value="${requestScope.QUIZ_TIME}"/>
        <c:set var="subjectID" value="${requestScope.SUBJECT_ID}"/>
        
        <c:set var="student" value="${sessionScope.STUDENT.name}"/>
        
        <c:if test="${empty student}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        
        <c:if test="${empty listQuestion}">
            <h2>
                Sorry , quiz of subject is updating !! Please choose another subject to take quiz !
            </h2>
            <a href="home_student.jsp">Go back </a>
        </c:if>
        
        
        <c:if test="${not empty listQuestion}">
            <h3 style="margin-left: 300px;color: red">${subjectID} Quiz</h3>
            <div class="container-btn"> 
                <button id="btnPrevious">Previous</button>
                <button id="btnNext">Next</button>
            </div>
            <form id="formQuiz" action="ProcessServlet" class="container-question" method="POST" >

                <c:forEach var="row" items="${listQuestion}" varStatus="i">
                    <table class="question hiddenQuestion" id="q+${i.count}">
                        <tbody>
                            <tr>

                                <td>Question ${i.count} : </td>
                                <td><textarea id="questionContent" rows="5" cols="60">${row.question_content}</textarea></td>
                            </tr>

                            <tr>
                                <td>Select one </td>
                                <td>
                                    <input type="radio" id="ans1" name="rdAnswerQuestion${i.count}" value="${row.answer_1}">
                                    <label for="ans1">${row.answer_1}</label><br>
                                    <input type="radio" id="ans2" name="rdAnswerQuestion${i.count}" value="${row.answer_2}">
                                    <label for="ans2">${row.answer_2}</label><br>  
                                    <input type="radio" id="ans3" name="rdAnswerQuestion${i.count}" value="${row.answer_3}">
                                    <label for="ans3">${row.answer_3}</label><br>
                                    <input type="radio" id="ans4" name="rdAnswerQuestion${i.count}" value="${row.answer_4}">
                                    <label for="ans4">${row.answer_4}</label><br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="txtQuestionID${i.count}" value="${row.id}"/>


                                </td>
                                <td>

                                </td>
                            </tr>


                        </tbody>
                    </table>
                </c:forEach>
                <input type="hidden" name="numberQuestion" value="${fn:length(listQuestion)}"/>
                <input type="hidden" name="subjectID" value="${subjectID}"/>
                <input type="hidden" id="txtTimeRemaining" name="txtTimeRemaining" value=""/>
                <input type="hidden" name="txtQuizTime" value="${quizTime}"/>
                <input type="submit" id="btnSubmit" value="Finish Quiz" name="btAction">

                <div>
                    <p class="container-question" style="color: red" id="timeCountDown"></p>
                </div>
            </form>





        </c:if>

        <script>
            window.onload = function () {
                listQuestion[0].classList.remove("hiddenQuestion");
                var totalSeconds = 60 * ${quizTime},
                        display = document.querySelector('#timeCountDown');
                startTimer(totalSeconds, display);
                getTimeParameter();
            }
            var currentQuestion = 0;
            var listQuestion = document.getElementsByClassName("question");
            var nextBtn = document.getElementById("btnNext");
            var preBtn = document.getElementById("btnPrevious");
            preBtn.addEventListener("click", function () {
                currentQuestion--;
                if (currentQuestion == -1) {
                    currentQuestion = listQuestion.length - 1;
                }
                for (var i = 0; i < listQuestion.length; i++) {
                    listQuestion[i].classList.add("hiddenQuestion");
                    if (currentQuestion == i) {
                        listQuestion[i].classList.remove("hiddenQuestion");
                    }
                }
            });
            nextBtn.addEventListener("click", function () {
                currentQuestion++;
                if (currentQuestion == listQuestion.length) {
                    currentQuestion = 0;
                }
                for (var i = 0; i < listQuestion.length; i++) {

                    listQuestion[i].classList.add("hiddenQuestion");
                    if (currentQuestion == i) {
                        listQuestion[i].classList.remove("hiddenQuestion");
                    }
                }
            });
            function startTimer(duration, display) {
                var start = Date.now(),
                        diff,
                        minutes,
                        seconds;
                function timer() {
                    // get the number of seconds that have elapsed since 
                    // startTimer() was called
                    diff = duration - (((Date.now() - start) / 1000) | 0);

                    // does the same job as parseInt truncates the float
                    minutes = (diff / 60) | 0;
                    seconds = (diff % 60) | 0;

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;

                    if (diff <= 0) {

                        submitForm();
                    }
                }
                ;

                timer();
                setInterval(timer, 1000);
            }

            function getTimeParameter() {
                currentTime = setInterval(setTimeToHiddenInput, 1000);
            }

            function setTimeToHiddenInput() {

                var time = document.getElementById('timeCountDown').innerHTML;


                document.getElementById("txtTimeRemaining").value = time;


            }

            document.getElementById("btnSubmit").addEventListener('click', function () {

                if (confirm("Are you sure to submit quiz ?")) {
                    submitForm();
                } else {
                     event.preventDefault();
                }
            });

            function submitForm() {
                var form = document.getElementById("formQuiz");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "btAction");
                hiddenField.setAttribute("value", "Finish Quiz");
                form.appendChild(hiddenField);
                form.submit();
            }



        </script>

    </body>
</html>
