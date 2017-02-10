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

class Digito < AST
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

class Texto < AST
	attr_accessor :Texto

	def initialize tx
		@texto = tx
	end
end

class TkAsignacion < OperacionBinaria; end
class TkPuntoComa < Signo; end
class TkAbreParentesis < Signo; end
class TkCierraParentesis < Signo; end
class TkDiv < OperacionBinaria; end
class TkMod < OperacionBinaria; end
class TkResta < OperacionBinaria; end
class TkModulo < OperacionBinaria; end
class TkSuma < OperacionBinaria; end
class TkMultiplicacion < OperacionBinaria; end
class TkDivision < OperacionBinaria; end
class TkComa < Signo; end
class TkAnd < OperacionBinaria; end
class TkNot < OperacionUnaria; end
class TkOr < OperacionBinaria; end
class TkMayorEstricto < OperacionBinaria; end
class TkMenorEstricto < OperacionBinaria; end
class TkEquivalencia < OperacionBinaria; end
class TkInequivalencia < OperacionBinaria; end
class TkMayorIgual < OperacionBinaria; end
class TkMenorIgual < OperacionBinaria; end
class TkNumber < PalabraReservada; end
class TkBoolean < PalabraReservada; end
class TkProgram < PalabraReservada; end
class TkWith < PalabraReservada; end
class TkDo < PalabraReservada; end
class TkEnd < PalabraReservada; end
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
class TkId < Texto; end
class TkNum < Digito; end