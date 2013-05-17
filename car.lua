require "rhythmaware"
require "math"

Car = class("Car")
Car:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function Car:initialize(x, y, w, h)
	self.x = x
	self.y = y
	self.velocity = 0.0
	self.width = 20
	self.height = 60

	self.color = red
end

function Car:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Car:bump_whole()
end

function Car:bump_half()
end

function Car:bump_quarter()
end

function Car:bump_eigth()
end

