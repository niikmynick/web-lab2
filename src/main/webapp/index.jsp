<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--  <head>--%>
<%--    <title>JSP - Hello World</title>--%>
<%--  </head>--%>
<%--  <body>--%>
<%--    <h1><%= "Hello World!" %></h1>--%>
<%--    <br/>--%>
<%--    <a href="hello-servlet">Hello Servlet</a>--%>
<%--  </body>--%>
<%--</html>--%>

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
    <span>variant 3404</span>
  </div>
</header>

<div class="top-div">
  <div class="graph-div">
    <svg width="400" height="400">
      <!-- Scopes -->
      <polygon class="figure" points="200,200 200,100 300,200" fill="lightblue"></polygon>
      <rect class="figure" x="200" y="200" width="50" height="100" fill="lightblue"></rect>
      <circle class="figure" cx="200" cy="200" r="50" fill="lightblue" mask="url(#mask)"></circle>
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
      <text x="100" y="220" text-anchor="middle" class="r-minus-label">-R</text>

      <circle cx="150" cy="200" r="3" fill="black"></circle>
      <text x="150" y="220" text-anchor="middle" class="r-half-minus-label">-R/2</text>

      <circle cx="250" cy="200" r="3" fill="black"></circle>
      <text x="250" y="220" text-anchor="middle" class="r-half-label">R/2</text>

      <circle cx="300" cy="200" r="3" fill="black"></circle>
      <text x="300" y="220" text-anchor="middle" class="r-label">R</text>

      <text x="344" y="230" text-anchor="middle">X</text>

      <!-- Y-axis labels -->
      <circle cx="200" cy="100" r="3" fill="black"></circle>
      <text x="180" y="104" text-anchor="middle" class="r-label">R</text>

      <circle cx="200" cy="150" r="3" fill="black"></circle>
      <text x="180" y="154" text-anchor="middle" class="r-half-label">R/2</text>

      <circle cx="200" cy="300" r="3" fill="black"></circle>
      <text x="180" y="254" text-anchor="middle" class="r-half-minus-label">-R/2</text>

      <circle cx="200" cy="250" r="3" fill="black"></circle>
      <text x="180" y="304" text-anchor="middle" class="r-minus-label">-R</text>

      <text x="180" y="60" text-anchor="middle">Y</text>

      <!-- Hit point -->
      <circle cx="200" cy="200" r="3" fill="red" id="point"></circle>
    </svg>
  </div>

  <div class="form-div">
    <form id="user-input" action="server/script.php" method="get">
      <label for="x-value">X:</label>
      <input type="text" id="x-value" name="x-value" value="">

      <label for="y-value">Y: </label>
      <input type="text" id="y-value" name="y-value">

      <label for="r-value">R:</label>
      <select name="r-value" id="r-value">
        <option value="1">1</option>
        <option value="1.5">1.5</option>
        <option value="2">2</option>
        <option value="2.5">2.5</option>
        <option value="3">3</option>
      </select>

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

    <tbody id="results-body"></tbody>

  </table>
</div>

<div id="error-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="error-message"></p>
  </div>
</div>

</body>
</html>
