'''
- Fabiana Acosta; 10-10005
- Gianni Manilia; 12-10903
'''

#!/user/bin/ruby
require 'set'

class Token
	attr_reader :nombre,:l,:c,:cont
	
	def initialize (nombre,linea,columna,cont)
		@nombre = nombre
		@l = linea
		@c = columna
		@cont = cont
	end

	def printT 
		print "linea #{l}, columna #{c}: #{nombre} '#{cont}'\n"
	end
end

class TokenInt < Token
	def initialize (linea,columna,cont)
		@nombre = "literal numérico"
		@l = linea
		@c = columna
		@cont = cont
	end
end

class TokenPalC < Token
	def initialize (linea,columna,cont)
		@nombre = "palabra reservada"
		@l = linea
		@c = columna
		@cont = cont
	end
end

class TokenId < Token
	def initialize (linea,columna,cont)
		@nombre = "identificador"
		@l = linea
		@c = columna
		@cont = cont
	end
end	

class TokenCad < Token
	def initialize (linea,columna,cont)
		@nombre = "string"
		@l = linea
		@c = columna
		@cont = cont
	end
end	

class TokenSig < Token
	def initialize (linea,columna,cont)
		@nombre = "signo"
		@l = linea
		@c = columna
		@cont = cont
	end
end

class TokenInesperado < Token
	def initialize (linea,columna,cont)
		@nombre = "caracter inesperado"
		@l = linea
		@c = columna
		@cont = cont
	end
end

def verificar(t,l,c)
	signos = Set.new ["=",";","(",")","div","mod","-","%","+","*","/","and","not","or","/=",">=","<=",">","<"]
	t = t.split[0]
	
	if !t.nil?

		#Tam con el que ingreso t para verificar luego
		tam = t.length
		tam_aux = tam

		# Identificador
		identificador = /\A([a-z])(\w)*/.match(t)
		# Número
		numero = /\A(\d)+(.(\d)+)?/.match(t)
		# Palabra reservada
		palabra_reservada = /program|with|do|end|times|if|then|else|while|for|from|to|repeat|begin|func|true|false/.match(t)
		# Cadena de caracteres
		cadena_caracteres = /"(\w)*"/.match(t)

		# El token es un número
		if !numero.nil?
			token = TokenInt.new(l,c,numero)
			tam_aux = numero.to_s.length
		# El token es una palabra reservada
		elsif !palabra_reservada.nil?
			token = TokenPalC.new(l,c,palabra_reservada)
			tam_aux = palabra_reservada.to_s.length
		# El token es un identificador
		elsif !identificador.nil?
			token = TokenId.new(l,c,identificador)
			tam_aux = identificador.to_s.length
		# El token es un string
		elsif !cadena_caracteres.nil?
			token = TokenCad.new(l,c,cadena_caracteres)
			tam_aux = cadena_caracteres.to_s.length
		# El primer caracter es un signo
		elsif signos.include?(t[0])
			token = TokenSig.new(l,c,t[0])
			tam_aux = 1
		# El primer caracter es inesperado
		elsif !signos.include?(t[0])
			token = TokenInesperado.new(l,c,t[0])
			tam_aux = 1
		end

		# Imprimir el token
		token.printT

		#Si luego de haber leido el token aun quedaban caracteres
		#por leer, crea un t nuevo con los no leidos, aumenta el
		#numero de columna y verifica el nuevo t
		if tam-tam_aux>0
					tnew = t[tam_aux,tam]
					cnew = c + tam_aux
					verificar(tnew,l,cnew)
			end
	 end
end

archivo = ARGV[0]
l = 1
File.open(archivo, 'r') do |arch|
	while linea = arch.gets
		c = 1
		tam = linea.length
		lin = linea
		while tam>0 do
			#Toma cada linea y cuenta los espacios en blanco
			#para el numero de columna y luego los caracteres que
			#no son espacios en blanco se verifican para saber
			#que tipo de token son
			t = /(\S)*(\s)*/.match(lin)
			aux = t.to_s.length
			verificar(t.to_s,l,c)
			c = c + aux
			lin = lin[aux,lin.length]
			tam = lin.length
		end
		l+=1
	end
end