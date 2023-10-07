document.getElementById("canvas").onclick = (ev) => {
    let form = document.getElementById("form");
    let r = form.elements.r;
    if(!checkR()) return;
    let rect = document.getElementById("canvas").getBoundingClientRect();
    let x = (ev.clientX-rect.left-150)/100*r.value;
    let y = (150-ev.clientY+rect.top)/100*r.value;
    form.elements.x.value = Math.round(x);
    form.elements.y.value = y;
    if(checkX() && checkY() && checkR())
        form.submit();
}