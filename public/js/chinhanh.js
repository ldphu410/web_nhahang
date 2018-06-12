function ChiNhanh(){
	function bindEvent(){
		$('.chinhanh_edit').click(function(event) {
			/* Act on the event */
			var params = {
				id: $('.id').val(),
				ten: $('.ten').val(),
				thongtin: tinymce.get("thongtin").getContent(),
				hinhanh: $('.hinhanh').val()
			}

			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/chinhanh/suachinhanh",
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

		$('.chinhanh_xoa').click(function(event) {
			/* Act on the event */
			var chinhanh_id = $(this).attr("chinhanh_id") ;
			
			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/chinhanh/delete",
				type: "DELETE",
				data: {id:chinhanh_id},
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
	new ChiNhanh();
});