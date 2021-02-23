(* ::Package:: *)

expSumList[p_] := Accumulate[Exp[2.0*Pi*I*#^2/p]& /@ Range[p]]

expSumList[3]


expSumList[50]


list = expSumList[1057];


Clear[visualizer]
visualizer[n_] := ListLinePlot[N[{Re[#], Im[#]}& /@ expSumList[n]]]


(*Finds the absolute timing of using ListLinePlot*)
AbsoluteTiming[visualizer[200*Pi]]


graphicsVisualizer[n_]:= Graphics[Line[N[{Re[#], Im[#]}& /@ expSumList[n]]]]
(* Finds the absolute timing of using Graphics[Line[]] *)
AbsoluteTiming[graphicsVisualizer[200*Pi]] (*Note how the 2 functions look exactly the same, but graphics is faster*)


visualizer[200*Pi]


(* Gives us a table of visualizer() calls from 50th to the 80th prime number *)
Table[{visualizer[Prime[n]], Prime[n]}, {n, 50, 80}]


(*This function returns us the last point of the list of exponential sums*)
lastPoint[n_]:= Chop[Last[N[{Re[#], Im[#]}& /@ expSumList[n]]]]

lastPoint[271]


choppedPoints = Table[lastPoint[Prime[n]], {n,2, 70}] (* See how there are zeros? That's because of the Chop function *)


primeNumList = Table[{Prime[n],Max[lastPoint[Prime[n]]]}, {n,2, 50}] (* Correlates the endpoints with each prime number *)


(* Plot just to see the general curve of the points given from primeNumList table *)
ListLinePlot[primeNumList]
(* What does this curve look like? *)


(* Decided to square primeNumList *)
Table[{Prime[n],Max[lastPoint[Prime[n]]]^2}, {n,2, 50}]


(* This table represents the exponential sum walks that end up on the Y-axis (Notice how we are isolating the second point as the x-value will be 0) *)
yAxesTable = #[[2]]& /@ Select[choppedPoints^2, #[[1]]==0&]


(* This table represents the exponential sum walks that end up on the X-axis (Notice how we are isolating the first point as the y-value will be 0) *)
xAxesTable = #[[1]]& /@ Select[choppedPoints^2, #[[2]]==0&]
(* What could this pattern be *)


(* Shows all prime numbers that also satisfy x = 4n+1 for n in range of 0 to 100 *)
Select[Table[4n+1, {n, 0, 100}], PrimeQ[#]&]


(* Shows all prime numbers that also satisfy x = 4n+3 for n in range of 0 to 100 *)
Select[Table[4n+3, {n, 0, 100}], PrimeQ[#]&]


(* Taking modulo 4 of all values in the yAxesTable, and deleting like elements *)
DeleteDuplicates[Mod[Floor[yAxesTable+0.00001], 4]]
(* We are adding a very small amount to the table to account for numerical error, and using the Floor function to get a whole number *)


(* Taking modulo 4 of all values in the xAxesTable, and deleting like elements *)
DeleteDuplicates[Mod[Floor[xAxesTable+0.00001], 4]]


(* A generalized Exponential Sum List for any power *)
generalizedExpSumList[p_, c_] := Accumulate[Exp[2.0*Pi*I*#^c/p]& /@ Range[p]]


list2 = generalizedExpSumList[1057, 3];


ListLinePlot[N[{Re[#], Im[#]}& /@ list2]]


(* Creating functions that isolate the x-Points and y-Points of the generalized exponential sum list *)
x[t_]:=N[Re[list2[[t]]]]
y[t_]:=N[Im[list2[[t]]]]
z[t_] := t/100


(* This was just me being extra, just to visualize how it would look as z kept increasing *)
ListPointPlot3D[Table[{x[t], y[t], z[t]}, {t, 1, 1057}]] /. Point->Line


(* I wanted to experiment with the differences between ListPointPlot3D and ListPlot3D, as you can see, the ListPointPlot3D looks much better in this scenario *)
ListPlot3D[Table[{x[t], y[t], z[t]}, {t, 1, 1057}]]


(* Interpolation basically can estimate the values of a function through the extent of its dataset *)
inter = Interpolation[Table[{{t}, {x[t], y[t], z[t]}}, {t, 0, 1057}]]; 

(* These are stuff that we can control to change the visualization's appearance *)
options = {PlotStyle -> {Red, (Tube @@ {##}) &},
           Background -> Black, Boxed -> False, Axes -> False, 
           PlotRange -> All,  BoxRatios -> 1};
           
(* Provides a 3D parametric plot that takes in the appearance altering that we did above *)
Manipulate[ParametricPlot3D[inter[t], {t, 0, tmax}, Evaluate@options], {tmax, 1, 1057}]
