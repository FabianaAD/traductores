require_relative 'clases'

class Lexer
	attr_reader :tokens

	def initialize input
		@tokens = []
		@input = input
	end

	def catch_lexeme
		# Return nil si el input esta vacio
		return if @input.empty?
		# Ignorar todos los espacios en blanco al comienzo
		@input =~ /\A\s*/
		@input = $'
		# Local variable initialize with error, if all regex don't succeed
		class_to_be_instanciated = LexicographicError # Yes, this is class. Amaze here
		# For every key and value, check if the input match with the actual regex
		$tokens.each do |k,v|
			if @input =~ v
				# Taking advantage with the reflexivity and introspection of the
				# language is nice
				puts v
				class_to_be_instanciated = Object::const_get(k)
				break
			end
		end
		# Raise first error founded
		if $&.nil? and class_to_be_instanciated.eql? LexicographicError
			@input =~ /\A(\w|\p{punct})/
			raise LexicographicError.new($&)
		end
		# Append token found to the token list
		@tokens << class_to_be_instanciated.new($&)
		# Update input
		@input = @input[$&.length..@input.length-1]
		# Return token found
		return @tokens[-1]
	end

	def imprimir_tokens
		for i in (0..@tokens.length-1)
			#@tokens[i].prnt
			puts @tokens[i]
			puts "\n"
		end
	end
end