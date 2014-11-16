ResponsiveRestorableDisplay = require 'tiny-filmmaking-studio/scripts/js/lib/film/ResponsiveRestorableDisplay'
SimplePlayer = require 'tiny-filmmaking-studio/scripts/js/lib/player/SimplePlayer'
FinishedFilm = require 'tiny-filmmaking-studio/scripts/js/lib/FinishedFilm'
setupLane1 = require './lanes/1'
laneData = require "../../../lanes/1.json"
Moosh = require 'moosh'
Kilid = require 'kilid'
El = require 'stupid-dom-interface'

kilid = new Kilid(null, 'kilid').getRootScope()
moosh = new Moosh document.body, kilid

film = new FinishedFilm

	id: 'the-one-with-the-dog-chasing-cars'

	lane: laneData

display = new ResponsiveRestorableDisplay document.body, document.getElementById 'filmSpace'

film.display = display
film.moosh = moosh
film.kilid = kilid

player = new SimplePlayer film

film.player = player

setupLane1 film

film.run()

do ->

	page = El document.querySelector '.pageContainer'

	display.on 'fullscreen', ->

		page.css pointerEvents: 'none'

	display.on 'restore', ->

		page.css pointerEvents: 'auto'


	# times = 0

	# film.theatre.model.timeControl.on 'time-change', listener = ->

	# 	return if times > 2

	# 	times++

	# 	if times > 1

	# 		film.theatre.model.timeControl.removeEvent 'time-change', listener

	# 		el.opacity 0

	# 		setTimeout ->

	# 			el.detach()

	# 		, 5000

		return