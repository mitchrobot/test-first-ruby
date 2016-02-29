class Friend

	def greeting(name = "")
		result = "Hello, #{name}!" if !name.empty?
		result = "Hello!" if name.empty?
		result
	end

end