# module.exports = {
#   attributes: ['name']
# }

KlassSerializer = new Cerealizer([
  # { as: 'Klass' },
  { attributes: ['name', 'description', 'hit_dice_type', 'hit_dice', 'recovery', 'character_count'] },
  { recovery: (record) -> return "#{record.hit_dice}D#{record.hit_dice_type}" },
  { character_count: (record) -> 
      if record.characters
        return record.characters.length
      else
        return null
  }
]);

module.exports = KlassSerializer;