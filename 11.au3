;~ Sleep(10000)
;~ ������� ������� �������
Opt("CaretCoordMode", 2)
$aClientSize = WinGetClientSize("VEGA Conflict")
$x0=0
$y0=20
$x1=$aClientSize[0]
$y1=$aClientSize[1]

;~ ��������� ��� ������
$Red=0xD56E6E
$Yelow=0xE1965B
$Blue=0x4FA5C2
$White=0xFFFFFF
$WhiteSpace=0xC3EBF3

;~ ������ �������� �����
$ysheep1=$y1/2-200
$sheepleft=$x1-225
$SheepLeftClick=$sheepleft+15
$sheeprightIcon=$sheepleft+30
$SelectSheep=7
$dysheep=43

;~ ������ � ������ ������
$xBtn1=$x1/2-95*2
$dxBtn=95
$yBtn=$y1-35-20

;~ ������ �� � ������ ������
$xBtnOk=($x1)/2+$x0
$yBtnOk=($y1)/2+$y0+80

#include <Misc.au3>
#include <MsgBoxConstants.au3>
HotKeySet("{ESC}","stop")

$hFile = FileOpen("test.txt", 10)
$dll = DllOpen("user32.dll")

;~ ���������� ���������� �� ����� �������������� �������
$SheepRem=0
;~ ���������� ��������� �����
Local $StateSheep [7] = [0,0,0,0,0,0,0]
;~ ���������� ����������� ����� �������
Local $BatleSheep [7]= [0,0,0,0,0,0,1]
;~ ������� �������. � ������� ������ ������
Local $RepairNom [7]= [7,6,5,4,3,2,1]
$hFile = FileOpen("test.txt", 1)


While 1
    Sleep(50)


	  $i=7
		 If $SelectSheep<$i Then
			$dy=138
		 Else
			$dy=0
		 EndIf
		 MouseClick("left",$sheeprightIcon-8,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2-1,1,1)
	  $aCoord=MouseGetPos()
		$ColorCord=PixelGetColor($aCoord[0],$aCoord[1])

         ToolTip("������ ���"&@CRLF&"����������: x="&$aCoord[0]&" y="&$aCoord[1]&@CRLF&"����="&$ColorCord, Default, Default, '_IsPressed', 1)


WEnd
Func stop()
    Exit
 EndFunc



DllClose($dll)

