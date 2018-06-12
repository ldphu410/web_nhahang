$(document).ready(function() {
	$('.change').click(function(){
		$('.form1').addClass('an');
		$('.form2').removeClass('an');
	})
	$('.back').click(function(){
		$('.form2').addClass('an');
		$('.form1').removeClass('an');
	})
});