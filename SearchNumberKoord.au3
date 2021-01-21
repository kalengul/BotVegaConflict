#include <Array.au3>
#include <Color.au3>
Global $Number0 [8][5] = [[0,1,1,1,0],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[0,1,1,1,0]]
Global $Number1 [8][5] = [[0,0,1,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,1,0]]
Global $Number2 [8][5] = [[1,1,1,1,0],[0,0,0,1,1],[0,0,0,1,1],[0,0,0,1,0],[0,0,1,0,0],[0,1,0,0,0],[1,1,0,0,0],[1,1,1,1,1]]
Global $Number3 [8][5] = [[1,1,1,1,0],[0,0,0,1,1],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,0,0,0,1],[0,0,0,1,1],[1,1,1,1,0]]
Global $Number4 [8][5] = [[0,0,1,0,0],[0,1,1,0,0],[0,1,0,0,0],[1,1,0,1,0],[1,0,0,1,0],[1,1,1,1,1],[0,0,0,1,0],[0,0,0,1,0]]
Global $Number5 [8][5] = [[0,1,1,1,1],[1,1,0,0,0],[1,0,0,0,0],[0,1,1,1,0],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,1,1],[1,1,1,1,0]]
Global $Number6 [8][5] = [[0,1,1,1,0],[1,0,0,0,0],[1,0,0,0,0],[1,1,1,1,0],[1,0,0,0,1],[1,0,0,0,1],[1,1,0,1,1],[0,1,1,1,0]]
Global $Number7 [8][5] = [[1,1,1,1,1],[0,0,0,0,1],[0,0,0,1,0],[0,0,0,1,0],[0,0,1,0,0],[0,0,1,0,0],[0,1,0,0,0],[0,1,0,0,0]]
Global $Number8 [8][5] = [[0,1,1,1,0],[1,0,0,0,1],[1,0,0,0,1],[0,1,1,1,0],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[0,1,1,1,0]]
Global $Number9 [8][5] = [[0,1,1,1,0],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[0,1,1,1,1],[0,0,0,0,1],[0,0,0,1,1],[1,1,1,1,0]]

Global $Number[8][5]

While 1
$Nom1=0
$Nom2=0
$Nom3=0
$Nom4=0
$Nom5=0
$Nom6=0
$x0=1530
$y0=35
_GoNumber($x0,$y0,$Nom1)
;~ MouseClick("left",$x0,$y0,1,1)
$x0=1537
$y0=35
_GoNumber($x0,$y0,$Nom2)
;~ MouseClick("left",$x0,$y0,1,1)
$x0=1544
$y0=35
_GoNumber($x0,$y0,$Nom3)
;~ MouseClick("left",$x0,$y0,1,1)

$x0=1560
$y0=35
_GoNumber($x0,$y0,$Nom4)
;~ MouseClick("left",$x0,$y0,1,1)
$x0=1567
$y0=35
_GoNumber($x0,$y0,$Nom5)
;~ MouseClick("left",$x0,$y0,1,1)
$x0=1574
$y0=35
_GoNumber($x0,$y0,$Nom6)
;~ MouseClick("left",$x0,$y0,1,1)

MsgBox($MB_SYSTEMMODAL, "Координаты", $Nom1+$Nom2+$Nom3+" , "+$Nom4+$Nom5+$Nom6, 100)

sleep(10000)
WEnd

Func _GoFunctColor($x0,$y0)
$nColor=PixelGetColor($x0,$y0)
$BColor=_ColorGetBlue($nColor)
$GColor=_ColorGetGreen($nColor)
$RColor=_ColorGetRed($nColor)
$AllColor=$BColor+$GColor+$RColor
Return $AllColor
EndFunc

Func DxNumber ($x0, $y0, $Mx, ByRef $Dx )
$i=0
$n=0
   $Dx=0
   $NomMassY=0
   While $NomMassY<8
	  $NomMassX=0
	  While $NomMassX<4
		 if $Number[$NomMassY][$NomMassX]=1 Then
			$Dx=$Dx+(_GoFunctColor($x0+$NomMassX,$y0+$NomMassY)-$Mx)*(_GoFunctColor($x0+$NomMassX,$y0+$NomMassY)-$Mx)
			$n=$n+1
			EndIf
		 $NomMassX=$NomMassX+1
		 WEnd
	  $NomMassY=$NomMassY+1
	  WEnd
   $Dx=0;
If $n<>0 then
 $Dx=$Dx/$n
EndIf
EndFunc

Func MxNumber ( $x0,  $y0, ByRef $Mx)
$n=0
   $Mx=0;
   $NomMassY=0
   While $NomMassY<8
	  $NomMassX=0
	  While $NomMassX<4
		 if $Number[$NomMassY][$NomMassX]=1 Then
			$Mx=$Mx+_GoFunctColor($x0+$NomMassX,$y0+$NomMassY)
			$n=$n+1
			EndIf
		 $NomMassX=$NomMassX+1
		 WEnd
	  $NomMassY=$NomMassY+1
	  WEnd
If $n<>0 then
 $Mx=$Mx/$n
EndIf
EndFunc

Func _GoNumber ( $x0, $y0, ByRef $NomMinD)
$Number=$Number0
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
$MinD=$Dx
$NomMinD=0

$Number=$Number1
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=1
   EndIf

$Number=$Number2
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=2
   EndIf

$Number=$Number3
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=3
   EndIf

$Number=$Number4
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=4
   EndIf

$Number=$Number5
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=5
   EndIf

$Number=$Number6
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=6
   EndIf

$Number=$Number7
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=7
   EndIf

$Number=$Number8
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=8
   EndIf

$Number=$Number9
$Mx=0
MxNumber($x0,$y0,$Mx)
$Dx=0
DxNumber ($x0,$y0,$Mx,$Dx)
if $Dx<$MinD then
   $MinD=$Dx
   $NomMinD=9
   EndIf

EndFunc

