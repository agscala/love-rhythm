require "box"
require "math"
require "rhythm"
require "emitter"
require "player"

require "grid"
require "gridrender"
require "cellrender"

function love.load()
	bpm = 60
	bpm_in_secs = 60 / bpm
	rate = 0
	total_elapsed = 0
	last_accuracy = 0

	box = Box:new(300, 10, 30, 30)
	box.do_bump_whole = true
	Rhythm:subscribe(box)

	box2 = Box:new(340, 10, 30, 30)
	box2.do_bump_half = true
	Rhythm:subscribe(box2)

	box3 = Box:new(380, 10, 30, 30)
	box3.do_bump_quarter = true
	Rhythm:subscribe(box3)

	box4 = Box:new(420, 10, 30, 30)
	box4.do_bump_eigth = true
	Rhythm:subscribe(box4)

	emitter = Emitter:new(400, 300)
	emitter.do_bump_whole = true
	emitter.do_bump_half = true
	emitter.do_bump_quarter = true
	emitter.do_bump_eigth = true
	Rhythm:subscribe(emitter)

	local sound = love.audio.newSource("Anitek-Calling.mp3")
	love.audio.play(sound)

	player = Player:new(200, 300)

	Rhythm:restart()

	grid = Grid:new(20, 10)
	grid_render = GridRender:new(100, 150, 30, 30, grid)

end

function love.draw()
	box:draw()
	box2:draw()
	box3:draw()
	box4:draw()

	love.graphics.setColor(255, 255, 255)

    love.graphics.print(last_accuracy, 10, 10)

	if Rhythm:is_beat() then
		-- love.graphics.rectangle("fill", 200, 200, 300, 300)
	end

	emitter:draw()
	player:draw()
	grid_render:draw()
end

function love.update(dt)
	Rhythm:update(dt)
	emitter:update(dt)
	player:update(dt)
	grid_render:update(dt)
end

function love.keypressed(key, unicode)
	last_accuracy = Rhythm:beat_accuracy(1.0)
	player:move(key)
end

