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
        "Syntactic error on: #{@token}"   
    end
end

class Parser < Racc::Parser

module_eval(<<'...end retina_parser.y/module_eval...', 'retina_parser.y', 155)

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
    86,    73,    27,   125,   106,   112,    29,    27,   107,   113,
     6,    29,    27,    30,   101,     3,    29,    27,    30,    16,
    17,    29,    27,    30,     4,   100,    29,   120,    30,     4,
    63,    27,    42,    30,   105,    29,    78,    41,    31,    32,
    33,    28,    30,    31,    32,    33,    28,    42,    31,    32,
    33,    28,    76,    31,    32,    48,    28,   119,    31,    32,
    33,    28,    27,    75,   -26,    71,    29,    31,    32,    33,
    28,    27,   -26,    30,    70,    29,    27,    16,    17,    69,
    29,    27,    30,    24,    25,    29,    27,    30,   103,    43,
    29,    27,    30,    40,   115,    29,   104,    30,    31,    32,
    33,    28,    30,    79,   116,   117,   118,    31,    32,    33,
    28,    80,    31,    32,    33,    28,    39,    31,    32,    33,
    28,    38,    31,    32,    33,    28,   122,    31,    32,    33,
    28,    27,   123,   124,    37,    29,    27,    42,   109,    36,
    29,    27,    30,    35,   127,    29,    27,    30,    23,   129,
    29,    27,    30,   130,   131,    29,   132,    30,   133,   134,
    27,   135,    30,   136,    29,   137,   138,    31,    32,    33,
    28,    30,    31,    32,    33,    28,   139,    31,    32,    33,
    28,   140,    31,    32,    33,    28,   141,    31,    32,    33,
    28,    27,   142,   143,    21,    29,    31,    32,    33,    28,
    27,   145,    30,    63,    29,    27,     4,   147,    19,    29,
    18,    30,   150,    27,    44,     5,    30,    29,   -52,   -52,
   -52,    27,   -52,   -52,    30,    29,   152,    31,    32,    33,
    28,   153,    30,   154,   155,   nil,    31,    32,    33,    28,
   nil,    31,    32,    33,    28,   nil,   nil,   nil,   nil,    31,
    32,    48,    28,   nil,   nil,   nil,   nil,    31,    32,    33,
    28,    27,   nil,   nil,    63,    29,    27,   nil,   nil,   nil,
    29,    27,    30,    63,   nil,    29,    57,    30,    58,    59,
    60,    64,    30,    62,    61,    57,   nil,   nil,    59,    60,
    64,   nil,    62,    61,   nil,   nil,   nil,    31,    32,    33,
    28,   nil,    31,    32,    33,    28,   nil,    31,    32,    33,
    28,    63,   nil,   nil,   nil,    56,    55,    51,    54,    50,
    52,    53,   nil,    57,   nil,    58,    59,    60,    64,    63,
    62,    61,   nil,    56,    55,    51,    54,    50,    52,    53,
    49,    57,    63,    58,    59,    60,    64,   nil,    62,    61,
    63,   nil,   nil,   nil,    68,   nil,   nil,   -52,   -52,   -52,
   nil,   -52,   -52,   nil,   nil,    59,    60,    64,    63,    62,
    61,    98,    56,    55,    51,    54,    50,    52,    53,   nil,
    57,   nil,    58,    59,    60,    64,    63,    62,    61,   nil,
    56,    55,    51,    54,    50,    52,    53,    63,    57,   nil,
    58,    59,    60,    64,    63,    62,    61,   nil,   nil,    57,
   nil,    58,    59,    60,    64,   nil,    62,    61,   nil,   -52,
   -52,   -52,    63,   -52,   -52,   nil,    56,    55,    51,    54,
    50,    52,    53,   nil,    57,   nil,    58,    59,    60,    64,
    63,    62,    61,   nil,    56,    55,    63,    54,   nil,    52,
    53,   nil,    57,   nil,    58,    59,    60,    64,    63,    62,
    61,   -52,   -52,   -52,   nil,   -52,   -52,   nil,   nil,   nil,
    57,   nil,    58,    59,    60,    64,    63,    62,    61,   nil,
    56,    55,    51,    54,    50,    52,    53,   nil,    57,   nil,
    58,    59,    60,    64,    63,    62,    61,   nil,    56,    55,
    51,    54,    50,    52,    53,    63,    57,   nil,    58,    59,
    60,    64,   nil,    62,    61,   nil,   nil,    57,   nil,    58,
    59,    60,    64,   nil,    62,    61,    63,   108,   nil,   nil,
    56,    55,    51,    54,    50,    52,    53,    63,    57,   nil,
    58,    59,    60,    64,   nil,    62,    61,   nil,   nil,    57,
   nil,    58,    59,    60,    64,   nil,    62,    61,    63,   149,
   nil,   nil,    56,    55,    51,    54,    50,    52,    53,   nil,
    57,   nil,    58,    59,    60,    64,    63,    62,    61,   nil,
    56,    55,   nil,    54,   nil,    52,    53,   nil,    57,   nil,
    58,    59,    60,    64,   nil,    62,    61,    63,   151,   nil,
   nil,    56,    55,    51,    54,    50,    52,    53,    63,    57,
   nil,    58,    59,    60,    64,   nil,    62,    61,   nil,   nil,
   nil,   nil,   nil,   -52,   -52,   -52,    63,   -52,   -52,   nil,
    56,    55,   nil,    54,   nil,    52,    53,   nil,    57,   nil,
    58,    59,    60,    64,   nil,    62,    61,    16,    17,   nil,
    13,   nil,   nil,   nil,    11,   nil,   nil,    12,    14,   nil,
   nil,    15,    16,    17,   nil,    13,    10,   nil,   nil,    11,
   nil,   nil,    12,    14,   nil,   nil,    15,    16,    17,   nil,
    13,    10,   nil,   nil,    11,   nil,   nil,    12,    14,   nil,
   nil,    15,    16,    17,   nil,    13,    10,   nil,   nil,    11,
   nil,   nil,    12,    14,   nil,   nil,    15,    16,    17,   nil,
    13,    10,   nil,   nil,    11,   nil,   nil,    12,    14,   nil,
   nil,    15,    16,    17,   nil,    13,    10,   nil,   nil,    11,
   nil,   nil,    12,    14,   nil,   nil,    15,    16,    17,   nil,
    13,    10,   nil,   nil,    11,   nil,   nil,    12,    14,   nil,
   nil,    15,    16,    17,   nil,    13,    10,   nil,   nil,    11,
   nil,   nil,    12,    14,   nil,   nil,    15,   nil,   nil,   nil,
   nil,    10 ]

