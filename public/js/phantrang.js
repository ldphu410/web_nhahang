var page = document.getElementById("sopage");
var page1= page.getAttribute('value')





$.ajax({
	url: "localhost:3000"+"/menu",
	type: 'post',
	dataType: 'json',
	data: {},
})
.done(function() {
	console.log("success");
})
.fail(function() {
	console.log("error");
})
.always(function() {
	console.log("complete");
});
