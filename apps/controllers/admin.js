var express = require('express')
var multer = require('multer')
var ejs = require('ejs')
var path = require('path')
var config = require('config')

//Init router
var router = express.Router()

//Khai bao bien
var helper = require("../helpers/helper")
var admin_md = require("../models/admin")
var user_md = require("../models/user")
var monan_md= require("../models/monan")
var header_md= require("../models/header")
var slides_md= require("../models/slides")



//Set Storage Engine
const storage = multer.diskStorage({
	destination: './public/images/',
	filename: (req,file,cb)=>{
		cb(null,file.fieldname + '-' + Date.now() + path.extname(file.originalname))
	}
})

//Init Upload
const upload = multer({
	storage: storage,
	limits:{fileSize: 100000000},
	fileFilter:(req,file,cb)=>{
		checkFileType(file, cb)
	}
}).single('myImage')

//Check File Type
function checkFileType(file, cb){
	// Allowes ext
	const filetypes = /jpeg|jpg|png|gif/
	//Check ext
	const extname = filetypes.test(path.extname(file.originalname).toLowerCase())
	//Check mime
	const mimetype = filetypes.test(file.mimetype)

	if(mimetype && extname){
		return cb(null,true)
	}else{
		cb('Error: Images Only')
	}
}


//--------------------------------------Đăng nhập, Đăng ký ADMIN------------------------------------------//
router.get("/admin_signup",(req,res)=>{
	
	res.render("admin_signup",{data:{}})
})

router.post("/admin_signup",(req,res)=>{
	var user = req.body
	
	if(user.email.trim().length==0){
		res.render("admin_signup",{data:{error:"Email is required"}})
	}

	else if(user.passwd != user.repasswd && user.passwd.trim().length != 0){
		res.render("admin_signup",{data:{error:"Password not match"}})	
	}
	else{
		if(user.isadmin != config.get("pass_admin")){
			res.render("admin_signup",{data:{error:"Code not match"}})	
		}else{
			//Insert to DB
			var password = helper.hash_password(user.passwd)
			user={
				email: user.email,
				password: password,
				first_name: user.firstname,
				last_name: user.lastname,
				isadmin: "admin"
			}

			//su dung ham trong model admin_md.addAdmin(admin)

			var result = admin_md.addAdmin(user)                      
			result.then(function(data){
			res.redirect("/admin/admin_signin")       
			}).catch(function(err){
			res.render("admin_signup",{data: {error: err}})
			});
		}

		
    }
	
})


router.get("/admin_signin",(req,res)=>{
	
	res.render("admin_signin",{data:{}})
})

router.post("/admin_signin",(req,res)=>{
	var param = req.body
	if(param.email.trim().length == 0){
		res.render("admin_signin",{data:{error:"Please enter an email"}})
	}else{
		var data =  admin_md.getAdminByEmail(param.email)
		if(data){
			data.then((users)=>{
				var user = users[0]
				// var pass = param.password
				var status = helper.compare_password(param.password, user.password)
				if(!status){
					res.render("admin_signin",{data:{error:"Password wrong"}})
				}else{
					req.session.admin = user
					res.redirect("/") 
				}
			})
		}else{
			res.render("admin_signin",{data:{error:"User not exists"}})
		}
	}

})



//--------------------------------------Đăng nhập, Đăng ký USER------------------------------------------//
router.get("/signup",(req,res)=>{
	
	res.render("signup",{data:{}})
})

router.post("/signup",(req,res)=>{
	var user = req.body
	
	if(user.email.trim().length==0){
		res.render("signup",{data:{error:"Email is required"}})
	}

	else if(user.passwd != user.repasswd && user.passwd.trim().length != 0){
		res.render("signup",{data:{error:"Password not match"}})	
	}
	else{	
		//Insert to DB
		var password = helper.hash_password(user.passwd)
		user={
			email: user.email,
			password: password,
			first_name: user.firstname,
			last_name: user.lastname
		}

		//su dung ham trong model user_md.addUser(user)

		var result = user_md.addUser(user)                      
		result.then(function(data){
		res.redirect("/admin/signin")       
		}).catch(function(err){
		res.render("signup",{data: {error: err}})
		});		
    }
	
})


router.get("/signin",(req,res)=>{
	
	res.render("signin",{data:{}})
})

router.post("/signin",(req,res)=>{
	var param = req.body
	if(param.email.trim().length == 0){
		res.render("signin",{data:{error:"Please enter an email"}})
	}else{
		var data =  user_md.getUserByEmail(param.email)
		if(data){
			data.then((users)=>{
				var user = users[0]
				// var pass = param.password
				var status = helper.compare_password(param.password, user.password)
				if(!status){
					res.render("signin",{data:{error:"Password wrong"}})
				}else{
					req.session.user = user
					res.redirect("/") 
				}
			})
		}else{
			res.render("signin",{data:{error:"User not exists"}})
		}
	}

})

