require "middleclass"
require "timeout"

Cell = class("Cell")

function Cell:initialize(x, y, cell_width, cell_height)
	self.x = x
	self.y = y
	self.cell_width = cell_width
	self.cell_height = cell_height

	self.velocity_y = 100
	self.velocity_x = 500

	self.move_timer = Timeout(0.05)
	self.grid_column = 1
end

function Cell:draw()
	love.graphics.rectangle("line", self.x, self.y, self.cell_width, self.cell_height)
end

function Cell:update(dt)
	self.move_timer:update(dt)
end

function Cell:drop(dt)
	self.y = self.y + self.velocity_y * dt
end

function Cell:move_left()
	if self.move_timer:is_ready() then
		self.x = self.x - self.cell_width
		self.grid_column = self.grid_column - 1

		self.move_timer:restart()
	end
end

function Cell:move_right()
	if self.move_timer:is_ready() then
		self.x = self.x + self.cell_width
		self.grid_column = self.grid_column + 1

		self.move_timer:restart()
	end
end

