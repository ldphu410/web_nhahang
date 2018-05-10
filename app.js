var express = require('express')
var config = require('config')
var bodyParser = require('body-parser')
var session = require("express-session")


var app = express()
var controllers  = require(__dirname + "/apps/controllers")


//setup session
app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: config.get("secret_key"),								//lấy giá trị trong file default.js
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}))

//body-parser
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))  
app.use(controllers)
app.set("views",__dirname+"/apps/views")
app.set("view engine","ejs")

//static folder
app.use("/static",express.static(__dirname+"/public"))

var host = config.get("server.host")
var port = config.get("server.port")

app.listen(port, host,()=>{
	console.log("Server is running on port", port)
})