var bcrypt =  require("bcrypt")
var config = require("config")

var TEMP = 0;
var ID = -1;
var out = -1;
function hash_password(password){
	var saltRounds = config.get("salt");

	var salt = bcrypt.genSaltSync(saltRounds);
	var hash = bcrypt.hashSync(password, salt);

	return hash; 
}

function compare_password(password, hash){
	return bcrypt.compareSync(password, hash);
}

function get_TEMP(){
	return TEMP;
}

function set_TEMP(a){
	TEMP  = a;
}

function get_ID(){
	return ID;
}

function set_ID(a){
	ID  = a;
}

function set_out(a){
	ID  = a;
}

function get_out(){
	return ID;
}

module.exports = {
	hash_password: hash_password,
	compare_password:compare_password,
	get_TEMP: get_TEMP,
	set_TEMP: set_TEMP,
	get_ID: get_ID,
	set_ID: set_ID
}
