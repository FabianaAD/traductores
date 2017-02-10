$tokens = {
	Digit:							/\A\d+/,
	Pr_Number: 					/\Anumber\b/,
	Pr_Boolean:					/\Aboolean\b/,
	Program:						/\Aprogram\b/,
	End:								/\Aend\b/,
	With:								/\Awith\b/,
	Do:									/\Ado\b/,
	Times:							/\Atimes\b/,
	If:									/\Aif\b/,
	Then:								/\Athen\b/,
	Else:								/\Aelse\b/,
	While:							/\Awhile\b/,
	For:								/\Afor\b/,
	From:								/\Afrom\b/,
	To:									/\Ato\b/,
	Repeat:							/\Arepeat\b/,
	Begin:							/\Abegin\b/,
	Func:								/\Afunc\b/,
	True:								/\Atrue\b/,
	False:							/\Afalse\b/,
	Not:								/\Anot/,
	And:								/\Aand/,
	Or:	 								/\Aor/,
	Fraccion_Entera:		/\Adiv/,
	Residuo_Entero:			/\Amod/,
	Id:									/\A([a-z])(\w)*\b/,
	Cadena:							/\A("(.|\s)*[^\\,\n]?")|\A"[^"]*\n/,
	Comentario:					/\A#(\w)*\b/,
	Asignacion:					/\A=/,
	Adicion:						/\A\+/,
	Sustraccion:				/\A\-/,
	Repeticion:					/\A\*/,
	Fraccion_Exacta:		/\A\//,
	Residuo_Exacto:			/\A%/,
	MayorEstricto:			/\A>/,
	MenorEstricto:			/\A</,
	MayorIgual:					/\A>=\b/,
	MenorIgual:					/\A<=\b/,
	Equivale:						/\A==\b/,
	Inequivale:					/\A\/=\b/,
	PuntoComa:					/\A;/,
	AbreParentesis:			/\A\(/,
	CierraParentesis:		/\A\)/,
	Coma:								/\A,/
}

class Token
	attr_reader :t
	
	def initialize text
		@t = text
	end

	def to_s
		"Tk#{self.class}"
	end
end

class LexicographicError < RuntimeError
	def initialize t
		@t = t
	end

	def to_s
		"Unknown lexeme \'#{@t}\'"
	end
end

class SyntacticError < RuntimeError
		def initialize(tok)
				@token = tok
		end

		def to_s
				"Syntactic error on: #{@token}"   
		end
end

class Digit < Token
	def to_s
		"TkDigit(#{@t})"
	end

	def to_i
		@t.to_i
	end
end

# Clases que estan listas
class Asignacion < Token; end
class Adicion < Token; end
class Sustraccion < Token; end
class Repeticion < Token; end
class Fraccion_Exacta < Token; end
class Residuo_Exacto < Token; end
class Fraccion_Entera < Token; end
class Residuo_Entero < Token; end
class Not < Token; end
class And < Token; end
class Or < Token; end
class MayorEstricto < Token; end
class MenorEstricto < Token; end
class MayorIgual < Token; end
class MenorIgual < Token; end
class Equivale < Token; end
class Inequivale < Token; end
class Program < Token; end
class End < Token; end
class PuntoComa < Token; end
class Pr_Number < Token; end
class Pr_Boolean < Token; end
class Id < Token; end

# Clases por arreglar
class With < Token; end
class Do < Token; end
class Times < Token; end
class If < Token; end
class Then < Token; end
class Else < Token; end
class While < Token; end
class For < Token; end
class From < Token; end
class To < Token; end
class Repeat < Token; end
class Begin < Token; end
class Func < Token; end
class True < Token; end
class False < Token; end
class Cadena < Token; end
class Comentario < Token; end
class AbreParentesis < Token; end
class CierraParentesis < Token; end
class Coma < Token; end