(* ::Package:: *)

(* ::Input:: *)
(**)


approx[n_]:=N[(1+1/n)^n]
approxerror[n_]:=N[E-(1+1/n)^n]


list = Table[approxerror[n], {n,1000,50000,1000}]
ListLinePlot[list]


convergeList = Table[n*approxerror[n], {n, 1000, 50000, 1000}]
ListLinePlot[convergeList]


ListLinePlot[Table[approx[n],{n, 1000, 50000, 1000}]]


largeNumber = 10^5
constantGuess = largeNumber*approxerror[largeNumber]
constantFunction[n_]:=constantGuess/n
constantTable = Table[constantFunction[n], {n,1000, 50000, 1000}]


ListLinePlot[constantTable]
ListLinePlot[{list, constantTable}, Mesh->All, MeshStyle->{Black}]
ListLinePlot[{Table[E, {n, 10000, 500000, 10000}], Table[approx[n], {n,10000, 500000, 10000}]}]



