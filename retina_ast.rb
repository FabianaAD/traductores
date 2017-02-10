class AST
	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		attrs.each do |a|
			a.print_ast indent + "  " if a.respond_to? :print_ast
		end
	end

	def attrs
		instance_variables.map do |a|
			instance_variable_get a
		end
	end
end

class Numero < AST
	attr_accessor :digito

	def initialize d 
		@digito = d
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}: #{@digito.to_i}"
	end
end

class OperacionUnaria < AST
	attr_accessor :operando

	def initialize operando
		@operando = operando
	end
end

class OperacionBinaria < AST
	attr_accessor :izquierda, :derecha

	def initialize iz, de
		@izquierda = iz
		@derecha = de
	end
end

class Signo < AST
	attr_accessor :signo

	def initialize s 
		@signo = s
	end
end

class PalabraReservada < AST
	attr_accessor :palabra

	def initialize pa
		@palabra = pa
	end
end

class Tipo < AST
	attr_reader :nombre, :id, :valor
	
	def initialize nombre, id, valor=""
		@nombre = nombre
		@id = id
		@valor = valor
	end
end

class Texto < AST
	attr_accessor :Texto

	def initialize tx
		@texto = tx
	end
end

# Clases arregladas
class Igual < OperacionBinaria; end
class Suma < OperacionBinaria; end
class Resta < OperacionBinaria; end
class Multiplicacion < OperacionBinaria; end
class Division_Exacta < OperacionBinaria; end
class Resto_Exacto < OperacionBinaria; end
class Division_Entera < OperacionBinaria; end
class Resto_Entero < OperacionBinaria; end
class Negado < OperacionUnaria; end
class Conjuncion < OperacionBinaria; end
class Disyuncion < OperacionBinaria; end
class Mayor_Estricto < OperacionBinaria; end
class Menor_Estricto < OperacionBinaria; end
class Mayor_Igual < OperacionBinaria; end
class Menor_Igual < OperacionBinaria; end
class Equivalencia < OperacionBinaria; end
class Inequivalencia < OperacionBinaria; end
class Inicio < PalabraReservada; end
class Fin < PalabraReservada; end
class Punto_Coma < Signo; end
class Number < Tipo; end
class Boolean < Tipo; end
class Identificador < Texto; end

# Clases por arreglar
class TkAbreParentesis < Signo; end
class TkCierraParentesis < Signo; end
class TkComa < Signo; end
class TkWith < PalabraReservada; end
class TkDo < PalabraReservada; end
class TkTimes < PalabraReservada; end
class TkIf < PalabraReservada; end
class TkThen < PalabraReservada; end
class TkElse < PalabraReservada; end
class TkWhile < PalabraReservada; end
class TkFor < PalabraReservada; end
class TkFrom < PalabraReservada; end
class TkTo < PalabraReservada; end
class TkRepeat < PalabraReservada; end
class TkBegin < PalabraReservada; end
class TkFunc < PalabraReservada; end
class TkTrue < PalabraReservada; end
class TkFalse < PalabraReservada; end