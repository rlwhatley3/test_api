

module.exports = {

	strip: (obj) ->
		payload = {}
		if obj instanceof Array
			payload = _.map obj, (o) ->
				delete o.createdAt
				delete o.updatedAt
				o
		else if obj.rows
			payload = _.map obj, (o) ->
				delete o.createdAt
				delete o.updatedAt
				o
		else
			payload = obj
		return payload

	chego: (req, res, err, obj) ->
		if err
			console.log err
			res.json(err)
		else
			res.json(obj)
	check: (err, obj) ->
		if err
			console.log err
			res.json(err)
		else
			obj
	tokenize: (user) ->
		user = 
			name: user.name
			id: user.id
			roll: user.roll
	issueToken: (req, res,user,token) ->
		payload = 
			user: user
			token: token

		res.json(payload)

}