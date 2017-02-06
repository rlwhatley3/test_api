###
LoginController

@description :: Server-side logic for managing logins
@help        :: See http://links.sailsjs.org/docs/controllers
###

# jane for free -spotify style, would be on desktop only, and would
# be able to run any devices and take voice commands for such. 
# paid for jane would be mobile, portable to infinite devices, and allows chaining of janets

module.exports = {

	login: (req,res) ->
		params = req.body
		console.log 'what'
		User.findOne({email: params.email}).exec( (err,user) ->
			Packager.check(err,user)
			if user? && user.password == params.password
				user = Packager.tokenize(user)
				req.session.authenticated = true
				req.session.user = user
				token = Token.generate(user)
				Packager.issueToken(req,res, user, token)
			else
				req.session.authenticated = false
				Packager.chego(req,res,err,params)
			)

	logout: () ->
		req.session = null
		res.redirect('/')
	}

