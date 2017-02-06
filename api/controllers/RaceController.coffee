###
RaceController

@description :: Server-side logic for managing races
@help        :: See http://links.sailsjs.org/docs/controllers
###

module.exports = {

  index: (req, res) ->
    races = Race.find().exec((err, array) ->
      Packager.chego(req, res, err, array)
    )


# create: (req, res) ->
#     body = req.body
#     Game.create({name: body.name}).exec( (err, created) ->
#       Packager.chego(req,res,err,created)
#     )

  create: (req, res) ->
    body = req.body
    console.log 'In create >>>'
    Race.create(body).exec( (err, created) ->
      Packager.chego(req,res,err,created)
    )
}

