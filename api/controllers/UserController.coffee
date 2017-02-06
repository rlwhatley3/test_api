###
UserController

@description :: Server-side logic for managing users
@help        :: See http://links.sailsjs.org/docs/controllers
###

module.exports = {

	index: (req, res) ->
		body = req.body
		User.find().exec( (err, users) ->
			Packager.chego(req,res,err,users)
			)

	create: (req, res) ->
		User.create(req.body).exec( (err, user) ->
			req.session.authenticated = true
			Packager.chego(req, res, err, user)
			)

	show: (req, res) ->
		User.findOne({id: req.param('id')}).exec( (err, user) ->
			Packager.chego(req,res,err,user)
			)
}
