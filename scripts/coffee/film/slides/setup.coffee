content = require './content'
El = require 'stupid-dom-interface'

module.exports = (film) ->

	pieces = content.split /~~/

	el = El '.theSlideshow'
	.inside film.display.bgLayer

	obj = setNumber: (n) ->

		return unless 0 <= n <= pieces.length - 1

		el.html pieces[n|0]

		return

	film.theatre.timeline.addObject 'SlidesObj', obj

	film.theatre.model.graph
	.getGroup('Slides').getActor('Slides')
	.addPropOfObject 'Number', 'SlidesObj', 'setNumber', 0

	return