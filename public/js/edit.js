function Edit(){
	function bindEvent(){
		$('.edit').click(function(event) {
			/* Act on the event */
			var params = {
				id: $('.id').val(),
				ten: $('.ten').val(),
				gia: $('.gia').val(),
				gioithieu: $('.gioithieu').val(),
				nguyenlieu: tinymce.get("nguyenlieu").getContent(),
				bua: $('.bua').val(),
				hinhanh: $('.hinhanh').val()
			}

			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/monan/suamonan",
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

		$('.monan_xoa').click(function(event) {
			/* Act on the event */
			var monan_id = $(this).attr("monan_id") 
			
			var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		
			$.ajax({
				url: base_url+"/admin/monan/delete",
				type: "DELETE",
				data: {id:monan_id},
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
	new Edit();
});