var q = require('q')
var db = require('../common/database')

var conn = db.getConnection()




function addUser(user){
	if(user){
		var defer = q.defer()

		var query = conn.query('INSERT INTO admin SET ?', user, (err, result)=>{
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
		var query = conn.query('SELECT * FROM admin WHERE ?',{email:email},(err,result)=>{
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
	getUserByEmail: getUserByEmail
}