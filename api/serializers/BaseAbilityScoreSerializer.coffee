
# CharacterSerializer
_ = require('lodash')


# Promise = require()

BaseAbilityScore = new Cerealizer([
  { attributes: ['charisma', 'constitution', 'dexterity', 'intelligence', 'strength', 'wisdom'] }
]);

module.exports = BaseAbilityScore;