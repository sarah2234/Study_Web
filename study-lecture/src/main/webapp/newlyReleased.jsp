<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="newlyReleased.NewlyReleased" %>
<%@ page import="newlyReleased.NewlyReleasedDAO" %>

<!DOCTYPE html>
<html>
<head>
    <link href="mainStyle.css" rel="stylesheet">
    <link href="tableStyle.css" rel="stylesheet">
    <link href="http://fonts.cdnfonts.com/css/pretendo" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nintendo Swap Shop</title>
</head>
<body>
<div class="top">
    <a href="index.jsp">
        <span class="topTitle">
            <img src="image/Nintendo-Logo.png" alt="Nintendo Logo" />
            <p style="margin-left: 120px;">Newly Released</p>
        </span>
    </a>
    <img src="image/new_game1.png" class="topImg" alt="topImg" />
    <button class="loginBtn" onclick="location.href='login.html'">login</button>
</div>

<div>
    <nav>
        <a href="bestSellers.jsp" class="navigator">Best Sellers</a>
        <a href="#" class="navigator" style="color: #303030;">Newly Released</a>
        <a href="onSale.jsp" class="navigator">On Sale</a>
    </nav>
</div>

<div class="content">
    <div class="container slide-left">
        <%
            NewlyReleasedDAO newlyReleasedDAO = new NewlyReleasedDAO();
            ArrayList<NewlyReleased> list = newlyReleasedDAO.getNewlyReleased();
            for(int i = 0; i < list.size(); i++) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
                String releaseDate = sdf.format(new Date(list.get(i).getNewlyReleasedReleaseDate().getTime()));

                int cheapest = 0; // 초기: 달러가 제일 쌈
                // 미국과 한국 비교
                if(list.get(i).getNewlyReleasedPrice(1) > 0 && list.get(i).getNewlyReleasedPrice(2) > 0) {
                    if (Math.min(list.get(i).getNewlyReleasedPrice(0) * 1263.48, list.get(i).getNewlyReleasedPrice(1))
                            == list.get(i).getNewlyReleasedPrice(1))
                        cheapest = 1;
                }
                // 제일 싼 곳과 일본 비교
                if(Math.min(list.get(i).getNewlyReleasedPrice(cheapest), list.get(i).getNewlyReleasedPrice(2) * 9.7310)
                        == list.get(i).getNewlyReleasedPrice(2) * 9.7310)
                    cheapest = 2;
                // 제일 싼 곳과 영국 비교
                if(Math.min(list.get(i).getNewlyReleasedPrice(cheapest), list.get(i).getNewlyReleasedPrice(3) * 1588.64)
                        == list.get(i).getNewlyReleasedPrice(3) * 1588.64)
                    cheapest = 3;

        %>
        <span class="product">
            <img src="<%=list.get(i).getNewlyReleasedImageURL()%>" alt="image" width="200px" height="324px">
            <hr color="red">
            <table>
                <tr>
                    <td>Title</td>
                    <td><%=list.get(i).getNewlyReleasedName()%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="red" style="border: 0; height: 1px;"></td>
                </tr>

                <tr>
                    <td>Release Date</td>
                    <td><%=releaseDate%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="red" style="border: 0; height: 1px;"></td>
                </tr>

                <tr>
                    <td colspan="2">Price (Won)</td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="red" style="border: 0; height: 1px;"></td>
                </tr>
                <tr <%if (cheapest == 1)%> style="background-color: #e4e4e4" <%;%>>
                    <td>KOR</td>
                    <td><%=list.get(i).getNewlyReleasedPrice(1)==0?"-":Math.round(list.get(i).getNewlyReleasedPrice(1))%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="#e5e5e5" style="border: 0; height: 1px;"></td>
                </tr>

                <tr <%if (cheapest == 0)%> style="background-color: #e4e4e4" <%;%>>
                    <td>US<i>(1263.48)</i></td>
                    <td><%=Math.round(list.get(i).getNewlyReleasedPrice(0) * 1263.48)%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="#e5e5e5" style="border: 0; height: 1px;"></td>
                </tr>

                <tr <%if (cheapest == 2)%> style="background-color: #e4e4e4" <%;%>>
                    <td>JAP<i>(9.7310)</i></td>
                    <td><%=list.get(i).getNewlyReleasedPrice(2)==0?"-":Math.round(list.get(i).getNewlyReleasedPrice(2) * 9.7310)%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="#e5e5e5" style="border: 0; height: 1px;"></td>
                </tr>

                <tr <%if (cheapest == 3)%> style="background-color: #e4e4e4" <%;%>>
                    <td>UK<i>(1588.64)</i></td>
                    <td><%=Math.round(list.get(i).getNewlyReleasedPrice(3) * 1588.64)%></td>
                </tr>
            </table>
        </span>
        <%
            }
        %>
    </div>
</div>
<footer>오픈소스 웹소프트웨어 과제-2020039075 이승현</footer>
</body>
</html>