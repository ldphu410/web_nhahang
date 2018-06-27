var q = require('q')
var db = require('../common/database')

var conn = db.getConnection()




function addDoanhThu(user){
	if(user){
		var defer = q.defer()

		var query = conn.query('INSERT INTO doanhthu SET ?', user, (err, result)=>{
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

function getDoanhThuByDate(date){
	if(date){
		var defer = q.defer()
		var query = conn.query('SELECT * FROM doanhthu WHERE ?',{ngay:date},(err,result)=>{
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

function getAllDoanhThu(){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM doanhthu',(err,result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})
	return defer.promise

}


function  getDS(start, limit){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM doanhthu LIMIT ?, ?',[start, limit],(err,result)=>{
		if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
	})
	return defer.promise
}

function totalRecords(){

	var sql = "SELECT count(*) as total FROM doanhthu";
 	var a =''
	var query = conn.query(sql, function(err, result) {
 
		a =  result[0].total
 
	});
	return a
}

module.exports = {
	addDoanhThu: addDoanhThu,
	getDoanhThuByDate: getDoanhThuByDate,
	getAllDoanhThu: getAllDoanhThu,
	getDS:getDS,
	totalRecords: totalRecords
}