racc_action_check = [
    53,    38,    53,   112,    73,    81,    53,    12,    74,    81,
     2,    12,    59,    53,    70,     0,    59,    80,    12,    38,
    38,    80,    58,    59,     2,    69,    58,   103,    80,     0,
    67,   145,    47,    58,    73,   145,    44,    22,    53,    53,
    53,    53,   145,    12,    12,    12,    12,    22,    59,    59,
    59,    59,    42,    80,    80,    80,    80,   103,    58,    58,
    58,    58,    57,    39,    48,    37,    57,   145,   145,   145,
   145,   141,    48,    57,    36,   141,    56,   104,   104,    35,
    56,    55,   141,    10,    10,    55,    43,    56,    72,    23,
    43,    11,    55,    21,    99,    11,    72,    43,    57,    57,
    57,    57,    11,    45,   100,   101,   102,   141,   141,   141,
   141,    45,    56,    56,    56,    56,    20,    55,    55,    55,
    55,    18,    43,    43,    43,    43,   105,    11,    11,    11,
    11,    60,   106,   107,    15,    60,    30,   111,    79,    14,
    30,    86,    60,    13,   115,    86,    61,    30,     9,   117,
    61,    52,    86,   118,   119,    52,   120,    61,   121,   122,
    62,   123,    52,   126,    62,   128,   129,    60,    60,    60,
    60,    62,    30,    30,    30,    30,   131,    86,    86,    86,
    86,   132,    61,    61,    61,    61,   135,    52,    52,    52,
    52,    51,   136,   137,     8,    51,    62,    62,    62,    62,
    50,   140,    51,    92,    50,    63,     7,   144,     5,    63,
     4,    50,   147,    25,    25,     1,    63,    25,    92,    92,
    92,    64,    92,    92,    25,    64,   149,    51,    51,    51,
    51,   151,    64,   152,   153,   nil,    50,    50,    50,    50,
   nil,    63,    63,    63,    63,   nil,   nil,   nil,   nil,    25,
    25,    25,    25,   nil,   nil,   nil,   nil,    64,    64,    64,
    64,    27,   nil,   nil,    88,    27,    29,   nil,   nil,   nil,
    29,    54,    27,    91,   nil,    54,    88,    29,    88,    88,
    88,    88,    54,    88,    88,    91,   nil,   nil,    91,    91,
    91,   nil,    91,    91,   nil,   nil,   nil,    27,    27,    27,
    27,   nil,    29,    29,    29,    29,   nil,    54,    54,    54,
    54,    26,   nil,   nil,   nil,    26,    26,    26,    26,    26,
    26,    26,   nil,    26,   nil,    26,    26,    26,    26,    34,
    26,    26,   nil,    34,    34,    34,    34,    34,    34,    34,
    26,    34,    95,    34,    34,    34,    34,   nil,    34,    34,
    90,   nil,   nil,   nil,    34,   nil,   nil,    95,    95,    95,
   nil,    95,    95,   nil,   nil,    90,    90,    90,    65,    90,
    90,    65,    65,    65,    65,    65,    65,    65,    65,   nil,
    65,   nil,    65,    65,    65,    65,    46,    65,    65,   nil,
    46,    46,    46,    46,    46,    46,    46,    89,    46,   nil,
    46,    46,    46,    46,    93,    46,    46,   nil,   nil,    89,
   nil,    89,    89,    89,    89,   nil,    89,    89,   nil,    93,
    93,    93,    96,    93,    93,   nil,    96,    96,    96,    96,
    96,    96,    96,   nil,    96,   nil,    96,    96,    96,    96,
    66,    96,    96,   nil,    66,    66,    97,    66,   nil,    66,
    66,   nil,    66,   nil,    66,    66,    66,    66,    87,    66,
    66,    97,    97,    97,   nil,    97,    97,   nil,   nil,   nil,
    87,   nil,    87,    87,    87,    87,   110,    87,    87,   nil,
   110,   110,   110,   110,   110,   110,   110,   nil,   110,   nil,
   110,   110,   110,   110,   114,   110,   110,   nil,   114,   114,
   114,   114,   114,   114,   114,    85,   114,   nil,   114,   114,
   114,   114,   nil,   114,   114,   nil,   nil,    85,   nil,    85,
    85,    85,    85,   nil,    85,    85,    77,    77,   nil,   nil,
    77,    77,    77,    77,    77,    77,    77,    84,    77,   nil,
    77,    77,    77,    77,   nil,    77,    77,   nil,   nil,    84,
   nil,    84,    84,    84,    84,   nil,    84,    84,   146,   146,
   nil,   nil,   146,   146,   146,   146,   146,   146,   146,   nil,
   146,   nil,   146,   146,   146,   146,    82,   146,   146,   nil,
    82,    82,   nil,    82,   nil,    82,    82,   nil,    82,   nil,
    82,    82,    82,    82,   nil,    82,    82,   148,   148,   nil,
   nil,   148,   148,   148,   148,   148,   148,   148,    94,   148,
   nil,   148,   148,   148,   148,   nil,   148,   148,   nil,   nil,
   nil,   nil,   nil,    94,    94,    94,    83,    94,    94,   nil,
    83,    83,   nil,    83,   nil,    83,    83,   nil,    83,   nil,
    83,    83,    83,    83,   nil,    83,    83,    49,    49,   nil,
    49,   nil,   nil,   nil,    49,   nil,   nil,    49,    49,   nil,
   nil,    49,   116,   116,   nil,   116,    49,   nil,   nil,   116,
   nil,   nil,   116,   116,   nil,   nil,   116,     3,     3,   nil,
     3,   116,   nil,   nil,     3,   nil,   nil,     3,     3,   nil,
   nil,     3,     6,     6,   nil,     6,     3,   nil,   nil,     6,
   nil,   nil,     6,     6,   nil,   nil,     6,    71,    71,   nil,
    71,     6,   nil,   nil,    71,   nil,   nil,    71,    71,   nil,
   nil,    71,   138,   138,   nil,   138,    71,   nil,   nil,   138,
   nil,   nil,   138,   138,   nil,   nil,   138,   113,   113,   nil,
   113,   138,   nil,   nil,   113,   nil,   nil,   113,   113,   nil,
   nil,   113,    68,    68,   nil,    68,   113,   nil,   nil,    68,
   nil,   nil,    68,    68,   nil,   nil,    68,   nil,   nil,   nil,
   nil,    68 ]

