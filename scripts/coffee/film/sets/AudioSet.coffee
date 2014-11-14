Set = require('tiny-filmmaking-studio').Set

module.exports = class AudioSet extends Set

	constructor: ->

		super

		@id = 'audio'

		@film.theatre.model.audio.set window.postBase + '/xeno/tdk.mp3'
