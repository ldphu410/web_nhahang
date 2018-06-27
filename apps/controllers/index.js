var express = require('express')
var config = require('config')
var helper = require("../helpers/helper")
var router = express.Router()

router.use("/admin", require(__dirname + "/admin.js"))
router.use("/nhahang", require(__dirname + "/nhahang.js"))

//Khai bao bien
var user_md = require("../models/user")
var monan_md = require("../models/monan")
var header_md = require("../models/header")
var slides_md = require("../models/slides")
var menuTC_md = require("../models/menuTrangChu")
var phantrang_md = require("../models/phantrang")
var chinhanh_md = require("../models/chinhanh")
var comment_md = require("../models/comment")
var date_md = require("../models/book")


var limit = 9
var page = ""
//------------------------------------------------HOME-----------------------------------------------//


router.get("/", (req, res) => {
    //All Mon An
    var allMonAn = ""
    var all = monan_md.getAllMonAn()
    all.then((dt1) => {
        allMonAn = {
            cacmonan: dt1,
            error: false
        }
    })

    //Header
    var header = header_md.getHeaderById(1)
    var header1 = ""
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
        }
    })

    //Slide
    var slides = slides_md.getAllSlide()
    var slides1 = ""
    slides.then((slides) => {
        slides1 = {
            slides: slides,
            error: false
        }
    })


    //Chi nhanh
    var chinhanh = chinhanh_md.getAllChiNhanh()
    var chinhanh1 = ""
    chinhanh.then((cn) => {
        chinhanh1 = {
            post: cn,
            error: false
        }
    })

    //Menu Trang Chủ
    var menuTC = menuTC_md.getAllMenuTC()
    var menuTC1 = ""
    menuTC.then((posts) => {
        var post = posts[0]
        menuTC1 = {
            post: post,
            error: false
        }
    })


    var total_record = ""
    var result = phantrang_md.getRecord()
    result.then((data) => {
        total_record = data.length
        page = Math.ceil(total_record / limit)
        var _trang = phantrang_md.getProduct(0, 9)
        _trang.then((dt) => {
            var data1 = {
                cacmonan: dt,
                error: false
            }
            if (helper.get_TEMP() === 0) {
                 res.render("nhahang/trangchu", { data: allMonAn, _trang: data1, header: header1, slides: slides1, menuTC: menuTC1, chinhanh: chinhanh1, page: page })
            }
            if (helper.get_TEMP() === 1) {
                var iduser = helper.get_ID()
                var user = user_md.getUserById(iduser)
                user.then((dt) => {
                    res.render("nhahang/trangchu2", {
                        data: allMonAn,
                        header: header1,
                        _trang: data1,
                        slides: slides1,
                        menuTC: menuTC1,
                        chinhanh: chinhanh1,
                        page:page,
                        user: dt[0]
                    })
                })

            }
            
        })
    })
})


router.get("/page/:id", (req, res) => {


     //All Mon An
    var allMonAn = ""
    var all = monan_md.getAllMonAn()
    all.then((dt1) => {
        allMonAn = {
            cacmonan: dt1,
            error: false
        }
    })

    //Header
    var header = header_md.getHeaderById(1)
    var header1 = ""
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
        }
    })

    //Slide
    var slides = slides_md.getAllSlide()
    var slides1 = ""
    slides.then((slides) => {
        slides1 = {
            slides: slides,
            error: false
        }
    })


    //Chi nhanh
    var chinhanh = chinhanh_md.getAllChiNhanh()
    var chinhanh1 = ""
    chinhanh.then((cn) => {
        chinhanh1 = {
            post: cn,
            error: false
        }
    })

    //Menu Trang Chủ
    var menuTC = menuTC_md.getAllMenuTC()
    var menuTC1 = ""
    menuTC.then((posts) => {
        var post = posts[0]
        menuTC1 = {
            post: post,
            error: false
        }
    })





    var params = req.params
    var id = params.id
    var start = (id - 1) * limit
    var result = phantrang_md.getProduct(start, limit)
    var data1 = ""
    result.then((dt1) => {
        data1 = {
            cacmonan:dt1,
            error: false
        }
       res.render("nhahang/trangchu", { data: allMonAn, _trang: data1, header: header1, slides: slides1, menuTC: menuTC1, chinhanh: chinhanh1, page: page })
    }).catch(() => {
        res.send("Loi")
    })
})

