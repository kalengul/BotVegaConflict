#include <MsgBoxConstants.au3>
;~ ������� ������� �������
Opt("CaretCoordMode", 2)
$aClientSize = WinGetClientSize("VEGA Conflict")
$x0=0
$y0=29
$x1=$aClientSize[0]
$y1=$aClientSize[1]

;~ ��������� ��� ������
$Red=0xD56E6E
$Yelow=0xE1965B
$Blue=0x4FA5C2
$White=0xFFFFFF
$WhiteSpace=0xC3EBF3

;~ ������ ��������
;~ ������� ������� 1-�� �������
$ysheep1=Floor($y1/2-220+$y0)
;~ ����� ������� ����������� ������� ��������
$sheepleft=$x1-225
$SheepLeftClick=$sheepleft+15
;~ ������ ������� ������ ����������� ������� ��������
$sheeprightIcon=$sheepleft+30
;~ ������ ���� � ���������
$dysheep=43

;~ ��������� ��������� ������� ���������� ��������� �������
;~ X �������� ��� �������� ��� ��������� � �������
$xOstDvish=11
;~ Y �������� ��� �������� ��� ��������� � �������
$yOstDvish=16
;~ X �������� ��� ������ �������� �������� � �������
$x2Dvish=8
;~ Y �������� ��� ������ �������� ��������  � �������
$y2Dvish=16
;~ X �������� ��� ����
$xBase=16
;~ Y �������� ��� ����
$yBase=16
;~ X �������� ��� �������
$xRepair=16
;~ Y �������� ��� �������
$yRepair=21
;~ X �������� ��� ���
$xFight=15
;~ Y �������� ��� ���
$yFight=12

;~ ������ � ������ ������
;~ ���������� ����� ����� ������
$xBtn1=$x1/2-95*2
;~ ����� ������
$dxBtn=95
;~ ������� ������� ������
$yBtn=$y1-35-40+$y0

;~ ������ �� � ������ ������
$xBtnOk=($x1)/2+$x0
$yBtnOk=($y1)/2+$y0+80



;~ ��������� � ������ ������� ���������� �������
$SelectSheep=7
;~ ���������� ��������� �����
Global $StateSheep [7] = [0,0,0,0,0,0,0]
;~ ���������� ���������� ������������ ������
Global $StateKolAllSheepDestroy [7] = [0,0,0,0,0,0,0]
;~ ���������� ���������� ��������� ����
Global $StateKolSelectAttackSheep [7] = [0,0,0,0,0,0,0]
;~ ���������� ���������� �������� �� �����
Global $StateKolRequestAttackSheep [7] = [0,0,0,0,0,0,0]
;~ ���������� ����������� ����� ����
Global $StateSheepDestroy [7] = [0,0,0,0,0,0,0]
;~ ���������� ������ ���� ��� ���� � ���
Global $SheepInFight [7] = [0,0,0,0,0,0,0]
;~ ���������� ������ ������ Vsec
Global $VsecTime [8] =[2,5,8,11,14,17,20,23]
;~ ����� �������� ������ ����� VSec � �������
$ConstTimeVozvratMin =45
;~ ���������� ������� ����� � �������
$TimeGoVsek=0
;~ ���������� ���������� �� ���� ����
$MinMouseClick=@MIN
;~ ���������� ���������� �� ����� �������������� �������
$SheepRem=0
;~ ���������� ��� ������ �� �����
$ExitWhile=0
$hFile = FileOpen("test.txt", 1)

