var q = require('q')
var db = require('../common/database')

var conn = db.getConnection()

function getCommentById(id){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM comment WHERE ?',{idcmt:id}, (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}


function updateComment(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE comment SET noidungcmt=? WHERE idcmt=?',
			[params.noidungcmt, params.idcmt], (err, result)=>{
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



function getAllComment(){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM comment',(err,result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})
	return defer.promise

}



module.exports = {
	getCommentById: getCommentById,
	getAllComment: getAllComment,
	updateComment: updateComment
}