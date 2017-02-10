class Parser

		# Declaracion de Tokens
		token
			'=' ';' '(' ')' 'div' 'mod' '-' '%' '+' '*' '/' ',' 'and' 'not' 'or' '>' '<' '==' '/=' '>=' '<=' UMENOS
			'number' 'boolean'
			'program' 'with' 'do' 'end' 'times' 'if' 'then' 'else' 'while' 'for' 'from' 'to' 'by' 'repeat' 'begin' 'func' 'true' 'false'
			'id' 'num'

		# Precedencias y asociatividades de los operadores
		prechigh
		right 'not'
		nonassoc '==' '/=' '>=' '<=' '>' '<'
		left 'and'
		left 'or'
		left '*' '/' '%' 'div' 'mod'
		left '+' '-'
		preclow

		# Asignar alias a los tokens
		convert
			# Tokens listos
			'num'         'Digit'
			'='           'Asignacion'
			'+'           'Adicion'
			'-'           'Sustraccion'
			'*'           'Repeticion'
			'/'           'Fraccion_Exacta'
			'%'           'Residuo_Exacto'
			'div'         'Fraccion_Entera'
			'mod'         'Residuo_Entero'
			'not'         'Not'
			'and'         'And'
			'or'          'Or'
			'>'           'MayorEstricto'
			'<'           'MenorEstricto'
			'>='          'MayorIgual'
			'<='          'MenorIgual'
			'=='          'Equivale'
			'/='          'Inequivale'
			'program'     'Program'
			'end'         'End'
			';'           'PuntoComa'
			'number'      'Pr_Number'
			'boolean'     'Pr_Boolean'
			'id'          'Idtf'
			'if'          'Cond_If'
			'then'        'Cond_Then'
			'else'        'Cond_Else'
			'while'       'Cond_While'
			'do'          'Cond_Do'
			'for'         'Cond_For'
			'from'        'Cond_From'
			'to'          'Cond_To'
			'by'					'Cond_By'
			'repeat'      'Cond_Repeat'
			'times'       'Cond_Times'
			'('           'Abre_Parentesis'
			')'           'Cierra_Parentesis'
			','           'Signo_Coma'  
			'true'        'Bool_True'
			'false'       'Bool_False'
			
			# Tokens por arreglar
			'with'        'TkWith'
			'begin'       'TkBegin'
			'func'        'TkFunc'
end

# Creacion de la gramatica
start Inicio

rule
		
		Inicio  : Funcion 'program' Bloque 'end' ';'
						| 'program' Bloque 'end' ';'																	{ result = Inicio.new(val[1]) }
						;

		Funcion	: Funcion Funcion
						| 'func' Id '(' Arg ')' 'begin' 'end' ';'
						| 'func' Id '(' ')' 'begin' 'end' ';'
						| 'func' Id '(' Arg ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						| 'func' Id '(' ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						;

		Arg			: TipoVar  ',' Id
						| Arg ',' TipoVar  Id
						;

		Bloque  : TipoVar  Id ';'																										{ result = Declaracion.new(val[0],val[1]) }
						| TipoVar  Id '=' Exp ';'																					{ result = Declaracion.new(val[0],val[1],val[3]) }
						| Id '=' Exp ';'																						
						| 'num' '=' Exp ';'
						| 'if' Exp 'then' Bloque 'end' ';'																	{ result = If.new(val[1],val[3]) }
						| 'if' Exp 'then' Bloque 'else' Bloque 'end' ';'										{ result = If.new(val[1],val[3],val[5]) }
						| 'while' Exp 'do' Bloque 'end' ';'																	{ result = While.new(val[1],val[3]) }
						| 'with' TipoVar Id ';' 'do' Bloque 'end' ';'
						| 'for' Id 'from' 'num' 'to' 'num' 'do' Bloque 'end' ';'					{ result = For.new(val[1],val[3],val[5],val[7]) }
						| 'for' Id 'from' 'num' 'to' 'num' 'by' Num 'do' Bloque 'end' ';'	{ result = For.new(val[1],val[3],val[5],val[7],val[11]) }
						| 'repeat' 'num' 'times' Bloque 'end' ';'														{ result = Repeat.new(val[1],val[3]) }
						| Id '(' ')' ';'
						| Id '(' Attr ')' ';'
						| Exp ';'
						| Bloque Bloque																											{ result = Bloque_Cod.new(val[0],val[1]) }
						;

		Num			: 'num'							{ result = Numero.new(val[0]) }
						;

		Attr		: Exp
						| Id
						| Attr ',' Exp
						| Attr ',' Id
						;

		Id      : 'id'							{ result = Identificador.new(val[0]) }
						;

		TipoVar : 'number'					{ result = Number.new() }
						| 'boolean'					{ result = Boolean.new() }
						;

		Exp     : 'num'							{ result = Numero.new(val[0]) }
						| Id								{ result = val[0] }							
						| 'true'						{ result = Booleano.new(val[0]) }							
						| 'false'						{ result = Booleano.new(val[0]) }							
						| '-' Exp = UMENOS	{ result = MenosUnario.new(val[1]) }												
						| Exp '+' Exp				{ result = Suma.new(val[0],val[2]) }								
						| Exp '-' Exp				{ result = Resta.new(val[0],val[2]) }							
						| Exp '*' Exp				{ result = Multiplicacion.new(val[0],val[2]) }						
						| Exp '/' Exp				{ result = Division_Exacta.new(val[0],val[2]) }							
						| Exp '%' Exp				{ result = Resto_Exacto.new(val[0],val[2]) }
						| Exp 'div' Exp			{ result = Division_Entera.new(val[0],val[2]) }				
						| Exp 'mod' Exp			{ result = Resto_Entero.new(val[0],val[2]) }
						| 'not' Exp					{ result = Negado.new(val[1])}							
						| Exp 'and' Exp			{ result = Conjuncion.new(val[0],val[2]) }							
						| Exp 'or' Exp			{ result = Disyuncion.new(val[0],val[2]) }							
						| Exp '>' Exp				{ result = Mayor_Estricto.new(val[0],val[2]) }							
						| Exp '<' Exp				{ result = Menor_Estricto.new(val[0],val[2]) }							
						| Exp '>=' Exp			{ result = Mayor_Igual.new(val[0],val[2]) }							
						| Exp '<=' Exp			{ result = Menor_Igual.new(val[0],val[2]) }																	
						| Exp '==' Exp			{ result = Equivalencia.new(val[0],val[2]) }							
						| Exp '/''=' Exp		{ result = Inequivalencia.new(val[0],val[2]) }							
						| '(' Exp ')'								
						;

---- header

require_relative "retina_lexer"
require_relative "retina_ast"

class SyntacticError < RuntimeError

    def initialize(tok)
        @token = tok
    end

    def to_s
        "Error de sintaxis en: #{@token}"   
    end
end

---- inner

def on_error(id, token, stack)
    raise SyntacticError::new(token)
end
   
def next_token
    token = @lexer.catch_lexeme
    return [false,false] unless token
    return [token.class,token]
end
   
def parse(lexer)
    @yydebug = true
    @lexer = lexer
    @tokens = []
    ast = do_parse
    return ast
end