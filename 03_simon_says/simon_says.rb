def echo(text)
	text
end

def shout(text)
	text.upcase
end

def repeat(text, count = 2)
	result = text
	repeats = count - 1
	repeats.times do
		result += ' ' + text
	end
	result
end

def start_of_word(word, letters = 1)
	word.slice(0,letters)
end

def first_word(text)
	words = text.split
	return words[0]
end

def titleize(title)
	words = title.split
	list = ["a", "the", "of", "an", "and", "over"]

	words.map! do |x|
		if !list.include? x.downcase
			x.capitalize
		else
			x.downcase
		end
	end

	words[0] = words[0].capitalize # Make sure 1st word is caplitalized no matter what it is

	result = words.join(' ')
	result
end