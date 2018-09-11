<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <div xmlns:sec="http://www.springframework.org/security/tags"/>
    <title>Welcome</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>

<div class="container">
    <%--<c:choose>--%>

    <%--<c:when test={pageContext.request.userPrincipal.name != null}>--%>
        <%--<form id="logoutForm" method="POST" action="${contextPath}/logout">--%>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        <%--</form>--%>

        <%--<h7>${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>--%>
        <%--</h7>--%>
    <%--</c:when>--%>
        <%--<c:otherwise>--%>

        <%--</c:otherwise>">--%>
    <%--</c:choose>--%>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal != null && pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                ${pageContext.request.userPrincipal.name}   <h7 class="text-center">| <a onclick="document.forms['logoutForm'].submit()"><i class="fa fa-sign-out"></i>Выйти</a></h7>
            </c:when>
            <c:otherwise>

                <h7 class="text-center"><a href="${contextPath}/login"><i class="fa fa-sign-in"></i>Войти</a></h7>
            </c:otherwise>
        </c:choose>

</div>

</body>
</html>