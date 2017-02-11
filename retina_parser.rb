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

module_eval(<<'...end retina_parser.y/module_eval...', 'retina_parser.y', 162)

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
    80,    93,    26,   110,     6,   138,    24,   130,   122,    68,
    99,     3,    35,    25,    36,   139,    19,    20,   100,     4,
   109,    19,    20,   100,    26,   121,     4,   126,    24,    51,
   107,    52,    53,    54,    57,    25,    55,    56,   108,    19,
    20,    22,    23,    18,    21,    19,    20,    26,    14,    70,
    70,    24,    12,    19,    20,    13,    15,    73,    25,   128,
    16,    65,    66,    22,    23,    18,    21,   152,    19,    20,
    26,    14,    19,    20,    24,    12,    19,    20,    13,    15,
   129,    25,   119,    16,    19,    20,    22,    23,    18,    21,
   149,    19,    20,    26,    14,    19,    20,    24,    12,   131,
   113,    13,    15,    18,    25,    18,    16,   104,   136,    22,
    23,    18,    21,    98,    19,    20,    26,    14,    66,   158,
    24,    12,    95,   141,    13,    15,   142,    25,    75,    16,
   144,    74,    22,    23,    18,    21,   146,    19,    20,    26,
    14,   147,   117,    24,    12,    18,    63,    13,    15,    61,
    25,   151,    16,    42,    41,    22,    23,    18,    21,   154,
    19,    20,    26,    14,    18,     4,    24,    12,    28,    18,
    13,    15,     5,    25,   160,    16,   161,   162,    22,    23,
    18,    21,    51,   163,    26,    53,    54,    57,    24,    55,
    56,   164,   -53,   -53,   -53,    25,   -53,   -53,   nil,   nil,
   nil,    22,    23,    18,    21,    19,    20,    26,    14,   nil,
    30,    24,    12,   nil,   nil,    13,    15,   nil,    25,   nil,
    16,   nil,   nil,    22,    23,    18,    21,   nil,    19,    20,
    26,    14,   nil,   115,    24,    12,   nil,   116,    13,    15,
   nil,    25,   nil,    16,   nil,   nil,    22,    23,    18,    21,
   nil,    19,    20,    26,    14,   nil,   nil,    24,    12,   nil,
   nil,    13,    15,   nil,    25,   nil,    16,   nil,   nil,    22,
    23,    18,    21,   nil,    19,    20,    26,    14,   nil,   nil,
    24,    12,   nil,   nil,    13,    15,    26,    25,   nil,    16,
    24,   nil,    22,    23,    18,    21,    51,    25,    52,    53,
    54,    57,   nil,    55,    56,   -53,   -53,   -53,    26,   -53,
   -53,   nil,    24,   nil,   nil,    22,    23,    18,    21,    25,
    26,   nil,   nil,   nil,    24,    22,    23,    18,    21,    19,
    20,    25,    14,   -53,   -53,   -53,    12,   -53,   -53,    13,
    15,   nil,    26,   nil,    16,   nil,    24,    22,    23,    18,
    21,   nil,   nil,    25,    26,   nil,   nil,   nil,    24,    22,
    23,    18,    21,    19,    20,    25,    14,   nil,    26,   nil,
    12,   nil,    24,    13,    15,   nil,    26,   nil,    16,    25,
    24,    22,    23,    18,    21,   nil,    26,    25,   nil,   nil,
    24,   nil,   nil,    22,    23,    18,    21,    25,    51,   nil,
    52,    53,    54,    57,   nil,    55,    56,    22,    23,    18,
    21,   nil,   nil,   nil,   nil,    22,    23,    18,    21,    26,
   nil,   nil,   nil,    24,   nil,    22,    23,    18,    21,    51,
    25,    52,    53,    54,    57,   nil,    55,    56,   nil,   nil,
    19,    20,    26,    14,   nil,   150,    24,    12,   nil,   nil,
    13,    15,   nil,    25,   nil,    16,   nil,   nil,    22,    23,
    18,    21,   nil,    19,    20,    26,    14,   nil,    62,    24,
    12,   nil,   nil,    13,    15,   nil,    25,   nil,    16,   nil,
   nil,    22,    23,    18,    21,   nil,    19,    20,    26,    14,
   nil,   118,    24,    12,   nil,   nil,    13,    15,   nil,    25,
   nil,    16,   nil,   nil,    22,    23,    18,    21,   nil,    19,
    20,    26,    14,   nil,   nil,    24,    12,   nil,   nil,    13,
    15,   nil,    25,   nil,    16,   nil,   nil,    22,    23,    18,
    21,   nil,    19,    20,    26,    14,   nil,   nil,    24,    12,
   nil,   nil,    13,    15,   nil,    25,   nil,    16,   nil,   nil,
    22,    23,    18,    21,   nil,    19,    20,    26,    14,   nil,
   nil,    24,    12,   nil,   nil,    13,    15,   nil,    25,   nil,
    16,   nil,   nil,    22,    23,    18,    21,   nil,    19,    20,
    26,    14,   nil,   135,    24,    12,   nil,   nil,    13,    15,
   nil,    25,   nil,    16,   nil,   nil,    22,    23,    18,    21,
   nil,   nil,    26,   nil,   nil,   nil,    24,    51,   nil,    52,
    53,    54,    57,    25,    55,    56,   nil,   nil,   nil,    22,
    23,    18,    21,    19,    20,    26,    14,   nil,   nil,    24,
    12,   nil,   nil,    13,    15,   nil,    25,   nil,    16,   nil,
   nil,    22,    23,    18,    21,   nil,    19,    20,    26,    14,
   nil,   nil,    24,    12,   nil,   nil,    13,    15,   nil,    25,
   nil,    16,   nil,   nil,    22,    23,    18,    21,   nil,    19,
    20,    26,    14,   nil,   nil,    24,    12,   nil,   nil,    13,
    15,   nil,    25,   nil,    16,   nil,   nil,    22,    23,    18,
    21,   nil,    19,    20,    26,    14,   nil,   137,    24,    12,
   nil,   nil,    13,    15,   nil,    25,   nil,    16,   nil,   nil,
    22,    23,    18,    21,   nil,    19,    20,    26,    14,   nil,
   nil,    24,    12,   nil,   nil,    13,    15,   nil,    25,   nil,
    16,   nil,   nil,    22,    23,    18,    21,   nil,    19,    20,
    26,    14,   nil,   nil,    24,    12,   nil,   nil,    13,    15,
    26,    25,   nil,    16,    24,   nil,    22,    23,    18,    21,
    26,    25,    49,    50,    24,    48,   nil,    46,    47,   nil,
    51,    25,    52,    53,    54,    57,   nil,    55,    56,    22,
    23,    18,    21,    26,   nil,   nil,   nil,    24,   nil,    22,
    23,    18,    21,   nil,    25,   nil,   nil,   nil,   nil,    22,
    23,    18,    21,   nil,    19,    20,    26,    14,   nil,   120,
    24,    12,   nil,   nil,    13,    15,    26,    25,   nil,    16,
    24,   nil,    22,    23,    18,    21,    26,    25,   nil,   nil,
    24,    26,   nil,   nil,   nil,    24,   nil,    25,   nil,    26,
   nil,   nil,    25,    24,   nil,    22,    23,    18,    21,    26,
    25,   nil,   nil,    24,   nil,    22,    23,    18,    21,   nil,
    25,   nil,   nil,   nil,   nil,    22,    23,    18,    21,   nil,
    22,    23,    18,    21,   nil,   nil,   nil,   nil,    22,    23,
    18,    21,    26,   nil,   nil,   nil,    24,   nil,    22,    23,
    18,    21,   nil,    25,   -53,   -53,   -53,   nil,   -53,   -53,
   nil,   -53,   -53,   -53,    26,   -53,   -53,   nil,    24,    26,
   nil,   nil,   nil,    24,   nil,    25,   nil,   nil,   nil,   nil,
    25,    22,    23,    18,    21,    19,    20,    26,    14,   nil,
   140,    24,    12,   nil,   nil,    13,    15,   nil,    25,   nil,
    16,   nil,   nil,    22,    23,    18,    21,   nil,    22,    23,
    18,    21,    26,    53,    54,    57,    24,    55,    56,   nil,
    26,   nil,   nil,    25,    24,   nil,    22,    23,    18,    21,
   nil,    25,    49,    50,    45,    48,    44,    46,    47,   nil,
    51,   nil,    52,    53,    54,    57,   nil,    55,    56,   nil,
   nil,    22,    23,    18,    21,    72,   nil,   nil,   nil,    22,
    23,    18,    21,    49,    50,    45,    48,    44,    46,    47,
   nil,    51,   nil,    52,    53,    54,    57,   nil,    55,    56,
    97,   nil,   nil,    49,    50,    45,    48,    44,    46,    47,
    71,    51,   nil,    52,    53,    54,    57,   112,    55,    56,
    49,    50,    45,    48,    44,    46,    47,   nil,    51,   nil,
    52,    53,    54,    57,   159,    55,    56,    49,    50,    45,
    48,    44,    46,    47,   nil,    51,   nil,    52,    53,    54,
    57,   157,    55,    56,    49,    50,    45,    48,    44,    46,
    47,   nil,    51,   nil,    52,    53,    54,    57,    43,    55,
    56,    49,    50,    45,    48,    44,    46,    47,   nil,    51,
   nil,    52,    53,    54,    57,   nil,    55,    56,    91,    49,
    50,    45,    48,    44,    46,    47,   nil,    51,   nil,    52,
    53,    54,    57,   nil,    55,    56,    49,    50,    45,    48,
    44,    46,    47,   nil,    51,   nil,    52,    53,    54,    57,
   nil,    55,    56,    49,    50,    45,    48,    44,    46,    47,
   nil,    51,   nil,    52,    53,    54,    57,   nil,    55,    56,
    49,    50,   nil,    48,   nil,    46,    47,   nil,    51,   nil,
    52,    53,    54,    57,   nil,    55,    56 ]

