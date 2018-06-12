var express = require('express')
var config = require('config')
var helper = require("../helpers/helper")
var router = express.Router()

router.use("/admin", require(__dirname+"/admin.js"))
router.use("/nhahang", require(__dirname+"/nhahang.js"))

//Khai bao bien
var user_md = require("../models/user")
var monan_md= require("../models/monan")
var header_md= require("../models/header")
var slides_md= require("../models/slides")
var menuTC_md= require("../models/menuTrangChu")
var phantrang_md = require("../models/phantrang")
var chinhanh_md = require("../models/chinhanh")
var comment_md = require("../models/comment")



//------------------------------------------------HOME-----------------------------------------------//
router.get("/",(req,res)=>{
	//Header
	var header = header_md.getHeaderById(1)
	var header1=""
	header.then((posts)=>{
			var post = posts[0]
			header1 = {
				post: post,
				error:false
			}
	})

	//Slide
	var slides = slides_md.getAllSlide()
	var slides1=""
	slides.then((slides)=>{
		slides1 = {
			slides: slides,
			error: false
		}
	})


	//Chi nhanh
	var chinhanh = chinhanh_md.getAllChiNhanh()
	var chinhanh1 =""
	chinhanh.then((cn)=>{
			chinhanh1 = {
				post: cn,
				error:false
			}
	})

	//Menu Trang Chủ
	var menuTC = menuTC_md.getAllMenuTC()
	var menuTC1 =""
	menuTC.then((posts)=>{
		var post = posts[0]
			menuTC1 = {
				post: post,
				error:false
			}
	})

	var data = monan_md.getAllMonAn()

	data.then((cacmonan)=>{
		var data = {
			cacmonan: cacmonan,
			error: false
		}
		if(helper.get_TEMP() === 0){
			console.log(helper.get_TEMP())
			res.render("nhahang/trangchu",{data: data, header:header1, slides:slides1, menuTC:menuTC1, chinhanh: chinhanh1})

		}
		if(helper.get_TEMP() === 1){
			console.log(helper.get_TEMP())
			res.render("nhahang/trangchu2",{data: data, header:header1, slides:slides1, menuTC:menuTC1, chinhanh: chinhanh1})
		}
		
	}).catch((err)=>{
		res.render("nhahang/trangchu",{data:{error:"Get Post data is error"},header:header1, slides:slides1,menuTC:menuTC1, chinhanh: chinhanh1})
	})
})


router.get("/monan/:id",(req,res)=>{
	var params = req.params
	var id = params.id

	//Header
	var header = header_md.getHeaderById(1)
	var header1=""
	header.then((posts)=>{
			var post = posts[0]
			header1 = {
				post: post,
				error:false
			}
	})

	var data = monan_md.getMonAnById(id)
	if(data){
		data.then((posts)=>{
			var post = posts[0]
			var data = {
				post: post,
				error:false
			}

			res.render("nhahang/motmonan",{data:data,header:header1})
		}).catch((err)=>{
			var data = {error:"Could not get monan by ID"}
			res.render("nhahang/motmonan",{data:data,header:header1})
		})
	}else{
		var data = {error:"Could not get monan by ID"}
		res.render("nhahang/motmonan",{data:data,header:header1})
	}
})

router.put("/monan/cmt/:id",(req,res)=>{
	// var params = req.body
	var a=[], b=[]
	var id = req.params.id
	// var a1 = req.body.ten
	// var b1 = req.body.noidung
	// console.log(a1 + "+" +b1+ "+" +id)
	data= comment_md.getCommentById(id)
	// console.log("OK")
	data.then((d)=>{
		//json-->arr
		var nd = JSON.parse(d[0].noidungcmt)
		for(var i = 0; i<nd.length; i++){
			a.push(nd[i].name)
			b.push(nd[i].noidung)
		}
		var a1 = req.body.ten
		var b1 = req.body.noidung

		var obj = {
			"name": a1,
			"noidung":b1
		}

		nd.push(obj)
		var myJson = JSON.stringify(nd)
		var param1 = {
			idcmt: d[0].idcmt,
			noidungcmt: myJson
		}

		data1 = comment_md.updateComment(param1)
		data1.then((d1)=>{
			console.log("OK")
		})
	}).catch((e)=>{
		console.log("err")
	})

})

// router.post("/monan/cmt/:id",(req,res)=>{

// 	var params = req.body
// 	var a=[], b=[]
// 	var id = req.params.id
// 	data= comment_md.getCommentById(id)
// 	if(data){
// 		data.then((d)=>{
// 			var nd = JSON.parse(d[0].noidungcmt)
// 			for(var i = 0; i<nd.length; i++){
// 				a.push(nd[i].name)
// 				b.push(nd[i].noidung)
// 			}
// 			var a1 = "Quy", b1="456789"
			
// 			var obj = {
// 				"name": a1,
// 				"noidung":b1
// 			}

// 			nd.push(obj)
// 			var myJson = JSON.stringify(nd)
// 			var param1 = {
// 				idcmt: d[0].idcmt,
// 				noidungcmt: myJson
// 			}
// 			data1 = comment_md.updateComment(param1)
// 			data1.then((d1)=>{
// 				console.log("OK")
// 			})
// 		}).catch((e)=>{
// 			console.log(e)
// 		})
// 	}
	

	// if(!data){
	// 	res.json({status_code: 500})
	// }else{
	// 	data.then((result)=>{
	// 		console.log(result+"0K")
	// 		res.json({status_code:200})
	// 	}).catch(function(err){
	// 		res.json({status_code:500})
	// 	})
	// }
// })

//------------------------------------------------MENU-----------------------------------------------//
var limit = 6
var page=""
router.get("/menu",(req,res)=>{
	var total_record=""
   	var result = phantrang_md.getRecord()
   	result.then((data)=>{
   		total_record = data.length
   		page = Math.ceil(total_record/limit)
   		var result1 = phantrang_md.getProduct(0, 6)
   		result1.then((data1)=>{
			res.render('nhahang/menu',{data:data1,page:page})
		}).catch(()=>{
			res.send("Loi")
		})
   		// res.render('nhahang/menu',{data:data, page:page})
   	}).catch(()=>{
   		total_record = -1
   	})
	
})

router.get("/menu/:id",(req,res)=>{
	var params = req.params
	var id = params.id
	var start = (id-1)*limit
	var result = phantrang_md.getProduct(start, limit)

		result.then((data)=>{
			res.render('nhahang/menu',{data:data,page:page})
		}).catch(()=>{
			res.send("Loi")
		})
})

router.post("/menu/:id",(req,res)=>{
	var params = req.params
	var id = params.id
	var start = (id-1)*limit
	var result = phantrang_md.getProduct(start, limit)

		result.then((data)=>{
			res.render('nhahang/menu',{data:data,page:page})
		}).catch(()=>{
			res.send("Loi")
		})
})

//=============================MAP=====================================//
router.get("/map/:id",(req,res)=>{
	//Header
	var header = header_md.getHeaderById(1)
	var header1=""
	header.then((posts)=>{
			var post = posts[0]
			header1 = {
				post: post,
				error:false
			}
	
	})

	//Chi nhanh
	var chinhanh = chinhanh_md.getAllChiNhanh()
	var chinhanh1 =""
	chinhanh.then((cn)=>{
			chinhanh1 = {
				post: cn,
				error:false
			}
	 res.render("nhahang/map",{chinhanh: chinhanh1, header:header1})
	})

	
	
})


//--------------------------------------PROFILE------------------------------------
router.get("/profile", (req,res)=>{
	var id = helper.get_ID()
	res.render('nhahang/profile')
		
})



module.exports = router