(* ::Package:: *)

generateSquareSums[n_] := RandomReal[1, n]^2 + RandomReal[1, n]^2

generateSquareSums[6]


goodList[n_] := Select[generateSquareSums[n], #<1&]

goodList[6]


approxPi[n_] := N[4*Length[goodList[n]]/n]

approxPi[10]


Table[approxPi[10^i], {i, 1, 6}]
