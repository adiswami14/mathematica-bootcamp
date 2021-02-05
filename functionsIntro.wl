(* ::Package:: *)

sumPowerTwo[n_]:=Sum[2^c, {c,0,n}]
sumPowerTwo[2]


sumSquares[x_, y_]:=Sqrt[x^2+y^2]
sumSquares[5,1]


eNegativePower[n_]:=Sum[E^(-c), {c,1,n}]
ListLinePlot[Table[eNegativePower[n], {n, 1, 10}]]
