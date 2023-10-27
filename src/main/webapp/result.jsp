<%@ page import="com.example.weblab2.beans.UserCollection" %>
<%@ page import="com.example.weblab2.beans.Hit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%--
  Created by IntelliJ IDEA.
  User: niik
  Date: 19.10.2023
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Labwork</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<header class="header">
    <div>
        <span>Nikita Kobik, P3224</span>
        <span>variant 24927</span>
    </div>
</header>

<%
    ServletContext context = request.getServletContext();
    UserCollection userCollection = (UserCollection) context.getAttribute("userCollection");
    int batchSize = (int) context.getAttribute("batchSize");
    ArrayList<Hit> lastHits = new ArrayList<Hit>();

    for (int i = 0; i < batchSize; i++) {
        lastHits.add(userCollection.getCollection().get(i));
    }

    Hit lastHit = userCollection.getCollection().get(batchSize - 1);
%>

<div class="top-div">
    <div class="graph-div">
        <svg width="400" height="400">
            <!-- Scopes -->
            <polygon class="figure" points="200,200 200,150 300,200" fill="lightblue"></polygon>
            <rect class="figure" x="200" y="200" width="100" height="50" fill="lightblue"></rect>
            <circle class="figure" cx="200" cy="200" r="100" fill="lightblue" mask="url(#mask)"></circle>
            <mask id="mask">
                <rect x="0" y="0" width="200" height="200" fill="white"></rect>
            </mask>

            <!-- X-axis -->
            <line x1="50" y1="200" x2="350" y2="200" stroke="black" stroke-width="2"></line>

            <!-- Y-axis -->
            <line x1="200" y1="50" x2="200" y2="350" stroke="black" stroke-width="2"></line>

            <!-- X-axis arrow -->
            <polygon points="350,200 340,190 340,210" fill="black"></polygon>

            <!-- Y-axis arrow -->
            <polygon points="200,50 190,60 210,60" fill="black"></polygon>

            <!-- X-axis labels -->
            <circle cx="100" cy="200" r="3" fill="black"></circle>
            <text x="100" y="220" text-anchor="middle" class="r-minus-label"> -<%= lastHit.getR() %> </text>

            <circle cx="150" cy="200" r="3" fill="black"></circle>
            <text x="150" y="220" text-anchor="middle" class="r-half-minus-label"> -<%= lastHit.getR() / 2 %> </text>

            <circle cx="250" cy="200" r="3" fill="black"></circle>
            <text x="250" y="220" text-anchor="middle" class="r-half-label"> <%= lastHit.getR() / 2 %> </text>

            <circle cx="300" cy="200" r="3" fill="black"></circle>
            <text x="300" y="220" text-anchor="middle" class="r-label"> <%= lastHit.getR() %> </text>

            <text x="344" y="230" text-anchor="middle">X</text>

            <!-- Y-axis labels -->
            <circle cx="200" cy="100" r="3" fill="black"></circle>
            <text x="180" y="104" text-anchor="middle" class="r-label"> <%= lastHit.getR() %> </text>

            <circle cx="200" cy="150" r="3" fill="black"></circle>
            <text x="180" y="154" text-anchor="middle" class="r-half-label"> <%= lastHit.getR() / 2 %> </text>

            <circle cx="200" cy="300" r="3" fill="black"></circle>
            <text x="180" y="254" text-anchor="middle" class="r-half-minus-label"> -<%= lastHit.getR() / 2 %> </text>

            <circle cx="200" cy="250" r="3" fill="black"></circle>
            <text x="180" y="304" text-anchor="middle" class="r-minus-label"> -<%= lastHit.getR() %> </text>

            <text x="180" y="60" text-anchor="middle">Y</text>

            <%
                double centerX = 200;
                double centerY = 200;
                double scaleFactor = 100;

                for (Hit currentHit : lastHits) {
                    scaleFactor = 100 / currentHit.getR();
            %>
                <circle cx=<%= (currentHit.getX() * scaleFactor) + centerX %> cy=<%= (currentHit.getY() * -scaleFactor) + centerY %> r="3" fill="red" id="point"></circle>
            <%
                }
            %>

            <!-- Hit point -->
            <circle cx=<%= (lastHit.getX() * scaleFactor) + centerX %> cy=<%= (lastHit.getY() * -scaleFactor) + centerY %> r="3" fill="red" id="point"></circle>
        </svg>
    </div>

    <div class="form-div">
        <img src="img/am.jpg" alt="meme" width="500" height="500">
    </div>
</div>

<!-- Div w/ results table -->
<div id="results-div">
    <table id="results-table">
        <thead>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Status</th>
            <th>Time</th>
            <th>Script time</th>
        </tr>
        </thead>

        <tbody id="results-body">

        <%
            for (Hit hit : lastHits) {
        %>
        <tr>
            <td> <%= Math.round(hit.getX() * 100.0) / 100.0 %> </td>
            <td> <%= Math.round(hit.getY() * 100.0) / 100.0 %> </td>
            <td> <%= hit.getR() %> </td>
            <td> <%= hit.getStatus() ? "In" : "Out" %> </td>
            <td> <%= hit.getRequestTime() %> </td>
            <td> <%= hit.getScriptTime() + " ms" %> </td>
        </tr>
        <%
            }
        %>

        </tbody>

    </table>
</div>

<div id="back-div">
    <a href="index.jsp" id="back">
        Назад
    </a>
</div>

<script src="./dist/bundle.js"></script>

</body>
</html>