router.get("/code",(req,res)=>{
	res.render("admin/xuly/admin_code")
})



//----------------------------------------------Users----------------------------------------------//

// const Check = ""
// function KiemTraDangNhap(){
// 	if(Check === "ledinhphu"){
// 		return true
// 	}
// 	return false
// }

// router.post("/code",(req,res)=>{
// 	var param = req.body
// 	Check = param.pass
// })

router.get("/users",(req,res)=>{
	if(req.session.admin){
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

		var data = user_md.getAllUser()
		data.then((user)=>{
			var data={
				user: user,
				error:false
			}
			res.render("admin/xuly/users",{data:data, header:header1})
		}).catch((err)=>{
			var data = {error:"Could not get Users"}
			res.render("admin/xuly/users",{data:data,header:header1})
		})
	}else{
		res.redirect("/admin/admin_signin")
	}
		
})



//-----------------------------------------------Mon An--------------------------------------------//
router.get("/",(req,res)=>{
	if(req.session.admin){
		//Header
		var header = header_md.getHeaderById(1)
		header.then((posts)=>{
				var post = posts[0]
				var header = {
					post: post,
					error:false
				}
				// res.render("admin/xuly/header",{data:data, header:data})
				res.render("admin/admin",{data:{error:false}, header:header})
		})
	}else{
		res.redirect("/admin/admin_signin")
	}
	

})

router.get("/monan",(req,res)=>{
	if(req.session.admin){
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

		var data = monan_md.getAllMonAn()

		data.then((cacmonan)=>{
			var data = {
				cacmonan: cacmonan,
				error: false
			}
			res.render("admin/xuly/monan",{data: data, header:header1})
		}).catch((err)=>{
			res.render("admin/xuly/monan",{data:{error:"Get Post data is error"},header:header1})
		})
	}else{
		res.redirect("/admin/admin_signin")
	}
	
})



router.get("/monan/themmonan",(req,res)=>{
	if(req.session.admin){
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
		res.render("admin/xuly/themmonan.ejs",
			{
				data:{error:false},
				header:header1,
				anhmonan:"",
				msg:""
		})
	}else{
		res.redirect("/admin/admin_signin")
	}	
	
})



router.post("/monan/themmonan",(req,res)=>{
		params = req.body

		if(params.ten.trim().length == 0){
			var data={
				error:"Tên món ăn không được trống"
			}
			res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
		}else if(params.nguyenlieu.trim().length == 0){
			var data={
				error:"Nguyên liệu món ăn không được trống"
			}
			res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
		}else if(params.gia.trim().length == 0){
			var data={
				error:"Giá tiền món ăn không được trống"
			}
			res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
		}else if(params.hinhanh.trim().length == 0){
			var data={
				error:"Bạn cần thêm ảnh cho món ăn"
			}
			res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
		}else if(params.gioithieu.trim().length == 0){
			var data={
				error:"Bạn cần thêm mô tả cho món ăn"
			}
			res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
		}else if(params.bua.trim().length == 0){
			var data={
				error:"Bạn cần thêm loại cho món ăn"
			}
			res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
		}
		else{
			params={
				ten: params.ten,
				gia: params.gia,
				nguyenlieu: params.nguyenlieu,
				hinhanh:params.hinhanh,
				gioithieu:params.gioithieu,
				bua:params.bua
			}

			var data = monan_md.themMonAn(params);
			data.then((result)=>{
				res.redirect("/admin/monan")
			}).catch((err)=>{
				var data={
					error:"Could not insert MonAn"
				}
				res.render("admin/xuly/themmonan",{data:data, anhmonan:"", msg:""})
			})
		}
})

router.post("/monan/themmonan/themanh",(req,res)=>{	
			upload(req,res,(err)=>{
			if(err){
				res.render('admin/xuly/themmonan',{
					data:{error:false},
					anhmonan:"",
					msg:err
		
				})
			}else{
				if(req.file == undefined){
					res.render('admin/xuly/themmonan',{
						data:{error:false},
						anhmonan:"",
						msg:'ERROR: No File Selected'
				
					})
				}else{
					//Them Anh vao DB

					console.log(req.file)
					console.log(req.file.path)
					res.render('admin/xuly/themmonan',{
						anhmonan:`/static/images/${req.file.filename}`,

						data:{error:false},
						msg:'File Uploaded',
						file:`/static/images/${req.file.filename}`
					})
				}
			}
		})
})



