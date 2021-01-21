#include <MsgBoxConstants.au3>
#include <Date.au3>
;~ Переменная вывода протокола
Global $GoProtocol=1
$hFile = FileOpen("SessionStatistics.txt", 1)
FileWrite($hFile,"Дата старта сеанса - "&_NowDate()&" Время старта сеанса - "& _NowTime()&  @CRLF)
if $GoProtocol=1 then
$h2File = FileOpen("ProtocolSession.txt", 2)
FileWrite($h2File,"Дата старта сеанса - "&_NowDate()&" Время старта сеанса - "& _NowTime()&  @CRLF)
EndIf

;~ Переменная заголовка рабочего окна (для Steam - "VEGA Conflict" для Mozila - "KIXEYE.com - Mozilla Firefox")
Global $NameWindow="VEGA Conflict"
;~ Размеры рабочей области
Opt("CaretCoordMode", 2)
Global $aClientSize = WinGetClientSize($NameWindow)
Global $aPos=WinGetPos($NameWindow)
While @error=1
   $aClientSize = WinGetClientSize($NameWindow)
   $aPos=WinGetPos($NameWindow)
WEnd

if $GoProtocol=1 then
FileWrite($h2File, "$aPos[0]="&$aPos[0]&" $aPos[1]="&$aPos[1]&" $aPos[2]="&$aPos[2]&" $aPos[3]="&$aPos[3]&  @CRLF)
FileWrite($h2File, "$aClientSize[0]="&$aClientSize[0]&" $aClientSize[1]="&$aClientSize[1]&  @CRLF)
EndIf

;~ Константы для цветов
Global $Red=0xD56E6E
Global $RedConnect=0xD46E6E
Global $RedConnectArround=0xCA6363
Global $RedBaseAttack=0xFE5959
Global $Yelow=0xE1965B
Global $YelowRepair=5783327
Global $Blue=0x4FA5C2
Global $BlueRepair=2112577
Global $SkyBlue=0x4EA4C1
Global $SkyBlueArround=0x4394B4
Global $White=0xFFFFFF
Global $WhiteRepairBtn=15066597
Global $WhiteRepair=14407117
Global $WhiteRepair2=14867926
Global $Black=0x000000
If $NameWindow="KIXEYE.com - Mozilla Firefox" Then
   Global $WhiteRepair=15065563
   Global $White=0xADBCC0
   EndIf
Global $WhiteSpace=0xC3EBF3
Global $GreyCoord=0xAEC9CE

if $GoProtocol=1 then
FileWrite($h2File, "$Blue="&$Blue&" $SkyBlue="&$SkyBlue&" $BlueRepair="&$BlueRepair&" $Red="&$Red& " $Yelow="& $Yelow & " $Red="& $Red  &  @CRLF)
EndIf

;~ $ysheep1=0
;~ $EndWhileColor=False
;~ While ($ysheep1<=$aClientSize[1]+50) and (not $EndWhileColor)
;~    $ysheep1=$ysheep1+1
;~    $coord = PixelSearch($aClientSize[0]-50,$ysheep1,$aClientSize[0]-50,$ysheep1, $Black,6)
;~    If not @error Then
;~ 	     $coord = PixelSearch($aClientSize[0]-100,$ysheep1,$aClientSize[0]-100,$ysheep1, $Black,6)
;~ 		 If not @error Then
;~ 			$coord = PixelSearch($aClientSize[0]-200,$ysheep1,$aClientSize[0]-200,$ysheep1, $Black,6)
;~ 			If not @error Then
;~ 			   $EndWhileColor=True
;~ 			EndIf
;~ 		 EndIf
;~    EndIf
;~    WEnd


Global $x0=0+$aPos[0]+9
Global $y0=20+$aPos[1]+9
if (@OSVersion="WIN_8") or (@OSVersion="WIN_10") Then
   $y0=$y0+1
EndIf

Global $x1=$aClientSize[0]
Global $y1=$aClientSize[1]

$yFastRepair=0
;~ Убрать заголовки при запуске из Mozila
If $NameWindow="KIXEYE.com - Mozilla Firefox" Then
   $y0=$y0+67+1
   $yFastRepair=1
   $y1=$y1-70-90
   $x1=$x1-10+1
EndIf



;~ Пункты кораблей
;~ Верхняя граница 1-го корабля
Global $ysheep1=($y1/2-220+$y0)
;~ Левая граница развернутых пунктов кораблей
Global $sheepleft=$x0+$x1-225
Global $SheepLeftClick=$sheepleft+15
;~ Правая граница иконки развернутых пунктов кораблей
Global $sheeprightIcon=$sheepleft+30
;~ Ширина окна с кораблями
Global $dysheep=43
;~ Ширина окна с составом флота
Global $ParDySheep=138

;~ Параметры координат которые определяют состояние корабля
;~ X смещение для Движения или Остановки в космосе
Global $xOstDvish=11
;~ Y смещение для Движения или Остановки в космосе
Global $yOstDvish=16
;~ X смещение для второй проверки Движения в космосе
Global $x2Dvish=8
;~ Y смещение для второй проверки Движения  в космосе
Global $y2Dvish=16
;~ X смещение для Базы
Global $xBase=16
;~ Y смещение для Базы
Global $yBase=16
;~ X смещение для Ремонта
Global $xRepair=16
;~ Y смещение для Ремонта
Global $yRepair=21
;~ X смещение для Боя
Global $xFight=101
;~ Y смещение для Боя
Global $yFight=21
;~ X смещение для сопровождаемого
Global $xConnect=20
;~ Y смещение для сопровождаемого
Global $yConnect=16
;~ X смещение для сопровождающего
Global $xToConnect=22
;~ Y смещение для сопровождающего
Global $yToConnect=12
;~ X и Y смещения для коорднат сектора у корабля
Global $x1DToConnect=3
Global $y1DToConnect=32
Global $x2DToConnect=6
Global $y2DToConnect=36
Global $x3DToConnect=25

;~ Кнопки в нижней панели
;~ Координтаы самой левой кнопки
Global $xBtn1=$x0+($x1/2-95*2)
;~ Длина кнопки
Global $dxBtn=95
;~ Верхняя граница кнопок
Global $yBtn=$y1-35-40+$y0

;~ Кнопка ОК в центре экрана
Global $xBtnOk=($x1)/2+$x0
Global $yBtnOk=($y1)/2+$y0+80

;~ Высота пункта в отметках
Global $yOtmetki=54

;~ Ширина и высота корабля в верфи
Global $xySheepBase=125
;~ Расстояние между кораблями в верфи
Global $xySheepBaseDist=10
;~ Расстояние до кнопки убрать из флота
Global $xBtnDelInFleet=300
Global $yBtnDelInFleet=375
;~ Координаты кнопки ремонт
Global $xBtnRepairInBase=370-40
Global $yBtnRepairInBase=-100+6
;~ Координаты быстрого ремонта
Global $xBtnFastRepairInBase=352
Global $yBtnFastRepairInBase=189
;~ Координаты поиска быстрого ремонта
Global $xBtnFastRepairInBaseSearch=352
Global $yBtnFastRepairInBaseSearch=-37
;~ Координаты "Последние корабли"
Global $xBtnLastSheep=-435
Global $yBtnLastSheep=-265
;~ Координаты первого корабля из списка последних
Global $xBtnFirstSheep=-435
Global $yBtnFirstSheep=-195
;~ Координаты крестика
Global $xBtnExit=476
Global $yBtnExit=-334
;~ Координаты кораблей в верфи
Global $xSheepInBase [6]=[0,0,0,0,0,0]
Global $ySheepInBase [6]=[0,0,0,0,0,0]
$xSheepInBase[0]=$x0+$x1/2+(-$xySheepBase-$xySheepBaseDist)
$ySheepInBase[0]=$y0+$y1/2+(-$xySheepBase-$xySheepBaseDist)-10
$xSheepInBase[1]=$x0+$x1/2+(0)
$ySheepInBase[1]=$y0+$y1/2+(-$xySheepBase-$xySheepBaseDist)-10
$xSheepInBase[2]=$x0+$x1/2+($xySheepBase+$xySheepBaseDist)
$ySheepInBase[2]=$y0+$y1/2+(-$xySheepBase-$xySheepBaseDist)-10
$xSheepInBase[3]=$x0+$x1/2+(-$xySheepBase-$xySheepBaseDist)
$ySheepInBase[3]=$y0+$y1/2+(0)-10
$xSheepInBase[4]=$x0+$x1/2+(0)
$ySheepInBase[4]=$y0+$y1/2+(0)-10
$xSheepInBase[5]=$x0+$x1/2+($xySheepBase+$xySheepBaseDist)
$ySheepInBase[5]=$y0+$y1/2+(0)-10
;~ Смещение для определения наличия корабля в верфи
Global $xSheepInBaseSmesh=-4
Global $ySheepInBaseSmesh=-24