racc_action_pointer = [
   -10,   215,   -15,   654,   168,   208,   669,   167,   166,   106,
    80,    87,     3,   120,    97,    91,   nil,   nil,   117,   nil,
    88,    90,    34,    87,   nil,   209,   309,   257,   nil,   262,
   132,   nil,   nil,   nil,   327,    37,    39,    36,    -4,    60,
   nil,   nil,    10,    82,    33,    98,   384,    19,    59,   624,
   196,   187,   147,    -2,   267,    77,    72,    58,    18,     8,
   127,   142,   156,   201,   217,   366,   438,    28,   729,    22,
   -29,   684,    83,    -4,    -5,   nil,   nil,   524,   nil,   135,
    13,   -23,   574,   624,   535,   503,   137,   456,   262,   395,
   348,   271,   201,   402,   606,   340,   420,   444,   nil,    66,
    77,    69,    78,    19,    54,    98,   115,    91,   nil,   nil,
   474,   124,     0,   714,   492,   141,   639,   106,   150,   126,
   139,   116,   156,   123,   nil,   nil,   135,   nil,   137,   139,
   nil,   173,   143,   nil,   nil,   142,   189,   190,   699,   nil,
   157,    67,   nil,   nil,   179,    27,   556,   209,   595,   198,
   nil,   203,   230,   231,   nil,   nil ]

