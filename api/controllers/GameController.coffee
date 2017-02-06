###
GameController

@description :: Server-side logic for managing games
@help        :: See http://links.sailsjs.org/docs/controllers
###

module.exports = {

	index: (req, res) ->
		Game.find().exec((err, array) ->
			Packager.chego(req,res,err,array)
			)
	create: (req, res) ->
		body = req.body
		Game.create({name: body.name}).exec( (err, created) ->
			Packager.chego(req,res,err,created)
		)
	show: (req, res) ->
		Game.findOne({name: req.param('name')}).exec( (err, thing) ->
			Packager.chego(req,res,err,thing)
			)
	destroy: (req, res) ->
		body = req.body
		Game.destroy({name: body.name}).exec( (err, destroyed) ->
			Packager.chego(req, res, err, destroyed)
			)
	# still doesn't work
	update: (req, res) ->
		changes = req.body.changes
		target = req.body.target

		Game.update(body).exec( (err, updated) ->
			Packager.chego(req,res,err,updated)
			)
}

