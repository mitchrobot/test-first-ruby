def add(augend, addend)
	augend + addend
end

def subtract(number1, number2)
	number1 - number2
end

def sum(numbers)
	return false if !numbers.is_a? Array
	return 0 if numbers.empty?
	numbers.inject(0) { |sum, x| sum + x }
end

def multiply(number1, *numbers)
	result = 1
	result = result * number1
	numbers.each do |x|
		result = result * x
	end
	result
end

def power(number, power)
	number ** power
end

def factorial(number)
	return 1 if number == 0
	result = 1
	number.times do |i|
		result = result * (i + 1)
	end
	result
end