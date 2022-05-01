<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link href="mainStyle.css" rel="stylesheet">
    <link href="http://fonts.cdnfonts.com/css/pretendo" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nintendo Swap Shop</title>
</head>
<body>
<div class="top">
    <a href="index.jsp">
        <span class="topTitle">
            <img src="image/Nintendo-Logo.png" alt="Nintendo Logo" />
            <p style="margin-left: 120px;">Swap Shop</p>
        </span>
    </a>
    <img src="image/eshop.png" class="topImg" alt="topImg" />

    <button class="loginBtn" onclick="location.href='login.html'">login</button>
</div>
<div>
    <nav>
        <a href="bestSellers.jsp" class="navigator">Best Sellers</a>
        <a href="newlyReleased.jsp" class="navigator">Newly Released</a>
        <a href="onSale.jsp" class="navigator">On Sale</a>
    </nav>
</div>

<div class="content">
    <h1 class="slide-top" style="margin-top: 60px; font-size: 70px; width: auto;">Find Your Games at a <br>Reasonable Price</h1>
    <img src="image/nintendo_switch.png" class="slide-bottom" style="float: right;" alt="nintendo switch">
    <div class="slide-top" style="font-size: 25px; margin-top: 200px;">
        Nintendo eShop에서 판매 중인 게임 가격을 국가별로 한 눈에 확인해보세요.
        <br>당신이 원하는 게임을 최저가로 구매하실 수 있습니다.
    </div>
    <img src="image/new_game2.png" alt="new game" class="slide-bottom" style="float: left; height: 500px; margin-top: 300px;">
    <div class="slide-top" style="font-size: 25px; margin-top: 600px;">
        최신 게임을 최저가로 접해보세요.
    </div>
    <img src="image/mario.png" class="slide-bottom" style="margin-top: 200px; height: 450px; left: -300px;" alt="mario">
    <img src="image/sale.png" class="slide-bottom" style="float: right; height: 800px; margin-top: 400px;" alt="eshop">
    <div class="slide-top" style="font-size: 25px; margin-left: 500px; margin-top: 100px;">
        각 나라에서 세일하고 있는 게임을 찾아보세요.
    </div>
</div>
<footer>오픈소스 웹소프트웨어 과제-2020039075 이승현</footer>
</body>
</html>