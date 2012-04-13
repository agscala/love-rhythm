require "middleclass"
require "rhythm"


RhythmAware = {}

function RhythmAware:included(_class)
	_class.do_bump_whole = false
	_class.do_bump_half = false
	_class.do_bump_quarter = false
	_class.do_bump_eigth = false
end

function RhythmAware:bump_whole()
end

function RhythmAware:bump_half()
end

function RhythmAware:bump_quarter()
end

function RhythmAware:bump_eighth()
end

