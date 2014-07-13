Set = require('tiny-filmmaking-studio').Set

module.exports = class BatmanSet extends Set

	constructor: ->

		super

		@id = 'batman'

		@container = @makeSetContainer([177000])
		.attr 'id', 'batman-container'

		darkKnightProps =

			opacity: [0, 1]

			scale: [.88, .96]



		props =

			opacity: [0, 1]

			scale: [.9, 1]




		el = @_makeEl ".batman-title"
		.html 'THE DARK KNIGHT'
		.inside @container
		.z 1

		@_setupDomEl 'TDK', 'Title 1', el, ['opacity', 'scaleAll']

		# @_createWord "THE DARK KNIGHT", ".batman-title", "Batman", "THE DARK KNIGHT", darkKnightProps

		# @_createComplexWord "Directed by", "Christopher Nolan", ".batman-title", "Batman", "Director", props

		# @_createComplexWord "Screenplay by", "Christopher Nolan", ".batman-title", "Batman", "Screen", props

		# @_createComplexWord "Story by", "Christopher Nolan", ".batman-title", "Batman", "Story1", props

		# @_createComplexWord "Story by", "David S. Goyer", ".batman-title", "Batman", "Story2", props




		# @_setupTangled "Batman", "THE DARK KNIGHT", "Prog", el, props


		# director = @_makeEl ".batman-title"
		# .html '<h6>Directed by</h6><h3>Christopher Nolan</h3>'
		# .inside @container
		# .z 1

		# @_setupTangled "Batman", "Director", "Prog", director, props


		# el = @_makeEl ".batman-title"
		# .html '<h6>Screenplay by</h6><h3>Christopher Nolan</h3>'
		# .inside @container
		# .z 1

		# @_setupTangled "Batman", "Screen", "Prog", el, props


	_createWord: (html, css, groupName, name, props) ->

		el = @_makeEl css
		.html html
		.inside @container
		.z 1

		@_setupTangled groupName, name, "Prog", el, props

	_createComplexWord: (title, text, css, groupName, name, props) ->

		el = @_makeEl css
		.html "<h6>#{title}</h6><h3>#{text}</h3>"
		.inside @container
		.z 1

		@_setupTangled groupName, name, "Prog", el, props