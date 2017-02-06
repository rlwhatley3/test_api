
jwt = require('jwt-simple')

secret = 'yourMother'

module.exports = {

	generate: (obj) ->
		token = jwt.encode(obj, secret)
		console.log 'generating token: ' + token
		token
	check: (token) ->
		obj = jwt.decode(token, secret)
		console.log 'checked token: ' + obj
		obj


}