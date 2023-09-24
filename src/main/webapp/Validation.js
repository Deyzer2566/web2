let x = document.getElementById("x");
let y = document.getElementById("y");
let r = document.getElementById("r");
let checkButton = document.getElementById("check");
let selectedX = '';
for(let i = 0;i<x.children.length;i++){
    but = x.children[i];
    but.onclick = function(){
        selectedX = x.children[i].value;
        labels = document.getElementsByTagName('label');
        document.getElementById("form").elements.x.value=x.children[i].value;
        for(let j = 0; j < labels.length; j++ ) {
            if (labels[j].htmlFor == "x")
                label = labels[j];
        }
        label.innerHTML ='Введите координату X='+selectedX+":";
    }
}
function checkR(){
    if(r.value == "")
    {
        alert("Введите значение R");
        return false;
    }
    if(isNaN(parseFloat(r.value)))
    {
        alert("Введите в поле R число!");
        return false;
    }
    r.value = r.value.replace(',','.');
    if(r.value<1 || r.value > 4)
    {
        alert("Введенный R не входит в интервал [1;4]!");
        return false;
    }
    return true;
}
function checkY(){
    if(y.value == "")
    {
        alert("Введите значение y");
        return false;
    }
    y.value = y.value.replace(',','.');
    if(isNaN(parseFloat(y.value)))
    {
        alert("Введите в поле y число!");
        return false;
    }
    if(y.value<-3 || y.value > 5)
    {
        alert("Введенный y не входит в интервал [-3;5]!");
        return false;
    }
    return true;
}
function checkX(){
    if(selectedX == "")
    {
        alert("Выберите значение X");
        return false;
    }
    isXIsCorrect = false;
    for(let x = -4;x <= 4;x++)
        isXIsCorrect |= x==selectedX;
    if(!isXIsCorrect)
    {
        alert('Некорректное значение X');
        return false;
    }
    return true;
}
function checkFields(){
    return checkX() && checkY() && checkR();
}