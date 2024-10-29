const url = "/controller-servlet";
let xArray = document.querySelectorAll("input[type=checkbox]:checked");
const y = document.querySelector('#y');
const r = document.querySelector('#currentR');
const rSetters = document.querySelectorAll('.rButton') 
const path = document.querySelector("#curve")
const rectangle = document.querySelector("#rectangle")
const triangle = document.querySelector('#triangle')
const submitButon = document.querySelector('#submitForm')

console.log(rectangle.getAttribute("points"))
console.log(getCurrentTime())


    r.addEventListener('change',($event)=>{
        resizePolygons()
        xArray = document.querySelectorAll("input[type=checkbox]:checked");
       
    })


    submitButon.addEventListener('click',($event)=>{
        xArray = document.querySelectorAll("input[type=checkbox]:checked");
        xArray.forEach(curX=>{
            fetch("/webLab2-1.0/controller-servlet",{
                method: "POST",
                headers: {'Content-Type': 'application/json;charset=utf-8'},
                body:JSON.stringify({
                    x:curX.id,
                    y: y.value,
                    r: r.value,
                    sent: getCurrentTime()
                })

            })
            .then(response => response.text())
            .then(data=>console.log("success: ",data))
            .catch(err=>console.log(err))
        })
    })




// async function submitFunc(){
//     xArray = document.querySelectorAll("input[type=checkbox]:checked");
//     for(currX of xArray){
//         let response = await fetch({
//             url: url,
//             method: "POST",
//             headers: {'Content-Type': 'application/json;charset=utf-8'},
//             data:{
//                 x:currX,
//                 y: y.value,
//                 r: r.value
//             }
//         }
//     )

//     let data = await response.json()
//     console.log(data)
//     }

// }


function resizePolygons(){

    //originally R = 3
    if(r.value>4){r.value = 4}
    if(r.value<1){r.value = 1}
    let scale = 3/r.value
    //all calculations are done relative to the center 140,140 
    rectangle.setAttribute('points',`${140},${140} ${140},${140+(107/scale)} ${140-(54/scale)},${140+(107/scale)} ${140-(54/scale)},${140}`)
    //when r = 3 ; 140,140 140,247 86,247 86,140
    triangle.setAttribute('points',`${140},${140} ${140 +(54/scale)},${140} ${140},${140 +(107/scale)}`)
    path.setAttribute('d',` M ${140+(107/scale)} 140
                        S ${140+(107/scale)} ${140-(107/scale)} 140 ${140-(107/scale)}
                        L 140 140 L ${140-(54/scale)} 140`)


    // when r=3 M 247 140
    //S 247 33 140 33
    //L 140 140 L 86 140

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