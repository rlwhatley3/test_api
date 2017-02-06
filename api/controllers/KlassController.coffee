###
KlassController

@description :: Server-side logic for managing klasses
@help        :: See http://links.sailsjs.org/docs/controllers
###

module.exports = {

	index: (req, res) ->
		params = req.query
		Klass.find()
		.populate('characters')
		.exec((err, klasses) ->
			Cerealize klasses, each_serializer: 'Klass'
			.then (ret) ->
				klassez = ret.klass
				if params && params.with_stats == 'true'
					Cerealize(klassez, each_serializer: 'KlassStats').then (obj) ->
						klassez = obj.klassstats
						return Packager.chego(req, res, err, klassez)
				else
					return Packager.chego(req, res, err, klassez)
		)
	create: (req, res) ->
		body = req.body
		Klass.create({name: body.name}).exec( (err, created) ->
			Packager.chego(req,res,err,created)
		)
	show: (req, res) ->
		Klass.findOne({name: req.param('name')}).exec( (err, thing) ->
			Packager.chego(req,res,err,thing)
		)
	destroy: (req, res) ->
		body = req.body
		Klass.destroy({name: body.name}).exec( (err, destroyed) ->
			Packager.chego(req, res, err, destroyed)
		)
	# still doesn't work
	update: (req, res) ->
		changes = req.body.changes
		target = req.body.target

		Klass.update(body).exec( (err, updated) ->
			Packager.chego(req,res,err,updated)
		)
}

