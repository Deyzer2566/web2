checkButton.onclick = function(){
	if (checkFields()) {
		let form = document.getElementById("form");
		form.submit();
	}
};
function isPointInArea(x,y,r){
	if(x >= 0 && y >= 0) {
		return x * x + y * y <= r * r;
	} else if (x < 0 && y >= 0) {
		return x>= -r/2 && y <= r;
	} else if (x <= 0 && y <= 0) {
		return -x/2-r/2 <= y;
	}
	return false;
}
document.getElementById("y").value = getSavedValue("y");    // set the value to this input
document.getElementById("r").value = getSavedValue("r");   // set the value to this input
getSavedValueForX("x");    // set the value to this input
/* Here you can add more inputs to set value. if it's saved */
//Save the value function - save it to localStorage as (ID, VALUE)
function saveValue(e){
	var id = e.id;  // get the sender's id to save it .
	var val = e.value; // get the value.
	localStorage.setItem(id, val);// Every time user writing something, the localStorage's value will override .
}

function getSavedValueForX(v){
	v1 = getSavedValue(v);
	labels = document.getElementsByTagName('label');
	for(let j = 0; j < labels.length; j++ ) {
		if (labels[j].htmlFor == "x_buttons")
			label = labels[j];
	}
	document.getElementById("form").elements.x.value=v1;
	if(v1 != "")
		label.innerHTML ='Введите координату X='+v1+":";
}
//get the saved value function - return the value of "v" from localStorage.
function getSavedValue  (v){
	if (!localStorage.getItem(v)) {
		return "";// You can change this to your defualt value.
	}
	return localStorage.getItem(v);
}