;~ Расстояние от центра экрана до кнопки убрать при атаке на базу
Global $xBtnAttackInBaseY=95
Global $yBtnAttackInBaseY=115
;~ Расстояние от правого нижнего угла экрана до кнопки База
Global $xBtnBase=-155
Global $yBtnBase=-75
;~ Расстояние от правого нижнего угла экрана до кнопки Сектор
Global $xBtnSpace=-36
Global $yBtnSpace=-74
;~ Расстояние от центра экрана до кнопки Ремонт после атаки на базу
Global $xBaseRepair=-90
Global $yBaseRepair=130


;~ Выбранный в начале запуска ассистента корабль
Global $SelectSheep=7
;~ Переменная состояния флота
Global $StateSheep [7] = [0,0,0,0,0,0,0]
;~ Переменная количества уничтоженных флотов
Global $StateKolAllSheepDestroy [7] = [0,0,0,0,0,0,0]
;~ Переменная количества выбранных атак
Global $StateKolSelectAttackSheep [7] = [0,0,0,0,0,0,0]
;~ Переменная количества запросов на атаку
Global $StateKolRequestAttackSheep [7] = [0,0,0,0,0,0,0]
;~ Переменная уничтожения флота веги
Global $StateSheepDestroy [7] = [0,0,0,0,0,0,0]
;~ Переменная флагов того что флот в бою
Global $SheepInFight [7] = [0,0,0,0,0,0,0]
;~ Переменная состояния сопровождения флотов
Global $SheepConvoyState [7] = [0,0,0,0,0,0,0]
;~ Флаг необходимости ожидания сопровождающего флота
Global $SheepConvoyFlag [7] = [0,0,0,0,0,0,0]
;~ Переменная наличия корабля во флоте
Global $SheepInFleetBase [6]=[0,0,0,0,0,0]
;~ Переменная для определения номера ремонтируемого корабля в быстром ремонте
Global $NomSheepInFastRepair=6;
;~ Переменная определяющая номер флота в быстром ремонте
Global $NomFleetInFastRepir=0;
;~ Переменная времен вылета Vsec
Global $VsecTime [9] =[0,3,6,9,12,15,18,21,24]
;~ Время возврата флотов перед VSec в минутах
Global $ConstTimeVozvratMin =50
;~ Переменная наличия Всека в секторе
Global $TimeGoVsek=0
;~ Переменная отвечающая за клик мыши
Global $MinMouseClick=@MIN
;~ Переменная отвечающая за номер ремонтируемого корабля
Global $SheepRem=0
;~ Переменная для выхода из цикла
Global $ExitWhile=0
;~ Переменная атаки на базу
Global $BaseAfterAttack=0
;~ Переменная первого старта
Global $FirstStart=1


