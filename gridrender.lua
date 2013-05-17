require "middleclass"

GridRender = class("GridRender")
GridRender:include(RhythmAware)

function GridRender:initialize(x, y, cell_width, cell_height, grid)
	self.x = x
	self.y = y
	self.cell_width = cell_width
	self.cell_height = cell_height
	self.grid = grid

	self.cell = Cell:new(self.x, self.y - self.cell_height, self.cell_height, self.cell_width)
end

function GridRender:set_grid(grid)
	self.grid = grid
end

function GridRender:draw()
	local width = self.cell_width * self.grid.num_columns
	local height = self.cell_height * self.grid.num_rows

	love.graphics.rectangle("line", self.x, self.y, width, height)

	for column = 1, self.grid.num_columns do
		for row = 1, self.grid.num_rows do
			local x_pos = self.x + (column - 1) * self.cell_width
			local y_pos = self.y + (row - 1) * self.cell_height

			-- love.graphics.rectangle("line", x_pos, y_pos,
				-- self.cell_width, self.cell_height)
		end
	end

	self.cell:draw()
end

function GridRender:update(dt)
	if love.keyboard.isDown("left") then
		if self.cell.column > 1 then
			self.cell:move_left()
		end
	elseif love.keyboard.isDown("right") then
		if self.cell.column < self.grid.num_columns then
			self.cell:move_right()
		end
	end

	self.cell:update(dt)

	local max_y = self.y + self.cell_height * (self.grid.num_rows - 1)
	if self.cell.y < max_y then
		self.cell:drop(dt)
	else
		self.cell.y = max_y
		self.grid:add_cell(self.cell)
	end
end

