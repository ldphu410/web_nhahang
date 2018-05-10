var express = require('express')

var router = express.Router()

router.use("/admin", require(__dirname+"/admin.js"))
router.use("/nhahang", require(__dirname+"/nhahang.js"))

//Khai bao bien
var user_md = require("../models/user")
var monan_md= require("../models/monan")
var header_md= require("../models/header")
var slides_md= require("../models/slides")

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


	var data = monan_md.getAllMonAn()

	data.then((cacmonan)=>{
		var data = {
			cacmonan: cacmonan,
			error: false
		}
		res.render("nhahang/trangchu",{data: data, header:header1, slides:slides1})
	}).catch((err)=>{
		res.render("nhahang/trangchu",{data:{error:"Get Post data is error"},header:header1, slides:slides1})
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
module.exports = router