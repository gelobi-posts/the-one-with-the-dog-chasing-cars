BatmanSet = require '../sets/BatmanSet'
AudioSet = require '../sets/AudioSet'

module.exports = (film) ->

	film.addSet new AudioSet film

	film.addSet new BatmanSet film

	return