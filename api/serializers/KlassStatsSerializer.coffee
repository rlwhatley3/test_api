KlassStatsSerializer = new Cerealizer([
  { attributes: ['name', 'character_count'] }
  { character_count: (record) -> return record.characters.length }
])

module.exports = KlassStatsSerializer