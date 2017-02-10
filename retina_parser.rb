#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'


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

class Parser < Racc::Parser

module_eval(<<'...end retina_parser.y/module_eval...', 'retina_parser.y', 164)

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
...end retina_parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    80,   124,    25,    93,   111,     3,    23,   142,    99,   131,
     6,   -29,    32,    24,    33,   121,   100,   143,   -27,   -29,
     4,   108,    19,    20,    25,     4,   -27,   114,    23,   109,
    64,    63,   112,   123,   105,    24,   110,    19,    20,   104,
    21,    22,    18,    36,    19,    20,    25,    14,   126,    61,
    23,    12,    19,    20,    13,    15,   127,    24,    18,    16,
    98,    95,    21,    22,    18,    11,    19,    20,    25,    14,
   129,   117,    23,    12,    75,   118,    13,    15,   120,    24,
    74,    16,   133,   134,    21,    22,    18,    11,    19,    20,
    25,    14,   135,   136,    23,    12,    18,   138,    13,    15,
   139,    24,    18,    16,    62,    60,    21,    22,    18,    11,
    19,    20,    25,    14,   144,   145,    23,    12,   146,   147,
    13,    15,   148,    24,    41,    16,   151,   152,    21,    22,
    18,    11,    19,    20,    25,    14,    18,    34,    23,    12,
   155,    18,    13,    15,     4,    24,   158,    16,    27,    18,
    21,    22,    18,    11,    19,    20,    25,    14,   161,     5,
    23,    12,   163,   164,    13,    15,   165,    24,   166,    16,
   nil,   nil,    21,    22,    18,    11,    19,    20,    25,    14,
   nil,   nil,    23,    12,   nil,   nil,    13,    15,   nil,    24,
   nil,    16,   nil,   nil,    21,    22,    18,    11,    19,    20,
    25,    14,   nil,    29,    23,    12,   nil,   nil,    13,    15,
    25,    24,   nil,    16,    23,   nil,    21,    22,    18,    11,
    50,    24,    51,    52,    53,    56,    50,    54,    55,    52,
    53,    56,    25,    54,    55,   nil,    23,   nil,    21,    22,
    18,    36,   nil,    24,   nil,   nil,   nil,   nil,    21,    22,
    18,    36,    19,    20,    25,    14,   nil,   154,    23,    12,
   nil,   nil,    13,    15,    25,    24,   nil,    16,    23,   nil,
    21,    22,    18,    11,    50,    24,    51,    52,    53,    56,
   nil,    54,    55,   -55,   -55,   -55,    25,   -55,   -55,   nil,
    23,   nil,    21,    22,    18,    36,   nil,    24,   nil,   nil,
   nil,   nil,    21,    22,    18,    36,    19,    20,    25,    14,
   nil,   122,    23,    12,   nil,   nil,    13,    15,   nil,    24,
   nil,    16,   nil,   nil,    21,    22,    18,    11,   nil,   nil,
    25,   nil,   nil,   nil,    23,    50,   nil,    51,    52,    53,
    56,    24,    54,    55,   nil,   nil,    21,    22,    18,    36,
    19,    20,    25,    14,   nil,   nil,    23,    12,   nil,   nil,
    13,    15,   nil,    24,   nil,    16,   nil,   nil,    21,    22,
    18,    11,    19,    20,    25,    14,   nil,   nil,    23,    12,
   nil,   nil,    13,    15,    25,    24,   nil,    16,    23,   nil,
    21,    22,    18,    11,    25,    24,   nil,   nil,    23,    25,
   nil,   nil,   nil,    23,   nil,    24,   nil,   nil,   nil,   nil,
    24,   nil,    21,    22,    18,    36,    25,   nil,   nil,   nil,
    23,   nil,    21,    22,    18,    36,   nil,    24,   nil,   nil,
   nil,   nil,    21,    22,    18,    36,   nil,    21,    22,    18,
    36,    25,   -55,   -55,   -55,    23,   -55,   -55,   nil,   nil,
   nil,   nil,    24,   nil,    21,    22,    18,    36,   nil,   nil,
   nil,    19,    20,    25,    14,   nil,   162,    23,    12,   nil,
   nil,    13,    15,   nil,    24,   nil,    16,   nil,   nil,    21,
    22,    18,    11,    19,    20,    25,    14,   nil,   141,    23,
    12,   nil,   nil,    13,    15,   nil,    24,   nil,    16,   nil,
   nil,    21,    22,    18,    11,    19,    20,    25,    14,   nil,
   nil,    23,    12,   nil,   nil,    13,    15,   nil,    24,   nil,
    16,   nil,   nil,    21,    22,    18,    11,    25,    66,   nil,
   nil,    23,    25,   nil,   nil,   nil,    23,   nil,    24,   nil,
    25,   nil,   nil,    24,    23,    21,    22,    18,    36,    25,
   nil,    24,   nil,    23,   nil,   nil,   nil,   nil,    25,   nil,
    24,   nil,    23,   nil,   nil,    21,    22,    18,    36,    24,
    21,    22,    18,    36,   nil,   nil,   nil,   nil,    21,    22,
    18,    36,    25,   nil,   nil,   nil,    23,    21,    22,    18,
    36,   nil,   nil,    24,   nil,   nil,    21,    22,    18,    36,
   nil,   nil,    19,    20,    25,    14,   nil,   140,    23,    12,
   nil,   nil,    13,    15,   nil,    24,   nil,    16,   nil,   nil,
    21,    22,    18,    11,    19,    20,    25,    14,   nil,   nil,
    23,    12,   nil,   nil,    13,    15,   nil,    24,   nil,    16,
   nil,   nil,    21,    22,    18,    11,    19,    20,    25,    14,
   nil,   nil,    23,    12,   nil,   nil,    13,    15,    25,    24,
   nil,    16,    23,   nil,    21,    22,    18,    11,    50,    24,
    51,    52,    53,    56,   nil,    54,    55,   -55,   -55,   -55,
    25,   -55,   -55,   nil,    23,   nil,    21,    22,    18,    36,
   nil,    24,   nil,   nil,   nil,   nil,    21,    22,    18,    36,
    19,    20,    25,    14,   nil,   119,    23,    12,   nil,   nil,
    13,    15,    25,    24,   nil,    16,    23,   nil,    21,    22,
    18,    11,    25,    24,   nil,   nil,    23,    25,   nil,   nil,
   nil,    23,   nil,    24,   nil,    25,   nil,   nil,    24,    23,
    21,    22,    18,    36,    25,   nil,    24,   nil,    23,   nil,
    21,    22,    18,    36,   nil,    24,   nil,   nil,   nil,   nil,
    21,    22,    18,    36,   nil,    21,    22,    18,    36,   nil,
   nil,   nil,   nil,    21,    22,    18,    36,    25,   nil,   nil,
   nil,    23,    21,    22,    18,    36,    25,   nil,    24,   nil,
    23,    52,    53,    56,   nil,    54,    55,    24,    48,    49,
    44,    47,    43,    45,    46,   nil,    50,   nil,    51,    52,
    53,    56,   nil,    54,    55,    21,    22,    18,    36,   nil,
    72,   nil,   nil,   nil,    21,    22,    18,    36,    48,    49,
    44,    47,    43,    45,    46,   nil,    50,   nil,    51,    52,
    53,    56,   157,    54,    55,    48,    49,    44,    47,    43,
    45,    46,   nil,    50,    71,    51,    52,    53,    56,   160,
    54,    55,    48,    49,    44,    47,    43,    45,    46,   nil,
    50,   nil,    51,    52,    53,    56,    97,    54,    55,    48,
    49,    44,    47,    43,    45,    46,   nil,    50,   nil,    51,
    52,    53,    56,   101,    54,    55,    48,    49,    44,    47,
    43,    45,    46,   nil,    50,   nil,    51,    52,    53,    56,
    42,    54,    55,    48,    49,    44,    47,    43,    45,    46,
   nil,    50,   nil,    51,    52,    53,    56,   113,    54,    55,
    48,    49,    44,    47,    43,    45,    46,   nil,    50,   nil,
    51,    52,    53,    56,   nil,    54,    55,    91,    48,    49,
    44,    47,    43,    45,    46,   nil,    50,   nil,    51,    52,
    53,    56,   nil,    54,    55,    48,    49,    44,    47,    43,
    45,    46,   nil,    50,   nil,    51,    52,    53,    56,   nil,
    54,    55,    48,    49,   nil,    47,   nil,    45,    46,   nil,
    50,   nil,    51,    52,    53,    56,   nil,    54,    55,    48,
    49,    44,    47,    43,    45,    46,   nil,    50,   nil,    51,
    52,    53,    56,   nil,    54,    55,    48,    49,    44,    47,
    43,    45,    46,   nil,    50,   nil,    51,    52,    53,    56,
   nil,    54,    55,    48,    49,    44,    47,    43,    45,    46,
   nil,    50,   nil,    51,    52,    53,    56,   nil,    54,    55,
    48,    49,   nil,    47,   nil,    45,    46,   nil,    50,   nil,
    51,    52,    53,    56,   nil,    54,    55,    50,   nil,    51,
    52,    53,    56,   nil,    54,    55,   -55,   -55,   -55,   nil,
   -55,   -55,   -55,   -55,   -55,   nil,   -55,   -55 ]

