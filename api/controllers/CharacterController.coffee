###
CharacterController

@description :: Server-side logic for managing characters
@help        :: See http://links.sailsjs.org/docs/controllers
###
_ = require('lodash')
# serialize = require('../serializers/characterAdminSerializer.coffee')

module.exports = {
	index: (req, res) ->
		# characters = Character.find(created_by: req.session.user.id)
		Character.find()
		.populate('created_by')
		.populate('primary_class')
		.populate('secondary_classes')
		.populate('race')
		.populate('base_ability_score')
		.exec((err, characters) ->
			race_ids = _.map(characters, (c) -> c.race.id)
			Race.find(race_ids)
			.populate('characters')
			.exec((err, races) ->
				characters = _.map(characters, (c) -> c.race = _.filter(races, { id: c.race.id })[0]; return c;)
				Cerealize(characters, { each_serializer: 'Character', user: req.session.user }).then (ret) ->
					console.log('RET')
					console.log(ret)
					return Packager.chego(req, res, err, ret[Object.keys(ret)[0]])
			)
		)
	create: (req, res) ->
		body = req.body
		_.merge(body, created_by: req.session.user.id)
		Character.create(body)
		.exec( (err, created) ->
			Character.findOne(id: created.id)
			.populate('created_by')
			.populate('primary_class')
			.populate('secondary_classes')
			.populate('race')
			.populate('base_ability_score')
			.exec((err, character) ->
				Cerealize(character, { serializer: 'Character' }).then (ret) ->

					return Packager.chego(req,res,err,ret.character)
			)
		)
	show: (req, res) ->
		Character.findOne({id: req.param('id')})
		.populate('created_by')
		.populate('primary_class')
		.populate('secondary_classes')
		.populate('race')
		.populate('base_ability_score')
		.exec( (err, character) ->
			Cerealize(character, { serializer: 'Character', as: Character }).then (ret) ->
				char = ret.character
				return Packager.chego(req, res, err, char)
		)
	destroy: (req, res) ->
		body = req.body
		Character.destroy({id: body.id}).exec( (err, destroyed) ->
			Packager.chego(req, res, err, destroyed)
		)
	update: (req, res) ->
		body = req.body
		nested_update_params = ['primary_class']
		_.each nested_update_params, (p) ->
			_.each Object.keys(body), (k) ->
				if body[k] != null && p == k 
					body[p] = body[p].id
		Character.update(id: body.id, body)
		.exec( (err, updated) ->
			if err
				console.log err
			Character.findOne(id: updated[0].id)
			.populate('created_by')
			.populate('primary_class')
			.populate('secondary_classes')
			.populate('race')
			.populate('base_ability_score')
			.exec( (er, character) ->
				Cerealize(character, { serializer: 'Character' }).then (ret) ->
					return Packager.chego(req,res,er,ret.character)
			)
		)
}