;~ ��������� ���������
;~ �������� �� Y (��� �� (1), ��� ����� (0.925))
$ParSheshy=1
$OtmSmesh=-50
;~ ������������ � ���� �����
Global $EnableSheep [7] =[0,0,0,0,1,1,1]
;~ ����� ����� �������� � ������ ������ �����
Global $SheepGoHomeFromVsec [7] = [1,1,1,1,1,0,0]
;~ ���������� ����������� ����� �������
Global $BattleSheep [7]= [0,0,0,0,1,1,1]
;~ ����� ������� �� ������ ���� ������
Global $VegaSheepNomInSearch [5][7] = [[0,0,0,0,1,3,4],[0,0,0,0,0,0,3],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
;~ ����� ����� ���������� ����� ���
Global $SheepGoHomeAfterBattle [7] = [0,0,0,0,0,0,0]
;~ ����� ����� ��������� �� ������ � ������ �����������
Global $SheepGoRepair [7] = [1,1,1,1,0,1,1]
;~ ������� �������. � ������� ������ ������
Global $RepairNom [7]= [7,6,5,4,1,2,3]

;~ ������� ��� ���������� � ����
$hFile = FileOpen("CoordinateAssists.txt", 2)
FileWrite($hFile, "X1="& $x1 & " Y1="& $y1 &  @CRLF)
FileWrite($hFile, "$sheepleft="& $sheepleft& "$sheeprightIcon="& $sheeprightIcon & "$SheepLeftClick="& $SheepLeftClick&  @CRLF)
FileWrite($hFile, "$ysheep1="& $ysheep1&  @CRLF)
FileWrite($hFile, "$ysheep2="& $ysheep1+(1)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep3="& $ysheep1+(2)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep4="& $ysheep1+(3)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep5="& $ysheep1+(4)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep6="& $ysheep1+(5)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep7="& $ysheep1+(6)*$dysheep&  @CRLF)
FileWrite($hFile, "SelectSheep1="&($ysheep1+$dysheep/2)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������ � ���������="&$x1-200&"y="&($y0+30)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������  ����������="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+$OtmSmesh)/$ParSheshy&  @CRLF)
FileWrite($hFile, "���� �1="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*1)/$ParSheshy&  @CRLF)
FileWrite($hFile, "���� �2="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*2)/$ParSheshy&  @CRLF)
FileWrite($hFile, "���� �3="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*3)/$ParSheshy&  @CRLF)
FileWrite($hFile, "���� �4="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*4)/$ParSheshy&  @CRLF)
FileWrite($hFile, "���� �5="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*5)/$ParSheshy&  @CRLF)
FileWrite($hFile, "��="&$xBtnOk&"y="&($yBtnOk)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������ ����� 1="&$xBtn1+1*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������ ����� 2="&$xBtn1+2*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������ ����� 3="&$xBtn1+3*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������ ����� 4="&$xBtn1+4*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "��������="&$x1/2-45&"y="&($y0+($y1+$y0)/2+100)/$ParSheshy&  @CRLF)
FileWrite($hFile, "������� �������� ��� �������� � �������="&$sheepleft+$xOstDvish&"y="&$ysheep1+(4)*$dysheep+$yOstDvish&  @CRLF)
FileWrite($hFile, "������� 2 ������� � �������="&$sheepleft+$x2Dvish&"y="&$ysheep1+(4)*$dysheep+$y2Dvish&  @CRLF)
FileWrite($hFile, "������� �� ����="&$sheepleft+$xBase&"y="&$ysheep1+(4)*$dysheep+$yBase&  @CRLF)
FileWrite($hFile, "������� ������="&$sheepleft+$xRepair&"y="&$ysheep1+(4)*$dysheep+$yRepair&  @CRLF)
FileWrite($hFile, "������� � �������� x1="&$xBtnOk-10&"y1="&$yBtnOk-10&"x2="&$xBtnOk+10&"y2="&$yBtnOk+10&  @CRLF)


;~ FileWrite($hFile, "����� x="&$sheepleft+$xOstDvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish&"="&PixelGetColor($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish)&  @CRLF)
;~ FileWrite($hFile, "����� x="&$sheepleft+$x2Dvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish&"="&PixelGetColor($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish)&  @CRLF)
;~ FileWrite($hFile, "����� x="&$sheepleft+$xBase&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yBase&"="&PixelGetColor($sheepleft+$xBase,$ysheep1+($i-1)*$dysheep+$dy+$yBase)&  @CRLF)
;~ FileWrite($hFile, "����� "&$i&" $EnableSheep="&$EnableSheep[$i-1]&  @CRLF)
;~ FileWrite($hFile, "��������� ����� "&$i&" ="&$StateSheep[$i-1]&  @CRLF)
