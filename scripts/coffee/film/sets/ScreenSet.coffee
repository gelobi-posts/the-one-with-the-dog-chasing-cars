Set = require('tiny-filmmaking-studio').Set

module.exports = class ScreenSet extends Set

	constructor: ->

		super

		@id = 'screen'

		return unless @film.player?

		@film.player.autoFullscreen = no

		display = @film.display

		@_onTime 24000, (forward, supposedT, currentT) =>

			return if currentT - supposedT > 1000

			return unless forward and @film.theatre.model.audio.isPlaying()

			return if display.state is 'fullscreen'

			do @_scrollToCenter

		@_onTime 25000, (forward, supposedT, currentT) =>

			return if currentT - supposedT > 1000

			return unless forward and @film.theatre.model.audio.isPlaying()

			return if display.state is 'fullscreen'

			display.fullscreen()

		@_onTime 129000, (forward) =>

			return unless forward and @film.theatre.model.audio.isPlaying()

			return if display.state is 'restored'

			display.restore()

	_scrollToCenter: ->

		pointerListener = (e) ->

			e.preventDefault()
			e.stopPropagation()

		window.addEventListener 'touchstart', pointerListener
		window.addEventListener 'mousewheel', pointerListener
		window.addEventListener 'scroll', pointerListener
		window.addEventListener 'touchmove', pointerListener

		stop = ->

			window.removeEventListener 'touchstart', pointerListener
			window.removeEventListener 'mousewheel', pointerListener
			window.removeEventListener 'scroll', pointerListener
			window.removeEventListener 'touchmove', pointerListener

		dims = document.getElementById('filmSpace').getBoundingClientRect()

		mid = parseInt (window.scrollY or window.pageYOffset) + dims.top + ((dims.bottom - dims.top) / 2)

		to = (parseInt mid - window.innerHeight / 2)

		from = parseInt (window.scrollY or window.pageYOffset)

		diff = to - from

		startTime = Date.now()

		dur = 500

		frame = ->

			now = Date.now()

			elapsed = now - startTime

			done = elapsed >= dur

			elapsed = dur if done

			prog = elapsed / dur

			prog = Math.sin prog * Math.PI / 2

			window.scrollTo 0, parseInt(from + diff * prog)

			raf frame unless done

			stop() if done

		raf frame

raf = window.requestAnimationFrame or window.webkitRequestAnimationFrame