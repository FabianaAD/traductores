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
	
	def initialize n, i, v=nil
		@nombre = n
		@id = i
		@valor = v
	end
end

class Id < AST
	attr_accessor :id

	def initialize i
		@id = i
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}: #{@d}"
	end
end

class NodoIf < AST
	attr_accessor :cond, :inst1, :inst2

	def initialize c, i1, i2=nil
		@cond = c
		@inst1 = i1
		@inst2 = i2
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		indent += "  "
		puts "#{indent}Condicion:"
		@cond.print_ast indent + "  " if @cond.respond_to? :print_ast

		puts "#{indent}Bloque then:"
		@inst1.print_ast indent + "  " if @inst1.respond_to? :print_ast

		# Si hay dos bloques de instrucciones
		if @inst2 != nil
			puts "#{indent}Bloque else:"
			@inst2.print_ast indent + "  " if @inst2.respond_to? :print_ast	
		end
	end
end	

class NodoWhile < AST
	attr_accessor :cond, :inst

	def initialize c, i
		@cond = c
		@inst = i
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		indent += "  "
		puts "#{indent}Condicion:"
		@cond.print_ast indent + "  " if @cond.respond_to? :print_ast

		puts "#{indent}Bloque:"
		@inst.print_ast indent + "  " if @inst.respond_to? :print_ast
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
class Identificador < Id; end
class If < NodoIf; end
class Then < PalabraReservada; end
class Else < PalabraReservada; end
class While < NodoWhile; end
class Do < PalabraReservada; end

# Clases por arreglar
class TkAbreParentesis < Signo; end
class TkCierraParentesis < Signo; end
class TkComa < Signo; end
class TkWith < PalabraReservada; end
class TkTimes < PalabraReservada; end
class TkFor < PalabraReservada; end
class TkFrom < PalabraReservada; end
class TkTo < PalabraReservada; end
class TkRepeat < PalabraReservada; end
class TkBegin < PalabraReservada; end
class TkFunc < PalabraReservada; end
class TkTrue < PalabraReservada; end
class TkFalse < PalabraReservada; end