class Dictionary
	attr_reader :entries

	def initialize(args = {})
		@entries = {}
	end

	def keywords
		@entries.keys.sort
	end

	def printable
		result = ''
		@entries.sort.each do |key, value|
			result += "[#{key}] \"#{value}\"\n"
		end
		result.slice(0..(result.length - 2))
	end

	def add(entry)
		if entry.is_a? Hash
			entry.each do |word, definition|
				@entries[word] = definition
			end
		end

		if entry.is_a? String
			@entries[entry] = nil
		end	
	end

	def include?(word)
		@entries.include?(word)
	end

	def find(word)
		@entries.select { |key, value| key =~ /\A#{word}/ }
	end

end

# d = Dictionary.new
# d.add('fish' => 'swimming animal')
# d.add('fish')
# puts d.entries
# puts d.find('fi')