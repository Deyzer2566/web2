checkButton.onclick = function(){
	if (checkFields()) {
		let form = document.getElementById("form");
		form.submit();
	}
};