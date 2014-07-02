EditingFilm = require 'tiny-filmmaking-studio/scripts/js/lib/EditingFilm'
setupLane1 = require './lanes/1'
setupSlides = require './slides/setup'

module.exports = (display) ->

	film = new EditingFilm

		id: 'the-one-with-the-dog-chasing-cars'

		lane: '1'

		passphrase: 'qwertix'

		aspectRatio: no

		port: 6546

		sourceResolution: [1680, 1050]

	film.display = display

	setupLane1 film

	setupSlides film

	film.theatre.model.audio.set '../xeno/til.mp3'
	film.theatre.model.audio.mute()

	film.run()

	film