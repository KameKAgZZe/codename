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
        <h3 class="form-signin-heading">Создайте фильм ${pageContext.request.userPrincipal.name}</h3>
    </c:if>

    <form:form method="POST" modelAttribute="movieForm"  enctype="multipart/form-data">

        <spring:bind path="name">
            <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
                <label for="name" id="">Название фильма: </label>
                <form:input type="text" path="name" class="form-control" placeholder="Name"
                            autofocus="true" id="name" required="true"></form:input>
                <form:errors path="name"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <label for="description" id="">Описание фильма: </label>
            <div class="form-group input-group mb-3 ${status.error ? 'has-error' : ''}">

                <form:textarea type="text" path="description" class="form-control" placeholder="Description" id="description" rows="2" required="true"></form:textarea>

                <form:errors path="description"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="genres">
        <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
            <label for="genres" id="">Выберите жанры фильма: </label>
                    <form:select path="genres" class="form-control" multiple="true" id="genres"  required="true">
                        <c:forEach var="genre" items="${genres}">
                            <option value="${genre.id}" >${genre.name}</option>
                        </c:forEach>
                    </form:select>
        </div>
        </spring:bind>
        <spring:bind path="director">
            <label for="director" id="">Режиссёр фильма: </label>
            <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="director" class="form-control" placeholder="Director" id="director"  required="true"></form:input>
                <form:errors path="director"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="age_bracket">
            <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
                    <label for="age"id="">Возрастной рейтинг: </label>
                <form:select path="age_bracket" class="form-control" id="age" required="true">

                    <option value="0+">0+</option>
                    <option value="6+">6+</option>
                    <option value="12+" selected>12+</option>
                    <option value="16+">16+</option>
                    <option value="18+">18+</option>
                </form:select>
                <form:errors path="age_bracket"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="duration">

            <div class="form-group input-group-sm mb-3 ${status.error ? 'has-error' : ''}">

                <label for="duration" id="">Продолжительность фильма: </label>
                <form:input type="time" path="duration" class="form-control" placeholder="Duration" id="duration"  required="true" aria-describedby="inputGroupFileAddon01"></form:input>
                <form:errors path="duration"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="poster">

            <div class="form-group  input-group-sm mb-3 ${status.error ? 'has-error' : ''}">
                <div class="input-group sb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                    </div>
                    <div class="custom-file">
                        <input type="file" name="posterFile" class="form-control" id="inputGroupFile01"accept="image/*"  required>
                        <%--<label class="custom-file-label" for="inputGroupFile01"></label>--%>
                    </div>
                </div>




                <form:errors path="poster"></form:errors>

            </div>
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