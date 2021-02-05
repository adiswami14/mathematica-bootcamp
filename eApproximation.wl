(* ::Package:: *)

(* ::Input:: *)
(*approx[n_]:=N[(1+1/n)^n]*)
(*approxerror[n_]:=N[E-(1+1/n)^n]*)


(* ::Input:: *)
(*list = Table[approxerror[n], {n,1000,50000,1000}]*)


(* ::Input:: *)
(*ListLinePlot[list]*)


(* ::Input:: *)
(*convergeList = Table[n*approxerror[n], {n, 1000, 50000, 1000}]*)


(* ::Input:: *)
(*ListLinePlot[convergeList]*)


(* ::Input:: *)
(*ListLinePlot[Table[approx[n],{n, 1000, 50000, 1000}]]*)


(* ::Input:: *)
(*largeNumber = 10^5*)


(* ::Input:: *)
(*constantGuess = largeNumber*approxerror[largeNumber]*)


(* ::Input:: *)
(*constantFunction[n_]:=constantGuess/n*)
(*constantTable = Table[constantFunction[n], {n,1000, 50000, 1000}]*)


(* ::Input:: *)
(*ListLinePlot[constantTable]*)


(* ::Input:: *)
(*ListLinePlot[{list, constantTable}, Mesh->All, MeshStyle->{Black}]*)


(* ::Input:: *)
(*ListLinePlot[{Table[E, {n, 10000, 500000, 10000}], Table[approx[n], {n,10000, 500000, 10000}]}]*)
