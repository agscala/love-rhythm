require "math"
-- require "rhythm"

function love.load()
	bpm = 140
	bpm_in_secs = 60 / bpm
	rate = 0
	total_elapsed = 0
	last_accuracy = 0
end

function love.draw()
    love.graphics.print(bpm, 5, 5)
    love.graphics.print(bpm_in_secs, 40, 5)

    love.graphics.print(rate, 5, 20)
    love.graphics.print(total_elapsed, 5, 35)

    love.graphics.print(last_accuracy, 100, 100)

	if is_beat() then
		love.graphics.rectangle("fill", 200, 200, 300, 300)
	end
end

function love.update(dt)
	rate = dt
	total_elapsed = total_elapsed + dt
end

function love.keypressed(key, unicode)
	last_accuracy = beat_accuracy()
end

function beat_accuracy()
	local beat_offset = math.fmod(total_elapsed, bpm_in_secs)
	beat_offset = math.max(beat_offset, bpm_in_secs - beat_offset)
	return math.ceil(100 * beat_offset / bpm_in_secs)
end

function is_beat()
	if beat_accuracy() >= 99 then
		return true
	else
		return false
	end
end

