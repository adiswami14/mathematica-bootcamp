(* ::Package:: *)

expSumList[p_] := Accumulate[Exp[2.0*Pi*I*#^2/p]& /@ Range[p]]

expSumList[3]


expSumList[4.5]


list = expSumList[1057];


Clear[visualizer]
visualizer[n_] := ListLinePlot[N[{Re[#], Im[#]}& /@ expSumList[n]]]


visualizer[200*Pi]


Table[{visualizer[Prime[n]], Prime[n]}, {n, 50, 75}]


generalizedExpSumList[p_, c_] := Accumulate[Exp[2.0*Pi*I*#^c/p]& /@ Range[p]]


list2 = generalizedExpSumList[1057, 3];


ListLinePlot[N[{Re[#], Im[#]}& /@ list2]]


x[t_]:=N[Re[list2[[t]]]]
y[t_]:=N[Im[list2[[t]]]]
z[t_] := t/100

ListPointPlot3D[Table[{x[t], y[t], z[t]}, {t, 1, 1057}]] /. Point->Line


ListPlot3D[Table[{x[t], y[t], z[t]}, {t, 1, 1057}]]


inter = Interpolation[Table[{{t}, {x[t], y[t], z[t]}}, {t, 0, 1057}]]; 

options = {PlotStyle -> {Red, Specularity[White, 50], (Tube @@ {##}) &},
           Background -> Black, Boxed -> False, Axes -> False, 
           PlotRange -> All,  BoxRatios -> 1};

Manipulate[ParametricPlot3D[inter[t], {t, 0, tmax}, Evaluate@options], {tmax, 1, 1057}]
