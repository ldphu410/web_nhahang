$(document).ready(function() {
	$(".addcmt").click(function(){
		var id = $('.idcmt').val();
		var noidung = $(".noidungcmt").val();
		var name = $('.namecmt').val();
		var base_url = location.protocol + "//" + document.domain + ":" + location.port;
		var params ={
			idcmt: id,
			namecmt: name,
			noidungcmt: noidung
		}
		$.ajax({
			url: base_url+`/monan/cmt/${id}`,
			type: "POST",
			data: params,
			asynce:true,
			success:function(kq){
				$('ul.moc li:eq(0)').before(kq);
			}
		});
	});
	
});