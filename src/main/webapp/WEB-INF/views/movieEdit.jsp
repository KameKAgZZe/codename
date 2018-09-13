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
</head>
<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">

        <h2>${pageContext.request.userPrincipal.name}
        </h2>
    </c:if>
<form action="/user" method="post">
        <div class="d-inline">
            Movie: <input type="text" name="moviename" value = "${movie.name}"/>

            <br>
            Описание:<input type="text" name="description" value = "${movie.description}"/>
            <c:out value = "${movie.description}"/>
            <br>
            Режиссёр:<input type="text" name="director" value = "${movie.director}"/>
            <br>
            Продолжительность:<input type="time" name="duration" value = "${movie.duration}"/>
            <br>
            Возрастной рейтинг:<input type="text" name="age_bracket" value = "${movie.age_bracket}"/>
            <br>
            Genres:
            <c:forEach var="genre" items="${movie.genres}"  >
                <div class="d-inline">
                    <label><input type="checkbox" name="${genre.name}">${genre.name}</label>
                </div>
            </c:forEach>

        </div></form>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
