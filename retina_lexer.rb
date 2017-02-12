require_relative 'clases'

class Lexer
	attr_reader :tokens

	def initialize input
		@tokens = []
		@input = input
		@lin = 0
		@col = 0
	end

	def catch_lexeme
		# Return nil si el input esta vacio
		return if @input.empty?
		# Ignorar todos los espacios en blanco al comienzo
		@input =~ /\A\s*/
		@input = $'
		# Inicializar con error en caso de que no haga match
		class_to_be_instanciated = LexicographicError # Yes, this is class. Amaze here
		# Verificar match con cada key y value
		$tokens.each do |k,v|
			if @input =~ v
				class_to_be_instanciated = Object::const_get(k)
				break
			end
		end
		# Mostrar primer error encontrado
		if $&.nil? and class_to_be_instanciated.eql? LexicographicError
			@input =~ /\A(\w|\p{punct})/
			raise LexicographicError.new($&)
		end
		# Añadir token a la lista de tokens
		@tokens << class_to_be_instanciated.new($&,@lin,@col)
		# Actualizar input
		@input = @input[$&.length..@input.length-1]
		# Retornar token encontrado
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