racc_action_check = [
    47,    61,    47,    93,     2,   130,    47,   119,   107,    36,
    69,     0,    11,    47,    11,   130,    14,    14,    69,     2,
    93,    61,    61,   114,   148,   107,     0,   115,   148,    82,
    92,    82,    82,    82,    82,   148,    82,    82,    92,   110,
   110,    47,    47,    47,    47,   148,   148,   143,   148,    36,
   100,   143,   148,    40,    40,   148,   148,    40,   143,   117,
   148,    34,    34,   148,   148,   148,   148,   148,   143,   143,
   141,   143,     9,     9,   141,   143,   122,   122,   143,   143,
   118,   141,   104,   143,   108,   108,   143,   143,   143,   143,
   143,   141,   141,   155,   141,    33,    33,   155,   141,   120,
    99,   141,   141,    94,   155,   123,   141,    74,   125,   141,
   141,   141,   141,    68,   155,   155,   102,   155,    64,   155,
   102,   155,    62,   133,   155,   155,   135,   102,    42,   155,
   137,    41,   155,   155,   155,   155,   139,   102,   102,     6,
   102,   140,   102,     6,   102,    32,    30,   102,   102,    27,
     6,   146,   102,    16,    15,   102,   102,   102,   102,   150,
     6,     6,   152,     6,    10,     7,   152,     6,     5,     4,
     6,     6,     1,   152,   157,     6,   158,   159,     6,     6,
     6,     6,    85,   160,     8,    85,    85,    85,     8,    85,
    85,   162,    90,    90,    90,     8,    90,    90,   nil,   nil,
   nil,   152,   152,   152,   152,     8,     8,   101,     8,   nil,
     8,   101,     8,   nil,   nil,     8,     8,   nil,   101,   nil,
     8,   nil,   nil,     8,     8,     8,     8,   nil,   101,   101,
   151,   101,   nil,   101,   151,   101,   nil,   101,   101,   101,
   nil,   151,   nil,   101,   nil,   nil,   101,   101,   101,   101,
   nil,   151,   151,   116,   151,   nil,   nil,   116,   151,   nil,
   nil,   151,   151,   nil,   116,   nil,   151,   nil,   nil,   151,
   151,   151,   151,   nil,   116,   116,    12,   116,   nil,   nil,
    12,   116,   nil,   nil,   116,   116,    13,    12,   nil,   116,
    13,   nil,   116,   116,   116,   116,    81,    13,    81,    81,
    81,    81,   nil,    81,    81,    89,    89,    89,   121,    89,
    89,   nil,   121,   nil,   nil,    12,    12,    12,    12,   121,
   149,   nil,   nil,   nil,   149,    13,    13,    13,    13,   121,
   121,   149,   121,    86,    86,    86,   121,    86,    86,   121,
   121,   nil,   109,   nil,   121,   nil,   109,   121,   121,   121,
   121,   nil,   nil,   109,    80,   nil,   nil,   nil,    80,   149,
   149,   149,   149,   109,   109,    80,   109,   nil,    24,   nil,
   109,   nil,    24,   109,   109,   nil,    25,   nil,   109,    24,
    25,   109,   109,   109,   109,   nil,    26,    25,   nil,   nil,
    26,   nil,   nil,    80,    80,    80,    80,    26,    83,   nil,
    83,    83,    83,    83,   nil,    83,    83,    24,    24,    24,
    24,   nil,   nil,   nil,   nil,    25,    25,    25,    25,   145,
   nil,   nil,   nil,   145,   nil,    26,    26,    26,    26,    79,
   145,    79,    79,    79,    79,   nil,    79,    79,   nil,   nil,
   145,   145,    29,   145,   nil,   145,    29,   145,   nil,   nil,
   145,   145,   nil,    29,   nil,   145,   nil,   nil,   145,   145,
   145,   145,   nil,    29,    29,   103,    29,   nil,    29,   103,
    29,   nil,   nil,    29,    29,   nil,   103,   nil,    29,   nil,
   nil,    29,    29,    29,    29,   nil,   103,   103,    31,   103,
   nil,   103,    31,   103,   nil,   nil,   103,   103,   nil,    31,
   nil,   103,   nil,   nil,   103,   103,   103,   103,   nil,    31,
    31,     3,    31,   nil,   nil,     3,    31,   nil,   nil,    31,
    31,   nil,     3,   nil,    31,   nil,   nil,    31,    31,    31,
    31,   nil,     3,     3,    75,     3,   nil,   nil,    75,     3,
   nil,   nil,     3,     3,   nil,    75,   nil,     3,   nil,   nil,
     3,     3,     3,     3,   nil,    75,    75,   124,    75,   nil,
   nil,   124,    75,   nil,   nil,    75,    75,   nil,   124,   nil,
    75,   nil,   nil,    75,    75,    75,    75,   nil,   124,   124,
    35,   124,   nil,   124,    35,   124,   nil,   nil,   124,   124,
   nil,    35,   nil,   124,   nil,   nil,   124,   124,   124,   124,
   nil,   nil,    73,   nil,   nil,   nil,    73,    78,   nil,    78,
    78,    78,    78,    73,    78,    78,   nil,   nil,   nil,    35,
    35,    35,    35,    73,    73,    72,    73,   nil,   nil,    72,
    73,   nil,   nil,    73,    73,   nil,    72,   nil,    73,   nil,
   nil,    73,    73,    73,    73,   nil,    72,    72,    71,    72,
   nil,   nil,    71,    72,   nil,   nil,    72,    72,   nil,    71,
   nil,    72,   nil,   nil,    72,    72,    72,    72,   nil,    71,
    71,   127,    71,   nil,   nil,   127,    71,   nil,   nil,    71,
    71,   nil,   127,   nil,    71,   nil,   nil,    71,    71,    71,
    71,   nil,   127,   127,   138,   127,   nil,   127,   138,   127,
   nil,   nil,   127,   127,   nil,   138,   nil,   127,   nil,   nil,
   127,   127,   127,   127,   nil,   138,   138,   136,   138,   nil,
   nil,   136,   138,   nil,   nil,   138,   138,   nil,   136,   nil,
   138,   nil,   nil,   138,   138,   138,   138,   nil,   136,   136,
    44,   136,   nil,   nil,    44,   136,   nil,   nil,   136,   136,
    45,    44,   nil,   136,    45,   nil,   136,   136,   136,   136,
    46,    45,    76,    76,    46,    76,   nil,    76,    76,   nil,
    76,    46,    76,    76,    76,    76,   nil,    76,    76,    44,
    44,    44,    44,   105,   nil,   nil,   nil,   105,   nil,    45,
    45,    45,    45,   nil,   105,   nil,   nil,   nil,   nil,    46,
    46,    46,    46,   nil,   105,   105,    48,   105,   nil,   105,
    48,   105,   nil,   nil,   105,   105,    49,    48,   nil,   105,
    49,   nil,   105,   105,   105,   105,    50,    49,   nil,   nil,
    50,    51,   nil,   nil,   nil,    51,   nil,    50,   nil,    52,
   nil,   nil,    51,    52,   nil,    48,    48,    48,    48,    53,
    52,   nil,   nil,    53,   nil,    49,    49,    49,    49,   nil,
    53,   nil,   nil,   nil,   nil,    50,    50,    50,    50,   nil,
    51,    51,    51,    51,   nil,   nil,   nil,   nil,    52,    52,
    52,    52,    54,   nil,   nil,   nil,    54,   nil,    53,    53,
    53,    53,   nil,    54,    88,    88,    88,   nil,    88,    88,
   nil,    87,    87,    87,   132,    87,    87,   nil,   132,    56,
   nil,   nil,   nil,    56,   nil,   132,   nil,   nil,   nil,   nil,
    56,    54,    54,    54,    54,   132,   132,    57,   132,   nil,
   132,    57,   132,   nil,   nil,   132,   132,   nil,    57,   nil,
   132,   nil,   nil,   132,   132,   132,   132,   nil,    56,    56,
    56,    56,    65,    84,    84,    84,    65,    84,    84,   nil,
    55,   nil,   nil,    65,    55,   nil,    57,    57,    57,    57,
   nil,    55,    39,    39,    39,    39,    39,    39,    39,   nil,
    39,   nil,    39,    39,    39,    39,   nil,    39,    39,   nil,
   nil,    65,    65,    65,    65,    39,   nil,   nil,   nil,    55,
    55,    55,    55,    37,    37,    37,    37,    37,    37,    37,
   nil,    37,   nil,    37,    37,    37,    37,   nil,    37,    37,
    67,   nil,   nil,    67,    67,    67,    67,    67,    67,    67,
    37,    67,   nil,    67,    67,    67,    67,    96,    67,    67,
    96,    96,    96,    96,    96,    96,    96,   nil,    96,   nil,
    96,    96,    96,    96,   156,    96,    96,   156,   156,   156,
   156,   156,   156,   156,   nil,   156,   nil,   156,   156,   156,
   156,   153,   156,   156,   153,   153,   153,   153,   153,   153,
   153,   nil,   153,   nil,   153,   153,   153,   153,    17,   153,
   153,    17,    17,    17,    17,    17,    17,    17,   nil,    17,
   nil,    17,    17,    17,    17,   nil,    17,    17,    60,    60,
    60,    60,    60,    60,    60,    60,   nil,    60,   nil,    60,
    60,    60,    60,   nil,    60,    60,    58,    58,    58,    58,
    58,    58,    58,   nil,    58,   nil,    58,    58,    58,    58,
   nil,    58,    58,   106,   106,   106,   106,   106,   106,   106,
   nil,   106,   nil,   106,   106,   106,   106,   nil,   106,   106,
    77,    77,   nil,    77,   nil,    77,    77,   nil,    77,   nil,
    77,    77,    77,    77,   nil,    77,    77 ]

