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

    <title>Log in with your account</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>


<div class="container">

    <form method="POST" action="${contextPath}/login"  class="form-signin">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true" aria-label="Username" aria-describedby="basic-addon1" id="username"/>

            <div class="input-group mb-3">
                <input name="password" type="password" class="form-control pwd" placeholder="Password" required>
                <div class="input-group-append">
            <span class="input-group-append">
             <button class="btn btn-default reveal" type="button"><i class="fa fa-eye" id="eye"></i></button>
            </span>

                </div>
            </div>



            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Login <i class="fa fa-sign-in"></i></button>
            <h7 class="text-center"><a href="${contextPath}/registration">Создать аккаунт</a></h7>
            <h7 class="text-center"><a href="${contextPath}/restore">Забыли пароль?</a></h7>
        </div>

    </form>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<!-- /container -->
<script>

    var $pwd = $(".pwd");
    var $eye = $("#eye");
$(".reveal")
    .mousedown( function () {
        $eye.removeClass("fa-eye");
        $eye.addClass("fa-eye-slash");
        $pwd.attr('type', 'text');
        }
    )
    .mouseup( function () {
        $eye.removeClass("fa-eye-slash");
        $eye.addClass("fa-eye");
        $pwd.attr('type', 'password');
});

</script>

</body>
</html>