racc_action_check = [
    46,   108,    46,    60,    93,     0,    46,   133,    67,   119,
     2,   116,    10,    46,    10,   105,    67,   133,    69,   116,
     0,    92,    60,    60,    28,     2,    69,    99,    28,    92,
    31,    31,    94,   108,    74,    28,    93,    14,    14,    73,
    46,    46,    46,    46,    28,    28,   102,    28,   110,    28,
   102,    28,   109,   109,    28,    28,   111,   102,   112,    28,
    66,    61,    28,    28,    28,    28,   102,   102,     3,   102,
   117,   102,     3,   102,    41,   102,   102,   102,   104,     3,
    40,   102,   121,   122,   102,   102,   102,   102,     3,     3,
    75,     3,   123,   124,    75,     3,   125,   126,     3,     3,
   127,    75,    39,     3,    29,    26,     3,     3,     3,     3,
    75,    75,   155,    75,   135,   136,   155,    75,   139,   140,
    75,    75,   141,   155,    16,    75,   143,   145,    75,    75,
    75,    75,   155,   155,     6,   155,    15,    11,     6,   155,
   150,     9,   155,   155,     7,     6,   154,   155,     5,     4,
   155,   155,   155,   155,     6,     6,    72,     6,   157,     1,
    72,     6,   160,   161,     6,     6,   162,    72,   163,     6,
   nil,   nil,     6,     6,     6,     6,    72,    72,     8,    72,
   nil,   nil,     8,    72,   nil,   nil,    72,    72,   nil,     8,
   nil,    72,   nil,   nil,    72,    72,    72,    72,     8,     8,
   152,     8,   nil,     8,   152,     8,   nil,   nil,     8,     8,
   100,   152,   nil,     8,   100,   nil,     8,     8,     8,     8,
    83,   100,    83,    83,    83,    83,    85,    83,    83,    85,
    85,    85,   149,    85,    85,   nil,   149,   nil,   152,   152,
   152,   152,   nil,   149,   nil,   nil,   nil,   nil,   100,   100,
   100,   100,   149,   149,    12,   149,   nil,   149,    12,   149,
   nil,   nil,   149,   149,    13,    12,   nil,   149,    13,   nil,
   149,   149,   149,   149,    81,    13,    81,    81,    81,    81,
   nil,    81,    81,    89,    89,    89,   106,    89,    89,   nil,
   106,   nil,    12,    12,    12,    12,   nil,   106,   nil,   nil,
   nil,   nil,    13,    13,    13,    13,   106,   106,   146,   106,
   nil,   106,   146,   106,   nil,   nil,   106,   106,   nil,   146,
   nil,   106,   nil,   nil,   106,   106,   106,   106,   nil,   nil,
   142,   nil,   nil,   nil,   142,    82,   nil,    82,    82,    82,
    82,   142,    82,    82,   nil,   nil,   146,   146,   146,   146,
   142,   142,    71,   142,   nil,   nil,    71,   142,   nil,   nil,
   142,   142,   nil,    71,   nil,   142,   nil,   nil,   142,   142,
   142,   142,    71,    71,    23,    71,   nil,   nil,    23,    71,
   nil,   nil,    71,    71,    24,    23,   nil,    71,    24,   nil,
    71,    71,    71,    71,    25,    24,   nil,   nil,    25,    80,
   nil,   nil,   nil,    80,   nil,    25,   nil,   nil,   nil,   nil,
    80,   nil,    23,    23,    23,    23,    64,   nil,   nil,   nil,
    64,   nil,    24,    24,    24,    24,   nil,    64,   nil,   nil,
   nil,   nil,    25,    25,    25,    25,   nil,    80,    80,    80,
    80,   159,    90,    90,    90,   159,    90,    90,   nil,   nil,
   nil,   nil,   159,   nil,    64,    64,    64,    64,   nil,   nil,
   nil,   159,   159,   132,   159,   nil,   159,   132,   159,   nil,
   nil,   159,   159,   nil,   132,   nil,   159,   nil,   nil,   159,
   159,   159,   159,   132,   132,    30,   132,   nil,   132,    30,
   132,   nil,   nil,   132,   132,   nil,    30,   nil,   132,   nil,
   nil,   132,   132,   132,   132,    30,    30,    32,    30,   nil,
   nil,    32,    30,   nil,   nil,    30,    30,   nil,    32,   nil,
    30,   nil,   nil,    30,    30,    30,    30,    33,    33,   nil,
   nil,    33,    34,   nil,   nil,   nil,    34,   nil,    33,   nil,
    56,   nil,   nil,    34,    56,    32,    32,    32,    32,    54,
   nil,    56,   nil,    54,   nil,   nil,   nil,   nil,    43,   nil,
    54,   nil,    43,   nil,   nil,    33,    33,    33,    33,    43,
    34,    34,    34,    34,   nil,   nil,   nil,   nil,    56,    56,
    56,    56,   130,   nil,   nil,   nil,   130,    54,    54,    54,
    54,   nil,   nil,   130,   nil,   nil,    43,    43,    43,    43,
   nil,   nil,   130,   130,   120,   130,   nil,   130,   120,   130,
   nil,   nil,   130,   130,   nil,   120,   nil,   130,   nil,   nil,
   130,   130,   130,   130,   120,   120,   118,   120,   nil,   nil,
   118,   120,   nil,   nil,   120,   120,   nil,   118,   nil,   120,
   nil,   nil,   120,   120,   120,   120,   118,   118,    44,   118,
   nil,   nil,    44,   118,   nil,   nil,   118,   118,    45,    44,
   nil,   118,    45,   nil,   118,   118,   118,   118,    79,    45,
    79,    79,    79,    79,   nil,    79,    79,    88,    88,    88,
   103,    88,    88,   nil,   103,   nil,    44,    44,    44,    44,
   nil,   103,   nil,   nil,   nil,   nil,    45,    45,    45,    45,
   103,   103,    47,   103,   nil,   103,    47,   103,   nil,   nil,
   103,   103,    48,    47,   nil,   103,    48,   nil,   103,   103,
   103,   103,    49,    48,   nil,   nil,    49,    50,   nil,   nil,
   nil,    50,   nil,    49,   nil,    51,   nil,   nil,    50,    51,
    47,    47,    47,    47,    52,   nil,    51,   nil,    52,   nil,
    48,    48,    48,    48,   nil,    52,   nil,   nil,   nil,   nil,
    49,    49,    49,    49,   nil,    50,    50,    50,    50,   nil,
   nil,   nil,   nil,    51,    51,    51,    51,    53,   nil,   nil,
   nil,    53,    52,    52,    52,    52,    55,   nil,    53,   nil,
    55,    84,    84,    84,   nil,    84,    84,    55,    38,    38,
    38,    38,    38,    38,    38,   nil,    38,   nil,    38,    38,
    38,    38,   nil,    38,    38,    53,    53,    53,    53,   nil,
    38,   nil,   nil,   nil,    55,    55,    55,    55,    35,    35,
    35,    35,    35,    35,    35,   nil,    35,   nil,    35,    35,
    35,    35,   153,    35,    35,   153,   153,   153,   153,   153,
   153,   153,   nil,   153,    35,   153,   153,   153,   153,   156,
   153,   153,   156,   156,   156,   156,   156,   156,   156,   nil,
   156,   nil,   156,   156,   156,   156,    65,   156,   156,    65,
    65,    65,    65,    65,    65,    65,   nil,    65,   nil,    65,
    65,    65,    65,    70,    65,    65,    70,    70,    70,    70,
    70,    70,    70,   nil,    70,   nil,    70,    70,    70,    70,
    17,    70,    70,    17,    17,    17,    17,    17,    17,    17,
   nil,    17,   nil,    17,    17,    17,    17,    96,    17,    17,
    96,    96,    96,    96,    96,    96,    96,   nil,    96,   nil,
    96,    96,    96,    96,   nil,    96,    96,    59,    59,    59,
    59,    59,    59,    59,    59,   nil,    59,   nil,    59,    59,
    59,    59,   nil,    59,    59,    68,    68,    68,    68,    68,
    68,    68,   nil,    68,   nil,    68,    68,    68,    68,   nil,
    68,    68,    77,    77,   nil,    77,   nil,    77,    77,   nil,
    77,   nil,    77,    77,    77,    77,   nil,    77,    77,    57,
    57,    57,    57,    57,    57,    57,   nil,    57,   nil,    57,
    57,    57,    57,   nil,    57,    57,   107,   107,   107,   107,
   107,   107,   107,   nil,   107,   nil,   107,   107,   107,   107,
   nil,   107,   107,   115,   115,   115,   115,   115,   115,   115,
   nil,   115,   nil,   115,   115,   115,   115,   nil,   115,   115,
    76,    76,   nil,    76,   nil,    76,    76,   nil,    76,   nil,
    76,    76,    76,    76,   nil,    76,    76,    78,   nil,    78,
    78,    78,    78,   nil,    78,    78,    86,    86,    86,   nil,
    86,    86,    87,    87,    87,   nil,    87,    87 ]

