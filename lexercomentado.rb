
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

class TokenSig < Token
  def initialize (linea,columna,cont)
    @nombre = "signo"
    @l = linea
    @c = columna
    @cont = cont
  end
end

def verificar(t,l,c)
	palClav = Set.new ["program","with","do","end","times"]
	# operadores = Set.new["==","/=",">=","<=",">","<","==","/="]
	signos = Set.new ["=","{","}",";","(",")","{","}"]
	t= t.split[0]
	
	if !t.nil?

		#Tam con el que ingreso t para verificar luego
	 	tam = t.length
	 	taux = tam

	 	#Verificacion para saber si es un entero, un identificador
	 	#o una palabra clave
	 	tid =  /\A([a-z])(\w)*/.match(t)
	 	tint = /\A(\d)+(.(\d)+)?/.match(t)
	 	tpc = /program|with|do|end|times/.match(t)


	 	#Si el token cumple que es un entero, palabra clave
	 	#o identificador, toma el tam de lo que fue aceptado
	 	#por la expresion regular
    	if !tint.nil?
      		aux = TokenInt.new(l,c,tint)
      		taux = tint.to_s.length
	 	elsif !tpc.nil?
	 		aux = TokenPalC.new(l,c,tpc)
	 		taux = tpc.to_s.length
    	elsif !tid.nil?
      		aux = TokenId.new(l,c,tid)
      		taux = tid.to_s.length
      	#Verifica si el primer caracter pertenece al conjunto
      	#de signos, si es asi toma el tam de leido como 1
    	elsif signos.include?(t[0])
      		aux = TokenSig.new(l,c,t[0])
      		taux = 1
	 	end
	 	
	 	#Imprime el token
	 	aux.printT

	 	#Si luego de haber leido el token aun quedaban caracteres
	 	#por leer, crea un t nuevo con los no leidos, aumenta el
	 	#numero de columna y verifica el nuevo t
	 	if tam-taux>0
      		tnew = t[taux,tam]
      		cnew = c + taux
      		verificar(tnew,l,cnew)
    	end
		

	 end


end




archivo = ARGV[0]
l=1
File.open(archivo, 'r') do |arch|
  while linea = arch.gets
  	c=1
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

