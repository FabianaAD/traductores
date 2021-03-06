class Parser

		# Declaracion de Tokens
		token
			'=' ';' '(' ')' 'div' 'mod' '-' '%' '+' '*' '/' ',' 'and' 'not' 'or' '>' '<' '==' '/=' '>=' '<=' UMENOS '->' 'str'
			'number' 'boolean'
			'program' 'with' 'do' 'end' 'times' 'if' 'then' 'else' 'while' 'for' 'from' 'to' 'by' 'repeat' 'begin' 'func' 'true' 'false' 'read' 'write' 'writeln'
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
			'with'        'Cond_With'
			'func'        'Func'
			'begin'       'Pr_Begin'
			'return'			'Pr_Return'
			'->'					'Flecha'
			'read'				'Pr_Read'
			'write'				'Pr_Write'
			'str'					'Str'
			'writeln'			'Pr_Writeln'
end

# Creacion de la gramatica
start Inicio

rule
		
		Inicio  : Funcion 'program' Bloque 'end' ';'		{ result = Multiple_Prog.new(val[0],Inicio.new(val[2])) }
						| 'program' Bloque 'end' ';'						{ result = Inicio.new(val[1]) }
						;

		Funcion	: Funcion Funcion																													{ result = Multiple_Func.new(val[0],val[1]) }
						| 'func' Id '(' Arg ')' 'begin' Bloque 'end' ';'													{ result = Funcion.new(val[1],val[3],val[6]) }
						| 'func' Id '(' ')' 'begin' Bloque 'end' ';'															{ result = Funcion.new(val[1],val[5]) }
						| 'func' Id '(' Arg ')' '->' TipoVar 'begin' Bloque 'return' Exp ';' 'end' ';'		{ result = Funcion.new(val[1],val[3],val[8],val[6],val[10]) }
						| 'func' Id '(' ')' '->' TipoVar 'begin' Bloque 'return' Exp ';' 'end' ';'				{ result = Funcion.new(val[1],nil,val[7],val[5],val[9]) }
						;

		Arg			: TipoVar Id							{ result = Declaracion.new(val[0],val[1]) }
						| Arg ',' TipoVar  Id			{ result = Multiple_Arg.new(val[0],Declaracion.new(val[2],val[3]))}
						;

		Bloque  : Decl																										
						| TipoVar  Id '=' Exp ';'																							{ result = Declaracion.new(val[0],val[1],val[3]) }
						| Id '=' Exp ';'																											{ result = Igual.new(val[0],val[2]) }
						| 'if' Exp 'then' Bloque 'end' ';'																		{ result = If.new(val[1],val[3]) }
						| 'if' Exp 'then' Bloque 'else' Bloque 'end' ';'											{ result = If.new(val[1],val[3],val[5]) }
						| 'while' Exp 'do' Bloque 'end' ';'																		{ result = While.new(val[1],val[3]) }
						| 'with' Decl 'do' Bloque 'end' ';'																		{ result = With.new(val[1],val[3])}
						| 'for' 'id' 'from' 'num' 'to' Limite 'do' Bloque 'end' ';'						{ result = For.new(val[1],val[3],val[5],val[7]) }
						| 'for' 'id' 'from' 'num' 'to' Limite 'by' 'num' 'do' Bloque 'end' ';'	{ result = For.new(val[1],val[3],val[5],val[7],val[11]) }
						| 'repeat' 'num' 'times' Bloque 'end' ';'															{ result = Repeat.new(val[1],val[3]) }
						| Id '(' ')' ';'																											{ result = Llamada.new(val[0])}
						| Id '(' Par ')' ';'																									{ result = Llamada.new(val[0],val[2])}
						| Exp ';'
						| 'read' Id ';'																												{ result = Read.new(val[1]) }
						| 'write' Imp	';'																											{ result = Write.new(val[1]) }
						| 'writeln' Imp ';'																										{ result = Writeln.new(val[1]) }
						| Bloque Bloque																												{ result = Bloque_Cod.new(val[0],val[1]) }
						;

		Limite	:	'num'							{ result = Numero.new(val[0]) }
						| 'id'							{ result = Identificador.new(val[0]) }

		Imp			: Exp
						| 'str'							{ result = Cadena.new(val[0]) }
						| Imp ',' Imp				{ result = Multiple_Imp.new(val[0],val[2]) }
						;

		Par			: 'id'							{ result = Identificador.new(val[0]) }
						| 'num'							{ result = Numero.new(val[0]) }
						| 'true'						{ result = Booleano.new(val[0]) }							
						| 'false'						{ result = Booleano.new(val[0]) }
						| Par ',' Par				{ result = Multiple_Par.new(val[0],val[2])}
						;

		Id      : 'id'							{ result = Identificador.new(val[0]) }
						;

		Decl		: TipoVar  Id ';'		{ result = Declaracion.new(val[0],val[1]) }
						| Decl Decl					{ result = Multiple.new(val[0],val[1]) }
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
						| Exp '/=' Exp			{ result = Inequivalencia.new(val[0],val[2]) }							
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
        "linea #{@token.lin}, columna #{@token.col}: token inesperado: #{@token.class}: #{@token.t}"   
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