racc_action_pointer = [
   -21,   159,   -16,    64,   105,   148,   130,   103,   174,    97,
    10,   135,   250,   260,    13,    92,    79,   907,   nil,   nil,
   nil,   nil,   nil,   370,   380,   390,   101,   nil,    20,   101,
   481,    28,   503,   523,   528,   822,   nil,   nil,   792,    58,
    44,    44,   nil,   554,   644,   654,    -2,   698,   708,   718,
   723,   731,   740,   773,   545,   782,   536,   993,   nil,   942,
    -2,    58,   nil,   nil,   412,   873,    57,     3,   959,    13,
   890,   348,   152,    36,   -11,    86,  1044,   976,  1053,   654,
   395,   260,   321,   206,   774,   212,  1059,  1065,   660,   266,
   425,   nil,    16,    -4,    19,   nil,   924,   nil,   nil,    24,
   206,   nil,    42,   676,    50,   -22,   282,  1010,    -7,    28,
    19,    39,    14,   nil,   nil,  1027,     6,    67,   622,     6,
   600,    37,    80,    63,    76,    52,    94,    60,   nil,   nil,
   578,   nil,   459,   -21,   nil,   111,    75,   nil,   nil,    72,
   116,   119,   326,    81,   nil,    81,   304,   nil,   nil,   228,
   112,   nil,   196,   839,   143,   108,   856,   129,   nil,   437,
   133,   160,   163,   165,   nil,   nil,   nil ]

