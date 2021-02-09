(* ::Package:: *)

infiniteSquareSum[n_]:= NestList[Sqrt[1+#]&, 1, n]

ListLinePlot[infiniteSquareSum[50]]


infiniteDivision[n_] := NestList[1/(1+#)&, 1, n]

ListLinePlot[infiniteDivision[10]]
