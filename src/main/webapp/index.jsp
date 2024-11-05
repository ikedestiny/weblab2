<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.model.Result" %>
<jsp:useBean id="results" scope="session" class="org.example.beans.Results"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta content='IE=edge' http-equiv='X-UA-Compatible'>
    <title>Home</title>
    <meta content='width=device-width, initial-scale=1' name='viewport'>
    <link href='./css/new.css' media='screen' rel='stylesheet' type='text/css'>

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
        <button id="submitForm" onclick="submitFunc()" type="button">Submit</button>


    </form>



    <div class=" plane">

        <svg class="svg-graph" height="560" width="560">
        			<!-- x-axis -->
        			<line class="axis" stroke="black" x1="4" x2="556" y1="280" y2="280"></line>
        			<line class="arrowHead" stroke="black" x1="544" x2="556" y1="272" y2="280"></line>
        			<line class="arrowHead" stroke="black" x1="544" x2="556" y1="288" y2="280"></line>

        			<!-- y-axis -->
        			<line class="axis" stroke="black" x1="280" x2="280" y1="4" y2="556"></line>
        			<line class="arrowHead" stroke="black" x1="280" x2="260" y1="4" y2="24"></line>
        			<line class="arrowHead" stroke="black" x1="280" x2="300" y1="4" y2="24"></line>

        			<!-- coordinate lines for x-axis -->
        			<line class="Xcoor" stroke="black" x1="84" x2="84" y1="276" y2="284"></line>  <!-- -5 -->
        			<line class="Xcoor" stroke="black" x1="182" x2="182" y1="276" y2="284"></line>  <!-- -2.5 -->
        			<line class="Xcoor" stroke="black" x1="378" x2="378" y1="276" y2="284"></line> <!-- 2.5 -->
        			<line class="Xcoor" stroke="black" x1="476" x2="476" y1="276" y2="284"></line> <!-- 5 -->

        			<!-- coordinate lines for y-axis -->
        			<line class="Ycoor" stroke="black" x1="276" x2="284" y1="84" y2="84"></line>  <!-- 5 -->
        			<line class="Ycoor" stroke="black" x1="276" x2="284" y1="182" y2="182"></line>  <!-- 2.5 -->
        			<line class="Ycoor" stroke="black" x1="276" x2="284" y1="378" y2="378"></line> <!-- -2.5 -->
        			<line class="Ycoor" stroke="black" x1="276" x2="284" y1="476" y2="476"></line> <!-- -5 -->

        			<!-- x-axis labels -->
        			<text class="xCoorText" x="552" y="272">x</text>
        			<text class="xCoorText" x="470" y="272">5</text>
        			<text class="xCoorText" x="366" y="272">2.5</text>
        			<text class="xCoorText" x="170" y="272">-2.5</text>
        			<text class="xCoorText" x="72" y="272">-5</text>

        			<!-- y-axis labels -->
        			<text class="yCoorText" x="296" y="88">5</text>
        			<text class="yCoorText" x="296" y="186">2.5</text>
        			<text class="yCoorText" x="296" y="382">-2.5</text>
        			<text class="yCoorText" x="296" y="480">-5</text>
        			<text class="yCoorText" x="296" y="20">y</text>

        			<!-- polygons (expanded) -->
        			<polygon id="rectangle" fill="blue" fill-opacity="0.2" points="280,280 280,476 182,476 182,280"></polygon>
        			<polygon id="triangle" fill="blue" fill-opacity="0.2" points="280,280 378,280 280,476"></polygon>

        			<!-- the curve (expanded) -->
        			<path id="curve"
        				  d="
                    M 476 280
                    S 476 84 280 84
                    L 280 280 L 182 280
                "
        				  fill="blue"
        				  fill-opacity="0.2"
        			/>
        		</svg>


    </div>

    <div class="results">
        <table id="resultTable">
                <caption>Results</caption>
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
         <button class="rButton" onclick="sendClearRequest()">Clear</button>
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