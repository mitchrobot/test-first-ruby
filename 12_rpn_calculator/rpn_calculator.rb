class RPNCalculator

	attr_reader :value, :stack

	def initialize
		@value = 0
		@stack = Array.new
	end

	def push(number)
		@stack.push number
	end

	def plus
		num = get_values
		@stack.push (num[0] + num[1])
		@value = @stack.last
	rescue Exception => e
	end

	def minus
		num = get_values
		@stack.push (num[0] - num[1])
		@value = @stack.last
	end

	def times
		num = get_values
		@stack.push (num[0] * num[1])
		@value = @stack.last
	end

	def divide
		num = get_values
		@stack.push (num[0].to_f / num[1].to_f)
		@value = @stack.last
	end

	def tokens
	end

	def evaluate
	end

	def get_values
		if @stack.length > 1
			val2 = @stack.last
			@stack.pop
			val1 = @stack.last
			@stack.pop
		# elsif @stack.length == 1
		# 	val2 = @stack.last
		# 	@stack.pop
		# 	val1 = @value
		else
			error_empty
		end
		return [val1, val2]
	end

	def error_empty
		begin
			raise "calculator is empty"
		rescue
			puts "calculator is empty"
		end
	end
end