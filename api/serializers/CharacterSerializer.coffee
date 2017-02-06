
# CharacterSerializer
_ = require('lodash')


# Promise = require()

CharacterSerializer = new Cerealizer([
  # { as: 'Character' },
  { attributes: ['name', 'race', 'standard_func', 'promise_func', 'secondary_classes', 'primary_class', 'base_ability_score', 'experience', 'level', 'is_public'] },
  { has_many: { secondary_classes: { each_serializer: 'Klass' } } },
  { has_one: { primary_class: { serializer: 'Klass' } } },
  { has_one: { race: { serializer: 'Race' } } },
  { has_one: { base_ability_score: { serializer: 'BaseAbilityScore' } } },

  { standard_func: (record, user) -> return record.id + '-' + record.name }
  # { promise_func: (record, user) -> return Cerealize(record.race, { serializer: 'Race' } ) }
  # { user_func: (record, user) -> 
  #   if user.is_admin
  #     return Cerealize(record.race, { serializer: 'RaceAdmin' })
  #   else 
  #     return Cerealize(record.race, { serializer: 'Race' })
  #  },
  #  { secondary_classes: (classes, record, user) ->
  #     if user.is_admin
  #       return classes
  #     else 
  #       return [classes[0]]
  #  }
  # { secondary_classes: (classes) -> return classes }

]);

module.exports = CharacterSerializer;