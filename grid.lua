require "middleclass"
local list = require "pl.list"

Grid = class("Grid")
Grid:include(RhythmAware)

local red = { 255, 0, 0 }
local blue = { 0, 0, 255 }

function Grid:initialize(num_columns, num_rows)
	self.num_columns = num_columns
	self.num_rows = num_rows

	self.grid = {}
	-- self.active_cells = list.List.new()
	-- self.frozen_cells = list.List.new()

	for column = 1, self.num_columns do
		self.grid[column] = {}
	end
end

function Grid:add_cell(cell)
	if cell.column <= self.num_columns then
		-- table.insert(self.grid[column], cell)
	end
end

function Grid:get_all_cells()
	local all_cells = {}

	for column = 1, self.num_columns do
	end

	return all_cells
end

function Grid:column_full(column)
	return table.getn(self.grid[column]) < self.num_rows
end

function Grid:num_cells_in_column(column)
	return table.getn(self.grid[column])
end

