Set = require('tiny-filmmaking-studio').Set

module.exports = class IntroSet extends Set

	constructor: ->

		super

		@id = 'intro'

		@container = @makeSetContainer([0, 176000])
		.attr 'id', 'intro-container'

		return