racc_action_pointer = [
   -16,   172,   -23,   507,   124,   168,   135,   123,   180,    47,
   119,    10,   272,   282,    -9,   109,   107,  1085,   nil,   nil,
   nil,   nil,   nil,   nil,   364,   372,   382,   145,   nil,   438,
   143,   484,   100,    70,    59,   576,     4,   997,   nil,   966,
    28,    94,    97,   nil,   736,   746,   756,    -2,   802,   812,
   822,   827,   835,   845,   878,   956,   905,   923,  1120,   nil,
  1103,    -4,   119,   nil,   115,   948,   nil,  1017,   110,     5,
   nil,   644,   621,   598,    61,   530,   756,  1154,   593,   415,
   350,   282,    15,   384,   936,   168,   316,   884,   877,   288,
   175,   nil,    25,   -21,    58,   nil,  1034,   nil,   nil,    97,
     5,   203,   112,   461,    44,   779,  1137,   -16,    59,   338,
    14,   nil,   nil,   nil,    10,    24,   249,    56,    77,   -39,
    96,   304,    51,    60,   553,    67,   nil,   667,   nil,   nil,
   -24,   nil,   900,    82,   nil,   123,   713,   127,   690,    90,
   138,    66,   nil,    43,   nil,   415,   122,   nil,    20,   316,
   156,   226,   158,  1068,   nil,    89,  1051,   144,   173,   147,
   180,   nil,   188,   nil,   nil ]

