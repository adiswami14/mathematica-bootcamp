(* ::Package:: *)

sumDigitSquares[n_] := Total[IntegerDigits[n]^2]

sumDigitSquares[13]


sumDigitSquaresIterated[n_] := Nest[sumDigitSquares[#]&, n, 100]
sumDigitSquaresIterated[25]


list = sumDigitSquaresIterated[#]& /@ Range[100]


Sort[DeleteDuplicates[list]]


sdslist = sumDigitSquares[#]& /@ list


findCycle[list_] := Last[SortBy[DeleteDuplicates[Select[Subsequences[list], Length[#]>2&]], 
					{SequenceCount[list, #1] < SequenceCount[list, #2]&, 
					Length[#1] < Length[#2]&}]]


(* find cycle tests *)
findCycle[{1, 2, 3, 2, 4, 2, 3, 2}]


findCycle[sdslist]


findCycle[{3,19,42,5,33,7,42,5,33,7,42,5}]



