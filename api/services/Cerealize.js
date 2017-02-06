var Cerealize = require('sails-hook-cerealize/Cerealize.js');

module.exports = function(records, config)  { return (new Cerealize(records, config)); }