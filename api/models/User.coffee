
###
User.coffee

@description :: TODO: You might write a short summary of how this model works and what it represents here.
@docs        :: http://sailsjs.org/#!documentation/models
###

module.exports =

	attributes: {

		username:
			type: 'string',
			foreignKey: true
		email:
			type: 'string',
			unique: true,
			foreignKey: true
		password:
			type: 'string'
		role:
			type: 'string',
			enum: ['base', 'admin']
		# many to many
		# games:
		# 	collection: 'game',
		# 	via: 'players',
		# 	dominant: true
		# many character to one user - has_many
		characters:
			collection: 'character',
			via: 'created_by',
			dominant: true
		#has_many
		todos:
			collection: 'todo',
			via: 'owner',
			dominant: true

	},

	can_view_stuff: (user, cb) ->
		if user.role == 'admin'
			return true
		else
			cb()




# module.exports = {

#   attributes: require('waterlock').models.user.attributes({
		
#     /* e.g.
#     nickname: 'string'
#     */
		
#   }),
	
#   beforeCreate: require('waterlock').models.user.beforeCreate,
#   beforeUpdate: require('waterlock').models.user.beforeUpdate
# };
