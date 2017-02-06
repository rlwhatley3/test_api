
# CharacterSerializer
_ = require('lodash')

# module.exports = {
#   attributes: ['name', 'description']
# }
RaceSerializer = new Cerealizer([
  # { as: 'Race' },
  { attributes: ['name', 'description'] }
  # { has_many: { characters: { each_serializer: 'Character', as: 'Character' } } }
]);

module.exports = RaceSerializer;