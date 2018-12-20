<%@ page import="codename.team.cinemabooking.model.Place" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>GoKino</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css"/>
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
		<div class="container-fluid popular-bg p-2-0">
			<div class="container m-2-0 ">
				<div class="row">
					<div class="col-12">
						<div class="film-data">
							<div class="film-title">${session.movie.name}</div>
							<div class="film-rej">Цена билета: <span id="price">${session.price}</span></div>
							<div class="film-descr">Время сеанса ${session.date}</div>
						</div>
					</div>
				</div>
				<div class="row block-map">
					<div class="col-12">
						<div class="session-reg">
							<div class="row">
								<div class="col-7">
									<div class="session-room">
										<div class="room-row">
											<div class="row-num" data-row="6">Ряд 6</div>
											<div class="row-points">
												<div class="row-point">1</div>
												<div class="row-point">2</div>
												<div class="row-point">3</div>
												<div class="row-point">4</div>
												<div class="row-point">5</div>
												<div class="row-point">6</div>
											</div>
										</div>
										<div class="room-row">
											<div class="row-num" data-row="5">Ряд 5</div>
											<div class="row-points">
												<div class="row-point">1</div>
												<div class="row-point blocked">2</div>
												<div class="row-point blocked">3</div>
												<div class="row-point">4</div>
												<div class="row-point">5</div>
												<div class="row-point">6</div>
											</div>
										</div>
										<div class="room-row">
											<div class="row-num" data-row="4">Ряд 4</div>
											<div class="row-points">
												<div class="row-point">1</div>
												<div class="row-point">2</div>
												<div class="row-point">3</div>
												<div class="row-point">4</div>
												<div class="row-point">5</div>
												<div class="row-point">6</div>
											</div>
										</div>
										<div class="room-row">
											<div class="row-num" data-row="3">Ряд 3</div>
											<div class="row-points">
												<div class="row-point">1</div>
												<div class="row-point">2</div>
												<div class="row-point">3</div>
												<div class="row-point">4</div>
												<div class="row-point">5</div>
												<div class="row-point">6</div>
											</div>
										</div>
										<div class="room-row">
											<div class="row-num" data-row="2">Ряд 2</div>
											<div class="row-points">
												<div class="row-point">1</div>
												<div class="row-point">2</div>
												<div class="row-point">3</div>
												<div class="row-point">4</div>
												<div class="row-point">5</div>
												<div class="row-point">6</div>
											</div>
										</div>
										<div class="room-row">
											<div class="row-num" data-row="1">Ряд 1</div>
											<div class="row-points">
												<div class="row-point">1</div>
												<div class="row-point">2</div>
												<div class="row-point">3</div>
												<div class="row-point">4</div>
												<div class="row-point">5</div>
												<div class="row-point">6</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-5">
									<div class="reg-data">
										<div class="data-inf-inp">
											<div class="row-point"></div>
											<div class="row-num">Свободные</div>
										</div>
										<div class="data-inf-inp">
											<div class="row-point blocked"></div>
											<div class="row-num">Занятые</div>
										</div>
										<div class="data-inf-inp">
											<div class="row-point select"></div>
											<div class="row-num">Выбранные Вами</div>
										</div>
										<div class="data-inf-film">
											Вы выбрали:<br>
											<div id="select-points">
												<!--   <div class="select-point" data-row="3">Ряд: <span class="select-row-num">3</span> Место: <span class="point">4,5</span></div>   -->

											</div>

											Сумма: <span id="sum"></span>
										</div>
										<div class="btn-gk">Забронировать</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="container">
           <div class="row block-map m-2-0">
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

<script src="${contextPath}/resources/js/jquery.js"></script>
<script src="${contextPath}/resources/js/bootstrap.js"></script>
<script src="${contextPath}/resources/js/script.js"></script>
</body>
</html>
