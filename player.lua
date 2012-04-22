require "rhythm"
require "rhythmaware"
require "math"
require "box"

Player = class("Player")
Player:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function Player:initialize(x, y)
	self.x = x
	self.y = y
	self.direction_y = 0
	self.body = Box:new(self.x, self.y, 5, 5)
end

function Player:move(key)
end

function Player:draw()
	love.graphics.setColor(255, 255, 255, alpha)
	love.graphics.rectangle("fill", self.x, self.y, 5, 5)
end

function Player:update(dt)
	if love.keyboard.isDown("up") then
		self.direction_y = -1
	elseif love.keyboard.isDown("down") then
		self.direction_y = 1
	else
		self.direction_y = 0
	end

	self.y = self.y + 10 * self.direction_y
end

function Player:bump_eigth()
end

