
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

def verificar(t,l,c)
	palClav = Set.new ["program","with","do","end","times"]
	# operadores = Set.new["==","/=",">=","<=",">","<","==","/="]
	# signos = Set.new["=",";","(",")","{","}"]
	t= t.split[0]
	
	if t.nil?

	 	#print "nulo\n"
	else
	 	tam = t.length
    	#tsig = /=|;|(|)|{|}/.match(t)
	 	tid =  /\A([a-z])(\w)*/.match(t)
	 	tint = /\A(\d)+(.(\d)+)?/.match(t) #problema con el :
	 	taux = tam
    	if !tint.nil?
      		aux = TokenInt.new(l,c,tint)
      		taux = tint.to_s.length
        elsif palClav.include?(t)
	 		aux = TokenPalC.new(l,c,t)
    	elsif !tid.nil?
      		aux = TokenId.new(l,c,tid)
      		taux = tid.to_s.length
    	#elsif !tsig.nil?
      	#	aux = TokenSig.new(l,c,tid)
      	#	taux = tsig.to_s.length
	 	else
	 		palabra="palabra"
	 		aux = Token.new(palabra,l,c,t)
	 	end
	 	
	 	aux.printT
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
#  	puts linea
  	tam = linea.length
  	lin = linea
  	while tam>0 do
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

