ResponsiveRestorableDisplay = require 'tiny-filmmaking-studio/scripts/js/lib/film/ResponsiveRestorableDisplay'
SimplePlayer = require 'tiny-filmmaking-studio/scripts/js/lib/player/SimplePlayer'

film = require('./_edit') display = new ResponsiveRestorableDisplay document.body, document.getElementById 'filmSpace'

player = new SimplePlayer film