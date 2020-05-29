<%-- 
    Document   : create_account
    Created on : May 21, 2020, 9:07:46 AM
    Author     : Yun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Account</title>
        <style>
            *{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }
            html, body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                display: table;
            }
            .wrap {
                display: table-cell;
                text-align: center;
                vertical-align: middle;

            }
            .login-form{
                width: 550px;

                margin: 0 auto;
                border: 1px solid #ddd;
                padding: 2rem;
                background: #ffffff;
            }
            .form-input{
                background: #fafafa;
                border: 1px solid #eeeeee;
                padding: 12px;
                width: 100%;
            }
            .form-group{
                margin-bottom: 1rem;
            }
            .form-button{
                background: #69d2e7;
                border: 1px solid #ddd;
                color: #ffffff;
                padding: 10px;
                width: 100%;
                text-transform: uppercase;
            }
            .form-button:hover{
                background: #69c8e7;
            }
            .form-header{
                text-align: center;
                margin-bottom : 2rem;
            }
            .form-footer{
                text-align: center;
            }
            a:active, a:visited {
                color: blue;
            }
        </style>
    </head>
    <body>
        <div class="wrap">
            <form  class="login-form" action="ProcessServlet" method="POST">
                <div class="form-header">
                    <h3>CREATE ACCOUNT</h3>

                </div>
                <c:set var="errors" value="${requestScope.CREATE_ACCOUNT_ERR}"/>
                <div class="form-group">
                    <input type="text" name="txtEmail"   class="form-input" value="${param.txtEmail}" placeholder="Email" />
                </div>
                <c:if test="${not empty errors.emailEmpty}">
                    <font color="red">
                    ${errors.emailEmpty}
                    </font><br/><br/>
                </c:if>
                <c:if test="${not empty errors.emailNotValid}">
                    <font color="red">
                    ${errors.emailNotValid}
                    </font><br/><br/>
                </c:if>

                <div class="form-group">
                    <input type="text" name="txtName" value="${param.txtName}" class="form-input" placeholder="Name">
                </div>


                <c:if test="${not empty errors.nameEmpty}">
                    <font color="red">
                    ${errors.nameEmpty}
                    </font><br/><br/>
                </c:if>
                <div class="form-group">
                    <input type="password" name="txtPassword" value="${param.txtPassword}" class="form-input" placeholder="Password">
                </div>

                <c:if test="${not empty errors.passwordEmpty}">
                    <font color="red">
                    ${errors.passwordEmpty}
                    </font><br/><br/>
                </c:if>
                <div class="form-group">
                    <input type="password" name="txtConfirmPassword" value="${param.txtConfirmPassword}" class="form-input" placeholder="Confirm Password">
                </div>


                <c:if test="${not empty errors.confirmPasswordEmpty}">
                    <font color="red">
                    ${errors.confirmPasswordEmpty}
                    </font><br/><br/>
                </c:if>

                <c:if test="${not empty errors.confirmPasswordNotMatch}">
                    <font color="red">
                    ${errors.confirmPasswordNotMatch}
                    </font><br/><br/>
                </c:if>
                <div class="form-group">
                    <input type="submit" class="form-button" value="Create New Account" name="btAction" />
                </div>
                <div class="form-footer">
                    <a href="login.html">Go Back</a>
                </div>


            </form><br/>

            <c:if test="${not empty errors.emailIsExits}">
                <font color="red">
                ${errors.emailIsExits}
                </font><br/><br/>
            </c:if>
        </div>
    </body>
</html>
