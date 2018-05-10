function Slides(){
	function bindEvent(){
		$('.slide_edit').click(function(event) {
			/* Act on the event */
			var params = {
				id: $('.id').val(),
				title: $('.title').val(),
				content: tinymce.get("content").getContent(),
				button_content: $('.button_content').val(),
				image: $('.image').val()
			}

			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/slides/suaslides",
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

		
		$('.slide_xoa').click(function(event) {
			/* Act on the event */
			console.log("cc")
			var slides_id = $(this).attr("slides_id") 
			
			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/slides/delete",
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
	new Slides();
});