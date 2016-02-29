def reverser
	phrase = yield
	words = phrase.split
	
	words.map! do |word|
		word.reverse
	end

	result = words.join(' ')
end

def adder(addend = 1)
	number = yield
	number + addend
end

def repeater(amount = 1)
	amount.times do
		yield
	end
end
