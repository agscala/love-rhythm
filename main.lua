require "box"
require "math"
require "rhythm"

function love.load()
	bpm = 60
	bpm_in_secs = 60 / bpm
	rate = 0
	total_elapsed = 0
	last_accuracy = 0

	box = Box:new(300, 10, 30, 30)
	Rhythm:subscribe(box)
end

function love.draw()
	box:draw()

	love.graphics.setColor(255, 255, 255)

    love.graphics.print(bpm, 5, 5)
    love.graphics.print(bpm_in_secs, 40, 5)

    love.graphics.print(rate, 5, 20)
    love.graphics.print(total_elapsed, 5, 35)

    love.graphics.print(last_accuracy, 100, 100)

	if Rhythm:is_beat() then
		love.graphics.rectangle("fill", 200, 200, 300, 300)
	end
end

function love.update(dt)
	Rhythm:update(dt)
end

function love.keypressed(key, unicode)
	last_accuracy = Rhythm:beat_accuracy(1.0)
end

