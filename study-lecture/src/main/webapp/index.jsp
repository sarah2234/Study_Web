<%@ page language="java" contentType="text/html; charset=EUC-KR"
        pageEncoding="EUC-KR"%>
<%@ page import="bestSeller.BestSeller" %>
<%@ page import="bestSeller.BestSellerDAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <link href="indexStyle.css" rel="stylesheet">
    <link href="http://fonts.cdnfonts.com/css/pretendo" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nintendo Swap Shop</title>
</head>
<body>
<div class="top">
    <span class="topTitle">
        <img src="image/Nintendo-Logo.png" alt="Nintendo Logo" />
        <h1 class="webTitle">Swap Shop</h1>
    </span>
    <img src="image/switch.png" class="topImg" alt="topImg" />
    <button class="loginBtn" onclick="location.href='login.html'">login</button>
</div>

<div class="navigator">
    <nav>
        <a href="./about.jsp">About</a>
        <a href="bestSellers.jsp">Best Sellers</a>
        <a href="newlyReleased.jsp">Newly Released</a>
        <a href="onSale.jsp">On Sale</a>
    </nav>
</div>

<div class="productLines">
    <div class="bestSellers">
        <%
            BestSellerDAO bestSellerDAO = new BestSellerDAO();
            ArrayList<BestSeller> list = bestSellerDAO.getBestSellers();
            for(int i = 0; i < list.size(); i++) {
        %>
        <p><%=list.get(i).getBestSellerName()%></p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>