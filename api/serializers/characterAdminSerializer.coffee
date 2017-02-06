
# CharacterSerializer
# _ = require('lodash')

# characterAdminSerializer = (array) ->
#   new Serializer(Character, array, {}, {}, 'characterAdminSerializer')

# module.exports = new Cerealizer('characterAdminSerializer', array, params)


# module.exports = {

#   attributes: ['name', 'race', 'secondary_classes'],

#   has_many: {
#     secondary_classes: each_serializer: 'Klass', as: 'Klass'
#   }

#   has_one: {
#     race: serializer: 'Race', as: 'Race'
#   }


#   race: (race) ->
#     race.id = null
#     return race

#   # secondary_classes: (classes) ->
#   #   new Cerealize(classes, each_serializer: 'Klass', as: 'Klass').then (res) ->
#   #     return res
# }

# module.exports = characterAdminSerializer