racc_action_default = [
   -53,   -53,   -53,   -53,   -53,   -53,   -53,    -3,   -53,   -10,
   -53,   -32,   -53,   -53,   -53,   -53,   -53,   -53,   -26,   -29,
   -30,   -31,   -33,   -34,   -53,   -53,   -53,   -53,   165,   -53,
   -53,   -23,   -53,   -28,   -53,   -53,   -53,   -53,   -32,   -53,
   -53,   -53,   -53,   -22,   -53,   -53,   -53,   -53,   -53,   -53,
   -53,   -53,   -53,   -53,   -53,   -53,   -53,   -53,   -35,   -43,
   -53,   -53,   -53,    -2,   -53,   -53,   -27,   -53,   -53,   -53,
   -24,   -53,   -53,   -53,   -53,   -53,   -36,   -37,   -38,   -39,
   -53,   -40,   -41,   -42,   -44,   -45,   -46,   -47,   -48,   -49,
   -50,   -52,   -53,   -53,   -53,    -1,   -53,   -12,   -20,   -53,
   -53,   -53,   -53,   -53,   -53,   -53,   -51,   -53,   -53,   -53,
   -53,    -8,   -11,   -21,   -25,   -53,   -53,   -53,   -53,   -53,
   -53,   -53,   -53,   -53,   -53,   -53,   -13,   -53,   -15,   -16,
   -53,   -19,   -53,   -53,    -9,   -53,   -53,   -53,   -53,   -53,
   -53,   -53,    -5,   -53,   -14,   -53,   -53,    -4,   -53,   -53,
   -53,   -53,   -53,   -53,   -17,   -53,   -53,   -53,   -53,   -53,
   -53,   -18,   -53,    -7,    -6 ]

