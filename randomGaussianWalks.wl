(* ::Package:: *)

(* One-dimensional Random Gaussian walks *)
rlist[n_]:=RandomInteger[{-1,1}, n]
rlist[4]


rsum[n_] := Accumulate[n]
list = rlist[3]


rsum[list]


rplot[n_]:=ListLinePlot[rsum[RandomChoice[{-1, 1}, n]]]
rplot[10]


(* 2 Dimensional Random Gaussian Walk *)
rlist2d[n_]:= RandomChoice[{-1,1},{n,2}]
rlist2d[3]


rplot2d[n_]:=ListLinePlot[rsum[rlist2d[n]], ColorFunction->"Rainbow"]
rplot2d[3]


Table[rplot2d[n], {n, 0, 5}]


Manipulate[rplot2d[n], {n, 1, 100, 1}]


Manipulate[rplot[n], {n, 1, 100, 1}]
