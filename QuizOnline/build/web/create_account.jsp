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
        <link rel="stylesheet"  type="text/css" href="resource/form.css">
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