// router.post("/page/:id", (req, res) => {
//     var params = req.params
//     var id = params.id
//     var start = (id - 1) * limit
//     var result = phantrang_md.getProduct(start, limit)

//     result.then((data) => {
//         res.render('nhahang/trangchu', { data: data, page: page })
//     }).catch(() => {
//         res.send("Loi")
//     })
// })


router.get("/monan/:id", (req, res) => {
    var params = req.params
    var id = params.id
    var data1 = ""
    // var user1 = ""

    // //Lấy thông tin user
    // var iduser = helper.get_ID()
    // console.log(iduser)
    // if (iduser !== -1) {
    //     var u = user_md.getUserById(iduser)
    //     u.then((dtuser) => {
    //         var post = dtuser[0]
    //         user1 = post.first_name +" "+ post.last_name
    //     })
    // }


    //Header
    var header = header_md.getHeaderById(1)
    var header1 = ""
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
        }
    })

    var data = monan_md.getMonAnById(id)
    data.then((posts) => {
        var post = posts[0]
        data1 = {
            post: post,
            error: false
        }
    })


    var comment = comment_md.getCommentById(id)
    comment.then((cmt) => {
        var ndcmt = cmt[0].noidungcmt
        var arrcmt = JSON.parse(ndcmt)

        res.render("nhahang/motmonan", { arrcmt: arrcmt, data: data1, header: header1 })

    }).catch((e) => {
        var arr = []
        var newnd = {
            name: "Lê Đình Phú",
            time: "25/6/2018 2:54",
            noidung: "Món này ngon cực kỳ :)"
        }
        arr.push(newnd)
        var json = JSON.stringify(arr)
        var new1 = {
            idcmt: id,
            noidungcmt: json
        }
        var themcmt = comment_md.themComment(new1)
        themcmt.then((kq1) => {
            //    if (iduser !== -1) {
            //      res.render("nhahang/motmonan", { arrcmt: arrcmt, data: data1, header: header1, user:user })
            // }
            res.render("nhahang/motmonan", { arrcmt: arrcmt, data: data1, header: header1 })
        })
    })
})

router.post("/monan/cmt/:id", (req, res) => {
    var params = req.body
    var date = new Date();
    var now = date.getDate() + "-" + date.getMonth() + "-" + date.getFullYear() + "  " + date.getHours() + ":" + date.getMinutes()
    var a = [],
        b = [],
        c = []
    var id = req.params.id
    var a1 = req.body.namecmt
    var b1 = req.body.noidungcmt

    data = comment_md.getCommentById(id)

    data.then((d) => {
        //json-->arr
        var nd = JSON.parse(d[0].noidungcmt)
        for (var i = 0; i < nd.length; i++) {
            a.push(nd[i].name)
            b.push(nd[i].noidung)
            c.push(nd[i].time)
        }


        var obj = {
            "name": a1,
            "noidung": b1,
            "time": now
        }

        nd.push(obj)
        var myJson = JSON.stringify(nd)
        var param1 = {
            idcmt: d[0].idcmt,
            noidungcmt: myJson
        }

        data1 = comment_md.updateComment(param1)
        data1.then((d1) => {


            var giaodien = ""
            giaodien = giaodien + `<li class="clearfix">` +
                `<img src="https://bootdey.com/img/Content/user_1.jpg" class="avatar" alt="">` +
                `<div class="post-comments">` +
                `<p class="meta">${now} <a class="thea" href="#">${req.body.namecmt}</a> says : <i class="pull-right"><a class="thea" href="#"></a></i></p>` +
                `<p>${req.body.noidungcmt}</p>` +
                `</div>` +
                `</li>`
            res.send(giaodien)
        })
    })


})