racc_action_default = [
   -52,   -52,   -52,   -52,   -52,   -52,   -52,    -3,   -52,   -52,
   -52,   -52,   -52,   -52,   -52,   -52,   -27,   -28,   -52,   156,
   -52,   -52,   -52,   -26,   -12,   -52,   -52,   -52,   -37,   -52,
   -52,   -42,   -43,   -51,   -52,   -52,   -52,   -52,   -52,   -52,
    -2,   -10,   -52,   -52,   -52,   -52,   -21,   -22,   -51,   -52,
   -52,   -52,   -52,   -52,   -52,   -52,   -52,   -52,   -52,   -52,
   -52,   -52,   -52,   -52,   -52,   -52,   -38,   -41,   -52,   -52,
   -52,   -52,   -52,   -52,   -52,    -1,   -25,   -52,   -19,   -52,
   -52,   -52,   -30,   -31,   -32,   -33,   -52,   -34,   -35,   -36,
   -39,   -40,   -44,   -45,   -46,   -47,   -48,   -50,   -29,   -52,
   -52,   -52,   -52,   -52,   -52,   -52,   -52,   -52,   -11,   -20,
   -23,   -24,   -52,   -52,   -49,   -52,   -52,   -52,   -52,   -52,
   -52,   -52,   -52,   -52,    -8,   -13,   -52,   -15,   -52,   -52,
   -18,   -52,   -52,    -9,    -5,   -52,   -52,   -52,   -52,    -4,
   -52,   -52,   -14,   -16,   -52,   -52,   -52,   -52,   -52,   -52,
   -17,   -52,   -52,   -52,    -7,    -6 ]

racc_goto_table = [
     8,    22,     1,    20,    74,    72,     2,    45,    26,    34,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    47,   nil,   nil,
   nil,   nil,    46,   nil,    65,   nil,    66,    67,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    77,   nil,   nil,   nil,   nil,   nil,    81,    82,    83,    84,
    85,    87,    88,    89,    90,    91,    92,    93,    94,    95,
    96,    97,   nil,   nil,   nil,    99,   nil,   nil,   102,   nil,
   121,   nil,   111,   nil,   nil,   nil,   nil,   110,   nil,   nil,
   nil,   nil,   nil,   114,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   126,   nil,   nil,   128,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   144,   nil,   nil,   146,   nil,
   nil,   nil,   148 ]

racc_goto_check = [
     3,     7,     1,     3,     6,     4,     2,     8,     5,     5,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     7,   nil,   nil,
   nil,   nil,     5,   nil,     5,   nil,     5,     5,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     5,   nil,   nil,   nil,   nil,   nil,     3,     5,     5,     5,
     5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
     5,     5,   nil,   nil,   nil,     3,   nil,   nil,     3,   nil,
     6,   nil,     7,   nil,   nil,   nil,   nil,     5,   nil,   nil,
   nil,   nil,   nil,     5,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     3,   nil,   nil,     3,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     3,   nil,   nil,     5,   nil,
   nil,   nil,     5 ]

racc_goto_pointer = [
   nil,     2,     6,    -3,   -33,    -3,   -34,    -8,   -18 ]

