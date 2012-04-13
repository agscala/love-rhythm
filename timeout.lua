require "middleclass"

Timeout = class("Timeout")

function Timeout:initialize(seconds)
	self.initial_seconds = seconds
	self.seconds_remaining = seconds

	self.ready = false
end

function Timeout:update(dt)
	self.seconds_remaining = self.seconds_remaining - dt
	-- print(self.seconds_remaining)
end

function Timeout:reset()
	self.seconds_remaining = self.initial_seconds
end

function Timeout:is_ready()
	if self.seconds_remaining < 0 then
		self:reset()
		return true
	else
		return false
	end
end

