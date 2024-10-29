<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.model.Result" %>
<jsp:useBean id="results" scope="session" class="org.example.beans.Results"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta content='IE=edge' http-equiv='X-UA-Compatible'>
    <title>Page Title</title>
    <meta content='width=device-width, initial-scale=1' name='viewport'>
    <link href='./css/main.css' media='screen' rel='stylesheet' type='text/css'>

</head>
<body>
<div id="header">
    <div class="introDiv">
        <h1>Ike Holy Destiny <% application.getAttribute("name"); %> </h1>
        <h1>P3230</h1>
        <h1>Variant 374215</h1>
    </div>
    <div>
        <h1 id="page-title">
            Web Programming Lab 2
        </h1>
    </div>
</div>


<div class="main">
    <form id="main-form" method="post">
        <h1 id="ParamsSecTitle">
            Parameters</h1>
        <div class="params">
            <div class="xValues card">
                <div class="cardLog"><h2>Select X</h2></div>
                <div><label>-5<input checked id="-5" name="x" type="checkbox"></label></div>
                <div><label>-4<input id="-4" name="x" type="checkbox"></label></div>
                <div><label>-3<input id="-3" name="x" type="checkbox"></label></div>
                <div><label>-2<input id="-2" name="x" type="checkbox"></label></div>
                <div><label>-1<input id="-1" name="x" type="checkbox"></label></div>
                <div><label>0<input id="0" name="x" type="checkbox"></label></div>
                <div><label>1<input id="1" name="x" type="checkbox"></label></div>
                <div><label>2<input id="2" name="x" type="checkbox"></label></div>
                <div><label>3<input id="3" name="x" type="checkbox"></label></div>
            </div>

            <div class="card rValues">
                <div class="cardLog"><h2>Enter R</h2></div>
                <input id="currentR" placeholder="currentR" type="number" min="1" max="4" value="3">
            </div>

            <div class="card yValues">
                <h2 class="cardLog">Enter Y</h2>
                <input id="y" max="3" min="-3" type="number" value="0">
            </div>
        </div>
        <button id="submitForm" type="button">Submit</button>


    </form>



    <div class=" plane">
        <svg class="svg-graph" height="280" width="280">

            <!-- x-axes -->
            <line class="axis" stroke="black" x1="4" x2="272" y1="140" y2="140"></line>
            <line class="arrowHead" stroke="black" x1="260" x2="272" y1="132" y2="140"></line>
            <line class="arrowHead" stroke="black" x1="260" x2="272" y1="148" y2="140"></line>

            <!-- y-axes -->
            <line class="axis" stroke="black" x1="140" x2="140" y1="4" y2="272"></line>
            <line class="arrowHead" stroke="black" x1="140" x2="120" y1="4" y2="24"></line>
            <line class="arrowHead" stroke="black" x1="140" x2="160" y1="4" y2="24"></line>

            <!-- coordinate lines -->
            <line class="Xcoor" stroke="black" x1="33" x2="33" y1="136" y2="144"></line>
            <line class="Xcoor" stroke="black" x1="86" x2="86" y1="136" y2="144"></line>
            <line class="Xcoor" stroke="black" x1="194" x2="194" y1="136" y2="144"></line>
            <line class="Xcoor" stroke="black" x1="247" x2="247" y1="136" y2="144"></line>

            <line class="Ycoor" stroke="black" x1="136" x2="144" y1="33" y2="33"></line>
            <line class="Ycoor" stroke="black" x1="136" x2="144" y1="86" y2="86"></line>
            <line class="Ycoor" stroke="black" x1="136" x2="144" y1="194" y2="194"></line>
            <line class="Ycoor" stroke="black" x1="136" x2="144" y1="247" y2="247"></line>

            <text class="xCoorText" x="268" y="132">x</text>
            <text id="rTextY" class="xCoorText" x="246" y="132">3</text>
            <text id="r/2TextY" class="xCoorText" x="192" y="132">1.5</text>
            <text id="-r/2TextY" class="xCoorText" x="83" y="132">-1.5</text>
            <text id="-rTextY" class="xCoorText" x="30" y="132">-3</text>

            <text id="-r/2TextX" class="yCoorText" x="156" y="194">-1.5</text>
            <text id="-rTextX" class="yCoorText" x="156" y="248">-3</text>
            <text id="r/2TextX" class="yCoorText" x="156" y="86">1.5</text>
            <text id="rTextX" class="yCoorText" x="156" y="34">3</text>
            <text id="ytextX" class="yCoorText" x="156" y="10">y</text>

            <!-- polygons -->
            <polygon id="rectangle" fill="blue" fill-opacity="0.2" points="140,140 140,247 86,247 86,140"></polygon>
            <!-- rectangle -->
            <polygon id="triangle" fill="blue" fill-opacity="0.2" points="140,140 192,140 140,247"></polygon> <!-- triangle -->

            <!-- the curve -->
            <path id="curve"
                  d="
                        M 247 140
                        S 247 33 140 33
                        L 140 140 L 86 140
                    "
                  fill="blue"
                  fill-opacity="0.2"
            />
        </svg>

    </div>

    <div class="results">
        <table id="resultTable">
            <tr>
                <th>x</th>
                <th>y</th>
                <th>r</th>
                <th>In Area</th>
                <th>Request Sent</th>
                <th>Response time</th>
            </tr>
                  <%
                                        for (Result result : results.getSessionResults()) {
                                %>
                                <tr>
                                     <td><%= result.getX() %></td>
                                         <td><%= result.getY() %></td>
                                         <td><%= result.getR() %></td>
                                         <td><%= result.isInArea() %></td>
                                         <td><%= result.getRequestSent() %></td>
                                         <td><%= result.getResponseTIme() %></td>
                                    </tr>
                                        <%
                                        }%>
        </table>
    </div>



</div>

<!-- add table for result here -->
<%= results.getSessionResults().size() %>
<footer>
    <div class="footer"><h1>--пока--</h1></div>
</footer>
<script defer src='./js/new.js'></script>
</body>
</html>