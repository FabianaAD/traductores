$tokens = {
	Numero:				/\A(\d)+(.(\d)+)?/,
	Number: 			/\Anumber\b/,
	Boolean:			/\Aboolean\b/,
	Program:			/\Aprogram\b/,
	With:				/\Awith\b/,
	Do:					/\Ado\b/,
	End:				/\Aend\b/,
	Times:				/\Atimes\b/,
	If:					/\Aif\b/,
	Then:				/\Athen\b/,
	Else:				/\Aelse\b/,
	While:				/\Awhile\b/,
	For:				/\Afor\b/,
	From:				/\Afrom\b/,
	To:					/\Ato\b/,
	Repeat:				/\Arepeat\b/,
	Begin:				/\Abegin\b/,
	Func:				/\Afunc\b/,
	True:				/\Atrue\b/,
	False:				/\Afalse\b/,
	And:				/\Aand\b/,
	Not:				/\Anot\b/,
	Or:	 				/\Aor\b/,
	Div:				/\Adiv\b/,
	Mod:				/\Amod\b/,
	Id:					/\A([a-z])(\w)*/,
	Cadena:				/\A("(.|\s)*[^\\,\n]?")|\A"[^"]*\n/,
	Comentario:			/\A#(\w)*\b/,
	Igual:				/\A=/,
	PuntoComa:			/\A;/,
	AbreParentesis:		/\A\(/,
	CierraParentesis:	/\A\)/,
	Resta:				/\A\-/,
	Modulo:				/\A%\b/,
	Suma:				/\A\+/,
	Multiplicacion:		/\A\*/,
	Division:			/\A\//,
	Coma:				/\A,/,
	MayorEstricto:		/\A>/,
	MenorEstricto:		/\A</,
	Equivalencia:		/\A==\b/,
	Inequivalencia:		/\A\/=\b/,
	MayorIgual:			/\A>=\b/,
	MenorIgual:			/\A<=\b/
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

class Numero < Token; end
class Number < Token; end
class Boolean < Token; end
class Program < Token; end
class With < Token; end
class Do < Token; end
class End < Token; end
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
class And < Token; end
class Not < Token; end
class Or < Token; end
class Div < Token; end
class Mod < Token; end
class Id < Token; end
class Cadena < Token; end
class Comentario < Token; end
class Igual < Token; end
class PuntoComa < Token; end
class AbreParentesis < Token; end
class CierraParentesis < Token; end
class Resta < Token; end
class Modulo < Token; end
class Suma < Token; end
class Multiplicacion < Token; end
class Division < Token; end
class Coma < Token; end
class MayorEstricto < Token; end
class MenorEstricto < Token; end
class Equivalencia < Token; end
class Inequivalencia < Token; end
class MayorIgual < Token; end
class MenorIgual < Token; end