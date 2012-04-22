require "rhythmaware"
require "math"

Box = class("Box")
Box:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function Box:initialize(x, y, w, h)
	self.x = x
	self.y = y
	self.width = w
	self.height = h

	self.color = red
end

function Box:draw()
	-- love.graphics.setColor(255, 0, 0)
	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Box:bump_whole()
	if self.color == red then
		self.color = blue
	else
		self.color = red
	end
end

function Box:bump_half()
	if self.color == red then
		self.color = blue
	else
		self.color = red
	end
end

function Box:bump_quarter()
	if self.color == red then
		self.color = blue
	else
		self.color = red
	end
end

function Box:bump_eigth()
	if self.color == red then
		self.color = blue
	else
		self.color = red
	end
end

