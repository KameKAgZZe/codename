<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoKino</title>
	<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <div class="content">
        <div class="container-fluid header-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-12">
						<div class="logo"><img src="${contextPath}/resources/image/logo.png" alt="logo"></div>
					</div>
					<div class="col-sm-6">
						<div class="nav d-flex justify-content-around">
							<span><a href="${contextPath}/complete">СЕАНСЫ</a></span>
							<span><a href="${contextPath}/about">О НАС</a></span>
							<span><a href="${contextPath}/contacts">КОНТАКТЫ</a></span>
						</div>
					</div>
					<div class="col-sm-3 col-12">
						<div class="reg d-flex justify-content-between">
							<c:choose>
								<c:when test="${pageContext.request.userPrincipal != null && pageContext.request.userPrincipal.name != null}">
									<form id="logoutForm" method="POST" action="${contextPath}/logout">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</form>
									${pageContext.request.userPrincipal.name}   <h7 class="text-center">| <a onclick="document.forms['logoutForm'].submit()">ВЫЙТИ</a></h7>
								</c:when>
								<c:otherwise>

									<h7 class="text-center"><a href="${contextPath}/login">ВОЙТИ</a></h7>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
        </div>
		<c:forEach var="movie" items="${movies}"  >
		<div class="container m-2-0">
			<div class="row">
				<div class="col-4">
					<div class="film-image">
						<img src="${contextPath}/resources/image/posters/${movie.poster}" width="200" height="270"/>
					</div>
				</div>
				<div class="col-8">
					<div class="film-data">
						<div class="film-title"><c:out value = "${movie.name}"/></div>
						<div class="film-subtitle">
							<c:forEach var="genre" items="${movie.genres}"  >
								<div class="d-inline">
									<c:out value = "${genre.name}"/>,
								</div>
							</c:forEach>, <c:out value = "${movie.age_bracket}"/><br>
							Продолжительность: <c:out value = "${movie.duration}"/>
						</div>
						<div class="film-sessions">
							<c:forEach var="ses" items="${session}">
								<c:choose>
									<c:when test="${movie.id eq ses.movie.id}">
											<a href="${contextPath}/booking/${ses.id}" class="film-session">${ses.date}</a>
										<br>
									</c:when>
								</c:choose>

							</c:forEach>
						</div>
						<div class="film-rej">Режиссер: <c:out value = "${movie.director}"/></div>
						<div class="film-descr">
							<c:out value = "${movie.description}"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
        <div class="container">
           <div class="row block-map">
			   <div class="col-5">
				   <div class="map-content">
					   <div class="t-blue">Мы находимся по адресу:</div>
					   <div class="t-address">г.Омск, улица Мира 27</div>
					   <div class="t-blue">Номер для бронирования:</div>
					   <div class="t-white">+7(3124)84-87-88</div>
					   <div class="t-blue">Email:</div>
					   <div class="t-white">info@gokino.ru</div>
					   <div class="t-blue">Время работы:</div>
					   <div class="t-white">
						   ПН-ЧТ: 10:00-01:00<br>
						   ПТ-ВС: 10:00-03:00
					   </div>
				   </div>
			   </div>
			   <div class="col-7">
				   <img src="${contextPath}/resources/image/map.png" alt="">
			   </div>
		   </div>
		</div>



	<footer class="footer_bg t-white footer">
		<div class="container">
			<div class="row">
				<div class="col-5">
					<div class="logo-footer">
						<img src="${contextPath}/resources/image/logo-footer.png" alt="">
					</div>
				</div>
				<div class="col-7 justify-content-between flex-wrap">
					<div class="footer-top-cont justify-content-between">
						<div class="nav nav-footer d-flex justify-content-between">
							<span><a href="${contextPath}/complete">СЕАНСЫ</a></span>
							<span><a href="${contextPath}/about">О НАС</a></span>
							<span><a href="${contextPath}/contacts">КОНТАКТЫ</a></span>
						</div>
						<div class="social d-flex justify-content-between">
							<a href=""><img src="${contextPath}/resources/image/soc-vk.png" alt="vk"></a>
							<a href=""><img src="${contextPath}/resources/image/soc-fb.png" alt="fb"></a>
							<a href=""><img src="${contextPath}/resources/image/soc-tw.png" alt="t"></a>
						</div>
					</div>
					<div class="footer-botoom-cont">
						<div class="footer-contacts">
							<span>info@gokino.ru </span>
							<span>+7(3124)84-87-88</span>
						</div>
						<div class="justify-content-between">
							<span>© Кинотеатр «${cinema_name}». Все права защищены.</span>
							<span>Политика конфиденциальности</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</div>

<script src="js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/script.js"></script>
</body>
</html>
