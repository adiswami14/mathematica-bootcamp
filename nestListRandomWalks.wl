(* ::Package:: *)

ListLinePlot[NestList[#+RandomChoice[{-1, 1}]&, 0, 10000]]


rwalk[n_, start_, steps_] := NestList[#+RandomChoice[steps]&, start, n]

ListLinePlot[rwalk[1000, 0, {-1, 1}]]


ListLinePlot[rwalk[10,{0,0},{{-1,1},{1,1},{1,-1},{-1,-1}}]]


ListLinePlot[rwalk[10,{0,0},{{0,1},{1,0},{0,-1},{-1,0}}]]


ListPlot3D[rwalk[100,{0,0,0},{{0,0,1},{0,0,-1},{1,0,0},{-1,0,0},{0,1,0},{0,-1,0}}]]


(* ::InheritFromParent:: *)
(**)
