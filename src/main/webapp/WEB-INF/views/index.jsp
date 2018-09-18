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
    <title>GoKino</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>



<div class="wrapper">
    <div class="content">
        <div class="container-fluid header-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-12">
                        <div class="logo"><img src="${contextPath}/resources/images/logo.png" alt="logo"></div>
                    </div>
                    <div class="col-sm-6">
                        <div class="nav d-flex justify-content-around">
                            <span><a href="#">СЕАНСЫ</a></span>
                            <span><a href="#">О НАС</a></span>
                            <span><a href="#">КОНТАКТЫ</a></span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-12">
                        <div class="reg d-flex justify-content-between">
                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal != null && pageContext.request.userPrincipal.name != null}">
                                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                                ${pageContext.request.userPrincipal.name}   <h7 class="text-center">| <a onclick="document.forms['logoutForm'].submit()"><i class="fa fa-sign-out"></i>Выйти</a></h7>
                            </c:when>
                            <c:otherwise>

                                <h7 class="text-center"><a href="${contextPath}/login">ВОЙТИ</a></h7>
                            </c:otherwise>
                        </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="main-banner">
                            <div class="f-week">Фильм недели</div>
                            <div class="f-name">Темные отражения</div>
                            <div class="f-info">ФАНТАСТИКА, 16+</div>
                            <div class="f-sessions">Сеансы: <a href="">12:30</a>, <a href="">13:00</a>, <a href="">18:20</a>, <a href="">21:50</a></div>
                            <div class="btn-gk">
                                Бронировать
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container m-t_-3r">
            <div class="row block-map ">
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
                    <img src="${contextPath}/resources/images/map.png" alt="">
                </div>
            </div>
        </div>
        <div class="container-fluid popular-bg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="title"><span class="t-blue">Популярное</span> <span class="t-white"> сейчас</span></div>
                    </div>
                    <div class="col-3">
                        <div class="film animaite">
                            <a href="">
                                <div class="film-content ">
                                    <span class="t-white">Перейти к фильму</span>
                                </div>
                                <img src="${contextPath}/resources/images/pop1.png" alt="f">
                            </a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="film animaite">
                            <a href="">
                                <div class="film-content ">
                                    <span class="t-white">Перейти к фильму</span>
                                </div>
                                <img src="${contextPath}/resources/images/pop1.png" alt="f">
                            </a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="film animaite">
                            <a href="">
                                <div class="film-content ">
                                    <span class="t-white">Перейти к фильму</span>
                                </div>
                                <img src="${contextPath}/resources/images/pop1.png" alt="f">
                            </a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="film animaite">
                            <a href="">
                                <div class="film-content ">
                                    <span class="t-white">Перейти к фильму</span>
                                </div>
                                <img src="${contextPath}/resources/images/pop1.png" alt="f">
                            </a>
                        </div>
                    </div>
                    <div class="col-12"><a href="" class="f_r m_1"><span class="t-white">Посмотреть все</span></a></div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="title"><span class="t-blue">Почему выбирают</span> <span class="t-white">именно нас?</span></div>
                </div>
                <div class="col-4">
                    <div class="poch">
                        <img src="${contextPath}/resources/images/pochemu1.png" alt="">
                        <span class="poch-text">
							Персональный консьерж,
							который возьмет на себя организацию
							досуга на территории мультиплекса
						</span>
                    </div>
                </div>
                <div class="col-4">
                    <div class="poch">
                        <img src="${contextPath}/resources/images/pochemu2.png" alt="">
                        <span class="poch-text">
							Возможность посещать премьеры
							и закрытые показы самых популярных
							в мире фильмов
						</span>
                    </div>
                </div>
                <div class="col-4">
                    <div class="poch">
                        <img src="${contextPath}/resources/images/pochemu3.png" alt="">
                        <span class="poch-text">
							Возможность арендовать целиком
							большие и маленькие залы, рассчитанные
							на 7–9 человек
						</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid subscribe-bg">
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <div class="subscribe">
                        <div class="subs-title">
							<span class="t-blue">
								Следите за новостями
							</span> <br>
                            <span class="t-white">оформив подписку!</span>
                        </div>
                        <div class="subs-cont">
                            <input name="email" id="email" type="text" class="inp-gk" placeholder="Ваш Email">
                            <div class="btn-gk">Подписаться</div>
                            <label for="email">Нажимая “Подписаться”, Вы подписываете <a href="">Пользовательское соглашение</a></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer_bg t-white footer">
        <div class="container">
            <div class="row">
                <div class="col-5">
                    <div class="logo-footer">
                        <img src="${contextPath}/resources/images/logo-footer.png" alt="">
                    </div>
                </div>
                <div class="col-7 justify-content-between flex-wrap">
                    <div class="footer-top-cont justify-content-between">
                        <div class="nav nav-footer d-flex justify-content-between">
                            <span><a href="#">СЕАНСЫ</a></span>
                            <span><a href="#">О НАС</a></span>
                            <span><a href="#">КОНТАКТЫ</a></span>
                        </div>
                        <div class="social d-flex justify-content-between">
                            <a href=""><img src="${contextPath}/resources/images/soc-vk.png" alt="vk"></a>
                            <a href=""><img src="${contextPath}/resources/images/soc-fb.png" alt="fb"></a>
                            <a href=""><img src="${contextPath}/resources/images/soc-tw.png" alt="t"></a>
                        </div>
                    </div>
                    <div class="footer-botoom-cont">
                        <div class="footer-contacts">
                            <span>info@gokino.ru </span>
                            <span>+7(3124)84-87-88</span>
                        </div>
                        <div class="justify-content-between">
                            <span>© Кинотеатр «GoКино». Все права защищены.</span>
                            <span>Политика конфиденциальности</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

</body>
</html>