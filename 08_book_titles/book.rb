class Book

	attr_reader :title

	def title=(phrase)
		@title = format_title(phrase)
	end

	# def title
	# 	@title
	# end

	def format_title(phrase)
		words = phrase.split
		
		words.map! do |x|
			format_word(x)
		end

		words[0] = words[0].capitalize

		words.join(' ')
	end

	def format_word(word)
		small_words = ["the", "a", "an", "and", "in", "of"]

		return word.capitalize if !small_words.include?(word)
		word
	end

end