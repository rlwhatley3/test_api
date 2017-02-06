/**
 * Bootstrap
 * (sails.config.bootstrap)
 *
 * An asynchronous bootstrap function that runs before your Sails app gets lifted.
 * This gives you an opportunity to set up your data model, run jobs, or perform some special logic.
 *
 * For more information on bootstrapping your app, check out:
 * http://sailsjs.org/#!/documentation/reference/sails.config/sails.config.bootstrap.html
 */

module.exports.bootstrap = function(cb) {
  var err = []

  seed_users = [];

  var admin = {
    username: 'Admin',
    email: 'admin@piecethree.net',
    password: '1',
    role: 'admin'
  };

  var user_one = {
    username: '1',
    email: '1@1.net',
    password: '1',
    role: 'admin'
  };

  var user_two = {
    username: '2',
    email: '2@2.net',
    password: '2',
    role: 'admin'
  }


  userCb = function (er, user) {
    if (er)
      err.push(er);
    else
      console.log('user created: ', user.username);
  };

  
  characterCb = function (er, character) {
    if(er)
      err.push(er);
    else
      console.log('Character created: ' + character.name + " for user: " + character.created_by);
  };

  klassCb = function (er, klass) {
    if(er)
      err.push(er);
    else
      console.log('Klass created: ', klass.name)
  };

  raceCb = function (er, race) {
    if(er)
      err.push(er);
    else
      console.log('Race created: ', race.name)
  };

  abilityScoreCb = function (er, ability_score) {
    if(er)
      err.push(er);
    else
      console.log('Ability Score created for: ', ability_score.character)
  };

  seed_characters = [];

  character_one = {
    name: "BrothamireTheron",
    created_by: 1,
    primary_class: 1,
    secondary_classes: [2],
    race: 1,
    base_ability_score: 1
  };

  character_two = {
    name: "Hodoor",
    created_by: 2,
    primary_class: 2,
    secondary_classes: [1],
    race: 2
  };
  
  character_three = {
    name: "scoob",
    created_by: 3,
    primary_class: 3,
    secondary_classes: [2],
    race: 2
  };

  seed_klasses = []

  klass_one = {
    name: 'barbarian',
    hit_dice: 1,
    hit_dice_type: 12,
    description: 'Me from planet Amazonia, big rats there, me crush with club.'
  };

  klass_two = {
    name: 'ranger',
    hit_dice: 1,
    hit_dice_type: 10,
    description: 'I shoot da bow. and use some animals talents and such.'
  };

  klass_three = {
    name: 'wizard',
    hit_dice: 1,
    hit_dice_type: 6,
    description: 'Wild and enigmatic, varied in form and function, the power of magic draws students who seek to master its mysteries. Some asire to become like the gods, shaping reality itself. Though the casting of a typical spell requires merely the utterance of a few strange words, fleeting gestures, and sometimes a pinch or clump of exotic materials, these surface components barely hint at the expertise attained after years of apprenticeship and countless hours of study.\n      Wizards live and die by their spells. Everything else is secondary. They learn new spells as the experiment and grow in experience. They can also learn them from other wizards, from ancient tomes or inscriptions, and from ancient creatures (such as the fey) that are steeped in magic.'
  };

  seed_races = [];

  dwarf = {
    name: 'dwarf',
    description: 'Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal. Theough they stand well under 5 feet tall, dwarves are so broad and compact that they can weigh as much as a human standing nearly two feet taller. Their courage and endurance are also easily a match for any of the larger folk. \n Dwarven skin ranges from deep brown to a paler hue tinged with red, but the most common shades are light brown or deep tan, like certain tones of earth. Their hair, worn long but in simple styles, is usually black, grey, or brown, though paler dwarvexs often have red hair. Male dwarves value their beards highly and groom them carefully.'
  };

  elf = {
    name: 'elf',
    description: 'Elves are a magical people of otherworldly grace, living in the world but not entirely part of it. They live in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light, where soft music drifts through the air and gentle fragrances waft on the breeze. Elves love nature and magic, art and artistry, music and poetry, and the good things of the world.'
  };

  seed_ability_scores = []

  base_ability_score_one = {
    strength: 15,
    constitution: 14,
    dexterity: 10,
    intelligence:8,
    wisdom: 13,
    charisma: 12,
    character: 1
  };

  seed_ability_scores.push(base_ability_score_one);

  seed_users.push(admin,user_one, user_two);
  seed_klasses.push(klass_one,klass_two, klass_three);
  seed_races.push(dwarf, elf);
  seed_characters.push(character_one, character_two, character_two, character_three);
  seed_users.forEach(function(user) {User.create(user, userCb);});
  seed_klasses.forEach(function(klass) {Klass.create(klass, klassCb)});
  seed_races.forEach(function(race) {Race.create(race, raceCb)});
  seed_characters.forEach(function(character) {Character.create(character, characterCb)});
  seed_ability_scores.forEach(function(ability_score) {Ability_score.create(ability_score, abilityScoreCb)});

  // It's very important to trigger this callback method when you are finished
  // with the bootstrap!  (otherwise your server will never lift, since it's waiting on the bootstrap)
  if (err.length > 0) {
    cb(err[0])
  }
  else
    cb();
};
