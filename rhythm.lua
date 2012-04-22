require "middleclass"
require "timeout"

local RhythmManager = class("RhythmManager")

function RhythmManager:update(dt)
	if self.is_running then
		self.rate = dt
		self.total_elapsed = self.total_elapsed + dt

		self.timeout_whole:update(dt)
		self.timeout_half:update(dt)
		self.timeout_quarter:update(dt)
		self.timeout_eigth:update(dt)

		self:notify_whole()
		self:notify_half()
		self:notify_eigth()
		self:notify_quarter()
	end
end

function RhythmManager:notify_whole()
	if self.timeout_whole:is_ready() then
		self.timeout_whole:continue()
		-- print("WHOLE")
		for i, subscriber in ipairs(self.subscribers) do
			-- print(subscriber.do_bump_whole)
			if subscriber.do_bump_whole then
				subscriber:bump_whole()
			end
		end
	end
end

function RhythmManager:notify_half()
	if self.timeout_half:is_ready() then
		self.timeout_half:continue()
		-- print("HALF")
		for i, subscriber in ipairs(self.subscribers) do
			-- print(subscriber.do_bump_half)
			if subscriber.do_bump_half then
				subscriber:bump_half()
			end
		end
	end
end

function RhythmManager:notify_quarter()
	if self.timeout_quarter:is_ready() then
		self.timeout_quarter:continue()
		-- print("QUARTER")
		for i, subscriber in ipairs(self.subscribers) do
			if subscriber.do_bump_quarter then
				subscriber:bump_quarter()
			end
		end
	end
end

function RhythmManager:notify_eigth()
	if self.timeout_eigth:is_ready() then
		self.timeout_eigth:continue()
		-- print("EIGTH")
		for i, subscriber in ipairs(self.subscribers) do
			if subscriber.do_bump_eigth then
				subscriber:bump_eigth()
			end
		end
	end
end

function RhythmManager:initialize(bpm)
	self.bpm = bpm
	self.beat_length = 60 / bpm
	self.rate = 0
	self.total_elapsed = 0
	self.is_running = true

	self.subscribers = {}

	self.timeout_whole = Timeout(self.beat_length)
	self.timeout_half = Timeout(self.beat_length / 2)
	self.timeout_quarter = Timeout(self.beat_length / 4)
	self.timeout_eigth = Timeout(self.beat_length / 8)
end

function RhythmManager:pause()
	self.is_running = false
end

function RhythmManager:stop()
	self.is_running = false

	self.timeout_whole:restart(dt)
	self.timeout_half:restart(dt)
	self.timeout_quarter:restart(dt)
	self.timeout_eigth:restart(dt)
end

function RhythmManager:start()
	self.is_running = true
end

function RhythmManager:restart()
	self:stop()
	self:start()
end

function RhythmManager:subscribe(object)
	table.insert(self.subscribers, object)
end

function RhythmManager:beat_accuracy(beat_size)
	local beat_size = beat_size or 1.0
	beat_size = self.beat_length * beat_size

	local beat_offset = math.fmod(self.total_elapsed, beat_size)
	beat_offset = math.max(beat_offset, beat_size - beat_offset)
	return math.ceil(100 * beat_offset / beat_size)
end

function RhythmManager:is_beat(beat_size)
	local beat_size = beat_size or 1.0

	if self:beat_accuracy(beat_size) >= 98 then
		return true
	else
		return false
	end
end

Rhythm = RhythmManager:new(96)

