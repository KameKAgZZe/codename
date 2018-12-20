<%@ page import="codename.team.cinemabooking.model.Place" %>
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
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>
<body>

<div class="container">

    <h2>Бронирование билетов на фильм ${session.movie.name}.</h2>
    <br>
    дата: ${session.date}
    <br>
    <% Integer rowCount = 0;%>

    <c:forEach var="row" items="${rows}">
        <%=++rowCount%>
        <div class="d-inline">
            <c:forEach var="i" begin="1" end="${row.place_in_row}">
            <label for="button<%=rowCount%>${i}">${i}</label>
            <input type="checkbox" name="isChecked" class ="btn btn-primary "  value="${row.id}_${i}" onclick="clickButton(<%=rowCount%>${i})">

        </c:forEach>
        </div>
        <br>
    </c:forEach>
    <br>
    <div class="calcPrice">Цена: <div id="price"></div>
    </div>
    <br>
    <form action="/booking/${session.id}" method="POST">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal == null && pageContext.request.userPrincipal.name == null}">
                Введите свой email <input type="email" required class="form-control">

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </c:when>

        </c:choose>
        <button class ="btn btn-primary btn-lg btn-block">Забронировать</button>
    </form>
</div>
<script>
    var p = 0;
    var price= "${session.price}";
    document.getElementById("price").innerHTML = p;
    function clickButton(id){
        var button =document.getElementById("button"+id);
        button.removeAttribute("class");
        button.setAttribute("class","btn btn-secondary");
        button.removeAttribute("onclick");
        button.setAttribute("onclick",'cancelSelection("'+id+'")');
        p = +p + +price;
        document.getElementById("price").innerHTML = p;

    }
    function cancelSelection(id){
        var button =document.getElementById("button"+id);
        button.removeAttribute("class");
        button.setAttribute("class","btn btn-primary");
        button.removeAttribute("onclick");
        button.setAttribute("onclick",'clickButton("'+id+'")');
        p = +p - +price;
        document.getElementById("price").innerHTML = p;
    }
    function toBook(){
        var request=new XMLHttpRequest();
        arr.forEach(function(item, id, arr) {
            if(item){
                request.open("GET","ClickButton?id="+id,false);
                request.send();
            }
        });}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>