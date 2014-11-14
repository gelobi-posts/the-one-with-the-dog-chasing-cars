Set = require('tiny-filmmaking-studio').Set
titles = require "./batmanSet/titles"

module.exports = class BatmanSet extends Set

	constructor: ->

		super

		@id = 'batman'

		@container = @makeSetContainer()
		.attr 'id', 'batmanContainer'

		el = @_makeEl ".batman-title"
		.html 'THE DARK KNIGHT'
		.inside @container
		.z 1

		@_setupDomEl 'TDK', 'Title 1', el, ['opacity', 'scaleAll']

		obj =

			n: (n) ->

				el.html titles[n]

		@_setupObject 'TDK', 'Content', obj, ['n']