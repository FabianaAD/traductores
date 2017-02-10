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

class Identificador < AST
	attr_accessor :id

	def initialize i
		@id = i
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}: #{@id}"
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

class Declaracion < AST
	attr_accessor :nombre, :id, :valor
	
	def initialize n, i, v=nil
		@nombre = n
		@id = Identificador.new(i.t)
		@valor = v
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		indent += "  "

		@nombre.print_ast indent if @nombre.respond_to? :print_ast

		@id.print_ast indent if @id.respond_to? :print_ast

		# Si hay dos bloques de instrucciones
		if @valor != nil
			puts "#{indent}Valor:"
			@valor.print_ast indent + "  " if @valor.respond_to? :print_ast	
		end
	end
end

class Number < AST
	def print_ast indent=""
		puts "#{indent}Tipo: number"
	end
end

class Boolean < AST
	def print_ast indent=""
		puts "#{indent}Tipo: boolean"
	end
end

class If < AST
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

class While < AST
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

class For < AST
	attr_accessor :id, :from, :to, :bloque

	def initialize i,f,t,b
		@id = Identificador.new(i)
		@from = Numero.new(f)
		@to = Numero.new(t)
		@bloque = b
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		@id.print_ast indent + "  " if @id.respond_to? :print_ast

		puts "#{indent}From:"
		@from.print_ast indent + "  " if @from.respond_to? :print_ast

		puts "#{indent}To:"
		@to.print_ast indent + "  " if @to.respond_to? :print_ast

		puts "#{indent}Bloque:"
		@bloque.print_ast indent + "  " if @bloque.respond_to? :print_ast
	end
end

class Repeat < AST
	attr_accessor :n, :bloque

	def initialize n,b
		@n = Numero.new(n)
		@bloque = b
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		puts "#{indent}Times:"
		@n.print_ast indent + "  " if @n.respond_to? :print_ast

		puts "#{indent}Bloque:"
		@bloque.print_ast indent + "  " if @bloque.respond_to? :print_ast
	end
end

class Booleano < AST
	attr_accessor :nombre

	def initialize n
		@nombre = n
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
class Then < PalabraReservada; end
class Else < PalabraReservada; end
class Do < PalabraReservada; end
class From < PalabraReservada; end
class To < PalabraReservada; end
class Times < PalabraReservada; end
class AbreParentesis < Signo; end
class CierraParentesis < Signo; end
class Coma < Signo; end
class True < Booleano; end
class False < Booleano; end

# Clases por arreglar
class TkWith < PalabraReservada; end
class TkBegin < PalabraReservada; end
class TkFunc < PalabraReservada; end