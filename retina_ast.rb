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
		puts "#{indent}#{self.class}: #{@digito.t}"
	end
end

class Identificador < AST
	attr_accessor :texto

	def initialize txt
			@texto = txt.t
	end

	def print_ast indent=""
			puts "#{indent}Identificador: #{@texto}"
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
		@id = i
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
	attr_accessor :id, :from, :to, :by, :bloque

	def initialize i,f,t,by,bl=nil
		@id = Identificador.new(i)
		@from = Numero.new(f)
		@to = t
		if bl != nil
			@by = Numero.new(by)
			@bloque = bl
			puts "#{bl}"
		else
			@by = nil
			@bloque = Bloque_Cod.new(by,nil)
		end
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		@id.print_ast indent + "  " if @id.respond_to? :print_ast

		puts "#{indent}From:"
		@from.print_ast indent + "  " if @from.respond_to? :print_ast

		puts "#{indent}To:"
		@to.print_ast indent + "  " if @to.respond_to? :print_ast

		if @by != nil
			puts "#{indent}By:"
			@by.print_ast indent + "  " if @by.respond_to? :print_ast
		end	

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
		@nombre = n.t
	end

	def print_ast indent=""
			puts "#{indent}Booleano: #{@nombre}"
	end
end	

class With < AST
	attr_accessor :decl, :bloque

	def initialize d,b
		@decl = d
		@bloque = b
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		indent += "  "

		@decl.print_ast indent if @decl.respond_to? :print_ast

		puts "#{indent}Bloque:"
		@bloque.print_ast indent + "  " if @bloque.respond_to? :print_ast
	end
end	

class Bloque_Cod < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end

class Multiple < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end

class Multiple_Func < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end

class Funcion < AST
	attr_accessor :id, :arg, :tipo, :bloque, :ret

	def initialize i,a,b,t=nil,r=nil
		@id = i
		@arg = a
		@tipo = t
		@bloque = b
		@ret = r
	end

	def print_ast indent=""
		puts "#{indent}#{self.class}:"

		indent += "  "

		@id.print_ast indent if @id.respond_to? :print_ast

		if @arg != nil	
			@arg.print_ast indent if @arg.respond_to? :print_ast
		end

		if @tipo != nil	
			@tipo.print_ast indent if @tipo.respond_to? :print_ast
		end

		puts "#{indent}Bloque:"
		@bloque.print_ast indent + "  " if @bloque.respond_to? :print_ast

		if @ret != nil
			puts "#{indent}Retorno:"
			@ret.print_ast indent + "  " if @ret.respond_to? :print_ast
		end
	end
end	

class Multiple_Arg < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end

class Multiple_Prog < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end

class Multiple_Par < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end

class Llamada < AST
	attr_accessor :id, :par

	def initialize i,a=nil
		@id = i
		@par = a
	end

	def print_ast indent=""
		puts "#{indent}#{self.class} a funcion:"

		indent += "  "

		@id.print_ast indent + "  " if @id.respond_to? :print_ast

		if @par != nil
			puts "#{indent}Parametros:"
			@par.print_ast indent + "  " if @par.respond_to? :print_ast
		end
	end
end

class Multiple_Imp < OperacionBinaria
	def print_ast indent=""
		attrs.each do |a|
			a.print_ast indent if a.respond_to? :print_ast
		end
	end
end	

class Cadena < AST
	attr_accessor :texto

	def initialize txt
			@texto = txt.t
	end

	def print_ast indent=""
			puts "#{indent}Cadena: #{@texto}"
	end
end

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
class MenosUnario < OperacionUnaria; end
class Begin < PalabraReservada; end
class Flecha_Arg < Signo; end
class Return < PalabraReservada; end
class Read < OperacionUnaria; end
class Write < OperacionUnaria; end
class Writeln < OperacionUnaria; end