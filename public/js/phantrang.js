// var page = document.getElementById("sopage");
// var page1= page.getAttribute('value')





// $.ajax({
// 	url: "localhost:3000"+"/menu",
// 	type: 'post',
// 	dataType: 'json',
// 	data: {},
// })
// .done(function() {
// 	console.log("success");
// })
// .fail(function() {
// 	console.log("error");
// })
// .always(function() {
// 	console.log("complete");
// });

$(document).ready(function() {
	// var soPage = $('#sopage').val();
	// var k = ""
	// console.log(soPage)
	// for(var i = 1; i<=soPage; i++){
	// 	k = i;
	// 	// var k1 = $(`#nut${k}`).val();
	// 	// console.log(k1);
		
	// 	$(`#nut${k}`).click(function(){
	// 		var k2 = $(`#nut${k}`).val();
	// 		console.log(k2)
	// 		break
	// 	});	
	// }

	$('.pagination li').click(function(event) {
		var id = this.id;
		var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		var k={
			id : id
		}
		$.ajax({
			url: base_url+`/page/${id}`,
			type: "post",
			data: k,
			asynce:true,
			success:(data1)=>{
				$('.aa').after(kq);
				
			}
			
		});
	});
	// $(".mm").click(function(){
		
		// var base_url = location.protocol + "//" + document.domain + ":" + location.port;
	
		// $.ajax({
		// 	url: base_url+`/page`,
		// 	type: "get",
		// 	data: params,
		// 	asynce:true,
		// 	success:function(kq){
		// 		// $('ul.moc li:eq(0)').before(kq);
		// 	}
		// });

	// });
	
	
});