racc_action_default = [
   -55,   -55,   -55,   -55,   -55,   -55,   -55,    -3,   -55,   -55,
   -34,   -33,   -55,   -55,   -55,   -55,   -55,   -55,   -30,   -31,
   -32,   -35,   -36,   -55,   -55,   -55,   -55,   167,   -55,   -55,
   -24,   -55,   -55,   -55,   -55,   -55,   -33,   -34,   -55,   -55,
   -55,   -55,   -23,   -55,   -55,   -55,   -55,   -55,   -55,   -55,
   -55,   -55,   -55,   -55,   -55,   -55,   -55,   -37,   -45,   -55,
   -55,   -55,    -2,   -10,   -55,   -55,   -55,   -55,   -26,   -34,
   -55,   -55,   -55,   -55,   -55,   -55,   -38,   -39,   -40,   -41,
   -55,   -42,   -43,   -44,   -46,   -47,   -48,   -49,   -50,   -51,
   -52,   -54,   -55,   -55,   -55,    -1,   -55,   -12,   -21,   -55,
   -55,   -13,   -55,   -55,   -55,   -55,   -55,   -53,   -55,   -55,
   -55,   -55,   -55,   -11,   -22,   -28,   -34,   -55,   -55,   -55,
   -55,   -55,   -55,   -55,   -55,   -55,   -55,   -55,    -8,   -14,
   -55,   -16,   -55,   -55,   -20,   -55,   -55,    -9,    -5,   -55,
   -55,   -55,   -55,   -55,    -4,   -55,   -55,   -15,   -17,   -55,
   -55,   -25,   -55,   -55,   -55,   -55,   -55,   -55,   -18,   -55,
   -55,   -55,   -55,   -55,    -7,   -19,    -6 ]

