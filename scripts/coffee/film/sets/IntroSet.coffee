Set = require('tiny-filmmaking-studio').Set

module.exports = class IntroSet extends Set

	constructor: ->

		super

		@id = 'intro'

		@container = @makeSetContainer()
		.attr 'id', 'intro-container'

		return