racc_goto_table = [
    27,    69,     8,    92,     2,    29,    34,     1,    38,    38,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    38,    38,    38,   nil,   nil,   nil,   nil,   nil,    64,   nil,
   nil,    38,    33,    32,   nil,   nil,   nil,    40,    32,   nil,
    38,    38,    38,    38,    38,    38,    38,    38,    38,    38,
    38,    38,    38,    38,   nil,   nil,    33,    32,   nil,   nil,
   nil,    38,   nil,    33,    32,   114,   nil,   nil,   nil,   nil,
   101,   102,   103,   nil,   105,   nil,    38,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    94,   nil,   nil,   nil,   nil,
   111,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   124,   nil,
   nil,   nil,   nil,   nil,   nil,   127,   nil,   nil,   nil,   134,
   132,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    37,
    39,   nil,   123,   nil,   125,   143,   nil,   145,   nil,   nil,
   148,    58,    59,    60,   nil,    38,   133,   nil,    38,   nil,
   155,   nil,    67,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    76,    77,    78,    79,    81,    82,    83,    84,    85,
    86,    87,    88,    89,    90,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    96,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   106,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   153,   nil,   nil,   156 ]

racc_goto_check = [
     4,     9,     3,     5,     2,     3,     4,     1,     4,     4,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     4,     4,     4,   nil,   nil,   nil,   nil,   nil,     4,   nil,
   nil,     4,     8,     6,   nil,   nil,   nil,     8,     6,   nil,
     4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
     4,     4,     4,     4,   nil,   nil,     8,     6,   nil,   nil,
   nil,     4,   nil,     8,     6,     9,   nil,   nil,   nil,   nil,
     3,     3,     3,   nil,     3,   nil,     4,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     6,   nil,   nil,   nil,   nil,
     4,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     3,   nil,
   nil,   nil,   nil,   nil,   nil,     3,   nil,   nil,   nil,     4,
     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     7,
     7,   nil,     6,   nil,     6,     3,   nil,     3,   nil,   nil,
     3,     7,     7,     7,   nil,     4,     6,   nil,     4,   nil,
     3,   nil,     7,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     7,     7,     7,     7,     7,     7,     7,     7,     7,
     7,     7,     7,     7,     7,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     7,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     7,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     7,   nil,   nil,     7 ]

