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
			'boolean'     'Pr_Boolean'
			'id'          'ID'
			'if'          'Cond_If'
			'then'        'Cond_Then'
			'else'        'Cond_Else'
			'while'       'Cond_While'
			'do'          'Cond_Do'
			'for'         'Cond_For'
			'from'        'Cond_From'
			'to'          'Cond_To'
			
			# Tokens por arreglar
			'('           'TkAbreParentesis'
			')'           'TkCierraParentesis'
			','           'TkComa'  
			'with'        'TkWith'
			'times'       'TkTimes'
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
						| 'program' Bloque 'end' ';'																	{ result = Inicio.new(val[1]) }
						;

		Funcion	: Funcion Funcion
						| 'func' 'id' '(' Arg ')' 'begin' 'end' ';'
						| 'func' 'id' '(' ')' 'begin' 'end' ';'
						| 'func' 'id' '(' Arg ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						| 'func' 'id' '(' ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						;

		Arg			: TipoVar  ',' 'id'
						| Arg ',' TipoVar  'id'
						;

		Bloque  : TipoVar  Id ';'																							{ result = Tipo.new(val[0],val[1]) }
						| TipoVar  'id' '=' Exp ';'																		{ result = Tipo.new(val[0],val[1],val[3]) }
						| 'id' '=' Exp ';'																						{ result = Identificador.new(val[0]) }
						| 'num' '=' Exp ';'
						| 'if' Exp 'then' Bloque 'end' ';'														{ result = If.new(val[1],val[3]) }
						| 'if' Exp 'then' Bloque 'else' Bloque 'end' ';'							{ result = If.new(val[1],val[3],val[5]) }
						| 'while' Exp 'do' Bloque 'end' ';'														{ result = While.new(val[1],val[3]) }
						| 'with' 'number' 'id' ';' 'do' Bloque 'end' ';'
						| 'for' 'id' 'from' 'num' 'to' 'num' 'do' Bloque 'end' ';'		{ result = For.new(val[1],val[3],val[5],val[7]) }
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

		Id      : Id ',' 'id'				{ result = Identificador.new(val[2]) }
						| 'id'							{ result = Identificador.new(val[0]) }
						;

		TipoVar : 'number'					
						| 'boolean'
						;

		Exp     : 'num'							{ result = Numero.new(val[0]) }
						| 'id'							{ result = Identificador.new(val[0]) }							
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