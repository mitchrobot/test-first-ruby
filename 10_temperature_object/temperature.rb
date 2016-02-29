class Temperature

	attr_accessor :c, :f

	def initialize(args = {})
		@f = args[:f]
		@c = args[:c]
		get_fahrenheit
		get_celsius
	end

	def get_fahrenheit
		if @f.nil? && !@c.nil?
			@f = @c * (9/5.0) + 32
		end
	end

	def get_celsius
		if @c.nil? && !@f.nil?
			@c = (@f - 32) * (5/9.0)
		end
	end

	def in_fahrenheit
		@f
	end

	def in_celsius
		@c
	end

	def Temperature.from_celsius(temp)
		Temperature.new(:c => temp)
	end

	def Temperature.from_fahrenheit(temp)
		Temperature.new(:f => temp)
	end

end

# class Celcius < Temperature
# 	def initialize(temp)
# 		Temperature.new(:c => temp)
# 	end
# end

# class Fahrenheit < Temperature
# 	Temperature.new(:f => temp)
# end