<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Фильм бла-бла-бла</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


</head>

<body>

<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h3 class="form-signin-heading">Создайте сеанс ${pageContext.request.userPrincipal.name}</h3>
    </c:if>

    <form:form method="POST" modelAttribute="sessionForm" enctype="application/x-www-form-urlencoded">
        <spring:bind path="movie">
            <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
                <form:select path="movie" class="form-control" placeholder="Name"
                        autofocus="true" id="name" required="true">
                    <c:forEach var="movie" items="${movies}">
                        <option value="${movie.id}" <c:if test="${movieEditId.equals(movie)}"> selected</c:if>>${movie.name}</option>
                    </c:forEach>
                </form:select>

            </div>
        </spring:bind>
        <spring:bind path="room">
            <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
                <form:select path="room" class="form-control" placeholder="Name"
                        autofocus="true" id="room_id" required="true">
                    <c:forEach var="room" items="${rooms}">
                        <option value="${room.id}">${room.id}</option>
                    </c:forEach>
                </form:select>

            </div>
        </spring:bind>

        <div class='input-group date' id='datetimepicker1'>
            <input class="form-control" type="datetime-local" id="example-datetime-local-input" name="dateForm"/>
        </div>

<spring:bind path="price">
    <form:input type="number" path="price"  class="form-control"  placeholder="Цена билета" min="0" max="1000" step="0.01" value="" name="price" id="price" required="required" />
        </spring:bind>

        <input  type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit <i class="fa fa-check"></i></button>
    </form:form>



</div>
<!-- /container -->
<style>
    .custom-file-input ~ .custom-file-label::after {
        content: "Открыть";
    }</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>