racc_goto_pointer = [
   nil,     7,     4,    -1,    -4,   -58,    24,   117,    23,   -35 ]

racc_goto_default = [
   nil,   nil,     7,    31,    11,   nil,    10,    17,     9,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  5, 49, :_reduce_1,
  4, 49, :_reduce_2,
  2, 50, :_reduce_3,
  9, 50, :_reduce_4,
  8, 50, :_reduce_5,
  14, 50, :_reduce_6,
  13, 50, :_reduce_7,
  2, 53, :_reduce_8,
  4, 53, :_reduce_9,
  1, 51, :_reduce_none,
  5, 51, :_reduce_11,
  4, 51, :_reduce_12,
  6, 51, :_reduce_13,
  8, 51, :_reduce_14,
  6, 51, :_reduce_15,
  6, 51, :_reduce_16,
  10, 51, :_reduce_17,
  12, 51, :_reduce_18,
  6, 51, :_reduce_19,
  4, 51, :_reduce_20,
  5, 51, :_reduce_21,
  2, 51, :_reduce_none,
  2, 51, :_reduce_23,
  1, 57, :_reduce_24,
  3, 57, :_reduce_25,
  1, 52, :_reduce_26,
  3, 56, :_reduce_27,
  2, 56, :_reduce_28,
  1, 54, :_reduce_29,
  1, 54, :_reduce_30,
  1, 55, :_reduce_31,
  1, 55, :_reduce_32,
  1, 55, :_reduce_33,
  1, 55, :_reduce_34,
  2, 55, :_reduce_35,
  3, 55, :_reduce_36,
  3, 55, :_reduce_37,
  3, 55, :_reduce_38,
  3, 55, :_reduce_39,
  3, 55, :_reduce_40,
  3, 55, :_reduce_41,
  3, 55, :_reduce_42,
  2, 55, :_reduce_43,
  3, 55, :_reduce_44,
  3, 55, :_reduce_45,
  3, 55, :_reduce_46,
  3, 55, :_reduce_47,
  3, 55, :_reduce_48,
  3, 55, :_reduce_49,
  3, 55, :_reduce_50,
  4, 55, :_reduce_51,
  3, 55, :_reduce_none ]

