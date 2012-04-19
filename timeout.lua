require "middleclass"

Timeout = class("Timeout")

function Timeout:initialize(seconds)
	self.timeout_length = seconds
	self.seconds_elapsed = 0

	self.ready = false
end

function Timeout:update(dt)
	self.seconds_elapsed = self.seconds_elapsed + dt
end

function Timeout:reset()
	-- This preserves the excess time after a trigger.
	self.seconds_elapsed = self.seconds_elapsed - self.timeout_length
end

function Timeout:restart()
	-- This hard-resets and will mess up specific timing.
	self.seconds_elapsed = 0
end

function Timeout:is_ready()
	if self.seconds_elapsed > self.timeout_length then
		self:reset()
		return true
	else
		return false
	end
end

