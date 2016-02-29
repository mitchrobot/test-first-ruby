class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		secs = @seconds
		hours = 0
		minutes = 0

		if secs >= 3600 # 3600 seconds in an hour
			hours = secs / 3600
			secs = secs - (hours * 3600)
		end

		if secs >= 60 # 60 seconds in a minute
			minutes = secs / 60
			secs = secs - (minutes * 60)
		end

		"#{padded(hours)}:#{padded(minutes)}:#{padded(secs)}"
	end

	def padded(number)
		return "0#{number.to_s}" if (number > (-1)) && (number < 10)
		return number.to_s if number > 9
	end
end
