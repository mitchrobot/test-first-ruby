class XmlDocument

	attr_reader :xml

	def initialize(indents_active = false)
		@xml = ''
		@indent = 0
		@indents_active = indents_active
	end

	def method_missing(sym, *args, &block)
		if block_given?
			open_opening_tag({:name => sym, :parameters => args})
			close_tag
			add_indent
			@xml << yield
			decrease_indent
			add_linebreak
			open_closing_tag({:name => sym})
		else
			open_opening_tag({:name => sym, :parameters => args})
			close_single_tag
		end
		@xml
	end

	# def create_tag
	# end

	def increase_indent
		@indent += 2 if @indents_active == true
	end

	def decrease_indent
		@indent += (-2) if @indents_active == true
		@indent = 0 if @indent < 0
	end

	def add_indent
		@indent.times do
			@xml << ' '
		end
	end

	def add_linebreak
		@xml << "\n" if @indents_active == true
	end

	def include_parameters(parameters)
		parameters.each do | pairs |
			pairs.each do | parameter, value |
				@xml << " #{parameter}='#{value}'"
			end
		end
	end

	def open_opening_tag(args)
		# Create tag
		# Add linebreak
		add_indent
		@xml << "<#{args[:name]}"
		include_parameters(args[:parameters]) # Passes array of hashes in parameter-value pairs
	end

	def close_single_tag
		@xml << "/>"
		add_linebreak
	end

	def close_tag
		@xml << ">"
		add_linebreak
		increase_indent
	end

	def open_closing_tag(args)
		# Decrease indent
		# Create close tag
		# Add linebreak
		decrease_indent
		@xml << "</#{args[:name]}>"
		add_linebreak
	end

	def reset
		@xml = ''
	end

end