//------------------------------------------------MENU-----------------------------------------------//

router.get("/menu", (req, res) => {
    var allMonAn = ""

    var s = [],
        t = [], 
        c = []
    //Header
    var header1 = ""
    var header = header_md.getHeaderById(1)
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
       }
    })

    var monan = monan_md.getAllMonAn()
    monan.then((dt)=>{
       allMonAn = dt
        for(var i = 0; i<allMonAn.length; i++){
            if(allMonAn[i].bua.indexOf('sang') !== -1){
                s.push(allMonAn[i])
             }
            if(allMonAn[i].bua.indexOf('trua') !== -1){
                t.push(allMonAn[i])
            }
            if(allMonAn[i].bua.indexOf('toi') !== -1){
                c.push(allMonAn[i])
            }
        }  
        res.render('nhahang/menu',{sang:s, trua: t, toi: c, header:header1  })
    })

    

    // console.log(s[0].bua +"/"+t[0].bua)

    





    // var total_record = ""
    // var result = phantrang_md.getRecord()
    // result.then((data) => {
    //     total_record = data.length
    //     page = Math.ceil(total_record / limit)
    //     var result1 = phantrang_md.getProduct(0, 6)
    //     result1.then((data1) => {
    //         res.render('nhahang/menu', { data: data1, page: page })
    //     }).catch(() => {
    //         res.send("Loi")
    //     })
    //     // res.render('nhahang/menu',{data:data, page:page})
    // }).catch(() => {
    //     total_record = -1
    // })

})

router.get("/menu/:id", (req, res) => {

    var params = req.params
    var id = params.id
    var start = (id - 1) * limit
    var result = phantrang_md.getProduct(start, limit)

    result.then((data) => {
        res.render('nhahang/menu', { data: data, page: page })
    }).catch(() => {
        res.send("Loi")
    })
})

router.post("/menu/:id", (req, res) => {
    var params = req.params
    var id = params.id
    var start = (id - 1) * limit
    var result = phantrang_md.getProduct(start, limit)

    result.then((data) => {
        res.render('nhahang/menu', { data: data, page: page })
    }).catch(() => {
        res.send("Loi")
    })
})

//=============================MAP=====================================//
router.get("/map", (req, res) => {
    //Header
    var header = header_md.getHeaderById(1)
    var header1 = ""
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
        }

    })

    //Chi nhanh
    var chinhanh = chinhanh_md.getAllChiNhanh()
    var chinhanh1 = ""
    chinhanh.then((cn) => {
        chinhanh1 = {
            post: cn,
            error: false
        }
        res.render("nhahang/map", { chinhanh: chinhanh1, header: header1 })
    })



})


//--------------------------------------PROFILE------------------------------------
router.get("/profile/:id", (req, res) => {
    var params = req.params
    var id = params.id
    var data = user_md.getUserById(id)
    data.then((users) => {
        var user = users[0]
        var data = {
            error: null
        }
        res.render('nhahang/profile', { data: data, id: id, user: user })
    })
})

