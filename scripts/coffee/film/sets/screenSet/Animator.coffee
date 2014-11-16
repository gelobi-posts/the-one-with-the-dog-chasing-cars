TimingFunction = require 'timing-function'

module.exports = class Animator

	constructor: (@_currentProps) ->

		@_toProps = {}

		@_fromProps = {}

		@_timingFunction = TimingFunction.get 'sine.easeOut'

		@_duration = 2000

		@_startTime = 0

		@_active = no

	setDuration: (d) ->

		d = parseInt d

		@_duration = d

		@

	setEasing: (t) ->

		try

			@_timingFunction = TimingFunction.get t

		catch

			throw Error "Unkown easing: '#{t}'"

	set: (to) ->

		unless @_active

			@_active = yes

		@_startTime = @_now

		for name, val of to

			@_toProps[name] = val

			@_fromProps[name] = @_currentProps[name]

		@

	raf: (t) ->

		@_now = t

		return unless @_active

		prog = (@_now - @_startTime) / @_duration

		if prog >= 1.0

			prog = 1.0

			@_active = no

		prog = @_timingFunction prog

		for name, val of @_toProps

			@_currentProps[name] = @_fromProps[name] + prog * (val - @_fromProps[name])

		if not @_active

			@_toProps = {}

		return