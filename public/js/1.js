 $(function(){
 	khoimonan = $('.nhieumon').isotope({
	  itemSelector: '.motmon',
	  layoutMode: 'masonry'
	});

	khoimonan.imagesLoaded().progress( function() {
	  khoimonan.isotope('layout');
	});

	$('.tieudect a').click(function() {
		dulieu = $(this).data('monan'); 
	//	console.log(dulieu);
		khoimonan.isotope({ filter:  dulieu })
		 return false ; 
	});

	// xu ly phan responsive bang jquery . 
	// tinh ra so div ten .motmon

	//soluongmon = $('.motmon').length ;
	//docao = soluongmon* 120; 
	//console.log(docao );

	//$('.noidungct').css({'height':docao})

	// xem div .motmon co ton tai hay khong 
	 
	 new WOW().init();

	// var anhs = document.querySelectorAll('.motmon .anhmon img'),
	// 	nenden = document.querySelector('.nenden'),
	// 	dongLai = document.querySelector('.dongLai'),
	// 	thongtinanh = document.querySelector('.thongtinanh'),
	// 	khoicacanhs = document.querySelectorAll('.khoicacanh ul li');
	// 	// console.log(khoicacanhs);
		
	// 	//Đóng lại nut X
	// 	dongLai.addEventListener('click',function(){
			
	// 		nenden.classList.remove('ra');
	// 		thongtinanh.classList.remove('ra');
	// 	})

	// 	//Đóng lại nen den
	// 	nenden.addEventListener('click',function(){
			
	// 		nenden.classList.remove('ra');
	// 		thongtinanh.classList.remove('ra');

	// 	})

	// for (var i = 0; i < anhs.length; i++) {
	// 	anhs[i].addEventListener('click',function(){
	// 		nenden.classList.add('ra');
	// 		thongtinanh.classList.add('ra');
	// 		var anhduocclick=this;
	// 		console.log(anhduocclick.previousElementSibling);
	// 		for (var k = 0; anhduocclick=anhduocclick.previousElementSibling; k++) {}
	// 		khoicacanhs[k].classList.add('active');
	// 		//in ra phần tử được active
	// 		// console.log(khoicacanh[k])
	// 		// khoicacanh[k].classList.add('active');
	// 	})
	// }
 	 
})  
