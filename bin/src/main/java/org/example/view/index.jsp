<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta content='IE=edge' http-equiv='X-UA-Compatible'>
    <title>Page Title</title>
    <meta content='width=device-width, initial-scale=1' name='viewport'>
    <link href='main.css' media='screen' rel='stylesheet' type='text/css'>

</head>
<body>
<div id="header">
    <div class="introDiv">
        <h1>Ike Holy Destiny</h1>
        <h1>P3230</h1>
        <h1>Variant 374215</h1>
    </div>
    <div>
        <h1 id="page-title">
            Web Programming Lab 1
        </h1>
    </div>
</div>


<div class="main">
    <form id="main-form" method="get">
        <h1 id="ParamsSecTitle">
            Parameters</h1>
        <div class="params">
            <div class="xValues card">
                <div class="cardLog"><h2>Select X</h2></div>
                <label><i>-2</i><input checked id="-2" name="x" type="checkbox"></label>
                <label>-1.5<input id="-1.5" name="x" type="checkbox"></label>
                <label>-1<input id="-1" name="x" type="checkbox"></label>
                <label>-0.5<input id="-0.5" name="x" type="checkbox"></label>
                <label>0<input id="0" name="x" type="checkbox"></label>
                <label>0.5<input id="0.5" name="x" type="checkbox"></label>
                <label>1<input id="1" name="x" type="checkbox"></label>
                <label>1.5<input id="1.5" name="x" type="checkbox"></label>
                <label>2<input id="2" name="x" type="checkbox"></label>
            </div>

            <div class="card rValues">
                <div class="cardLog"><h2>Select R</h2></div>
                <button class="rButton">1</button>
                <button class="rButton">1.5</button>
                <button class="rButton">2</button>
                <button class="rButton">2.5</button>
                <button class="rButton">3</button>

                <input id="currentR" placeholder="currentR" type="number" value="0">
            </div>

            <div class="card yValues">
                <h2 class="cardLog">Enter Y</h2>
                <input id="y" max="3" min="-3" type="number" value="0">
            </div>
        </div>
        <button id="submitForm" onclick="submitFunc()" type="button">Submit</button>

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

            </table>
        </div>
    </form>


    <div>
        <div class="svg plane">
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
                <text class="xCoorText" x="246" y="132">R</text>
                <text class="xCoorText" x="192" y="132">R/2</text>
                <text class="xCoorText" x="83" y="132">-R/2</text>
                <text class="xCoorText" x="30" y="132">-R</text>

                <text class="yCoorText" x="156" y="194">-R/2</text>
                <text class="yCoorText" x="156" y="248">-R</text>
                <text class="yCoorText" x="156" y="86">R/2</text>
                <text class="yCoorText" x="156" y="34">R</text>
                <text class="yCoorText" x="156" y="10">y</text>

                <!-- polygons -->
                <polygon fill="blue" fill-opacity="0.2" points="140,140 140,33 194,33 194,140"></polygon>
                <!-- rectangle -->
                <polygon fill="blue" fill-opacity="0.2" points="140,140 247,140 140,247"></polygon> <!-- triangle -->

                <!-- the curve -->
                <path
                    d="
                        M 86 140
                        S 88 88 140 86
                        L 140 140 L 86 140
                    "
                    fill="blue"
                    fill-opacity="0.2"
                />
            </svg>

        </div>


    </div>

    <!-- add table for result here -->

    <footer>
        <div class="footer"><h1>--пока--</h1></div>
    </footer>
    <script defer src='main.js'></script>
</body>
</html>