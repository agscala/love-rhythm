require "middleclass"

GridRender = class("GridRender")
GridRender:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function GridRender:initialize(x, y, cell_width, cell_height)
	self.x = x
	self.y = y
	self.cell_width
	self.cell_height

	self.grid = {}
end

function GridRender:set_grid(grid)
	self.grid = grid
end

function GridRender:draw()
	local width = self.cell_width * self.grid.num_columns
	local height = self.cell_height * self.grid.num_rows

	-- top
	love.graphics.line(self.x, self.y,
		self.x + width, self.y)

	-- left
	love.graphics.line(self.x, self.y,
		self.x, self.y + height)

	-- bottom
	love.graphics.line(self.x, self.y + height,
		self.x + width, self.y + height)

	-- right
	love.graphics.line(self.x + width, self.y,
		self.x + width, self.y + height)

		self.y + self.cell_width * grid.num_columns)
	for column = 1, self.num_columns do
		local x_pos = self.x + (column - 1) * self.cell_width
	end
end