router.get("/monan/suamonan/:id",(req,res)=>{  
	if(req.session.admin){
		var params = req.params
		var id = params.id

		var data = monan_md.getMonAnById(id)
		
		if(data){
			data.then((posts)=>{
				var post = posts[0]
				var data = {
					post: post,
					error:false
				}

				res.render("admin/xuly/suamonan",{data:data})
			}).catch((err)=>{
				var data = {error:"Could not get Mon An by ID"}
				res.render("admin/xuly/suamonan",{data:data})
			})
		}else{
			var data = {error:"Could not get Mon An by ID"}
			res.render("admin/xuly/suamonan",{data:data})
		}
	}else{
		res.redirect("/admin/admin_signin")
	}
	
})

router.put("/monan/suamonan",(req,res)=>{

	var params = req.body

	data = monan_md.updateMonAn(params)

	if(!data){
		res.json({status_code: 500})
	}else{
		data.then((result)=>{
			res.json({status_code:200})
		}).catch(function(err){
			res.json({status_code:500})
		})
	}
})

router.get("/monan/taianh/:id",(req,res)=>{
	if(req.session.admin){
		var params = req.params
		var id = params.id
		res.render("admin/xuly/taianh",{id:id, msg:""})
	}else{
		res.redirect("/admin/admin_signin")
	}
})

router.post("/monan/taianh/:id",(req,res)=>{
	var params = req.params
	var id = params.id
	upload(req,res,(err)=>{
		if(err){
			res.render(`admin/xuly/taianh`,{
				id:id,
				anhmonan:"",
				msg:err
			})
		}else{
			if(req.file == undefined){
				res.render(`admin/xuly/taianh`,{
					id:id,
					anhmonan:"",
					msg:'ERROR: No File Selected'
				})
			}else{
				//Them Anh vao DB
				// console.log(id)	
				// console.log(req.file)
				// console.log(req.file.path)

				var data = monan_md.taiAnhMonAn(id, `/static/images/${req.file.filename}`)
				data.then((result)=>{
					res.redirect("/admin/monan")
				}).catch((err)=>{
					res.render(`admin/xuly/taianh`,{
						id:id,
						anhmonan:`/static/images/${req.file.filename}`,
						msg:'File Uploaded',
						file:`/static/images/${req.file.filename}`
					})
				})	
			}
		}
	})
})



router.delete("/monan/delete",(req,res)=>{
	var monan_id = req.body.id
	var data = monan_md.deleteMonAn(monan_id)

	if(!data){
		res.json({status_code: 500})
	}else{
		data.then((result)=>{
			res.json({status_code:200})
		}).catch(function(err){
			res.json({status_code:500})
		})
	}
})


//--------------------------------------------Header-----------------------------------------------------
router.get("/header/:id",(req,res)=>{
	if(req.session.admin){
		var params = req.params
		var id = params.id

		var data = header_md.getHeaderById(id)

		if(data){
			data.then((posts)=>{
				var post = posts[0]
				var data = {
					post: post,
					error:false
				}

				res.render("admin/xuly/header",{data:data, header:data})
			}).catch((err)=>{
				var data = {error:"Could not get Header by ID"}
				res.render("admin/xuly/header",{data:data, header:data})
				res.render("admin/layout/nav",{data:data, header:data})
			})
		}else{
			var data = {error:"Could not get Header by ID"}
			res.render("admin/xuly/header",{data:data, header:data})
		}
	}else{
		res.redirect("/admin/admin_signin")
	}
	
})


router.put("/header",(req,res)=>{
	var params = req.body
	data = header_md.updateHeader(params)

	if(!data){
		res.json({status_code: 500})
	}else{
		data.then((result)=>{
			res.json({status_code:200})
		}).catch(function(err){
			res.json({status_code:500})
		})
	}
})

//--------------------------SLIDES----------------------------------

router.get("/slides",(req,res)=>{
	if(req.session.admin){
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
		var data = slides_md.getAllSlide()
		data.then((slides)=>{
			var data = {
				slides: slides,
				error: false
			}
			res.render("admin/xuly/slides",{data: data, header:header1})
		}).catch((err)=>{
			res.render("admin/xuly/slides",{data:{error:"Get Post data is error"},header:header1})
		})
	}else{
		res.redirect("/admin/admin_signin")
	}
	
})

router.get("/slides/suaslides/:id",(req,res)=>{
	if(req.session.admin){
		var params = req.params
		var id = params.id

		var data = slides_md.getSlidesById(id)

		if(data){
			data.then((posts)=>{
				var post = posts[0]
				var data = {
					post: post,
					error:false
				}

				res.render("admin/xuly/suaslides",{data:data})
			}).catch((err)=>{
				var data = {error:"Could not get slide by ID"}
				res.render("admin/xuly/suaslides",{data:data})
			})
		}else{
			var data = {error:"Could not get slide by ID"}
			res.render("admin/xuly/suaslides",{data:data})
		}
	}else{
		res.redirect("/admin/admin_signin")
	}
})

