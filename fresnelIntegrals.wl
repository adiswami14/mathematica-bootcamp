(* ::Package:: *)

f[t_] = Integrate[Cos[x^2], {x, 0, t}]
g[t_] = Integrate[Sin[x^2], {x, 0, t}]


Plot[{f[t], g[t]}, {t, 1, 10}]


ParametricPlot[{f[t], g[t]}, {t, 0, 10}, ColorFunction->"Rainbow", ImageSize->Full]


Manipulate[ParametricPlot[{f[t], g[t]}, {t, 1, x}, ColorFunction->"Rainbow", ImageSize->Full,PlotRange->{{0,1}, {0,1}}],
			{x, 1.1, 15, 0.1}]


Manipulate[ParametricPlot3D[{f[t], g[t], t/10}, {t, 1, x}, ColorFunction->"Rainbow", ImageSize->Full,PlotRange->{{0,1}, {0,1}, {0,1}}],
			{x, 1.1, 15, 0.1}]
