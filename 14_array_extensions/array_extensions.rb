class Array

	def sum
		return 0 if self.length < 1
		self.inject(0) { | addend, sum | sum += addend }
	end

	def square
		copy = self # Necessary to prevent user from manipulating original array?
		return copy if self.length < 1
		self.map { | x | x**2 }
	end

	def square!
		return self if self.length < 1
		self.map! { | x | x**2 }
	end
end
