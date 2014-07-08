IntroSet = require '../sets/IntroSet'
BatmanSet = require '../sets/BatmanSet'

module.exports = (film) ->

	film.addSet new IntroSet film

	film.addSet new BatmanSet film

	return