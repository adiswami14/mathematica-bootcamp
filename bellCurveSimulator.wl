(* ::Package:: *)

rsum[n_] := Total[RandomReal[1, n]]

(* rsum test *)
rsum[3]


sim[k_, n_]:= Table[rsum[n], {i, 1, k}]

(* sim test *)
list = sim[100000, 15]
Mean[list]
Median[list]


generateHistogram[n_]:=SmoothHistogram[sim[100000, n]]

generateHistogram[7]


generateHistogram[25]


(* generate table of bell curves *)
Table[generateHistogram[i], {i, 1, 15}]
