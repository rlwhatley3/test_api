###
Klass.coffee

@description :: TODO: You might write a short summary of how this model works and what it represents here.
@docs        :: http://sailsjs.org/#!documentation/models
###

module.exports =

	attributes: {

		name:
			type: 'string'

		description:
			type: 'string'

		level:
			type: 'integer'
			defaultsTo: () -> 1

		hit_dice_type:
			type: 'integer'

		hit_dice: 
			type: 'integer'

		characters:
			collection: 'character'
			via: 'secondary_classes'

		user_count: () ->
			console.log 'in user count ->'
			2
			# Character.find(primary_class: this)
			# Character.where('primary_class.id = ? OR secondary_classes.id = ?', this.id, this.id).
	}