;~ НАСТРОЙКИ программы
;~ ИСпользуемые в боте флоты
Global $EnableSheep [7] =[1,1,0,0,1,1,1]
;~ Какие флоты отзывать в случае вылета Всека
Global $SheepGoHomeFromVsec [7] = [0,0,0,0,1,0,0]
;~ Переменная возможности флота воевать
Global $BattleSheep [7]= [0,0,0,0,1,1,1]
;~ Какие отметки из списка бить флотам
Global $VegaSheepNomInSearch [5][7] = [[0,0,0,0,1,3,4],[0,0,0,0,5,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
;~ Какие флоты возвращать после боя
Global $SheepGoHomeAfterBattle [7] = [0,0,0,0,0,0,0]
;~ Номера флотов, которые сопровождать
Global $SheepConvoyNomber [7] =[0,0,0,0,0,0,0]
;~ Какие флоты возращать на ремонт в случае повреждения
Global $SheepGoRepair [7] = [0,0,0,0,1,1,1]
;~ Какие флоты быстро ремонтировать
Global $SheepGoFastRepair [7] = [1,0,0,0,1,1,0]
;~ Порядок ремонта. В массиве номера флотов
Global $RepairNom [7]= [1,2,7,5,3,4,6]
;~ В случае поломке флота завершить работу Ассистента (отозвать все корабли)
Global $SheepEndAssistants [7] =[0,0,0,0,0,0,0]
;~ Флаг запуска атаки на базу во время ивента
Global $GoAttackAtBaseIvent=0
;~ Время (час) выключения бота (больше 24 - выключение не происходит)
Global $TimeStopAssistent=25

;~ Переменные задержек
Global $TimeSmallSmallConst=300
Global $TimeSmallSmallRnd=300
Global $TimeSmallConst=500
Global $TimeSmallRnd=500
Global $TimeMediumConst=1000
Global $TimeMediumRnd=2000
Global $TimeLargeConst=2000
Global $TimeLargeRnd=3000
Global $TimeSheepConst=300
Global $TimeSheepRnd=300
Global $TimeSheepCircleConst=1000
Global $TimeSheepCircleRnd=1000
Global $TimeFastRepairRnd=5000


$ySmeshMozilaVstupit=0
$WhiteRazn=10
;~ Убрать заголовки при запуске из Mozila
If $NameWindow="KIXEYE.com - Mozilla Firefox" Then
   $yBtnOk=$yBtnOk+15
   $ySmeshMozilaVstupit=20
;~    $WhiteRazn=100
   EndIf


HotKeySet("{ESC}","_stop")
HotKeySet("{Pause}","_FPause")
HotKeySet("+!s","_SaveInFile")
Dim $iPause=False


if $GoProtocol=1 then
FileWrite($h2File, "X0="& $x0 & " Y0="& $y0 &  @CRLF)
FileWrite($h2File, "X1="& $x1 & " Y1="& $y1 &  @CRLF)
FileWrite($h2File, "$xBtnOk="& $xBtnOk & " $yBtnOk="& $yBtnOk &  @CRLF)
FileWrite($h2File, "$xBtnBase="& $x0+$x1+$xBtnBase & " $yBtnBase="& $y0+$y1+$yBtnBase &  @CRLF)
FileWrite($h2File, "$xBtnSpace="& $x0+$x1+$xBtnSpace & " $xBtnSpace="& $y0+$y1+$xBtnSpace &  @CRLF)

FileWrite($h2File, "$sheepleft="& $sheepleft& "$sheeprightIcon="& $sheeprightIcon & "$SheepLeftClick="& $SheepLeftClick&  @CRLF)
FileWrite($h2File, "$ysheep1="& $ysheep1&  @CRLF)
FileWrite($h2File, "$ysheep2="& $ysheep1+(1)*$dysheep&  @CRLF)
FileWrite($h2File, "$ysheep3="& $ysheep1+(2)*$dysheep&  @CRLF)
FileWrite($h2File, "$ysheep4="& $ysheep1+(3)*$dysheep&  @CRLF)
FileWrite($h2File, "$ysheep5="& $ysheep1+(4)*$dysheep&  @CRLF)
FileWrite($h2File, "$ysheep6="& $ysheep1+(5)*$dysheep&  @CRLF)
FileWrite($h2File, "$ysheep7="& $ysheep1+(6)*$dysheep&  @CRLF)
FileWrite($h2File, "Позиция осановка или движение в космосе="&$sheepleft+$xOstDvish&"y="&$ysheep1+(1)*$dysheep+$yOstDvish&  @CRLF)
FileWrite($h2File, "Позиция 2 движеня в космосе="&$sheepleft+$x2Dvish&"y="&$ysheep1+(1)*$dysheep+$y2Dvish&  @CRLF)
FileWrite($h2File, "Позиция на базе="&$sheepleft+$xBase&"y="&$ysheep1+(1)*$dysheep+$yBase&  @CRLF)
FileWrite($h2File, "Позиция ремонт="&$sheepleft+$xRepair&"y="&$ysheep1+(1)*$dysheep+$yRepair&  @CRLF)
FileWrite($h2File, "Надпись в середине x1="&$xBtnOk-10&"y1="&$yBtnOk-10&"x2="&$xBtnOk+10&"y2="&$yBtnOk+10&  @CRLF)
FileWrite($h2File, "$xSheepInBase1="& $xSheepInBase[0] & " $ySheepInBase1="& $ySheepInBase[0] &  @CRLF)
FileWrite($h2File, "$xSheepInBase2="& $xSheepInBase[1] & " $ySheepInBase2="& $ySheepInBase[1] &  @CRLF)
FileWrite($h2File, "$xSheepInBase3="& $xSheepInBase[2] & " $ySheepInBase3="& $ySheepInBase[2] &  @CRLF)
FileWrite($h2File, "$xSheepInBase4="& $xSheepInBase[3] & " $ySheepInBase4="& $ySheepInBase[3] &  @CRLF)
FileWrite($h2File, "$xSheepInBase5="& $xSheepInBase[4] & " $ySheepInBase5="& $ySheepInBase[4] &  @CRLF)
FileWrite($h2File, "$xSheepInBase6="& $xSheepInBase[5] & " $ySheepInBase6="& $ySheepInBase[5] &  @CRLF)
FileWrite($h2File, "$xBtnLastSheep="& $x0+$x1/2+$xBtnLastSheep & " $yBtnLastSheep="& $y0+$y1/2+$yBtnLastSheep-10 &  @CRLF)
FileWrite($h2File, "$xBtnFirstSheep="& $x0+$x1/2+$xBtnFirstSheep & " $yBtnFirstSheep="& $y0+$y1/2+$yBtnFirstSheep-10 &  @CRLF)
FileWrite($h2File, "$xBtnDelInFleet="& $x0+$x1/2+$xBtnDelInFleet & " $yBtnDelInFleet="& $y0+$y1/2+$yBtnDelInFleet-10 &  @CRLF)
FileWrite($h2File, "$xBtnRepairInBase="& $x0+$x1/2+$xBtnRepairInBase & " $yBtnRepairInBase="& $y0+$y1/2+$yBtnRepairInBase-10 &  @CRLF)
FileWrite($h2File, "$xBtnFastRepairInBase="& $x0+$x1/2+$xBtnFastRepairInBase & " $yBtnFastRepairInBase="& $y0+$y1/2+$yBtnFastRepairInBase-20 &  @CRLF)
FileWrite($h2File, "$xBtnFastRepairInBaseSearch="& $x0+$x1/2+$xBtnFastRepairInBaseSearch & " $yBtnFastRepairInBaseSearch="& $y0+$y1/2+$yBtnFastRepairInBaseSearch-20+$yFastRepair &  @CRLF)
FileWrite($h2File, "$x1/2="& $x1/2 & " $y0+($y1)/2+80="& $y0+($y1)/2+80 & " $x1/2+90="& $x1/2+90 & " $y0+($y1)/2+120+$ySmeshMozilaVstupit="& $y0+($y1)/2+120+$ySmeshMozilaVstupit &  @CRLF)
FileWrite($h2File, "$x1/2="& $x1/2 & " $y0+($y1)/2+80="& $y0+($y1)/2+80 & " $x1/2+90="& $x1/2+90 & " $y0+($y1)/2+120+$ySmeshMozilaVstupit="& $y0+($y1)/2+120+$ySmeshMozilaVstupit &  @CRLF)
EndIf

if $GoProtocol=1 then
FileWrite($h2File, "$EnableSheep="&$EnableSheep[0] & $EnableSheep[1]& $EnableSheep[2]&$EnableSheep[3]&$EnableSheep[4]&$EnableSheep[5]&$EnableSheep[6]&  @CRLF)
FileWrite($h2File, "$SheepGoHomeFromVsec="&$SheepGoHomeFromVsec[0] & $SheepGoHomeFromVsec[1]& $SheepGoHomeFromVsec[2]&$SheepGoHomeFromVsec[3]&$SheepGoHomeFromVsec[4]&$SheepGoHomeFromVsec[5]&$SheepGoHomeFromVsec[6]&  @CRLF)
FileWrite($h2File, "$BattleSheep="&$BattleSheep[0] & $BattleSheep[1]& $BattleSheep[2]&$BattleSheep[3]&$BattleSheep[4]&$BattleSheep[5]&$BattleSheep[6]&  @CRLF)
FileWrite($h2File, "$SheepGoHomeAfterBattle="&$SheepGoHomeAfterBattle[0] & $SheepGoHomeAfterBattle[1]& $SheepGoHomeAfterBattle[2]&$SheepGoHomeAfterBattle[3]&$SheepGoHomeAfterBattle[4]&$SheepGoHomeAfterBattle[5]&$SheepGoHomeAfterBattle[6]&  @CRLF)
FileWrite($h2File, "$SheepGoRepair="&$SheepGoRepair[0] & $SheepGoRepair[1]& $SheepGoRepair[2]&$SheepGoRepair[3]&$SheepGoRepair[4]&$SheepGoRepair[5]&$SheepGoRepair[6]&  @CRLF)
FileWrite($h2File, "$SheepGoFastRepair="&$SheepGoFastRepair[0] & $SheepGoFastRepair[1]& $SheepGoFastRepair[2]&$SheepGoFastRepair[3]&$SheepGoFastRepair[4]&$SheepGoFastRepair[5]&$SheepGoFastRepair[6]&  @CRLF)
FileWrite($h2File, "$RepairNom="&$RepairNom[0] & $RepairNom[1]& $RepairNom[2]&$RepairNom[3]&$RepairNom[4]&$RepairNom[5]&$RepairNom[6]&  @CRLF)
FileWrite($h2File, "$SheepEndAssistants="&$SheepEndAssistants[0] & $SheepEndAssistants[1]& $SheepEndAssistants[2]&$SheepEndAssistants[3]&$SheepEndAssistants[4]&$SheepEndAssistants[5]&$SheepEndAssistants[6]&  @CRLF)
FileWrite($h2File, "$SheepConvoyNomber="& $SheepConvoyNomber[0] & $SheepConvoyNomber[1]& $SheepConvoyNomber[2]&$SheepConvoyNomber[3]&$SheepConvoyNomber[4]&$SheepConvoyNomber[5]&$SheepConvoyNomber[6] &  @CRLF)
FileWrite($h2File, "$SheepConvoyFlag="&$SheepConvoyFlag[0] & $SheepConvoyFlag[1]& $SheepConvoyFlag[2]&$SheepConvoyFlag[3]&$SheepConvoyFlag[4]&$SheepConvoyFlag[5]&$SheepConvoyFlag[6]&  @CRLF)

EndIf


Func _DelMessageByFightAnotherFleet ()
   $coord = PixelSearch($x1/2+80,$y0+($y1)/2+115,$x1/2+90,$y0+($y1)/2+125+$ySmeshMozilaVstupit, $White,$WhiteRazn)
   If not @error Then
;~ 	   Нажать "Убрать"
if $GoProtocol=1 then
FileWrite($h2File, "Уб ")
EndIf
	  MouseClick("left",$x1/2+100+random(20),$y0+($y1)/2+100,1,1)
	  Sleep($TimeSmallConst+random($TimeSmallRnd))
   EndIf
EndFunc

Func _GoDy ($SelectSheep,$i,ByRef $dy)
   If $SelectSheep<$i Then
	  $dy=$ParDySheep
   Else
	  $dy=0
   EndIf
EndFunc

Func _SelectSheep (ByRef $i)
   ;~ 	Выбрать Флот
   $dy=0
   _GoDy ($SelectSheep,$i,$dy)
   MouseClick("left",$sheeprightIcon-5-random(20),$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2+random(10),1,1)
if $GoProtocol=1 then
FileWrite($h2File, "Sl"&$i&" ")
;~    FileWrite($h2File, "$Select sheep="&$i&  @CRLF)
;~    FileWrite($h2File, "x="&$sheeprightIcon-5&"y="&$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2&  @CRLF)
EndIf
   $MinMouseClick=@MIN
   $SelectSheep=$i
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
EndFunc

Func _GoBattleFleet($i)
$Nom=0
if $GoProtocol=1 then
FileWrite($h2File, "Atk"&$i&" ")
EndIf
$GoAttack=0
while ($Nom<4) and ($VegaSheepNomInSearch[$Nom][$i-1]<>0) and ($GoAttack=0)
   _SelectSheep ($i)
   $StateKolRequestAttackSheep[$i-1]=$StateKolRequestAttackSheep[$i-1]+1
;~ Выбрать флот веги из списка возможных
;~ Нажать кнопку с отметками
if $GoProtocol=1 then
FileWrite($h2File, "Otm ")
EndIf
   MouseClick("left",$x1-200,$y0+30,1,1)
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))

;~ Выбрать вкладку "Отмеченные"
if $GoProtocol=1 then
FileWrite($h2File, "VOtm")
EndIf
   MouseClick("left",$x1/2-400+150+random(50),$y0+($y1)/2-5*$yOtmetki,1,1)
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))

;~ Выбрать нужный флот
if $GoProtocol=1 then
FileWrite($h2File, "Fl"&$VegaSheepNomInSearch[$Nom][$i-1]&" ")
EndIf
   MouseClick("left",$x1/2-400+150+random(50),$y0+($y1)/2+(-5+$VegaSheepNomInSearch[$Nom][$i-1])*$yOtmetki,1,1)


;~ Имитируем задержку пользователя
   Sleep($TimeMediumConst+random($TimeMediumRnd))

;~ Если в середине появилась надпись
   $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White,10)
   If not @error Then
;~ 	   Нажать «ОК»
	  _DelMessageByFightAnotherFleet ()
	  $GoAttack=0