router.put("/slides/suaslides",(req,res)=>{
	var params = req.body

	data = slides_md.updateSlide(params)

	if(!data){
		res.json({status_code: 500})
	}else{
		data.then((result)=>{
			res.json({status_code:200})
		}).catch(function(err){
			res.json({status_code:500})
		})
	}
})

router.get("/slides/themslides",(req,res)=>{
	if(req.sess.admin){
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
		res.render("admin/xuly/themslides.ejs",
		{
				data:{error:false},
				header:header1,
				anhslides:"",
				msg:""
		})

	}else{
		res.redirect("/admin/admin_signin")
	}
	
})



router.post("/slides/themslides",(req,res)=>{
	
	params = req.body	
	if(params.title.trim().length == 0){
		var data={
			error:"Tiêu đề không được trống"
		}
		res.render("admin/xuly/themslides",{data:data, anhslides:"", msg:""})
	}else if(params.content.trim().length == 0){
		var data={
			error:"Nội dung không được trống"
		}
		res.render("admin/xuly/themslides",{data:data, anhslides:"", msg:""})
	}else if(params.button_content.trim().length == 0){
		var data={
			error:"Nội dung món ăn không được trống"
		}
		res.render("admin/xuly/themslides",{data:data, anhslides:"", msg:""})
	}else if(params.image.trim().length == 0){
		var data={
			error:"Bạn cần thêm ảnh cho món ăn"
		}
		res.render("admin/xuly/themslides",{data:data, anhslides:"", msg:""})
	}
	else{
		params={
			title: params.title,
			content: params.content,
			button_content: params.button_content,
			image:params.image
		}

		var data = slides_md.themSlides(params);
		data.then((result)=>{
			res.redirect("/admin/slides")
		}).catch((err)=>{
			var data={
				error:"Could not insert Slide"
			}
			res.render("admin/xuly/themslides",{data:data, anhslides:"", msg:""})
		})
	}

})

router.post("/slides/themslides/themanh",(req,res)=>{

	upload(req,res,(err)=>{
		if(err){
			res.render('admin/xuly/themslides',{
				data:{error:false},
				anhslides:"",
				msg:err
	
			})
		}else{
			if(req.file == undefined){
				res.render('admin/xuly/themslides',{
					data:{error:false},
					anhslides:"",
					msg:'ERROR: No File Selected'
			
				})
			}else{
				//Them Anh vao DB

				console.log(req.file)
				console.log(req.file.path)
				res.render('admin/xuly/themslides',{
					anhslides:`/static/images/${req.file.filename}`,
					data:{error:false},
					msg:'File Uploaded',
					file:`/static/images/${req.file.filename}`
				})
			}
		}
	})
})

router.delete("/slides/delete",(req,res)=>{
	var slides_id = req.body.id
	var data = slides_md.deleteSlide(slides_id)

	if(!data){
		res.json({status_code: 500})
	}else{
		data.then((result)=>{
			res.json({status_code:200})
		}).catch(function(err){
			res.json({status_code:500})
		})
	}
})

router.get("/slides/taianh/:id",(req,res)=>{
	if(req.session.admin){
		var params = req.params
		var id = params.id
		res.render("admin/xuly/taianh1",{id:id, msg:""})
	}else{
		res.redirect("/admin/admin_signin")
	}
	
})

router.post("/slides/taianh/:id",(req,res)=>{
	var params = req.params
	var id = params.id
	upload(req,res,(err)=>{
		if(err){
			res.render(`admin/xuly/taianh1`,{
				id:id,
				anhmonan:"",
				msg:err
			})
		}else{
			if(req.file == undefined){
				res.render(`admin/xuly/taianh1`,{
					id:id,
					anhmonan:"",
					msg:'ERROR: No File Selected'
				})
			}else{
				//Them Anh vao DB
				// console.log(id)
				// console.log(req.file)
				// console.log(req.file.path)

				var data = slides_md.taiAnhSlides(id, `/static/images/${req.file.filename}`)
				data.then((result)=>{
					res.redirect("/admin/slides")
				}).catch((err)=>{
					res.render(`admin/xuly/taianh1`,{
						id:id,
						anhmonan:`/static/images/${req.file.filename}`,
						msg:'File Uploaded',
						file:`/static/images/${req.file.filename}`
					})
				})	
			}
		}
	})
})


module.exports=router