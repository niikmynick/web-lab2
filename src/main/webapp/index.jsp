<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.weblab2.beans.UserCollection" %>
<%@ page import="com.example.weblab2.beans.Hit" %>

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
  String posR = "R";
  String negR = "-R";
  String posHalfR = "R/2";
  String negHalfR = "-R/2";
  if (userCollection != null && !userCollection.getCollection().isEmpty()) {
    Hit lastHit = userCollection.getCollection().get(0);
    double lastR = lastHit.getR();

    posR = String.valueOf(lastR);
    negR = String.valueOf(-lastR);
    posHalfR = String.valueOf(lastR / 2);
    negHalfR = String.valueOf(-lastR / 2);
  }
%>

<div class="top-div">
  <div class="graph-div" id="graph-svg">
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

      <text x="100" y="220" text-anchor="middle" class="r-minus-label"> <%=negR%> </text>

      <circle cx="150" cy="200" r="3" fill="black"></circle>
      <text x="150" y="220" text-anchor="middle" class="r-half-minus-label"> <%=negHalfR%> </text>

      <circle cx="250" cy="200" r="3" fill="black"></circle>
      <text x="250" y="220" text-anchor="middle" class="r-half-label"> <%=posHalfR%> </text>

      <circle cx="300" cy="200" r="3" fill="black"></circle>
      <text x="300" y="220" text-anchor="middle" class="r-label"> <%=posR%> </text>

      <text x="344" y="230" text-anchor="middle">X</text>

      <!-- Y-axis labels -->
      <circle cx="200" cy="100" r="3" fill="black"></circle>
      <text x="180" y="104" text-anchor="middle" class="r-label"> <%=posR%> </text>

      <circle cx="200" cy="150" r="3" fill="black"></circle>
      <text x="180" y="154" text-anchor="middle" class="r-half-label"> <%=posHalfR%> </text>

      <circle cx="200" cy="300" r="3" fill="black"></circle>
      <text x="180" y="254" text-anchor="middle" class="r-half-minus-label"> <%=negHalfR%> </text>

      <circle cx="200" cy="250" r="3" fill="black"></circle>
      <text x="180" y="304" text-anchor="middle" class="r-minus-label"> <%=negR%> </text>

      <text x="180" y="60" text-anchor="middle">Y</text>

      <!-- Hit point -->
      <%
        if (userCollection != null && !userCollection.getCollection().isEmpty()) {
          int amount = Math.min(userCollection.getCollection().size(), 5);
          double centerX = 200;
          double centerY = 200;
          double scaleFactor = 100;

          Hit currentHit = userCollection.getCollection().get(0);
          scaleFactor = 100 / currentHit.getR();
      %>
      <circle cx=<%= (currentHit.getX() * scaleFactor) + centerX %> cy=<%= (currentHit.getY() * -scaleFactor) + centerY %> r="3" fill="red" id="point0"></circle>
      <%
          for (int i = 1; i < userCollection.getCollection().size(); i++) {
            currentHit = userCollection.getCollection().get(i);
            scaleFactor = 100 / currentHit.getR();
      %>
        <circle cx=<%= (currentHit.getX() * scaleFactor) + centerX %> cy=<%= (currentHit.getY() * -scaleFactor) + centerY %> r="3" fill="gray" id="point <%=i%>"></circle>
      <%
          }
        } else {
      %>
        <circle cx="200" cy="200" r="3" fill="red" id="point"></circle>
      <%
        }
      %>

    </svg>
  </div>

  <div class="form-div">
    <form id="user-input" action="${pageContext.request.contextPath}/controller" method="post">
      <label for="x-value">X:</label>
      <select name="x-value" id="x-value">
        <option value="-4">-4</option>
        <option value="-3">-3</option>
        <option value="-2">-2</option>
        <option value="-1">-1</option>
        <option selected="selected" value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
      </select>

      <label for="y-value">Y: </label>
      <input type="text" id="y-value" name="y-value">

      <label>R:</label>
      <div>
        <label>1<input type="checkbox" class='rBox' value="1" name="r-value"></label>
        <label>1.5<input type="checkbox" class='rBox' value="1.5" name="r-value"></label>
        <label>2<input type="checkbox" class='rBox' value="2" name="r-value"></label>
        <label>2.5<input type="checkbox" class='rBox' value="2.5" name="r-value"></label>
        <label>3<input type="checkbox" class='rBox' value="3" name="r-value"></label>
      </div>

<%--      <label for="r-value">R:</label>--%>
<%--      <select name="r-value" id="r-value">--%>
<%--        <option selected="selected" value="1">1</option>--%>
<%--        <option value="1.5">1.5</option>--%>
<%--        <option value="2">2</option>--%>
<%--        <option value="2.5">2.5</option>--%>
<%--        <option value="3">3</option>--%>
<%--      </select>--%>

      <input type="submit" value="Submit" id="submit-button">
    </form>
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
      if (userCollection != null && !userCollection.getCollection().isEmpty()) {
        for (Hit hit : userCollection.getCollection()) {
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
      }
    %>
    </tbody>

  </table>
</div>

<div id="error-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="error-message"></p>
  </div>
</div>

</body>

<script src="./dist/bundle.js"></script>

</html>
