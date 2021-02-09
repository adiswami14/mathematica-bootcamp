(* ::Package:: *)

sim[k_, n_] := Table[Total[RandomReal[1, n]], {i, 1, k}]

sim[5, 3]


prob[k_, n_] := N[Length[Select[sim[k, n], #<1&]]/k]

prob[100, 2]


Table[prob[100000, k], {k, 1, 6}]