racc_goto_table = [
    10,    26,    92,    10,     1,    10,    31,    39,     8,     2,
   150,    28,    40,    67,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    10,   nil,    10,   nil,   nil,
    69,   nil,   nil,   nil,   nil,   nil,    73,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    94,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    10,    10,
   nil,   nil,    10,   nil,   nil,   nil,   102,   103,   nil,   nil,
   106,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   116,   nil,    10,
    10,   nil,   125,    10,   nil,   nil,   nil,   nil,   nil,   128,
   nil,   nil,   nil,   nil,   nil,    10,   nil,    10,   nil,   nil,
   nil,   nil,   137,   130,   nil,   132,   nil,    10,   nil,    10,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    35,    38,    10,
   nil,   nil,   nil,   nil,   nil,   nil,    10,   149,    57,    58,
    59,   nil,    10,   nil,   nil,   nil,    10,    65,    68,    70,
   159,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    76,    77,
    78,    79,    81,    82,    83,    84,    85,    86,    87,    88,
    89,    90,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    96,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   107,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   115,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   153,   nil,   nil,   nil,   nil,   nil,   156 ]

racc_goto_check = [
     4,     4,     5,     4,     1,     4,     4,     7,     3,     2,
     8,     3,     4,     9,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     4,   nil,     4,   nil,   nil,
     4,   nil,   nil,   nil,   nil,   nil,     4,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     7,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,     4,
   nil,   nil,     4,   nil,   nil,   nil,     3,     3,   nil,   nil,
     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,   nil,     4,
     4,   nil,     7,     4,   nil,   nil,   nil,   nil,   nil,     4,
   nil,   nil,   nil,   nil,   nil,     4,   nil,     4,   nil,   nil,
   nil,   nil,     4,     3,   nil,     3,   nil,     4,   nil,     4,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     6,     6,     4,
   nil,   nil,   nil,   nil,   nil,   nil,     4,     3,     6,     6,
     6,   nil,     4,   nil,   nil,   nil,     4,     6,     6,     6,
     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     6,     6,
     6,     6,     6,     6,     6,     6,     6,     6,     6,     6,
     6,     6,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     6,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     6,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     6,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     6,   nil,   nil,   nil,   nil,   nil,     6 ]