router.post("/profile/edit/:id", (req, res) => {
    var id = req.params.id
    var params = req.body

    var data = user_md.getUserById(id)
    var user = ""
    data.then((users) => {
        user = users[0]
        if (params.firstname.trim().length === 0) {
            res.render(`nhahang/profile`, { data: { error: "Firstname is not empty" }, id: params.id, user: user })
        } else if (params.name.trim().length === 0) {
            res.render(`nhahang/profile`, { data: { error: "Lastname is not empty" }, id: params.id, user: user })
        } else if (params.gmail.trim().length === 0) {
            res.render(`nhahang/profile`, { data: { error: "Gmail is not empty" }, id: params.id, user: user })
        }
        // }else if(params.phone.trim().length === 0){
        //      res.render("nhahang/profile", {data:{error:"Phone is not empty"},id:params.id})
        // }
        else if (params.oldpassword.trim().length === 0) {
            res.render(`nhahang/profile`, { data: { error: "Password is not empty" }, id: params.id, user: user })
        } else if (params.oldpassword.trim().length !== 0 && helper.compare_password(params.oldpassword, user.password)) {
            if (params.newpassword !== params.confirmpassword) {
                res.render(`nhahang/profile`, { data: { error: "Password not match" }, id: params.id, user: user })
            } else if (params.newpassword.trim().length === 0 && params.confirmpassword.trim().length === 0) {
                var update = {
                    last_name: params.name,
                    first_name: params.firstname,
                    id: params.id,
                    email: params.gmail,
                    password: user.password
                }
                var data1 = user_md.updateUser(update)
                data1.then((a) => {
                    // res.render(`nhahang/profile`, {data:{error:null},id:params.id, user:user})
                    res.redirect(`/profile/${params.id}`)
                })
            } else if (params.newpassword.trim().length !== 0 && params.newpassword === params.confirmpassword) {
                var pass = helper.hash_password(params.newpassword)
                var update = {
                    last_name: params.name,
                    first_name: params.firstname,
                    id: params.id,
                    email: params.gmail,
                    password: pass
                }
                var data = user_md.updateUser(update)
                data.then((a) => {
                    res.redirect(`/profile/${params.id}`)
                })
            }

        }


    })

})


//----------------------------------------------Reservation-----------------------------------------
router.get("/reservation", (req, res) => {
    //Header
    var header = header_md.getHeaderById(1)
    var header1 = ""
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
        }
        // res.render("nhahang/book",{header:header1})
    })

    //Chi nhanh
    var chinhanh = chinhanh_md.getAllChiNhanh()
    var chinhanh1 = ""
    chinhanh.then((cn) => {
        chinhanh1 = {
            post: cn,
            error: false
        }
        res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "", thongbao: "" })
    })

})

router.post("/reservation", (req, res) => {
    var params = req.body
    var date = new Date();
    var now = date.getDate() + "/" + date.getMonth() + "/" + date.getFullYear()


    //Header
    var header = header_md.getHeaderById(1)
    var header1 = ""
    header.then((posts) => {
        var post = posts[0]
        header1 = {
            post: post,
            error: false
        }
        // res.render("nhahang/book",{header:header1})
    })

    //Chi nhanh
    var chinhanh = chinhanh_md.getAllChiNhanh()
    var chinhanh1 = ""
    chinhanh.then((cn) => {
        chinhanh1 = {
            post: cn,
            error: false
        }
        if (params.nameB.trim().length === 0) {
            res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "Tên không được trống", thongbao: "" })
        } else if (params.mailB.trim().length === 0) {
            res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "Gmail không được trống", thongbao: "" })
        } else if (params.phoneB.trim().length === 0) {
            res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "SĐT không được trống", thongbao: "" })
        } else if (params.dateB.trim().length === 0) {
            res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "Ngày đặt bàn không được trống", thongbao: "" })
        } else if (params.timeB.trim().length === 0) {
            res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "Thời gian không được trống", thongbao: "" })
        } else if (params.nameB.trim().length === 0) {
            res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "Số lượng người không được trống", thongbao: "" })
        } else {
            var book = {
                name: params.nameB,
                mail: params.mailB,
                phone: params.phoneB,
                date: params.dateB,
                time: params.timeB,
                person: params.numberB,
                now: now
            }
            // console.log(book.name +"/"+book.mail+"/"+book.phone+"/"+book.date+"/"+book.time+"/"+book.person+"/"+book.now)

            var data = date_md.addDate(book)
            data.then((result) => {
                res.render("nhahang/book", { chinhanh: chinhanh1, header: header1, error: "", thongbao: "Form đặt bàn gửi thành công" })
            }).catch((e) => {
                res.send(e)
            })
        }

    })


})

//-------------------------------------------------------SignOut------------------------------------------------
// router.get("/admin/signout",(res,req)=>{
//     helper.set_ID(-1)
//     helper.set_TEMP(0)
//      req.session.destroy((err) => {
//                             if (err) { console.log("FAILED") } else { console.log("SUCCESS") }
//                         })

// })

module.exports = router