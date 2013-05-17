require "rhythm"
require "rhythmaware"
require "math"
require "box"

Player = class("Player")
Player:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

local MAX_VELOCITY = 2.9
local MAX_DRIVING_ANGLE = 2
local MAX_POWERSLIDE_ANGLE = 60

function Player:initialize(x, y)
	self.x = x
	self.y = y
	self.body = Box:new(self.x, self.y, 5, 5)

	self.velocity = 0.0
	self.angle = 0
	self.current_turn_angle = 0
end

function Player:move(key)
end

function Player:draw()
	love.graphics.setColor(255, 255, 255, alpha)
	love.graphics.rectangle("fill", self.x, self.y, 5, 5)
end

function Player:update(dt)
	if love.keyboard.isDown("right") then
		self.current_turn_angle = 1

		if love.keyboard.isDown("z") then
			self.current_turn_angle = 2
		end

	elseif love.keyboard.isDown("left") then
		self.current_turn_angle = -1
		if love.keyboard.isDown("z") then
			self.current_turn_angle = -2
		end
	else
		self.current_turn_angle = 0
	end

	self.angle = self.angle + self.current_turn_angle

	if love.keyboard.isDown("up") then
		self.velocity = (self.velocity + 0.7)
		if self.velocity > MAX_VELOCITY then
			self.velocity = MAX_VELOCITY
		end

	elseif love.keyboard.isDown("down") then
		if self.velocity < 2.0 then
			self.velocity = 0
		else
			self.velocity = self.velocity - 2.0
		end

	else
		-- TODO lock to nearest 10 degree if not turning and velociity < X?
		if self.velocity < 1.0 then
			self.velocity = 0
		else
			self.velocity = self.velocity - 0.1
		end
	end

	radians = math.rad(self.angle)
	self.x = self.x + math.cos(radians) * self.velocity
	self.y = self.y + math.sin(radians) * self.velocity
end

function Player:bump_eigth()
end