racc_goto_pointer = [
   nil,     4,     9,     5,    -3,   -58,   125,    -7,  -133,   -20 ]

racc_goto_default = [
   nil,   nil,     7,    30,    37,   nil,    17,     9,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  5, 48, :_reduce_none,
  4, 48, :_reduce_2,
  2, 49, :_reduce_none,
  8, 49, :_reduce_none,
  7, 49, :_reduce_none,
  13, 49, :_reduce_none,
  12, 49, :_reduce_none,
  3, 52, :_reduce_none,
  4, 52, :_reduce_none,
  3, 50, :_reduce_10,
  5, 50, :_reduce_11,
  4, 50, :_reduce_none,
  4, 50, :_reduce_none,
  6, 50, :_reduce_14,
  8, 50, :_reduce_15,
  6, 50, :_reduce_16,
  8, 50, :_reduce_none,
  10, 50, :_reduce_18,
  12, 50, :_reduce_19,
  6, 50, :_reduce_20,
  4, 50, :_reduce_none,
  5, 50, :_reduce_none,
  2, 50, :_reduce_none,
  2, 50, :_reduce_24,
  1, 55, :_reduce_25,
  1, 56, :_reduce_none,
  1, 56, :_reduce_none,
  3, 56, :_reduce_none,
  3, 56, :_reduce_none,
  1, 51, :_reduce_30,
  1, 54, :_reduce_31,
  1, 54, :_reduce_32,
  1, 53, :_reduce_33,
  1, 53, :_reduce_34,
  1, 53, :_reduce_35,
  1, 53, :_reduce_36,
  2, 53, :_reduce_37,
  3, 53, :_reduce_38,
  3, 53, :_reduce_39,
  3, 53, :_reduce_40,
  3, 53, :_reduce_41,
  3, 53, :_reduce_42,
  3, 53, :_reduce_43,
  3, 53, :_reduce_44,
  2, 53, :_reduce_45,
  3, 53, :_reduce_46,
  3, 53, :_reduce_47,
  3, 53, :_reduce_48,
  3, 53, :_reduce_49,
  3, 53, :_reduce_50,
  3, 53, :_reduce_51,
  3, 53, :_reduce_52,
  4, 53, :_reduce_53,
  3, 53, :_reduce_none ]

