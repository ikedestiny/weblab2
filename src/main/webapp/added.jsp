<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
       <div class="results">
        <table id="resultTable">
        <caption>Last Added</caption>
            <tr>
                <th>x</th>
                <th>y</th>
                <th>r</th>
                <th>In Area</th>
                <th>Request Sent</th>
                <th>Response time</th>
            </tr>
                  <%
                                      Result result = results.getSessionResults().get(results.getSessionResults().size()-1);
                                %>
                                <tr>
                                     <td><%= result.getX() %></td>
                                         <td><%= result.getY() %></td>
                                         <td><%= result.getR() %></td>
                                         <td><%= result.isInArea() %></td>
                                         <td><%= result.getRequestSent() %></td>
                                         <td><%= result.getResponseTIme() %></td>
                                    </tr>

        </table>
    </div>
</div>
 <button>Home</button>

<!-- add table for result here -->
<%= results.getSessionResults().size() %>
<footer>
    <div class="footer"><h1>--????--</h1></div>
</footer>
<script defer src='./js/new.js'></script>
</body>
</html>