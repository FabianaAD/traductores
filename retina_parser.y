class Parser

		# Declaracion de Tokens
		token
			'=' ';' '(' ')' 'div' 'mod' '-' '%' '+' '*' '/' ',' 'and' 'not' 'or' '>' '<' '==' '/=' '>=' '<='
			'number' 'boolean'
			'program' 'with' 'do' 'end' 'times' 'if' 'then' 'else' 'while' 'for' 'from' 'to' 'repeat' 'begin' 'func' 'true' 'false'
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
			'id'          'Id'
			
			# Tokens por arreglar
			'('           'TkAbreParentesis'
			')'           'TkCierraParentesis'
			','           'TkComa'  
			'boolean'     'TkBoolean'
			'with'        'TkWith'
			'do'          'TkDo'
			'times'       'TkTimes'
			'if'          'TkIf'
			'then'        'TkThen'
			'else'        'TkElse'
			'while'       'TkWhile'
			'for'         'TkFor'
			'from'        'TkFrom'
			'to'          'TkTo'
			'repeat'      'TkRepeat'
			'begin'       'TkBegin'
			'func'        'TkFunc'
			'true'        'TkFunc'
			'false'       'TkFalse'
end

# Creacion de la gramatica
start Inicio

rule
		
		Inicio  : Funcion 'program' Bloque 'end' ';'
						| 'program' Bloque 'end' ';'					{ result = Inicio.new(val[1]) }
						;

		Funcion	: Funcion Funcion
						| 'func' 'id' '(' Arg ')' 'begin' 'end' ';'
						| 'func' 'id' '(' ')' 'begin' 'end' ';'
						| 'func' 'id' '(' Arg ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						| 'func' 'id' '(' ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						;

		Arg			: Tipo ',' 'id'
						| Arg ',' Tipo 'id'
						;

		Bloque  : Tipo Id ';'																															
						| Tipo 'id' '=' Exp ';'
						| 'id' '=' Exp ';'
						| 'num' '=' Exp ';'
						| 'if' Exp 'then' Bloque 'end' ';'
						| 'if' Exp 'then' Bloque 'else' Bloque 'end' ';'
						| 'while' Exp 'do' Bloque 'end' ';'
						| 'with' 'number' 'id' ';' 'do' Bloque 'end' ';'
						| 'for' 'id' 'from' 'num' 'to' 'num' 'do' Bloque 'end' ';'
						| 'repeat' 'num' 'times' Bloque 'end' ';'
						| 'id' '(' ')' ';'
						| 'id' '(' Attr ')' ';'
						| Exp ';'
						| Bloque Bloque
						;

		Attr		: Exp
						| Id
						| Attr ',' Exp
						| Attr ',' Id
						;

		Id      : Id ',' 'id'
						| 'id'
						;

		Tipo    : 'number'					
						| 'boolean'
						;

		Exp     : 'num'							{ result = Numero.new(val[0]) }
						| 'id'														
						| 'true'													
						| 'false'													
						| '-' Exp													
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