racc_reduce_n = 55

racc_shift_n = 167

racc_token_table = {
  false => 0,
  :error => 1,
  Asignacion => 2,
  PuntoComa => 3,
  Abre_Parentesis => 4,
  Cierra_Parentesis => 5,
  Fraccion_Entera => 6,
  Residuo_Entero => 7,
  Sustraccion => 8,
  Residuo_Exacto => 9,
  Adicion => 10,
  Repeticion => 11,
  Fraccion_Exacta => 12,
  Signo_Coma => 13,
  And => 14,
  Not => 15,
  Or => 16,
  MayorEstricto => 17,
  MenorEstricto => 18,
  Equivale => 19,
  Inequivale => 20,
  MayorIgual => 21,
  MenorIgual => 22,
  :UMENOS => 23,
  Pr_Number => 24,
  Pr_Boolean => 25,
  Program => 26,
  TkWith => 27,
  Cond_Do => 28,
  End => 29,
  Cond_Times => 30,
  Cond_If => 31,
  Cond_Then => 32,
  Cond_Else => 33,
  Cond_While => 34,
  Cond_For => 35,
  Cond_From => 36,
  Cond_To => 37,
  Cond_By => 38,
  Cond_Repeat => 39,
  TkBegin => 40,
  TkFunc => 41,
  Bool_True => 42,
  Bool_False => 43,
  Idtf => 44,
  Digit => 45,
  "return" => 46 }

racc_nt_base = 47

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"=\"",
  "\";\"",
  "\"(\"",
  "\")\"",
  "\"div\"",
  "\"mod\"",
  "\"-\"",
  "\"%\"",
  "\"+\"",
  "\"*\"",
  "\"/\"",
  "\",\"",
  "\"and\"",
  "\"not\"",
  "\"or\"",
  "\">\"",
  "\"<\"",
  "\"==\"",
  "\"/=\"",
  "\">=\"",
  "\"<=\"",
  "UMENOS",
  "\"number\"",
  "\"boolean\"",
  "\"program\"",
  "\"with\"",
  "\"do\"",
  "\"end\"",
  "\"times\"",
  "\"if\"",
  "\"then\"",
  "\"else\"",
  "\"while\"",
  "\"for\"",
  "\"from\"",
  "\"to\"",
  "\"by\"",
  "\"repeat\"",
  "\"begin\"",
  "\"func\"",
  "\"true\"",
  "\"false\"",
  "\"id\"",
  "\"num\"",
  "\"return\"",
  "$start",
  "Inicio",
  "Funcion",
  "Bloque",
  "Id",
  "Arg",
  "Exp",
  "TipoVar",
  "Num",
  "Attr" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'retina_parser.y', 75)
  def _reduce_2(val, _values, result)
     result = Inicio.new(val[1]) 
    result
  end
