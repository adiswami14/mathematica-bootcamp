(* ::Package:: *)

expSumVisualizer[p_] := Accumulate[Exp[2*Pi*I*#^2/p]& /@ Table[n, {n, 1, p}]]

expSumVisualizer[3]


list = expSumVisualizer[1057]


ListLinePlot[N[{Re[#], Im[#]}& /@ list]]


generalizedExpSumVisual[p_, c_] := Accumulate[Exp[2*Pi*I*#^c/p]& /@ Table[n, {n, 1, p}]] 


list2 = generalizedExpSumVisual[1057, 3]


ListLinePlot[N[{Re[#], Im[#]}& /@ list2]]


x[t_]:=N[Re[list2[[t]]]]
y[t_]:=N[Im[list2[[t]]]]
z[t_] := t/100

ListPointPlot3D[Table[{x[t], y[t], z[t]}, {t, 1, 1057}]] /. Point->Line
