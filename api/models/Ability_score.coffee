###
Ability_score.coffee

@description :: TODO: You might write a short summary of how this model works and what it represents here.
@docs        :: http://sailsjs.org/#!documentation/models
###

module.exports =

  attributes: {

    strength:
      type: 'integer'
      defaultsTo:() -> 0

    dexterity:
      type: 'integer'
      defaultsTo:() -> 0

    constitution: 
      type: 'integer'
      defaultsTo:() -> 0

    intelligence:
      type: 'integer'
      defaultsTo:() -> 0

    wisdom: 
      type: 'integer'
      defaultsTo:() -> 0

    charisma:
      type: 'integer'
      defaultsTo:() -> 0

  }

