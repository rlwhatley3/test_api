###
Character.coffee

@description :: TODO: You might write a short summary of how this model works and what it represents here.
@docs        :: http://sailsjs.org/#!documentation/models
###

module.exports =


	attributes: {

		name:
			type: 'string'

		is_public: 
			type: 'boolean'
			defaultsTo: () -> "false"

		experience:
			type: 'integer'
			defaultsTo: () -> 0

		base_ability_score:
			model: 'ability_score'
			dominant: true

		ability_score_modifications:
			collection: 'ability_score'
			dominant: true

		level:
			type: 'integer'
			defaultsTo:() -> 1
		#one race to one character
		race: 
			model: 'race'
			dominant: true 
		# one character to many klasses
		primary_class:
			model: 'klass'
			# defaultsTo:() -> some_filler_class
		# one character to many klasses
		secondary_classes:
			collection: 'klass'
			via: 'characters'
			dominant: true
		# one player to many characters
		created_by:
			model: 'user'


		toJSON: () ->
			obj = this.toObject()
			delete obj.createdAt
			delete obj.updatedAt
			obj
	},

	beforeCreate: (char, cb) ->
		if !char.base_ability_score
			Ability_score.create().exec((err, created) ->
				return cb(err) if err 
				char.base_ability_score = created.id
				cb()
			)
		else
			cb()
