<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<form:form action="/movie/${movie.id}" method="post" modelAttribute="movie"  enctype="application/x-www-form-urlencoded">
    <input name="id" value="${movie.id}" type="hidden">
        <div class="d-inline">
            Movie: <input type="text" name="name" value = "${movie.name}"/>

            <br>
            Описание:<input type="text" name="description" value = "${movie.description}"/>
            <c:out value = "${movie.description}"/>
            <br>
            Режиссёр:<input type="text" name="director" value = "${movie.director}"/>
            <br>
            Продолжительность:<input type="time" name="duration" value = "${movie.duration}"/>
            <br>
            Возрастной рейтинг:
            <form:select path="age_bracket" class="form-control" id="age" required="true">

            <option value="0+">0+</option>
            <option value="6+">6+</option>
            <option value="12+" selected>12+</option>
            <option value="16+">16+</option>
            <option value="18+">18+</option>
        </form:select>
            <br>
            Genres:
            <div class="d-inline">
            <c:forEach var="genre" items="${genres}"  >
                <label><input type="checkbox" name="genres" <c:if test="${movie.genres.contains(genre)}"> checked</c:if>
                     value="${genre.id}">${genre.name}</label>
            </c:forEach>
            </div>
            <button type="submit">Save</button>
        </div></form:form>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
