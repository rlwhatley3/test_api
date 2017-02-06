###
TodoController

@description :: Server-side logic for managing todoes
@help        :: See http://links.sailsjs.org/docs/controllers
###

module.exports = {

	index: (req, res) ->
		todos = Todo.find(owner: req.session.user.id).exec((err, array) ->
			console.log todos
			Packager.chego(req,res,err,array)
		)
	create: (req, res) ->
		body = req.body
		Todo.create({value: body.value, owner: req.session.user.id}).exec( (err, created) ->
			Packager.chego(req,res,err,created)
		)
	show: (req, res) ->
		params = req.params
		Todo.findOne({id: params}).exec( (err, todo) ->
			Packager.chego(req,res,err,todo)
		)
	destroy: (req, res) ->
		body = req.body
		Todo.destroy({value: body.value}).exec( (err, destroyed) ->
			Packager.chego(req, res, err, destroyed)
		)
	update: (req, res) ->
		changes = req.body.changes
		target = req.body.target

		Todo.update(body).exec( (err, updated) ->
			Packager.chego(req,res,err,updated)
		)

}


