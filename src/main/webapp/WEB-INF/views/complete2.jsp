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

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">

        <h2>${pageContext.request.userPrincipal.name} добавил фильм
        </h2>
    </c:if>

    <c:forEach var="movie" items="${movies}"  >
        <div class="d-inline">
            Movie: <c:out value = "${movie.name}"/>
            <img src="${contextPath}/resources/image/posters/${movie.poster}" width="150" height="200"/>

            <br>
            Описание: <c:out value = "${movie.description}"/>
            <br>
            Режиссёр:<c:out value = "${movie.director}"/>
            <br>
            Продолжительность:<c:out value = "${movie.duration}"/>
            <br>
            Возрастной рейтинг:<c:out value = "${movie.age_bracket}"/>
            <br>
            Genres:
            <c:forEach var="genre" items="${movie.genres}"  >
                <div class="d-inline">
                    <c:out value = "${genre.name}"/>
                </div>




                <br>
            </c:forEach>
            <a href="/movie/${movie.id}"> edit</a>
            <a href="/addsession/${movie.id}"> add session</a>
            <br>
            <label>${movie.status}</label>
            <br>
            <label>
                <c:if test="${movie.popular == true}"> популярный</c:if>
                <c:if test="${movie.popular != true}"> непопулярный</c:if>
            </label>
        </div>
        <br>
    </c:forEach>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
