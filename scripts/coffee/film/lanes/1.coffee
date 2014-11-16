BatmanSet = require '../sets/BatmanSet'
AudioSet = require '../sets/AudioSet'
ScreenSet = require '../sets/ScreenSet'

module.exports = (film) ->

	film.addSet new AudioSet film

	film.addSet new BatmanSet film

	film.addSet new ScreenSet film

	return