racc_goto_default = [
   nil,   nil,     7,   nil,   nil,   nil,     9,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  5, 46, :_reduce_none,
  4, 46, :_reduce_none,
  2, 47, :_reduce_none,
  8, 47, :_reduce_none,
  7, 47, :_reduce_none,
  13, 47, :_reduce_none,
  12, 47, :_reduce_none,
  3, 49, :_reduce_none,
  4, 49, :_reduce_none,
  3, 48, :_reduce_none,
  5, 48, :_reduce_none,
  2, 48, :_reduce_none,
  6, 48, :_reduce_none,
  8, 48, :_reduce_none,
  6, 48, :_reduce_none,
  8, 48, :_reduce_none,
  10, 48, :_reduce_none,
  6, 48, :_reduce_none,
  4, 48, :_reduce_none,
  5, 48, :_reduce_none,
  1, 53, :_reduce_none,
  1, 53, :_reduce_none,
  3, 53, :_reduce_none,
  3, 53, :_reduce_none,
  3, 52, :_reduce_none,
  1, 52, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  3, 50, :_reduce_29,
  3, 50, :_reduce_30,
  3, 50, :_reduce_31,
  3, 50, :_reduce_32,
  3, 50, :_reduce_33,
  3, 50, :_reduce_34,
  3, 50, :_reduce_35,
  3, 50, :_reduce_36,
  1, 50, :_reduce_37,
  2, 50, :_reduce_38,
  3, 50, :_reduce_39,
  3, 50, :_reduce_40,
  2, 50, :_reduce_41,
  1, 50, :_reduce_42,
  1, 50, :_reduce_43,
  3, 50, :_reduce_44,
  3, 50, :_reduce_45,
  3, 50, :_reduce_46,
  3, 50, :_reduce_47,
  3, 50, :_reduce_48,
  4, 50, :_reduce_49,
  3, 50, :_reduce_50,
  1, 50, :_reduce_51 ]

racc_reduce_n = 52

racc_shift_n = 156

racc_token_table = {
  false => 0,
  :error => 1,
  TkAsignacion => 2,
  TkPuntoComa => 3,
  TkAbreParentesis => 4,
  TkCierraParentesis => 5,
  TkDiv => 6,
  TkMod => 7,
  TkResta => 8,
  TkModulo => 9,
  TkSuma => 10,
  TkMultiplicacion => 11,
  TkDivision => 12,
  TkComa => 13,
  TkAnd => 14,
  TkNot => 15,
  TkOr => 16,
  TkMayorEstricto => 17,
  TkMenorEstricto => 18,
  TkEquivalencia => 19,
  TkInequivalencia => 20,
  TkMayorIgual => 21,
  TkMenorIgual => 22,
  TkNumber => 23,
  TkBoolean => 24,
  TkProgram => 25,
  TkWith => 26,
  TkDo => 27,
  TkEnd => 28,
  TkTimes => 29,
  TkIf => 30,
  TkThen => 31,
  TkElse => 32,
  TkWhile => 33,
  TkFor => 34,
  TkFrom => 35,
  TkTo => 36,
  TkRepeat => 37,
  TkBegin => 38,
  TkFunc => 39,
  TkFunc => 40,
  TkFalse => 41,
  TkId => 42,
  TkNum => 43,
  "return" => 44 }

racc_nt_base = 45

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
  "Arg",
  "Exp",
  "Tipo",
  "Id",
  "Attr" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

# reduce 17 omitted

# reduce 18 omitted

# reduce 19 omitted

# reduce 20 omitted

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

module_eval(<<'.,.,', 'retina_parser.y', 112)
  def _reduce_29(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 113)
  def _reduce_30(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 114)
  def _reduce_31(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 115)
  def _reduce_32(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 116)
  def _reduce_33(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 117)
  def _reduce_34(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 118)
  def _reduce_35(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 119)
  def _reduce_36(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 120)
  def _reduce_37(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 121)
  def _reduce_38(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 122)
  def _reduce_39(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 123)
  def _reduce_40(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 124)
  def _reduce_41(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 125)
  def _reduce_42(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 126)
  def _reduce_43(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 127)
  def _reduce_44(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 128)
  def _reduce_45(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 129)
  def _reduce_46(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 130)
  def _reduce_47(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 131)
  def _reduce_48(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 132)
  def _reduce_49(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 133)
  def _reduce_50(val, _values, result)
     result = 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 134)
  def _reduce_51(val, _values, result)
     result = 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
