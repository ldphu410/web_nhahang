var q = require('q')
var db = require('../common/database')

var conn = db.getConnection()




function addDate(data){
	if(data){
		var defer = q.defer()
		console.log(data.name +"/"+data.mail+"/"+data.phone+"/"+data.date+"/"+data.time+"/"+data.person+"/"+data.now)
		var query = conn.query('INSERT INTO book SET ?', data, (err, result)=>{
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



function getAllDate(){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM book',(err,result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})
	return defer.promise

}

function updateDate(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE book SET name=?, mail=?, phone=?, date=?, time=?, person=?, now=?, confirm=?  WHERE id=?',
			[params.name, params.mail, params.phone, params.date, params.time, params.person , params.now, params.confirm, params.id], (err, result)=>{
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

function getDateById(id){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM book WHERE ?',{id:id}, (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}


module.exports = {
	addDate: addDate,
	getAllDate: getAllDate,
	updateDate:updateDate,
	getDateById: getDateById
}