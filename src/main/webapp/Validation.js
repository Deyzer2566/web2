let x = document.getElementById("x_buttons");
let y = document.getElementById("y");
let r = document.getElementById("r");
let errorMessage = document.getElementById("errorMessage");
let checkButton = document.getElementById("check");
for(let i = 0;i<x.children.length;i++){
    but = x.children[i];
    but.onclick = function(){
        labels = document.getElementsByTagName('label');
        document.getElementById("form").elements.x.value=x.children[i].value;
        for(let j = 0; j < labels.length; j++ ) {
            if (labels[j].htmlFor == "x_buttons")
                label = labels[j];
        }
        label.innerHTML ='Введите координату X='+document.getElementById("form").elements.x.value+":";
        document.getElementById("check").disabled = !(checkR() && checkX() && checkY());
    }
}
function checkR(){
    r.value = r.value.trim();
    if(r.value == "")
    {
        errorMessage.innerHTML = "Введите значение R";
        return false;
    }
    if(isNaN(r.value) || isNaN(parseFloat(r.value)))
    {
        errorMessage.innerHTML = "Введите в поле R число!";
        return false;
    }
    r.value = r.value.replace(',','.');
    if(r.value<1 || r.value > 4)
    {
        errorMessage.innerHTML = "Введенный R не входит в интервал [1;4]!";
        return false;
    }
    return true;
}
function checkY(){
    y.value = y.value.trim();
    if(y.value == "")
    {
        errorMessage.innerHTML = "Введите значение y";
        return false;
    }
    y.value = y.value.replace(',','.');
    if(isNaN(y.value) || isNaN(parseFloat(y.value)))
    {
        errorMessage.innerHTML = "Введите в поле y число!";
        return false;
    }
    if(y.value<-3 || y.value > 5)
    {
        errorMessage.innerHTML = "Введенный y не входит в интервал [-3;5]!";
        return false;
    }
    return true;
}
function checkX(){
    document.getElementById("form").elements.x.value = document.getElementById("form").elements.x.value.trim();
    if(document.getElementById("form").elements.x.value == "")
    {
        errorMessage.innerHTML = ("Выберите значение X");
        return false;
    }
    isXIsCorrect = false;
    for(let x = -4;x <= 4;x++)
        isXIsCorrect |= x==document.getElementById("form").elements.x.value;
    if(!isXIsCorrect)
    {
        errorMessage.innerHTML = ('Некорректное значение X');
        return false;
    }
    return true;
}
function checkFields(){
    return checkX() && checkY() && checkR();
}

document.getElementById("y").oninput = (ev) => {
    document.getElementById("check").disabled = !(checkY() && checkR() && checkX());
}

document.getElementById("r").oninput = (ev) => {
    document.getElementById("check").disabled = !(checkR() && checkX() && checkY());
    if(checkR()){
        drawAxes();
        drawPoints(points, document.getElementById("r").value)
    }
}