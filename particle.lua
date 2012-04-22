require "rhythm"
require "rhythmaware"
require "math"

Particle = class("Particle")
Particle:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function Particle:initialize(x, y, angle, lifespan)
	self.origin_x = x
	self.origin_y = y
	self.x = x
	self.y = y
	self.angle = angle

	self.lifespan = lifespan

	self.color = red

	self.velocity = 300

	self.time_existing = 0
	self.is_dead = false
end

function Particle:draw()
	if not self.is_dead then
		local alpha = self.time_existing / self.lifespan
		alpha = math.sqrt(math.sqrt(alpha))
		alpha = alpha * 255
		alpha = 1 - alpha

		love.graphics.setColor(255, 255, 255, alpha)
		love.graphics.line(self.origin_x, self.origin_y, self.x, self.y)
	end
end

function Particle:update(dt)
	self.time_existing = self.time_existing + dt

	if self.time_existing > self.lifespan then
		self.is_dead = true
		return
	end

	self.y = self.y + math.sin(self.angle) * self.velocity
	self.x = self.x + math.cos(self.angle) * self.velocity

	self.velocity = self.velocity * 0.5
end

function Particle:bump_whole()
	if self.color == red then
		self.color = blue
	else
		self.color = red
	end
end

