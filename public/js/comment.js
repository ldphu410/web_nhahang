

// function render(data){
// 	var html=
// 		"<div class='comentBox'>"
// 			+"<div class='leftPanelImg'><img src='http://via.placeholder.com/100x100' alt=''></div>"
// 			+"<div class='rightPanel'>"
// 			+"<span>"+data.name+"</span>"
// 			// +"<div class='date'>"+data.time+"</div>"
// 			+"<p>"+data.body+"</p>"
// 			+"</div>"
// 			+"<div class='clear'></div>"
// 			+"</div>";
// 		$(".motcmt").append(html);
// }
// $(document).ready(function() {
// 	var coment = [];
// 	if(!localStorage.comentData){
// 		localStorage.comentData = [];
// 	}else{
// 		coment = JSON.parse(localStorage.comentData);
// 	}
// 	// var coment = [
// 	// 	{"name":"Phu1", "time":"2018", "body":"this is a cmt 1"}
// 	// ];	 
// 	for(var i = 0; i< coment.length; i++){
// 		render(coment[i]);
// 	}

// 	$('#addComent').click(function(event) {
// 		/* Act on the event */
// 		var addObj = {
// 			"name":$('#nameCmt').val(),
// 			// "date":$('#date').val(),
// 			"body":$('#bodyText').val()
// 		}
// 		coment.push(addObj);
// 		localStorage.comentData = JSON.stringify(coment);
// 		render(addObj);
// 		$('#name1').val('');
// 		// $('#date').val('dd//mm/yyyy');
// 		$('#bodyText').val();
// 	});
// });




function Comment(){
	function bindEvent(){
		$('#addcmt').click(function(event) {
			/* Act on the event */
			var params = {
				ten: $('#namecmt').val(),
				noidung: $('#noidungcmt').val()
			}

			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/monan/cmt/"+$('#idcmt').val(),
				type: "put",
				dataType:"json",
				data: params
				
			})
			.done(function() {
					console.log("success");

			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
					var noidung = "<div class='comentBox'>"
					+"<div class='leftPanelImg'><img src='http://via.placeholder.com/100x100' alt=''></div>"
					+"<div class='rightPanel'>"
					+"<span>"+ $('#namecmt').val()+"</span>"
					// +"<div class='date'>"+data.time+"</div>"
					+"<p>"+$('#noidungcmt').val()+"</p>"
					+"</div>"
					+"<div class='clear'></div>"
					+"</div>";
					$(".motcmt").append(noidung);
					$('#namecmt').val('');
					$('#noidungcmt').val('');
			});

		});
	}

	bindEvent();
}


$(document).ready(function() {
	new Comment();
});


// function Comment(){
// 	function bindEvent(){
// 		$('#addcmt').click(function(event) {
// 			/* Act on the event */
// 			var params = {
// 				ten: $('#namecmt').val(),
//  				noidung: $('#noidungcmt').val(),
//  				id: $('#idcmt').val()
// 			}
// 			var idcmt1 = $('#idcmt').val();
// 			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
// 			$.ajax({
// 				url: base_url+"/monan/cmt/"+$('#idcmt').val(),
// 				type: "post",
// 				data: params,
// 				dataType:"json",
// 				success: function(res){
// 					if(res && res.status_code == 200){
// 						location.reload();
// 					}
// 				},
// 				always: function() {
// 					var noidung = "<div class='comentBox'>"
// 					+"<div class='leftPanelImg'><img src='http://via.placeholder.com/100x100' alt=''></div>"
// 					+"<div class='rightPanel'>"
// 					+"<span>"+ $('#namecmt').val()+"</span>"
// 					// +"<div class='date'>"+data.time+"</div>"
// 					+"<p>"+$('#noidungcmt').val()+"</p>"
// 					+"</div>"
// 					+"<div class='clear'></div>"
// 					+"</div>";
// 					$(".motcmt").append(noidung);
// 					$('#namecmt').val('');
// 					$('noidungcmt').val('');
// 				}

// 			});

// 		});
// 	}
// 	bindEvent();
// }


// $(document).ready(function() {
// 	new Comment();
// });