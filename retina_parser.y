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
			'='           'TkAsignacion'
			';'           'TkPuntoComa'
			'('           'TkAbreParentesis'
			')'           'TkCierraParentesis'
			'div'         'TkDiv'
			'mod'         'TkMod'
			'-'           'TkResta'
			'%'           'TkModulo'
			'+'           'TkSuma'
			'*'           'TkMultiplicacion'
			'/'           'TkDivision'
			','           'TkComa'  
			'and'         'TkAnd'
			'not'         'TkNot'
			'or'          'TkOr'
			'>'           'TkMayorEstricto'
			'<'           'TkMenorEstricto'
			'=='          'TkEquivalencia'
			'/='          'TkInequivalencia'
			'>='          'TkMayorIgual'
			'<='          'TkMenorIgual'
			'number'      'TkNumber'
			'boolean'     'TkBoolean'
			'program'     'TkProgram'
			'with'        'TkWith'
			'do'          'TkDo'
			'end'         'TkEnd'
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
			'id'          'TkId'
			'num'         'TkNum'
end

# Creacion de la gramatica
start Inicio

rule
		
		Inicio  : Funcion 'program' Bloque 'end' ';'
						| 'program' Bloque 'end' ';'
						;

		Funcion	: Funcion Funcion
						| 'func' 'id' '(' Arg ')' 'begin' 'end' ';'
						| 'func' 'id' '(' ')' 'begin' 'end' ';'
						| 'func' 'id' '(' Arg ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						| 'func' 'id' '(' ')' '-' '>' 'begin' 'return' Exp ';' 'end' ';'
						;

		Arg			: Tipo 'id'
						| Arg, Tipo 'id'
						;

		Bloque  : Tipo Id ';'											
						| Tipo 'id' '=' Exp ';'
						| 'if' Exp 'then' Bloque 'end' ';'
						| 'if' Exp 'then' Bloque 'else' Bloque 'end' ';'
						| 'while' Exp 'do' Bloque 'end' ';'
						| 'with' 'number' 'id' ';' 'do' Bloque 'end' ';'
						| 'for' 'id' 'from' 'num' 'to' 'num' 'do' Bloque 'end' ';'
						| 'repeat' 'num' 'times' Bloque 'end' ';'
						| 'id' '(' ')' ';'
						| 'id' '(' Attr ')' ';'
						;

		Attr		: Exp
						| Id
						| Attr, Exp
						| Attr, Id
						;

		Id      : Id ',' 'id'
						| 'id'
						;

		Tipo    : 'number'
						| 'boolean'
						;

		Exp     : '(' Exp ')'											{ result = }
						| Exp '+' Exp											{ result = }
						| Exp '-' Exp											{ result = }
						| Exp '*' Exp											{ result = }
						| Exp '/' Exp											{ result = }
						| Exp '%' Exp											{ result = }
						| Exp 'mod' Exp										{ result = }
						| Exp 'div' Exp										{ result = }
						| 'num'														{ result = }
						| '-' Exp													{ result = }
						| Exp 'and' Exp										{ result = }
						| Exp 'or' Exp										{ result = }
						| 'not' Exp												{ result = }
						| 'true'													{ result = }
						| 'false'													{ result = }
						| Exp '>' Exp											{ result = }
						| Exp '<' Exp											{ result = }
						| Exp '<=' Exp										{ result = }
						| Exp '>=' Exp										{ result = }
						| Exp '=' Exp											{ result = }
						| Exp '/''=' Exp									{ result = }
						| Exp '==' Exp										{ result = }
						;

---- header

require_relative "retina_lexer"
require_relative "retina_ast"

class SyntacticError < RuntimeError

    def initialize(tok)
        @token = tok
    end

    def to_s
        "Syntactic error on: #{@token}"   
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