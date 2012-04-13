require "middleclass"
require "timeout"

local RhythmManager = class("RhythmManager")

function RhythmManager:update(dt)
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

function RhythmManager:notify_whole()
	if self:is_beat(1.0) and self.timeout_whole:is_ready() then
		print("WHOLE")
		for i, subscriber in ipairs(self.subscribers) do
			subscriber:bump_whole()
		end
	end
end

function RhythmManager:notify_half()
	if self:is_beat(0.5) and self.timeout_half:is_ready() then
		print("HALF")
		for i, subscriber in ipairs(self.subscribers) do
			subscriber:bump_half()
		end
	end
end

function RhythmManager:notify_quarter()
	if self:is_beat(0.25) and self.timeout_quarter:is_ready() then
		print("QUARTER")
		for i, subscriber in ipairs(self.subscribers) do
			subscriber:bump_quarter()
		end
	end
end

function RhythmManager:notify_eigth()
	if self:is_beat(0.125) and self.timeout_eigth:is_ready() then
		print("EIGTH")
		for i, subscriber in ipairs(self.subscribers) do
			subscriber:bump_eighth()
		end
	end
end

function RhythmManager:initialize(bpm)
	self.bpm_in_secs = 60 / bpm
	self.rate = 0
	self.total_elapsed = 0

	self.subscribers = {}

	self.timeout_whole = Timeout(self.bpm_in_secs / 2)
	self.timeout_half = Timeout(self.bpm_in_secs / 4)
	self.timeout_quarter = Timeout(self.bpm_in_secs / 8)
	self.timeout_eigth = Timeout(self.bpm_in_secs / 16)
end

function RhythmManager:pause()
end

function RhythmManager:resume()
end

function RhythmManager:subscribe(object)
	table.insert(self.subscribers, object)
end

function RhythmManager:beat_accuracy(beat_size)
	local beat_size = beat_size or 1.0
	beat_size = self.bpm_in_secs * beat_size

	local beat_offset = math.fmod(self.total_elapsed, beat_size)
	beat_offset = math.max(beat_offset, beat_size - beat_offset)
	return math.ceil(100 * beat_offset / beat_size)
end

function RhythmManager:is_beat(beat_size)
	local beat_size = beat_size or 1.0

	if self:beat_accuracy(beat_size) >= 99 then
		return true
	else
		return false
	end
end

Rhythm = RhythmManager:new(60)