if $GoProtocol=1 then
FileWrite($h2File, "BtnOk ")
EndIf
	  MouseClick("left",$xBtnOk+random(20),$yBtnOk+random(20),1,1)
	  Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
   Else
;~ 	  Нажать «Атака» (1 кнопка)
	  $GoAttack=1
if $GoProtocol=1 then
FileWrite($h2File, "AtkF ")
EndIf
	  MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2+Random(20),$yBtn,1,1)
	  Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
;~ 	  Увеличить количество атакованных флотов
	  $StateKolSelectAttackSheep[$i-1]=$StateKolSelectAttackSheep[$i-1]+1
   EndIf

;~ Имитируем задержку пользователя
   Sleep($TimeLargeConst+random($TimeLargeRnd))
;~ Проверка насчет сообщения об атакованном флоте
;~ FileWrite($hFile, "Точка x="&$x1/2+90&" y="&$y0+($y1)/2+120+$ySmeshMozilaVstupit&  @CRLF)

   $coord = PixelSearch($x1/2,$y0+($y1)/2+80,$x1/2+90,$y0+($y1)/2+120+$ySmeshMozilaVstupit, $White,$WhiteRazn)
   If not @error Then
;~ 	   Нажать "Вступить"
if $GoProtocol=1 then
FileWrite($h2File, "Vst ")
EndIf
	  MouseClick("left",$x1/2-45+random(20),$y0+($y1)/2+100,1,1)
	  Sleep($TimeMediumConst+random($TimeMediumRnd))
   EndIf
;~ 	Повторная проверка на предмет сообщения об отсутствии флота
;~ 	Если в середине появилась надпись
   $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White)
   If not @error Then
;~ 	   Нажать «ОК»
if $GoProtocol=1 then
FileWrite($h2File, "BtnOk ")
EndIf
	  MouseClick("left",$xBtnOk+random(20),$yBtnOk+random(20),1,1)
	  Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
   EndIf
   $MinMouseClick=@MIN
   $Nom=$Nom+1
WEnd
EndFunc

Func _SheepGoHome($i)
   _SelectSheep ($i)
