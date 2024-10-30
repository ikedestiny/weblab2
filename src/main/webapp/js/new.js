const url = "/controller-servlet";
let xArray = document.querySelectorAll("input[type=checkbox]:checked");
const y = document.querySelector('#y');
const r = document.querySelector('#currentR');
const rSetters = document.querySelectorAll('.rButton')
const path = document.querySelector("#curve")
const rectangle = document.querySelector("#rectangle")
const triangle = document.querySelector('#triangle')
const submitButon = document.querySelector('#submitForm')
const svg = document.querySelector('.svg-graph');

console.log(rectangle.getAttribute("points"))
console.log(getCurrentTime())

r.value = 4
resizePolygons()

r.addEventListener('change',($event)=>{
    resizePolygons()
    xArray = document.querySelectorAll("input[type=checkbox]:checked");

})


async function submitFunc(){
    xArray = document.querySelectorAll("input[type=checkbox]:checked");
    xArray.forEach(curX=>{submitReq(curX.id,y.value,r.value);})
    window.location.href =window.location.href+'/added.jsp' ;
}

async function submitReq(x,y,r){
    try {

        let res = await fetch("/webLab2-1.0/controller-servlet",{
            method: "POST",
            headers: {'Content-Type': 'application/json;charset=utf-8'},
            body:JSON.stringify({
                x:x,
                y: y,
                r: r,
                sent: getCurrentTime()
            })
        })

        let answer = await res.text()
        console.log(answer);

    }catch (err){
        console.log(err)
    }
}

function resizePolygons(){

    //originally R = 5 but quickly changed to 4
    if(r.value>4){r.value = 4}
    if(r.value<1){r.value = 1}
    let scale = 5/r.value
    //all calculations are done relative to the center 140,140
    rectangle.setAttribute('points',`${280},${280} ${280},${280+(196/scale)} ${280-(98/scale)},${280+(196/scale)} ${280-(98/scale)},${280}`)
    //when r = 5   280,280 280,476 182,476 182,280
    triangle.setAttribute('points',`${280},${280} ${280 +(98/scale)},${280} ${280},${280 +(196/scale)}`)
    //280,280 378,280 280,476
    path.setAttribute('d',` M ${280+(196/scale)} 280
                        S ${280+(196/scale)} ${280-(196/scale)} 280 ${280-(196/scale)}
                        L 280 280 L ${280-(98/scale)} 280`)

}

function getCurrentTime(){
    const now = new Date();

    // Format the current time as a string
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');
    // const miliseconds = now.getMiliseconds().toString().padStart(5,'00000')

    // Construct the time string
    const currentTime = `${hours}:${minutes}:${seconds}`;
    // const currentTime = now.toISOString()

    return currentTime;
}

async function sendClearRequest(){
    localStorage.removeItem("points");
    try{
        let response = await fetch("/webLab2-1.0/controller-servlet",{
            method: "GET",
            headers: {'Content-Type': 'application/json;charset=utf-8'}
        });

        let answer = await response.text();
        console.log(answer);
        window.location.href =window.location.href+'/clear.jsp' ;
    }catch (err){
        console.log(err);
    }


}


//svg.addEventListener("click", function(event) {
//    // Get the bounding box and calculate click coordinates relative to the SVG origin
//    const rect = svg.getBoundingClientRect();
//    const xClick = event.clientX - rect.left;
//    const yClick = event.clientY - rect.top;
//
//    // Map SVG coordinates (pixel space) to graph coordinates (-5 to 5)
//    const xCoord = ((xClick - 280) / 39.2).toFixed(2);  // scale: 39.2px per unit
//    const yCoord = ((280 - yClick) / 39.2).toFixed(2);
//    let circle = document.createElement('circle');
//    circle.r = 5;
//    circle.cx = xClick;
//    circle.cy = yClick;
//    circle.fill = "red";
//    svg.appendChild(circle)
//
//   console.log( (`x: ${xCoord}, y: ${yCoord}`));
//    console.log( (`x: ${xClick}, y: ${yClick}`));
//
//});

//svg.addEventListener("click", function(event) {
//    // Get the bounding box and calculate click coordinates relative to the SVG origin
//    const rect = svg.getBoundingClientRect();
//    const xClick = event.clientX - rect.left;
//    const yClick = event.clientY - rect.top;
//
//    // Map SVG coordinates (pixel space) to graph coordinates (-5 to 5)
//    const xCoord = ((xClick - 280) / 39.2).toFixed(2);  // scale: 39.2px per unit
//    const yCoord = ((280 - yClick) / 39.2).toFixed(2);
//
//    // Create the circle element
//    let circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
//    circle.setAttribute("r", 5);
//    circle.setAttribute("cx", xClick);
//    circle.setAttribute("cy", yClick);
//    circle.setAttribute("fill", "red");
//
//    // Append the circle to the SVG
//    svg.appendChild(circle);
//    submitReq(xCoord,yCoord,r.value);
//   // window.location.href =window.location.href+'/added.jsp' ;
//    // Logging coordinates
//    console.log(`x: ${xCoord}, y: ${yCoord}`);
//    console.log(`x: ${xClick}, y: ${yClick}`);
//});


// Retrieve saved points from localStorage and render them
document.addEventListener("DOMContentLoaded", function() {
    const savedPoints = JSON.parse(localStorage.getItem("points")) || [];
    savedPoints.forEach(point => {
        let circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
        circle.setAttribute("r", 5);
        circle.setAttribute("cx", point.xClick);
        circle.setAttribute("cy", point.yClick);
        circle.setAttribute("fill", "red");
        svg.appendChild(circle);
    });
});

svg.addEventListener("click", function(event) {
    // Get the bounding box and calculate click coordinates relative to the SVG origin
    const rect = svg.getBoundingClientRect();
    const xClick = event.clientX - rect.left;
    const yClick = event.clientY - rect.top;

    // Map SVG coordinates (pixel space) to graph coordinates (-5 to 5)
    const xCoord = ((xClick - 280) / 39.2).toFixed(2);  // scale: 39.2px per unit
    const yCoord = ((280 - yClick) / 39.2).toFixed(2);



    // Optional: send the coordinates to the server
   // submitReq(xCoord, yCoord, r.value);
    fetch("/webLab2-1.0/controller-servlet",{
        method: "POST",
        headers: {'Content-Type': 'application/json;charset=utf-8'},
        body:JSON.stringify({
            x:xCoord,
            y: yCoord,
            r: r.value,
            sent: getCurrentTime()
        })
    })
    .then(response=>{
        if(response.ok){
            // Create the circle element
            let circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
            circle.setAttribute("r", 5);
            circle.setAttribute("cx", xClick);
            circle.setAttribute("cy", yClick);
            circle.setAttribute("fill", "red");

            // Append the circle to the SVG
            svg.appendChild(circle);

            // Save the coordinates to localStorage
            const savedPoints = JSON.parse(localStorage.getItem("points")) || [];
            savedPoints.push({ xClick, yClick });
            localStorage.setItem("points", JSON.stringify(savedPoints));
            window.location.href =window.location.href+'/added.jsp' ;
        }else{
            console.log("response not ok")
            alert("y or x not within allowable range check console for details")
            console.log(response)
        }
    })
    .catch(err=>console.log(err))
    // Logging coordinates
    console.log(`x: ${xCoord}, y: ${yCoord}`);
    console.log(`x: ${xClick}, y: ${yClick}`);
});