.,.,

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

module_eval(<<'.,.,', 'retina_parser.y', 89)
  def _reduce_10(val, _values, result)
     result = Declaracion.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 90)
  def _reduce_11(val, _values, result)
     result = Declaracion.new(val[0],val[1],val[3]) 
    result
  end
.,.,

# reduce 12 omitted

# reduce 13 omitted

module_eval(<<'.,.,', 'retina_parser.y', 93)
  def _reduce_14(val, _values, result)
     result = If.new(val[1],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 94)
  def _reduce_15(val, _values, result)
     result = If.new(val[1],val[3],val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 95)
  def _reduce_16(val, _values, result)
     result = While.new(val[1],val[3]) 
    result
  end
.,.,

# reduce 17 omitted

module_eval(<<'.,.,', 'retina_parser.y', 97)
  def _reduce_18(val, _values, result)
     result = For.new(val[1],val[3],val[5],val[7]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 98)
  def _reduce_19(val, _values, result)
     result = For.new(val[1],val[3],val[5],val[7],val[11]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 99)
  def _reduce_20(val, _values, result)
     result = Repeat.new(val[1],val[3]) 
    result
  end
.,.,

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

module_eval(<<'.,.,', 'retina_parser.y', 103)
  def _reduce_24(val, _values, result)
     result = Bloque_Cod.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 106)
  def _reduce_25(val, _values, result)
     result = Numero.new(val[0]) 
    result
  end
.,.,

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

# reduce 29 omitted

module_eval(<<'.,.,', 'retina_parser.y', 115)
  def _reduce_30(val, _values, result)
     result = Identificador.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 118)
  def _reduce_31(val, _values, result)
     result = Number.new() 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 119)
  def _reduce_32(val, _values, result)
     result = Boolean.new() 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 122)
  def _reduce_33(val, _values, result)
     result = Numero.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 123)
  def _reduce_34(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 124)
  def _reduce_35(val, _values, result)
     result = Booleano.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 125)
  def _reduce_36(val, _values, result)
     result = Booleano.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 126)
  def _reduce_37(val, _values, result)
     result = MenosUnario.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 127)
  def _reduce_38(val, _values, result)
     result = Suma.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 128)
  def _reduce_39(val, _values, result)
     result = Resta.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 129)
  def _reduce_40(val, _values, result)
     result = Multiplicacion.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 130)
  def _reduce_41(val, _values, result)
     result = Division_Exacta.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 131)
  def _reduce_42(val, _values, result)
     result = Resto_Exacto.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 132)
  def _reduce_43(val, _values, result)
     result = Division_Entera.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 133)
  def _reduce_44(val, _values, result)
     result = Resto_Entero.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 134)
  def _reduce_45(val, _values, result)
     result = Negado.new(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 135)
  def _reduce_46(val, _values, result)
     result = Conjuncion.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 136)
  def _reduce_47(val, _values, result)
     result = Disyuncion.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 137)
  def _reduce_48(val, _values, result)
     result = Mayor_Estricto.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 138)
  def _reduce_49(val, _values, result)
     result = Menor_Estricto.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 139)
  def _reduce_50(val, _values, result)
     result = Mayor_Igual.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 140)
  def _reduce_51(val, _values, result)
     result = Menor_Igual.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 141)
  def _reduce_52(val, _values, result)
     result = Equivalencia.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 142)
  def _reduce_53(val, _values, result)
     result = Inequivalencia.new(val[0],val[2]) 
    result
  end
.,.,

# reduce 54 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
