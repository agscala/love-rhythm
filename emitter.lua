require "rhythmaware"
require "math"
require "particle"

Emitter = class("Emitter")
Emitter:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function Emitter:initialize(x, y)
	self.x = x
	self.y = y

	self.particles = {}
	print("NEW EMITTER")
end

function Emitter:draw()
	for i, particle in ipairs(self.particles) do
		particle:draw()
	end
end

function Emitter:update(dt)
	for i, particle in ipairs(self.particles) do
		particle:update(dt)
	end
end

_angle_whole = 0
function Emitter:bump_whole()
	local angle = (_angle_whole) % 360
	local angle_radians = math.rad(angle)
	table.insert(self.particles, Particle:new(self.x, self.y, angle_radians, 1.0))

	_angle_whole = _angle_whole + 2
end

_angle_half = 0
function Emitter:bump_half()
	local angle = (_angle_half) % 360
	local angle_radians = math.rad(angle)
	table.insert(self.particles, Particle:new(self.x, self.y, angle_radians, 1.0))

	_angle_half = _angle_half + 2
end

_angle_quarter = 0
function Emitter:bump_quarter()
	local angle = (_angle_quarter) % 360
	local angle_radians = math.rad(angle)
	table.insert(self.particles, Particle:new(self.x, self.y, angle_radians, 1.0))

	_angle_quarter = _angle_quarter + 2
end

_angle_eigth = 0
function Emitter:bump_eigth()
	local angle = (_angle_eigth) % 360
	local angle_radians = math.rad(angle)
	table.insert(self.particles, Particle:new(self.x, self.y, angle_radians, 1.0))

	_angle_eigth = _angle_eigth + 2
end


