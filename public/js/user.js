function User(){
	function bindEvent(){
		$('.user_edit').click(function(event) {
			/* Act on the event */
			var params = {
				id: $('.id').val(),
				first_name: $('.firstname').val(),
				last_name: $('.lastname').val(),
				email: $('.email').val(),

			}

			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/user/suauser",
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

		
		$('.user_xoa').click(function(event) {
			/* Act on the event */
			var slides_id = $(this).attr("user_id") 
			
			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/user/delete",
				type: "DELETE",
				data: {id:slides_id},
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
	new User();
});