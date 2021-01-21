#include <MsgBoxConstants.au3>
#include <Date.au3>
#include <Color.au3>
;~ Переменная вывода протокола
$FSettingFleet=FileOpen("SettingFletInAssistans.txt", 0)
$FSettingTime=FileOpen("SettingTimeInAssistans.txt", 0)
$FSystemSetting=FileOpen("SysSettingAssistans.txt", 0)
$hFile = FileOpen("Coord.txt", 2)

;~ Переменная заголовка рабочего окна (для Steam - "VEGA Conflict" для Mozila - "KIXEYE.com - Mozilla Firefox")
Global $NameWindow=FileReadLine($FSettingFleet,96)
;~ Размеры рабочей области
Opt("CaretCoordMode", 2)
Global $aClientSize = WinGetClientSize($NameWindow)
Global $aPos=WinGetPos($NameWindow)
While @error=1
   $aClientSize = WinGetClientSize($NameWindow)
   $aPos=WinGetPos($NameWindow)
WEnd
Global $x0=$aPos[0]+FileReadLine($FSystemSetting,1)
Global $y0=$aPos[1]+FileReadLine($FSystemSetting,2)+FileReadLine($FSystemSetting,5)
if (@OSVersion="WIN_8") or (@OSVersion="WIN_10") Then
   $y0=$y0+1
EndIf

Global $x1=$aClientSize[0]+FileReadLine($FSystemSetting,3)
Global $y1=$aClientSize[1]+FileReadLine($FSystemSetting,4)

$yFastRepair=0
;~ Убрать заголовки при запуске из Mozila
If $NameWindow="KIXEYE.com - Mozilla Firefox" Then
   $y0=$y0+67+1
   $yFastRepair=1
   $y1=$y1-70-90
   $x1=$x1-10+1
EndIf

$i0=$x0+$x1/2-249
$j0=$y0+$y1/2-233
$i1=$x0+$x1/2-189
$j1=$y0+$y1/2-224

;~ Координаты крестика
Global $xBtnExit=FileReadLine($FSystemSetting,61)
Global $yBtnExit=FileReadLine($FSystemSetting,62)

While not (WinActive($NameWindow))
   Sleep (500)
   WEnd

Sleep(5000)
MouseClick("left",$x0+40,$y0+40,1,1)


FileWrite($hFile, $i0&" "&$j0 &" "& $i1&" "&$j1&" "&$x0&" "&$x1&" "&$y0&" "&$y1&@CRLF)

$k=($j1-$j0+1)*($i1-$i0+1)
$kol=0
For $j=$j0 to $j1
   For $i=$i0 to $i1
	  ToolTip("Авторизация"&@CRLF&"Завершено "&int($kol/$k*100)&"%")
	  $kol=$kol+1
	  $pix=PixelGetColor($i,$j)
	  $pixB=_ColorGetBlue($pix)
	 FileWrite($hFile, $pixB & ":")
  Next
 FileWrite($hFile,  @CRLF)
 Next
 FileClose($hFile)
 MouseClick("left",$x0+$x1/2+$xBtnExit,$y0+$y1/2+$yBtnExit-10,1,1)
