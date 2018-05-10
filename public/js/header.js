function Header(){
	function bindEvent(){
		$('.sua_header').click(function(event) {
			/* Act on the event */
			var params = {
				id: $('.id').val(),
				fb: $('.fb').val(),
				mail: $('.mail').val(),
				sdt: $('.sdt').val(),
				time: $('.time').val()
			}

			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/header",
				type: "PUT",
				data: params,
				dataType:"json",
				success: function(res){
					if(res && res.status_code == 200){
						location.reload();
					}
				}
			});

		});
	}

	bindEvent();

}

$(document).ready(function() {
	new Header();
});