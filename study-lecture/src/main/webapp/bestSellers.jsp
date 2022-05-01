<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page import="bestSeller.BestSeller" %>
<%@ page import="bestSeller.BestSellerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>

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
            <p style="margin-left: 120px;">Best Sellers</p>
        </span>
    </a>
    <img src="image/zelda.png" class="topImg" alt="topImg" />
    <button class="loginBtn" onclick="location.href='login.html'">login</button>
</div>

<nav>
    <a href="#" class="navigator" style="color: #303030;">Best Sellers</a>
    <a href="newlyReleased.jsp" class="navigator">Newly Released</a>
    <a href="onSale.jsp" class="navigator">On Sale</a>
</nav>

<div class="content">
    <div class="container slide-left">
        <%
            BestSellerDAO bestSellerDAO = new BestSellerDAO();
            ArrayList<BestSeller> list = bestSellerDAO.getBestSellers();
            for(int i = 0; i < list.size(); i++) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
                String releaseDate = sdf.format(new Date(list.get(i).getBestSellerReleaseDate().getTime()));

                int cheapest = 0; // �ʱ�: �޷��� ���� ��
                // �̱��� �ѱ� ��
                if(list.get(i).getBestSellerPrice(1) > 0) {
                    if (Math.min(list.get(i).getBestSellerPrice(0) * 1263.48, list.get(i).getBestSellerPrice(1))
                            == list.get(i).getBestSellerPrice(1))
                        cheapest = 1;
                }
                // ���� �� ���� �Ϻ� ��
                if(Math.min(list.get(i).getBestSellerPrice(cheapest), list.get(i).getBestSellerPrice(2) * 9.7310)
                        == list.get(i).getBestSellerPrice(2) * 9.7310)
                    cheapest = 2;
                // ���� �� ���� ���� ��
                if(Math.min(list.get(i).getBestSellerPrice(cheapest), list.get(i).getBestSellerPrice(3) * 1588.64)
                        == list.get(i).getBestSellerPrice(3) * 1588.64)
                    cheapest = 3;

        %>
        <span class="product">
            <img src="<%=list.get(i).getBestSellerImageURL()%>" alt="image" width="200px" height="324px">
            <hr color="red">
            <table>
                <tr>
                    <td>Title</td>
                    <td><%=list.get(i).getBestSellerName()%></td>
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
                    <td><%=list.get(i).getBestSellerPrice(1)==0?"-":Math.round(list.get(i).getBestSellerPrice(1))%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="#e5e5e5" style="border: 0; height: 1px;"></td>
                </tr>

                <tr <%if (cheapest == 0)%> style="background-color: #e4e4e4" <%;%>>
                    <td>US<i>(1263.48)</i></td>
                    <td><%=Math.round(list.get(i).getBestSellerPrice(0) * 1263.48)%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="#e5e5e5" style="border: 0; height: 1px;"></td>
                </tr>

                <tr <%if (cheapest == 2)%> style="background-color: #e4e4e4" <%;%>>
                    <td>JAP<i>(9.7310)</i></td>
                    <td><%=Math.round(list.get(i).getBestSellerPrice(2) * 9.7310)%></td>
                </tr>
                <tr>
                    <td colspan="2"><hr color="#e5e5e5" style="border: 0; height: 1px;"></td>
                </tr>

                <tr <%if (cheapest == 3)%> style="background-color: #e4e4e4" <%;%>>
                    <td>UK<i>(1588.64)</i></td>
                    <td><%=Math.round(list.get(i).getBestSellerPrice(3) * 1588.64)%></td>
                </tr>
            </table>
        </span>
        <%
            }
        %>
    </div>
</div>
<footer>���¼ҽ� ������Ʈ���� ����-2020039075 �̽���</footer>
</body>
</html>