;~ Нажать кнопку вернуть корабль
if $GoProtocol=1 then
FileWrite($h2File, "Voz"&$i&" ")
EndIf
   MouseClick("left",$xBtn1+3*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
   $MinMouseClick=@MIN
   Sleep($TimeMediumConst+random($TimeMediumRnd))
EndFunc

Func _AllSheepGoHome()
   $NoAttak=2
   While $NoAttak<>0
	  $NoAttak=$NoAttak-1
	  $i=1
	  While $i<=7
		 _GetSostSheep($SelectSheep,$i)
		 if ($StateSheep[$i-1]=4) Then
			$NoAttak=2
			EndIf
		 If ($StateSheep[$i-1]=2) or ($StateSheep[$i-1]=3) or ($StateSheep[$i-1]=9)or ($StateSheep[$i-1]=10) or ($StateSheep[$i-1]=5) or ($StateSheep[$i-1]=6) or ($StateSheep[$i-1]=12)or ($StateSheep[$i-1]=13)  Then
		 _SheepGoHome($i)
		 EndIf
		 $i=$i+1
	  WEnd
   WEnd
   EndFunc

Func _GetSostSheep($SelectSheep,$i)
   $dy=0
   _GoDy ($SelectSheep,$i,$dy)
   $StateSheep[$i-1]=0

;~    if $GoProtocol=1 then
;~ FileWrite($h2File, "Точка OstDvish x="&$sheepleft+$xOstDvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish&"="&PixelGetColor($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish)&  @CRLF)
;~ FileWrite($h2File, "Точка 2Dvish x="&$sheepleft+$x2Dvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish&"="&PixelGetColor($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish)&  @CRLF)
;~ FileWrite($h2File, "Точка Base x="&$sheepleft+$xBase&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yBase&"="&PixelGetColor($sheepleft+$xBase,$ysheep1+($i-1)*$dysheep+$dy+$yBase)&  @CRLF)
;~ FileWrite($h2File, "Точка Connect x="&$sheepleft+$xConnect&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yConnect&"="&PixelGetColor($sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect)&  @CRLF)
;~ FileWrite($h2File, "Точка y1="&$ysheep1+($i-1)*$dysheep+$dy-10&" y2="&$ysheep1+($i)*$dysheep+$dy-10&  @CRLF)
;~ FileWrite($h2File, "Точка ToConnect x="&$sheepleft+$xToConnect&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yToConnect&"="&PixelGetColor($sheepleft+$xToConnect,$ysheep1+($i-1)*$dysheep+$dy+$yToConnect)&  @CRLF)
;~ EndIf


;~ 	Проверка на ремонт
$coord = PixelSearch($sheepleft+$xRepair-1,$ysheep1+($i-1)*$dysheep+$dy+$yRepair-1,$sheepleft+$xRepair+1,$ysheep1+($i-1)*$dysheep+$dy+$yRepair+1, $Yelow,10)
If not @error Then
   $StateSheep[$i-1]=8
EndIf

;~ Проверка на участие в сопровождении для СИНЕГО флота
$coord = PixelSearch($sheepleft+$xToConnect,$ysheep1+($i-1)*$dysheep+$dy+$yToConnect,$sheepleft+$xToConnect,$ysheep1+($i-1)*$dysheep+$dy+$yToConnect, $SkyBlueArround,10)
If not @error Then
   $coord = PixelSearch($sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect,$sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect, $SkyBlue,10)
   If not @error Then
;~ 	Сопровождаемый КРАСНЫЙ
	  $coord = PixelSearch($sheepleft+$x1DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y1DToConnect,$sheepleft+$x2DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y2DToConnect, $GreyCoord,10)
	  If not @error Then
		 $StateSheep[$i-1]=9
	  Else
   ;~ 	Сопровождаемый летит
		 $StateSheep[$i-1]=10
	  EndIf
   Else
;~ 	Сопровождающий КРАСНЫЙ
	  $coord = PixelSearch($sheepleft+$x1DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y1DToConnect,$sheepleft+$x2DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y2DToConnect, $GreyCoord,10)
	  If not @error Then
;~ 		Сопровождающий стоит
		 $StateSheep[$i-1]=14
	  Else
;~ 		Сопровождающий летит
		 $StateSheep[$i-1]=15
	  EndIF
   EndIf
   $coord = PixelSearch($sheepleft+$xFight-1,$ysheep1+($i-1)*$dysheep+$dy+$yFight-1,$sheepleft+$xFight+1,$ysheep1+($i-1)*$dysheep+$dy+$yFight+1, $White,10)
   If not @error Then
;~ 	Сопровождаемый флот в БОЮ
	  $StateSheep[$i-1]=11
   EndIf
EndIf

;~ Проверка на участие в сопровождении для КРАСНОГО флота
$coord = PixelSearch($sheepleft+$xToConnect,$ysheep1+($i-1)*$dysheep+$dy+$yToConnect,$sheepleft+$xToConnect,$ysheep1+($i-1)*$dysheep+$dy+$yToConnect, $RedConnectArround,10)
If not @error Then
   $coord = PixelSearch($sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect,$sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect, $RedConnect,10)
   If not @error Then
;~ 	Сопровождаемый КРАСНЫЙ
	  $coord = PixelSearch($sheepleft+$x3DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y1DToConnect,$sheepleft+$x2DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y2DToConnect, $GreyCoord,10)
	  If  @error Then
		 $StateSheep[$i-1]=12
	  Else
   ;~ 	Сопровождаемый летит
		 $StateSheep[$i-1]=13
	  EndIf
   Else
;~ 	Сопровождающий КРАСНЫЙ
	  $coord = PixelSearch($sheepleft+$x3DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y1DToConnect,$sheepleft+$x2DToConnect,$ysheep1+($i-1)*$dysheep+$dy+$y2DToConnect, $GreyCoord,10)
	  If  @error Then
;~ 		Сопровождающий стоит
		 $StateSheep[$i-1]=16
	  Else
;~ 		Сопровождающий летит
		 $StateSheep[$i-1]=17
	  EndIF
   EndIf
   $coord = PixelSearch($sheepleft+$xFight-1,$ysheep1+($i-1)*$dysheep+$dy+$yFight-1,$sheepleft+$xFight+1,$ysheep1+($i-1)*$dysheep+$dy+$yFight+1, $White,10)
   If not @error Then
;~ 	Сопровождаемый флот в БОЮ
	  $StateSheep[$i-1]=11
   EndIf
EndIf

;~ 	Остановка или движение СИНЕГО флота
$coord = PixelSearch($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish,$sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish, $Blue,10)
If  ($StateSheep[$i-1]=0) and (not @error) Then
  $coord = PixelSearch($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish,$sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish, $Blue,10)
   If not @error Then
;~ 		Пройдена вторая проверка на движение
	  $StateSheep[$i-1]=3
   Else
	  $StateSheep[$i-1]=2
;~ 		Проверка не  пройдена корабль стоит
   EndIf
EndIf

;~ Остановка или движение КРАСНОГО флота
$coord = PixelSearch($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish,$sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish, $Red,10)
If  ($StateSheep[$i-1]=0) and (not @error) Then
  $coord = PixelSearch($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish,$sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish, $Red,10)
  If not @error Then
;~ 		Пройдена вторая проверка на движение
	 $StateSheep[$i-1]=6
  Else
	 $StateSheep[$i-1]=5
;~ 		Проверка не  пройдена корабль стоит
  EndIf
EndIf

;~ 	  Флот в БОЮ
$coord = PixelSearch($sheepleft+$xFight-1,$ysheep1+($i-1)*$dysheep+$dy+$yFight-1,$sheepleft+$xFight+1,$ysheep1+($i-1)*$dysheep+$dy+$yFight+1, $White,10)
If  ($StateSheep[$i-1]=0) and (not @error) Then
   $StateSheep[$i-1]=4
EndIf

;~ Проверка на нахождение на базе СИНЕГО корабля
$coord = PixelSearch($sheepleft+$xBase-1,$ysheep1+($i-1)*$dysheep+$dy+$yBase-1,$sheepleft+$xBase+1,$ysheep1+($i-1)*$dysheep+$dy+$yBase+1, $Blue,10)
If  ($StateSheep[$i-1]=0) and (not @error) Then
   $StateSheep[$i-1]=1
EndIf

;~ Проверка на нахождение на базе КРАСНОГО корабля
$coord = PixelSearch($sheepleft+$xBase-1,$ysheep1+($i-1)*$dysheep+$dy+$yBase-1,$sheepleft+$xBase+1,$ysheep1+($i-1)*$dysheep+$dy+$yBase+1, $Red,10)
If  ($StateSheep[$i-1]=0) and (not @error) Then
   $StateSheep[$i-1]=7
EndIf

if $GoProtocol=1 then
   FileWrite($h2File, _NowTime()& "Sheep="&$i&" State="&$StateSheep[$i-1] &@CRLF)
   EndIf
EndFunc

Func _RepairFleet ()
   $j=1
   $EndWhileRepair=0
;~ Проходим по всем флотам в порядке установленном в массиве $RepairNom
   While ($j<8) and ($EndWhileRepair=0)
;~ 	  Если первым нашли флот в ремонте, то завершить поиск
	  if ($SheepRem=$RepairNom[$j-1]) Then
		 $EndWhileRepair=1
	  Elseif ($SheepRem<>$RepairNom[$j-1]) and ($EndWhileRepair=0) and ($StateSheep[$RepairNom[$j-1]-1]=7) Then
;~ 	     Если первым найден красный флот на базе, то
;~ 		 Проверяем наличие ремонтируемого флота
		 $EndWhileRepair=1
;~ FileWrite($hFile, "$SheepRem="&$SheepRem&  @CRLF)
;~
		 if $SheepRem<>0 Then
;~ 			Проверяем состояние флота
			_GetSostSheep($SelectSheep,$SheepRem)
;~ 			Если флот ремонтируется
			IF $StateSheep[$SheepRem-1]=8 then
;~ 			   Отключаем ремонт
			   _SelectSheep ($SheepRem)
			   if $GoProtocol=1 then
			   FileWrite($h2File, "DRep"&$SheepRem&" ")
			   EndIf
			   MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
			   Sleep($TimeMediumConst+random($TimeMediumRnd))
			   EndIf
			EndIf
		 _SelectSheep ($RepairNom[$j-1])
		 if $GoProtocol=1 then
		 FileWrite($h2File, "Rep"&$RepairNom[$j-1]&" ")
		 EndIf
		 MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
		 $MinMouseClick=@MIN
		 Sleep($TimeMediumConst+random($TimeMediumRnd))
		 $SheepRem=$RepairNom[$j-1]
;~ FileWrite($hFile, "$SheepRem="&$SheepRem&  @CRLF)
;~ 		Включаем ремонт найденного флота
		 EndIf
	  $j=$j+1
	  WEnd
EndFunc

Func _FastRepairFleet($i)
;~    Нажимаем на космос
if $GoProtocol=1 then
FileWrite($h2File, "FR"&$i&" ")
EndIf
   MouseClick("left",$x0+$x1+$xBtnSpace,$y0+$y1+$yBtnSpace,1,1)
   Sleep($TimeSmallConst+random($TimeSmallRnd))
if $GoProtocol=1 then
FileWrite($h2File, "BtSpace ")
EndIf
;~ Если быстрый ремонт еще не запускался.
if $GoProtocol=1 then
FileWrite($h2File, " NomFlFR"&$NomFleetInFastRepir&" ")
EndIf


;~ Отключаем ремонт
   if ($SheepRem<>0) and ($NomFleetInFastRepir=0) Then
;~ 	Проверяем состояние флота
	  _GetSostSheep($SelectSheep,$SheepRem)
;~ 	Если флот ремонтируется
	  IF $StateSheep[$SheepRem-1]=8 then
;~ 		 Отключаем ремонт
		 _SelectSheep ($SheepRem)
if $GoProtocol=1 then
FileWrite($h2File, "DRep"&$SheepRem&" ")
EndIf
		 MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
		 Sleep($TimeMediumConst+random($TimeMediumRnd))
		 EndIf
	  EndIf
;~ Выбираем корабль
_SelectSheep ($i)
;~ Заходим в порт (1 кнопка)
if $GoProtocol=1 then
FileWrite($h2File, "Bt1 ")
EndIf
MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
Sleep($TimeSmallConst+random($TimeSmallRnd))
_DelMessageByFightAnotherFleet ()
;~ Убираем корабли
IF $NomFleetInFastRepir=0 then
$NotDelSheepInFastRepair=False
$NomSheepInFastRepair=6;
While ($NomSheepInFastRepair>=2) and (not $NotDelSheepInFastRepair)
;~ Проверка на наличие корабля
   $coord = PixelSearch($xSheepInBase[$NomSheepInFastRepair-1]+$xSheepInBaseSmesh,$ySheepInBase[$NomSheepInFastRepair-1]+$ySheepInBaseSmesh,$xSheepInBase[$NomSheepInFastRepair-1]+$xSheepInBaseSmesh,$ySheepInBase[$NomSheepInFastRepair-1]+$ySheepInBaseSmesh, $Black,8)
   If  @error Then
if $GoProtocol=1 then
FileWrite($h2File, " SE ")
EndIf
;~    Проверка на наличие кнопки ремонт
	  $coord = PixelSearch($x0+$x1/2+$xBtnFastRepairInBaseSearch-5,$y0+$y1/2+$yBtnFastRepairInBaseSearch-20-5,$x0+$x1/2+$xBtnFastRepairInBaseSearch+5,$y0+$y1/2+$yBtnFastRepairInBaseSearch-20+5, $YelowRepair,10)
	  If  not @error Then
;~ 	  Отсутствия надписи ДАРОМ
		 If PixelGetColor($x0+$x1/2+$xBtnFastRepairInBaseSearch,$y0+$y1/2+$yBtnFastRepairInBaseSearch-20+$yFastRepair)=$WhiteRepair2 Then
			$NotDelSheepInFastRepair=True
			$NomSheepInFastRepair=$NomSheepInFastRepair+1
		 else
;~ 	  Выбираем корабль
if $GoProtocol=1 then
FileWrite($h2File, "BtSheep"&$NomSheepInFastRepair&" ")
EndIf
			MouseClick("left",$xSheepInBase[$NomSheepInFastRepair-1]+random(20),$ySheepInBase[$NomSheepInFastRepair-1]+random(20),1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			_DelMessageByFightAnotherFleet ()
;~ 	  Нажимаем кнопку "Убрать из флота"
if $GoProtocol=1 then
FileWrite($h2File, "DelSheep ")
EndIf
			MouseClick("left",$x0+$x1/2+$xBtnDelInFleet+random(20),$y0+$y1/2+$yBtnDelInFleet-10,1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			_DelMessageByFightAnotherFleet ()
			$SheepInFleetBase[$NomSheepInFastRepair-1]=1
			EndIf
	  Else
		 $NotDelSheepInFastRepair=True
	  EndIf

   Else
	  $SheepInFleetBase[$NomSheepInFastRepair-1]=0
   EndIf
   $NomSheepInFastRepair=$NomSheepInFastRepair-1
if $GoProtocol=1 then
FileWrite($h2File, $SheepInFleetBase[$NomSheepInFastRepair-1])
EndIf
WEnd

$NomFleetInFastRepir=$i
EndIf



if $GoProtocol=1 then
FileWrite($h2File, " FFR"&$NomSheepInFastRepair&" ")
EndIf

$ExitWhileRepair=0
While ($NomSheepInFastRepair<=6) and ($ExitWhileRepair=0)
;~  Проверка Идет ремонт или нет
$coord = PixelSearch($x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3,$x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3, $Black,10)
If @error Then
   if $GoProtocol=1 then
FileWrite($h2File, " NotR")
EndIf
;~  Проверка есть ли возможность активировать ремонт или нет
   $coord = PixelSearch($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10,$x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10, $BlueRepair,10)
   If not @error Then
;~ 	  Если ремонт не активирован, то
;~ 	  Нажимаем ремонт
if $GoProtocol=1 then
FileWrite($h2File, "BtRem ")
EndIf
	  MouseClick("left",$x0+$x1/2+$xBtnRepairInBase+random(20),$y0+$y1/2+$yBtnRepairInBase-10,1,1)
	  Sleep($TimeSmallConst+random($TimeSmallRnd))
	  _DelMessageByFightAnotherFleet ()
	  $MinMouseClick=@MIN
	  EndIf
;~ 	Проверка на возможность быстрого ремонта

   If PixelGetColor($x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair)=$WhiteRepair Then
if $GoProtocol=1 then
   FileWrite($h2File, "BtFRem ")
EndIf
;~ 	  Нажимаем Ремонт "Даром"
	  MouseClick("left",$x0+$x1/2+$xBtnFastRepairInBase+random(20),$y0+$y1/2+$yBtnFastRepairInBase-20,1,1)
	  _DelMessageByFightAnotherFleet ()
	  Sleep($TimeSmallConst+random($TimeSmallRnd))
   Else
	  $ExitWhileRepair=1
	  EndIf
   Else
   if $GoProtocol=1 then
FileWrite($h2File, " R")
EndIf

;~    Проверка на возможность нажать ремонт
	  $coord = PixelSearch($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10,$x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10, $BlueRepair,10)
	  If @error Then
;~ 	 	 Добавляем новый корабль
		 $NomSheepInFastRepair=$NomSheepInFastRepair+1
   ;~    Проверка имелся ли корабль во флоте
		 If ($NomSheepInFastRepair<=6) and ($SheepInFleetBase[$NomSheepInFastRepair-1]=1) Then
;~ 	  		Выбираем место корабля
if $GoProtocol=1 then
FileWrite($h2File, " BtSheep"&$NomSheepInFastRepair&" ")
EndIf
			MouseClick("left",$xSheepInBase[$NomSheepInFastRepair-1]+random(20),$ySheepInBase[$NomSheepInFastRepair-1]+random(20),1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			_DelMessageByFightAnotherFleet ()
;~ 	  		Нажимаем "последние корабли"
if $GoProtocol=1 then
FileWrite($h2File, "LastSheep ")
EndIf
			MouseClick("left",$x0+$x1/2+$xBtnLastSheep+random(20),$y0+$y1/2+$yBtnLastSheep-10,1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			_DelMessageByFightAnotherFleet ()
;~ 	  		Выбираем первый корабль
if $GoProtocol=1 then
FileWrite($h2File, "ShSel ")
EndIf
			MouseClick("left",$x0+$x1/2+$xBtnFirstSheep+random(20),$y0+$y1/2+$yBtnFirstSheep-10+random(20),1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			_DelMessageByFightAnotherFleet ()
;~ 	  		Нажимаем "Добавить во флот"
if $GoProtocol=1 then
FileWrite($h2File, "AddSheep ")
EndIf
			MouseClick("left",$x0+$x1/2+$xBtnDelInFleet+random(20),$y0+$y1/2+$yBtnDelInFleet-10,1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			_DelMessageByFightAnotherFleet ()
;~ FileWrite($hFile, "$xBtnRepairInBase="& $x0+$x1/2+$xBtnRepairInBase & " $yBtnRepairInBase="& $y0+$y1/2+$yBtnRepairInBase-10 &  @CRLF)
;~ FileWrite($hFile, "PixelGetColor="& PixelGetColor($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10) & " $BlueRepair="& $BlueRepair &  @CRLF)
;~ FileWrite($h2File, "$xBtnFastRepairInBase="& $x0+$x1/2+$xBtnFastRepairInBase & " $yBtnFastRepairInBase="& $y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair &  @CRLF)
;~ FileWrite($h2File, "PixelGetColor="& PixelGetColor($x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair) & " $WhiteRepair="& $WhiteRepair &  @CRLF)
;~ 		 $coord = PixelSearch($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10,$x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10, $BlueRepair,10)
;~ 		 While PixelGetColor($x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair)<>$WhiteRepair
;~ 			;~ Клик мышкой если его долго не было
;~ 			Sleep(1000+Random($TimeFastRepairRnd))
;~ 			_DelMessageByFightAnotherFleet ()
;~ 			If ($MinMouseClick<>@MIN) and Mod(Abs($MinMouseClick-@MIN),2)=0 Then
;~ if $GoProtocol=1 then
;~    FileWrite($h2File, "2")
;~ endif
;~ 			   MouseClick("left",$x0+$x1/2+$xBtnRepairInBase+random(20),$y0+$y1/2+$yBtnRepairInBase-10,1,1)
;~ 			   $MinMouseClick=@MIN
;~ 			   EndIf
;~ 			WEnd
;~ FileWrite($h2File, "PixelGetColor="& PixelGetColor($x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20) & " $WhiteRepair="& $WhiteRepair &  @CRLF)
			;~  Проверка есть ли возможность активировать ремонт или нет
			$coord = PixelSearch($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10,$x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10, $BlueRepair,10)
			If not @error Then
;~ 	  			Если ремонт не активирован, то
;~ 	 			 Нажимаем ремонт
if $GoProtocol=1 then
FileWrite($h2File, "BtRem ")
EndIf
				  MouseClick("left",$x0+$x1/2+$xBtnRepairInBase+random(20),$y0+$y1/2+$yBtnRepairInBase-10,1,1)
				  Sleep($TimeSmallConst+random($TimeSmallRnd))
				  _DelMessageByFightAnotherFleet ()
				  $MinMouseClick=@MIN
				  EndIf
		 EndIf
	  Else
if $GoProtocol=1 then
FileWrite($h2File, "BtRem ")
EndIf
		 MouseClick("left",$x0+$x1/2+$xBtnRepairInBase+random(20),$y0+$y1/2+$yBtnRepairInBase-10,1,1)
		 Sleep($TimeSmallConst+random($TimeSmallRnd))
		 _DelMessageByFightAnotherFleet ()
		 $MinMouseClick=@MIN
	 EndIf
   EndIf

WEnd

MouseClick("left",$x0+$x1/2+$xBtnExit,$y0+$y1/2+$yBtnExit-10,1,1)
Sleep($TimeSmallConst+random($TimeSmallRnd))
$MinMouseClick=@MIN

If $NomSheepInFastRepair>6 Then
   $SheepRem=0
   $NomFleetInFastRepir=0
EndIf
if $GoProtocol=1 then
   FileWrite($h2File, "Ex "&$NomFleetInFastRepir)
EndIf
EndFunc

Func _SheepGoFlyToConvoy($nom,$i)
  _SelectSheep($i)
  ;~ Нажать кнопку запустить корабль
if $GoProtocol=1 then
     FileWrite($h2File, "Bt2 ")
EndIf
   MouseClick("left",$xBtn1+2*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
   $MinMouseClick=@MIN
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
   $SheepConvoyState[$i-1]=$nom
EndFunc

Func _SheepGoConvoy($i)
;~    Выбрать корабль
   _SelectSheep($i)
   $SheepConvoyState[$i-1]=3
   $dy=0
   _GoDy ($SelectSheep,$SheepConvoyNomber[$i-1],$dy)
;~    Нажать кнопку сопровождать
if $GoProtocol=1 then
   FileWrite($h2File, "Bt1 ")
EndIf
   MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
;~    Выбрать корабль сопровождения
if $GoProtocol=1 then
FileWrite($h2File, "Conv"&$SheepConvoyNomber[$i-1]&" ")
EndIf
   MouseClick("left",$sheeprightIcon-5-random(20),$ysheep1+($SheepConvoyNomber[$i-1]-1)*$dysheep+$dy+$dysheep/2+random(10),1,10)
   $MinMouseClick=@MIN
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
   $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White,10)
   If not @error Then
;~ 	   Нажать «ОК»
if $GoProtocol=1 then
   FileWrite($h2File, "BtOk ")
endif
	  $SheepConvoyState[$i-1]=2
	  MouseClick("left",$xBtnOk+random(20),$yBtnOk+random(20),1,1)
	  Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
	  EndIf
EndFunc

Func _GoAttackToBase ()
;~    Нажимаем Защити Базу
   $coord = PixelSearch($x0+$x1/2-20,$y0+$y1,$x0+$x1/2+20,$y0+$y1-30, $White,10)
   If (not @error) and ($BaseAfterAttack=0) Then
if $GoProtocol=1 then
 FileWrite($h2File,@CRLF& _NowTime() &"BtBaseAttack ")
 EndIf
	  MouseClick("left",$x0+$x1/2-20,$y0+$y1-20,1,1)
	  Sleep(7000+random(3000))
	  _DelMessageByFightAnotherFleet ()
	  $BaseAfterAttack=1
;~ 	  Нажимаем убрать
	  $coord = PixelSearch($x0+$x1/2+$xBtnAttackInBaseY-20,$y0+$y1/2+$yBtnAttackInBaseY-30,$x0+$x1/2+$xBtnAttackInBaseY+20,$y0+$y1/2+$yBtnAttackInBaseY+30, $White,10)
	  While @error
		 $coord = PixelSearch($x0+$x1/2+$xBtnAttackInBaseY-20,$y0+$y1/2+$yBtnAttackInBaseY-30,$x0+$x1/2+$xBtnAttackInBaseY+20,$y0+$y1/2+$yBtnAttackInBaseY+30, $White,10)
	  WEnd
if $GoProtocol=1 then
FileWrite($h2File, "BtnClose ")
EndIf
		 MouseClick("left",$x0+$x1/2+$xBtnAttackInBaseY,$y0+$y1/2+$yBtnAttackInBaseY-10,1,1)
		 Sleep($TimeMediumConst+random($TimeMediumRnd))
		 _DelMessageByFightAnotherFleet ()
   EndIf
EndFunc

Func _GoRepairBase ()
;~ Нажимаем на базу
;~ FileWrite($hFile, "Состояние флота "&$i&" ="&$StateSheep[$i-1]&  @CRLF)
$coord = PixelSearch($x0+$x1/2-20,$y0+$y1,$x0+$x1/2+20,$y0+$y1-30, $RedBaseAttack,10)
If (@error) and ($BaseAfterAttack=1) Then
   $BaseAfterAttack=0

if $GoProtocol=1 then
FileWrite($h2File, "BtBase ")
EndIf
   MouseClick("left",$x0+$x1+$xBtnBase,$y0+$y1+$yBtnBase,1,1)
   Sleep($TimeMediumConst+random($TimeMediumRnd))
;~    Нажимаем Ремонт
if $GoProtocol=1 then
FileWrite($h2File, "BtRepairBase ")
EndIf
  MouseClick("left",$x0+$x1/2+$xBaseRepair,$y0+$y1/2+$yBaseRepair,1,1)
   Sleep($TimeMediumConst+random($TimeMediumRnd))

;~    Нажимаем на космос
if $GoProtocol=1 then
FileWrite($h2File, "BtSpace "&@CRLF)
EndIf
   MouseClick("left",$x0+$x1+$xBtnSpace,$y0+$y1+$yBtnSpace,1,1)
   Sleep($TimeMediumConst+random($TimeMediumRnd))
   EndIf
EndFunc


While not (WinActive($NameWindow))
   Sleep (500)
   WEnd

;~ Определение флотов, которым необходимо споровождение.
$i=1
While $i<=7
   If $SheepConvoyNomber[$i-1]<>0 Then
	 $SheepConvoyFlag[$SheepConvoyNomber[$i-1]-1]=1
  EndIf
	 $i=$i+1
  WEnd


;~ Бесконечный цикл
While 1
;~ Определение первого флота
   if $FirstStart=1 Then
	  $FirstStart=0
	  _GetSostSheep(1,1)
	  If $StateSheep[0]=0 Then
		 MouseClick("left",$sheeprightIcon-5-random(20),$ysheep1+$ParDySheep+$dysheep/2,1,1)
		 Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
		 EndIf
	  _SelectSheep(1)
   EndIf
;~    Отключение ассистента
   If $TimeStopAssistent=@HOUR Then
	  _stop
	  EndIf

;~    Проверка атаки на базу
   if ($GoAttackAtBaseIvent=1) and ($BaseAfterAttack=0)	  Then
	  _GoAttackToBase ()
   ElseIf ($GoAttackAtBaseIvent=1) and ($BaseAfterAttack=1)	Then
	  _GoRepairBase ()
   EndIf

;~ Цикл по всем флотам
   $i=7
   While $i>=1
;~ FileWrite($hFile, "флота "&$i&" $EnableSheep="&$EnableSheep[$i-1]&  @CRLF)
	If $iPause Then
	  _FPause()
	  EndIf
	If ($EnableSheep[$i-1]=1) and (WinActive($NameWindow)) Then
;~ 	   Определение состояния корабля
	  _GetSostSheep($SelectSheep,$i)
;~ 	  Проверка на Vsec
;~ 	  Определение времени ближайшего вылета VSec
	  $NomVsec=0
	  While ($NomVsec<=8) and ($VsecTime[$NomVsec]<@HOUR)
		 $NomVsec=$NomVsec+1
	  WEnd
;~ 	  Если разница между текущем временем и временем вылета меньше ConstTimeVozvrat минут и включен отзыв на всек ,то
	  IF ($NomVsec<=8) and(($VsecTime[$NomVsec]=@HOUR) or (($VsecTime[$NomVsec]-@HOUR=1) and (@MIN>$ConstTimeVozvratMin)))  and ($SheepGoHomeFromVsec[$i-1]=1)  Then
		 $TimeGoVsek=1
;~ 		 Если корабль в космосе стоит (Красный или Синий)
		 if ($StateSheep[$i-1]=2) or ($StateSheep[$i-1]=5) or ($StateSheep[$i-1]=9) or ($StateSheep[$i-1]=12) then
			   _SheepGoHome($i)
			EndIf
	  Else
		 $TimeGoVsek=0
	  EndIf
;~ 	  Если корабль на Vsek не реагирует, или Vsek не в космосе, то
	  IF ($BaseAfterAttack<>1) then
	  If $TimeGoVsek=0 Then
		 If $StateSheep[$i-1]=1 Then
;~ 			Корабль СИНИЙ на планете
;~ 			Обнуления количества уничтоженных флотов
			 $StateSheepDestroy[$i-1]=0
			 $SheepInFight[$i-1]=0
			 $SheepConvoyState[$i-1]=0
		 ;~ Если флот стоял на ремонте
			if $SheepRem=$i Then
;~ 				Сбросить номер ремонтируемого флота
			   $SheepRem=0
			EndIf
;~ 			Проверка необходимости ожидания сопровождения
			if $SheepConvoyFlag[$i-1]=1 Then
			   _SheepGoFlyToConvoy(1,$i)
;~ 		    Если флот может воевать (задан пользователем)
			ElseIF ($BattleSheep[$i-1]=1)  Then
			  _GoBattleFleet($i)
     	    EndIf
			if $SheepConvoyNomber[$i-1]<>0 Then
			   _SheepGoFlyToConvoy(1,$i)
			EndIf
		 ElseIf ($StateSheep[$i-1]=2) or ($StateSheep[$i-1]=9) Then
;~ 			Корабль СИНИЙ на в космосе стоит
			$SheepInFight[$i-1]=0
;~ 			Установка состояния что флот находится в сопровождении
			if ($StateSheep[$i-1]=9) Then
			   $SheepConvoyState[$i-1]=3
			   EndIf
;~ 			Проверка необходимости ожидания сопровождения
			if ($SheepConvoyFlag[$i-1]=1) and ($SheepConvoyState[$i-1]<>3) Then
			   _SheepGoFlyToConvoy(2,$i)
;~ 			Если корабль провел бой и его надо вернуть
			ElseIf ($SheepGoHomeAfterBattle[$i-1]=1) and ($StateSheepDestroy[$i-1]=1) Then
			   	_SheepGoHome($i)
			ElseIf ($BattleSheep[$i-1]=1) and (($StateSheep[$i-1]=2) or (($StateSheep[$i-1]=9) and ($SheepConvoyFlag[$i-1]=1)))  Then
;~ 			   Если флот может воевать (задан пользователем)
			   _GoBattleFleet($i)
			EndIf
			if ($SheepConvoyNomber[$i-1]<>0) Then
			   If $SheepConvoyState[$i-1]=2 Then
				  _SheepGoConvoy($i)
			   ElseIf $SheepConvoyState[$i-1]=1 Then
				 _SheepGoFlyToConvoy(2,$i)
			   EndIf
			EndIf
		 ElseIf $StateSheep[$i-1]=3 or ($StateSheep[$i-1]=10) Then
;~ 			Корабль СИНИЙ в космосе летит
			$SheepInFight[$i-1]=0
		 ElseIf $StateSheep[$i-1]=4 or ($StateSheep[$i-1]=11) Then
;~ 			Корабль В БОЮ
			$StateSheepDestroy[$i-1]=1
			If $SheepInFight[$i-1]=0 then
			   $SheepInFight[$i-1]=1
			   $StateKolAllSheepDestroy[$i-1]=$StateKolAllSheepDestroy[$i-1]+1
			   EndIf
		 ElseIf ($StateSheep[$i-1]=5) or ($StateSheep[$i-1]=12) Then
;~ 			Корабль КРАСНЫЙ в космосе стоит
			$SheepInFight[$i-1]=0
;~ 			Установка состояния что флот находится в сопровождении
			if ($StateSheep[$i-1]=12) Then
			   $SheepConvoyState[$i-1]=3
			   EndIf
;~ 			Проверка необходимости ожидания сопровождения
			if ($SheepConvoyFlag[$i-1]=1) and ($SheepConvoyState[$i-1]<>3) Then
			   _SheepGoFlyToConvoy(2,$i)
;~ 			Если корабль  надо вернуть (после боя или в результате повреждений)
			ElseIf ($SheepGoHomeAfterBattle[$i-1]=1) or ($SheepGoRepair[$i-1]=1) Then
			   	_SheepGoHome($i)
			ElseIf ($BattleSheep[$i-1]=1) and (($StateSheep[$i-1]=5) or (($StateSheep[$i-1]=12) and ($SheepConvoyFlag[$i-1]=1)))  Then
;~ 			   Если флот может воевать (задан пользователем)
				  _GoBattleFleet($i)
			EndIf
		 ElseIf $StateSheep[$i-1]=6 or ($StateSheep[$i-1]=13) Then
;~ 			Корабль КРАСНЫЙ в космосе летит
			$SheepInFight[$i-1]=0
		 ElseIf $StateSheep[$i-1]=7 Then
;~ 			Корабль КРАСНЫЙ на базе
;~ 			Попытка запустить корабль в бой
			If ($SheepGoRepair[$i-1]=0)  Then
			   if $SheepConvoyFlag[$i-1]=1 Then
				  _SheepGoFlyToConvoy(1,$i)
			   ElseIf ($BattleSheep[$i-1]=1) then
				  _GoBattleFleet($i)
			   EndIf
			EndIf
;~ 			Проверка необходимости ремонта флота
			IF $NomFleetInFastRepir=0 Then
			   If $SheepGoFastRepair[$i-1]=0 Then
				  _RepairFleet()
			   Else
				  _FastRepairFleet($i)
			   EndIf
			EndIf
			if $SheepEndAssistants[$i-1]=1 Then
			   _stop()
			EndIf
		 ElseIf $StateSheep[$i-1]=8 Then
;~ 			Корабль ЖЕЛТЫЙ на ремонте
			$SheepRem=$i
			If $NomFleetInFastRepir=$i Then
			   _FastRepairFleet($i)
			   EndIf
;~  FileWrite($hFile, "УСТАНОВИТЬ $SheepRem="&$SheepRem&  @CRLF)
		 Else
		 EndIf
	  Else
		 If $StateSheep[$i-1]=7 Then
			IF $NomFleetInFastRepir=0 Then
			   If $SheepGoFastRepair[$i-1]=0 Then
				  _RepairFleet()
			   Else
				  _FastRepairFleet($i)
			   EndIf
			EndIf
		 ElseIf $StateSheep[$i-1]=8 Then
;~ 			Корабль ЖЕЛТЫЙ на ремонте
			$SheepRem=$i
			If $NomFleetInFastRepir=$i Then
			   _FastRepairFleet($i)
			   EndIf
;~  FileWrite($hFile, "УСТАНОВИТЬ $SheepRem="&$SheepRem&  @CRLF)
		 EndIf
	  EndIf
   EndIf
   if $GoProtocol=1 then
   FileWrite($h2File, @CRLF)
   EndIf
   EndIf
	  Sleep($TimeSheepConst+random($TimeSheepRnd))
	  $i=$i-1

   WEnd

;~ Клик мышкой если его долго не было
If ($BaseAfterAttack<>1) and (($MinMouseClick<>@MIN) and Mod(Abs($MinMouseClick-@MIN),2)=0) Then
if $GoProtocol=1 then
   FileWrite($h2File,  _NowTime()&" BtSpace "&@CRLF)
EndIf
   MouseClick("left",$x0+$x1+$xBtnSpace,$y0+$y1+$yBtnSpace,1,1)
   $MinMouseClick=@MIN
   EndIf
Sleep($TimeSheepCircleConst+random($TimeSheepCircleRnd))
;~ Если в середине появилась надпись
   $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White,10)
   If not @error Then
;~ 	   Нажать «ОК»
	  $FirstStart=1
	  MouseClick("left",$xBtnOk+random(20),$yBtnOk+random(20),1,1)
	  Sleep(30000)
   EndIf
;~ Конец цикла по всем флотам
WEnd

Func _SaveInFile()
FileWrite($hFile,"Дата завершения сеанса - "&_NowDate()&" Время завершения сеанса - "& _NowTime()&  @CRLF)
FileWrite($hFile, "Количество запросов на атаку"&   @CRLF)
$i=0
$AllRequestAttack=0
While $i<=6
   FileWrite($hFile, $StateKolRequestAttackSheep[$i]&", ")
   $AllRequestAttack=$AllRequestAttack+$StateKolRequestAttackSheep[$i]
   $i=$i+1;
WEnd
FileWrite($hFile,@CRLF)
FileWrite($hFile, "Общее количество запросов на атаку ="&$AllRequestAttack&   @CRLF)
FileWrite($hFile, "Количество атак"&   @CRLF)
$i=0
$AllSelectAttack=0
While $i<=6
   FileWrite($hFile, $StateKolSelectAttackSheep[$i]&", ")
   $AllSelectAttack=$AllSelectAttack+$StateKolSelectAttackSheep[$i]
   $i=$i+1;
WEnd
FileWrite($hFile,@CRLF)
FileWrite($hFile, "Общее количество атак ="&$AllSelectAttack&   @CRLF)
FileWrite($hFile, "Процент удачных запросов"&   @CRLF)
$i=0
$AllSelectAttackProc=0
$n=0
While $i<=6
   If $StateKolRequestAttackSheep[$i]<>0 then
   FileWrite($hFile, $StateKolSelectAttackSheep[$i]/$StateKolRequestAttackSheep[$i]*100&"%, ")
   $AllSelectAttackProc=$AllSelectAttackProc+$StateKolSelectAttackSheep[$i]/$StateKolRequestAttackSheep[$i]*100
   $n=$n+1
   EndIf
   $i=$i+1;
WEnd
FileWrite($hFile,@CRLF)
if $n<>0 then
   FileWrite($hFile, "Средний процент ="&$AllSelectAttackProc/$n&"%"&   @CRLF)
EndIf

FileWrite($hFile, "Количество уничтоженных флотов"&   @CRLF)
$i=0
$AllSelectDestroy=0
While $i<=6
   FileWrite($hFile, $StateKolAllSheepDestroy[$i]&", ")
   $AllSelectDestroy=$AllSelectDestroy+$StateKolAllSheepDestroy[$i]
   $i=$i+1;
WEnd
FileWrite($hFile,@CRLF)
FileWrite($hFile, "Общее количество уничтоженных флотов ="&$AllSelectDestroy&   @CRLF)
FileWrite($hFile, "Процент уничтоженных флотов среди найденных"&   @CRLF)
$i=0
$AllSelectDestroyProc=0
$n=0
While $i<=6
   If $StateKolRequestAttackSheep[$i]<>0 then
   FileWrite($hFile, $StateKolAllSheepDestroy[$i]/$StateKolSelectAttackSheep[$i]*100&"%, ")
   $AllSelectDestroyProc=$AllSelectDestroyProc+$StateKolAllSheepDestroy[$i]/$StateKolSelectAttackSheep[$i]*100
   $n=$n+1
   EndIf
   $i=$i+1;
WEnd
FileWrite($hFile,@CRLF)
if $n<>0 then
   FileWrite($hFile, "Средний процент ="&$AllSelectDestroyProc/$n&"%"&   @CRLF)
EndIf
FileClose($hFile)
EndFunc

Func _FPause()
    $iPause = Not $iPause
	if $iPause Then
	  MsgBox($MB_SYSTEMMODAL, "Пауза", "Фарм-Ассистент на паузе", 100)
	EndIf
    While $iPause
        Sleep(25)
    WEnd
EndFunc

Func _stop()
;~    _AllSheepGoHome()
   _SaveInFile()
   MsgBox($MB_SYSTEMMODAL, "Выход", "Фарм-Ассистент отключен."&@CRLF&"Информация о статистике сохранена в SessionStatistics.txt", 100)
    Exit
 EndFunc