racc_reduce_n = 53

racc_shift_n = 165

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
  Flecha => 24,
  Pr_Number => 25,
  Pr_Boolean => 26,
  Program => 27,
  Cond_With => 28,
  Cond_Do => 29,
  End => 30,
  Cond_Times => 31,
  Cond_If => 32,
  Cond_Then => 33,
  Cond_Else => 34,
  Cond_While => 35,
  Cond_For => 36,
  Cond_From => 37,
  Cond_To => 38,
  Cond_By => 39,
  Cond_Repeat => 40,
  Pr_Begin => 41,
  Func => 42,
  Bool_True => 43,
  Bool_False => 44,
  Idtf => 45,
  Digit => 46,
  Pr_Return => 47 }

racc_nt_base = 48

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
  "\"->\"",
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
  "TipoVar",
  "Exp",
  "Decl",
  "Par" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'retina_parser.y', 74)
  def _reduce_1(val, _values, result)
     result = Multiple_Prog.new(val[0],Inicio.new(val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 75)
  def _reduce_2(val, _values, result)
     result = Inicio.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 78)
  def _reduce_3(val, _values, result)
     result = Multiple_Func.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 79)
  def _reduce_4(val, _values, result)
     result = Funcion.new(val[1],val[3],val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 80)
  def _reduce_5(val, _values, result)
     result = Funcion.new(val[1],val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 81)
  def _reduce_6(val, _values, result)
     result = Funcion.new(val[1],val[3],val[8],val[6],val[10]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 82)
  def _reduce_7(val, _values, result)
     result = Funcion.new(val[1],nil,val[7],val[5],val[9]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 85)
  def _reduce_8(val, _values, result)
     result = Declaracion.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 86)
  def _reduce_9(val, _values, result)
     result = Multiple_Arg.new(val[0],Declaracion.new(val[2],val[3]))
    result
  end
