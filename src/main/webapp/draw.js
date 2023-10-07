function drawAxes() {
    let context = document.getElementById("canvas").getContext('2d');
    context.clearRect(0, 0, 300, 300);
    context.fillStyle = 'rgb(51,153,255)';
    context.strokeStyle = 'rgba(0,0,0,0)';
    context.beginPath();
    context.moveTo(50, 150);
    context.lineTo(150, 150);
    context.lineTo(150, 200);
    context.fill();

    context.fillRect(150, 150, -50, -100);

    context.beginPath();
    context.moveTo(150, 150);
    context.fillStyle = 'rgb(51,153,255)';
    context.arc(150, 150, 100, 3 * Math.PI / 2, 2 * Math.PI);
    context.lineTo(150, 150);
    context.fill();

    context.beginPath();

    context.strokeStyle = 'rgba(0,0,0,1)';
    context.fillStyle = 'rgb(0,0,0)';

    context.moveTo(150, 0);
    context.lineTo(145, 10);
    context.moveTo(150, 0);
    context.lineTo(155, 10);

    context.font = "15px sans-serif";
    context.fillText('y', 160, 10);

    context.moveTo(150, 0);
    context.lineTo(150, 300);//ось y

    context.moveTo(300, 150);
    context.lineTo(290, 145);
    context.moveTo(300, 150);
    context.lineTo(290, 155);

    context.fillText('x', 290, 140);

    context.moveTo(0, 150);
    context.lineTo(300, 150);//ось x
    context.closePath();
    context.stroke();

    context.fillText("R/2", 155, 100);
    context.fillText("R/2", 190, 145);
    context.fillText("R/2", 155, 200);
    context.fillText("R/2", 90, 145);
    context.fillText("R", 240, 145);
}
function drawPoints(points, R){
    for(let i = 0;i<points.length;i++) {
        let x = points[i][0]/R*100+150;
        let y = 150 - points[i][1]/R*100;
        inArea = isPointInArea(points[i][0],points[i][1],R);
        context.beginPath();
        context.moveTo(x,y);
        context.arc(x,y,3,0,Math.PI*2);
        if(inArea)
            context.fillStyle="green";
        else
            context.fillStyle="red";
        context.fill();
    }
}