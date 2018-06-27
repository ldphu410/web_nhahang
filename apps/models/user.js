var q = require('q')
var db = require('../common/database')

var conn = db.getConnection()




function addUser(user){
	if(user){
		var defer = q.defer()

		var query = conn.query('INSERT INTO user SET ?', user, (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		})

		return defer.promise
	}
	return false
}

function getUserByEmail(email){
	if(email){
		var defer = q.defer()
		var query = conn.query('SELECT * FROM user WHERE ?',{email:email},(err,result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		})
		return defer.promise
	}
	return false
}

function getUserById(id){
	if(id){
		var defer = q.defer()
		var query = conn.query('SELECT * FROM user WHERE ?',{id:id},(err,result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		})
		return defer.promise
	}
	return false
}

function getAllUser(){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM user',(err,result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})
	return defer.promise

}

function updateUser(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE user SET first_name=?, last_name=?, email=?, password=? WHERE id=?',
			[params.first_name, params.last_name, params.email, params.password, params.id], (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		}) 
		return defer.promise
	}
	return false
}


module.exports = {
	addUser: addUser,
	getUserByEmail: getUserByEmail,
	getAllUser: getAllUser,
	getUserById:getUserById,
	updateUser: updateUser
}