.,.,

# reduce 10 omitted

module_eval(<<'.,.,', 'retina_parser.y', 90)
  def _reduce_11(val, _values, result)
     result = Declaracion.new(val[0],val[1],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 91)
  def _reduce_12(val, _values, result)
     result = Igual.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 92)
  def _reduce_13(val, _values, result)
     result = If.new(val[1],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 93)
  def _reduce_14(val, _values, result)
     result = If.new(val[1],val[3],val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 94)
  def _reduce_15(val, _values, result)
     result = While.new(val[1],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 95)
  def _reduce_16(val, _values, result)
     result = With.new(val[1],val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 96)
  def _reduce_17(val, _values, result)
     result = For.new(val[1],val[3],val[5],val[7]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 97)
  def _reduce_18(val, _values, result)
     result = For.new(val[1],val[3],val[5],val[7],val[11]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 98)
  def _reduce_19(val, _values, result)
     result = Repeat.new(val[1],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 99)
  def _reduce_20(val, _values, result)
     result = Llamada.new(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 100)
  def _reduce_21(val, _values, result)
     result = Llamada.new(val[0],val[2])
    result
  end
.,.,

# reduce 22 omitted

module_eval(<<'.,.,', 'retina_parser.y', 102)
  def _reduce_23(val, _values, result)
     result = Bloque_Cod.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 105)
  def _reduce_24(val, _values, result)
     result = Identificador.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 106)
  def _reduce_25(val, _values, result)
     result = Multiple_Par.new(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 109)
  def _reduce_26(val, _values, result)
     result = Identificador.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 112)
  def _reduce_27(val, _values, result)
     result = Declaracion.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 113)
  def _reduce_28(val, _values, result)
     result = Multiple.new(val[0],val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 116)
  def _reduce_29(val, _values, result)
     result = Number.new() 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 117)
  def _reduce_30(val, _values, result)
     result = Boolean.new() 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 120)
  def _reduce_31(val, _values, result)
     result = Numero.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 121)
  def _reduce_32(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 122)
  def _reduce_33(val, _values, result)
     result = Booleano.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 123)
  def _reduce_34(val, _values, result)
     result = Booleano.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 124)
  def _reduce_35(val, _values, result)
     result = MenosUnario.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 125)
  def _reduce_36(val, _values, result)
     result = Suma.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 126)
  def _reduce_37(val, _values, result)
     result = Resta.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 127)
  def _reduce_38(val, _values, result)
     result = Multiplicacion.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 128)
  def _reduce_39(val, _values, result)
     result = Division_Exacta.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 129)
  def _reduce_40(val, _values, result)
     result = Resto_Exacto.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 130)
  def _reduce_41(val, _values, result)
     result = Division_Entera.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 131)
  def _reduce_42(val, _values, result)
     result = Resto_Entero.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 132)
  def _reduce_43(val, _values, result)
     result = Negado.new(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 133)
  def _reduce_44(val, _values, result)
     result = Conjuncion.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 134)
  def _reduce_45(val, _values, result)
     result = Disyuncion.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 135)
  def _reduce_46(val, _values, result)
     result = Mayor_Estricto.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 136)
  def _reduce_47(val, _values, result)
     result = Menor_Estricto.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 137)
  def _reduce_48(val, _values, result)
     result = Mayor_Igual.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 138)
  def _reduce_49(val, _values, result)
     result = Menor_Igual.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 139)
  def _reduce_50(val, _values, result)
     result = Equivalencia.new(val[0],val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'retina_parser.y', 140)
  def _reduce_51(val, _values, result)
     result = Inequivalencia.new(val[0],val[2]) 
    result
  end
.,.,

# reduce 52 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
