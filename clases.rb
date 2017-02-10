$tokens = {
	Digit:							/\A\d+/,
	Pr_Number: 					/\Anumber\b/,
	Pr_Boolean:					/\Aboolean\b/,
	Program:						/\Aprogram\b/,
	End:								/\Aend\b/,
	Cond_If:						/\Aif\b/,
	Cond_Then:					/\Athen\b/,
	Cond_Else:					/\Aelse\b/,
	Cond_While:					/\Awhile\b/,
	Cond_Do:						/\Ado\b/,
	Cond_For:						/\Afor\b/,
	Cond_From:					/\Afrom\b/,
	Cond_To:						/\Ato\b/,
	With:								/\Awith\b/,
	Cond_Repeat:				/\Arepeat\b/,
	Cond_Times:					/\Atimes\b/,
	Begin:							/\Abegin\b/,
	Func:								/\Afunc\b/,
	True:								/\Atrue\b/,
	False:							/\Afalse\b/,
	Not:								/\Anot/,
	And:								/\Aand/,
	Or:	 								/\Aor/,
	Fraccion_Entera:		/\Adiv/,
	Residuo_Entero:			/\Amod/,
	ID:									/\A([a-z])(\w)*\b/,
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
class ID < Token; end
class Cond_If < Token; end
class Cond_Then < Token; end
class Cond_Else < Token; end
class Cond_While < Token; end
class Cond_Do < Token; end
class Cond_For < Token; end
class Cond_From < Token; end
class Cond_To < Token; end
class Cond_Repeat < Token; end
class Cond_Times < Token; end

# Clases por arreglar
class With < Token; end
class Begin < Token; end
class Func < Token; end
class True < Token; end
class False < Token; end
class Cadena < Token; end
class Comentario < Token; end
class AbreParentesis < Token; end
class CierraParentesis < Token; end
class Coma < Token; end