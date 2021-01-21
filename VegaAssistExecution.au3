#include <MsgBoxConstants.au3>
#include <Date.au3>
;~ Переменная вывода протокола
Global $GoProtocol=1
$hFile = FileOpen("SessionStatistics.txt", 1)
FileWrite($hFile,"Дата старта сеанса - "&_NowDate()&" Время старта сеанса - "& _NowTime()&  @CRLF)
$FSettingFleet=FileOpen("SettingFletInAssistans.txt", 0)
$FSettingTime=FileOpen("SettingTimeInAssistans.txt", 0)
$FSystemSetting=FileOpen("SysSettingAssistans.txt", 0)
if $GoProtocol=1 then
$h2File = FileOpen("ProtocolSession.txt", 2)
FileWrite($h2File,"Дата старта сеанса - "&_NowDate()&" Время старта сеанса - "& _NowTime()&  @CRLF)
EndIf

;~ Переменная заголовка рабочего окна (для Steam - "VEGA Conflict" для Mozila - "KIXEYE.com - Mozilla Firefox")
Global $NameWindow=FileReadLine($FSettingFleet,96)

;~ Размеры рабочей области
;~ WinMove($NameWindow, "", 0, 0, 1350, 700)
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
Global $YelowSpace=0xD48C55
Global $YelowRepair=5783327
Global $YelowRepair2=0x7F5B2C
Global $Blue=0x4FA5C2
Global $BlueRepair=2112577
Global $BlueSheepSelectRepair=0x121F22
Global $BlueExit=0xABDCE6
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
Global $WhiteSpace2=0xC0E3EA
Global $WhiteBtn=0xD4F8FF
Global $GreyCoord=0xAEC9CE

if $GoProtocol=1 then
FileWrite($h2File, "$Blue="&$Blue&" $SkyBlue="&$SkyBlue&" $BlueRepair="&$BlueRepair&" $Red="&$Red& " $Yelow="& $Yelow & " $Red="& $Red  &  @CRLF)
EndIf

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



;~ Пункты кораблей
;~ Верхняя граница 1-го корабля
Global $ysheep1=$y1/2+$y0+FileReadLine($FSystemSetting,6)
;~ Левая граница развернутых пунктов кораблей
Global $sheepleft=$x0+$x1+FileReadLine($FSystemSetting,7)
Global $SheepLeftClick=$sheepleft+FileReadLine($FSystemSetting,8)/2
;~ Правая граница иконки развернутых пунктов кораблей
Global $sheeprightIcon=$sheepleft+FileReadLine($FSystemSetting,8)
;~ Ширина окна с кораблями
Global $dysheep=FileReadLine($FSystemSetting,9)
;~ Ширина окна с составом флота
Global $ParDySheep=FileReadLine($FSystemSetting,10)

;~ Параметры координат которые определяют состояние корабля
;~ X смещение для Движения или Остановки в космосе
Global $xOstDvish=FileReadLine($FSystemSetting,11)
;~ Y смещение для Движения или Остановки в космосе
Global $yOstDvish=FileReadLine($FSystemSetting,12)
;~ X смещение для второй проверки Движения в космосе
Global $x2Dvish=FileReadLine($FSystemSetting,13)
;~ Y смещение для второй проверки Движения  в космосе
Global $y2Dvish=FileReadLine($FSystemSetting,14)
;~ X смещение для Базы
Global $xBase=FileReadLine($FSystemSetting,15)
;~ Y смещение для Базы
Global $yBase=FileReadLine($FSystemSetting,16)
;~ X смещение для Ремонта
Global $xRepair=FileReadLine($FSystemSetting,17)
;~ Y смещение для Ремонта
Global $yRepair=FileReadLine($FSystemSetting,18)
;~ X смещение для Боя
Global $xFight=FileReadLine($FSystemSetting,19)
;~ Y смещение для Боя
Global $yFight=FileReadLine($FSystemSetting,20)
;~ X смещение для сопровождаемого
Global $xConnect=FileReadLine($FSystemSetting,21)
;~ Y смещение для сопровождаемого
Global $yConnect=FileReadLine($FSystemSetting,22)
;~ X смещение для сопровождающего
Global $xToConnect=FileReadLine($FSystemSetting,23)
;~ Y смещение для сопровождающего
Global $yToConnect=FileReadLine($FSystemSetting,24)
;~ X и Y смещения для коорднат сектора у корабля
Global $x1DToConnect=FileReadLine($FSystemSetting,25)
Global $y1DToConnect=FileReadLine($FSystemSetting,26)
Global $x2DToConnect=FileReadLine($FSystemSetting,27)
Global $y2DToConnect=FileReadLine($FSystemSetting,28)
Global $x3DToConnect=FileReadLine($FSystemSetting,29)

;~ Кнопки в нижней панели
;~ Координаты самой левой кнопки
Global $xBtn1=$x0+$x1/2+FileReadLine($FSystemSetting,32)
;~ Длина кнопки
Global $dxBtn=FileReadLine($FSystemSetting,34)
;~ Верхняя граница кнопок
Global $yBtn=$y1+$y0+FileReadLine($FSystemSetting,33)

;~ Кнопка ОК в центре экрана
Global $xBtnOk=($x1)/2+$x0+FileReadLine($FSystemSetting,30)
Global $yBtnOk=($y1)/2+$y0+FileReadLine($FSystemSetting,31)

;~ X отметок
Global $XOtmBtn=FileReadLine($FSystemSetting,39)
;~ Y отметок
Global $YOtmBtn=FileReadLine($FSystemSetting,40)
;~ X Отмеченные
Global $XOtmecennieBtn=FileReadLine($FSystemSetting,41)
Global $YOtmecennieBtn=FileReadLine($FSystemSetting,67)
;~ Высота пункта в отметках
Global $yOtmetki=FileReadLine($FSystemSetting,42)

;~ Ширина и высота корабля в верфи
Global $xySheepBase=FileReadLine($FSystemSetting,47)
;~ Расстояние между кораблями в верфи
Global $xySheepBaseDist=FileReadLine($FSystemSetting,48)
;~ Расстояние до кнопки убрать из флота
Global $xBtnDelInFleet=FileReadLine($FSystemSetting,49)
Global $yBtnDelInFleet=FileReadLine($FSystemSetting,50)
;~ Координаты кнопки ремонт
Global $xBtnRepairInBase=FileReadLine($FSystemSetting,51)
Global $yBtnRepairInBase=FileReadLine($FSystemSetting,52)
;~ Координаты быстрого ремонта
Global $xBtnFastRepairInBase=FileReadLine($FSystemSetting,53)
Global $yBtnFastRepairInBase=FileReadLine($FSystemSetting,54)
;~ Координаты поиска быстрого ремонта
Global $xBtnFastRepairInBaseSearch=FileReadLine($FSystemSetting,55)
Global $yBtnFastRepairInBaseSearch=FileReadLine($FSystemSetting,56)
;~ Координаты "Последние корабли"
Global $xBtnLastSheep=FileReadLine($FSystemSetting,57)
Global $yBtnLastSheep=FileReadLine($FSystemSetting,58)
;~ Координаты первого корабля из списка последних
Global $xBtnFirstSheep=FileReadLine($FSystemSetting,59)
Global $yBtnFirstSheep=FileReadLine($FSystemSetting,60)
;~ Координаты крестика
Global $xBtnExit=FileReadLine($FSystemSetting,61)
Global $yBtnExit=FileReadLine($FSystemSetting,62)
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
Global $xSheepInBaseSmesh=FileReadLine($FSystemSetting,63)
Global $ySheepInBaseSmesh=FileReadLine($FSystemSetting,64)

;~ Расстояние от центра экрана до кнопки убрать при атаке на базу
Global $xBtnAttackInBaseY=FileReadLine($FSystemSetting,43)
Global $yBtnAttackInBaseY=FileReadLine($FSystemSetting,44)
;~ Расстояние от правого нижнего угла экрана до кнопки База
Global $xBtnBase=FileReadLine($FSystemSetting,35)
Global $yBtnBase=FileReadLine($FSystemSetting,36)
;~ Расстояние от правого нижнего угла экрана до кнопки Сектор
Global $xBtnSpace=FileReadLine($FSystemSetting,37)
Global $yBtnSpace=FileReadLine($FSystemSetting,38)
;~ Расстояние от центра экрана до кнопки Ремонт после атаки на базу
Global $xBaseRepair=FileReadLine($FSystemSetting,45)
Global $yBaseRepair=FileReadLine($FSystemSetting,46)

;~ Смещение для определения включенных кнопок внизу
Global $xNumberBtn=FileReadLine($FSystemSetting,65)
Global $yNumberBtn=FileReadLine($FSystemSetting,66)
$xNumberBtn=$x0+$x1/2+$xNumberBtn
$yNumberBtn=$y0+$y1+$yNumberBtn

;~ Переменная времен вылета Vsec
Global $VsecTime [8] =[2,5,8,11,14,17,20,23]
;~ Время возврата флотов перед VSec в минутах
Global $ConstTimeVozvratMin =50


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
Global $EnableSheep [7] =[0,0,0,0,0,0,0]
;~ Какие флоты отзывать в случае вылета Всека
Global $SheepGoHomeFromVsec [7] = [0,0,0,0,1,0,0]
;~ Переменная возможности флота воевать
Global $BattleSheep [7]= [0,0,0,0,1,1,1]
;~ Какие отметки из списка бить флотам
Global $VegaSheepNomInSearch [5][7] = [[0,0,0,0,1,3,4],[0,0,0,0,5,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
;~ Какие флоты возвращать после боя
Global $SheepGoHomeAfterBattle [7] = [0,0,0,0,0,0,0]
;~ Какие флоты возвращать после остановки в секторе
Global $SheepGoHomeInSektor [7] = [0,0,0,0,0,0,0]
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

;~ Иcпользуемые в боте флоты
$i=0
While $i<7
   $EnableSheep[$i]=FileReadLine($FSettingFleet,1+$i)
   $i=$i+1
WEnd
;~ Переменная возможности флота воеват
$i=0
While $i<7
   $BattleSheep[$i]=FileReadLine($FSettingFleet,8+$i)
   $i=$i+1
WEnd
;~ Какие отметки из списка бить флотам
$j=0
$k=0
While $j<5
   $i=0
   While $i<7
	  $VegaSheepNomInSearch [$j][$i]=FileReadLine($FSettingFleet,15+$k)
	  $k=$k+1
	  $i=$i+1
   WEnd
   $j=$j+1
WEnd
;~ Какие флоты возвращать после боя
$i=0
While $i<7
   $SheepGoHomeAfterBattle[$i]=FileReadLine($FSettingFleet,50+$i)
   $i=$i+1
WEnd
;~ Какие флоты возращать на ремонт в случае повреждения
$i=0
While $i<7
   $SheepGoRepair[$i]=FileReadLine($FSettingFleet,57+$i)
   $i=$i+1
WEnd
;~ Какие флоты отзывать в случае вылета Всека
$i=0
While $i<7
   $SheepGoHomeFromVsec[$i]=FileReadLine($FSettingFleet,64+$i)
   $i=$i+1
WEnd
;~ Какие флоты быстро ремонтировать
$i=0
While $i<7
   $SheepGoFastRepair[$i]=FileReadLine($FSettingFleet,71+$i)
   $i=$i+1
WEnd
;~ Номера флотов, которые сопровождать
$i=0
While $i<7
   $SheepConvoyNomber[$i]=FileReadLine($FSettingFleet,78+$i)
   $i=$i+1
WEnd
;~ Порядок ремонта. В массиве номера флотов
$i=0
While $i<7
   $RepairNom[$i]=FileReadLine($FSettingFleet,85+$i)
   $i=$i+1
WEnd
;~ Флаг запуска атаки на базу во время ивента
Global $GoAttackAtBaseIvent=FileReadLine($FSettingFleet,92)
;~ Время (час) выключения бота (больше 24 - выключение не происходит)
Global $TimeStopAssistent=FileReadLine($FSettingFleet,93)
Global $TimeStopAssistentMin=FileReadLine($FSettingFleet,94)
;~ Возврат флотов по завершению работы
Global $AllFleetGoHomeExit=FileReadLine($FSettingFleet,95)

;~ Какие флоты отзывать в случае остановки в секторе
$i=0
While $i<7
   $SheepGoHomeInSektor[$i]=FileReadLine($FSettingFleet,97+$i)
   $i=$i+1
WEnd

$ySmeshMozilaVstupit=0
$WhiteRazn=10
;~ Убрать заголовки при запуске из Mozila
If $NameWindow="KIXEYE.com - Mozilla Firefox" Then
   $yBtnOk=$yBtnOk+15
   $ySmeshMozilaVstupit=20
;~    $WhiteRazn=100
   EndIf

FileDelete("SettingFletInAssistans.txt")

;~ Переменные задержек
Global $TimeSmallSmallConst=FileReadLine($FSettingTime,1)
Global $TimeSmallSmallRnd=FileReadLine($FSettingTime,2)
Global $TimeSmallConst=FileReadLine($FSettingTime,3)
Global $TimeSmallRnd=FileReadLine($FSettingTime,4)
Global $TimeMediumConst=FileReadLine($FSettingTime,5)
Global $TimeMediumRnd=FileReadLine($FSettingTime,6)
Global $TimeLargeConst=FileReadLine($FSettingTime,7)
Global $TimeLargeRnd=FileReadLine($FSettingTime,8)
Global $TimeSheepConst=FileReadLine($FSettingTime,9)
Global $TimeSheepRnd=FileReadLine($FSettingTime,10)
Global $TimeSheepCircleConst=FileReadLine($FSettingTime,11)
Global $TimeSheepCircleRnd=FileReadLine($FSettingTime,12)
Global $TimeFastRepairRnd=FileReadLine($FSettingTime,13)





HotKeySet("{ESC}","_stop")
HotKeySet("{Pause}","_FPause")
HotKeySet("+!s","_SaveInFile")
Dim $iPause=False


if $GoProtocol=1 then
FileWrite($h2File,"$NameWindow="&$NameWindow&  @CRLF)
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
FileWrite($h2File, "$xBtnExit="& $x0+$x1/2+$xBtnExit & " $yBtnExit="& $y0+$y1/2+$yBtnExit-10 &  @CRLF)
FileWrite($h2File, "$xNumberBtn="& $xNumberBtn & " $yNumberBtn="& $yNumberBtn &  @CRLF)
FileWrite($h2File, "$xNumberBtn+="& $xNumberBtn+13 & " $yNumberBtn+="& $yNumberBtn+63 &  @CRLF)
FileWrite($h2File, "$x1/2="& $x1/2 & " $y0+($y1)/2+80="& $y0+($y1)/2+80 & " $x1/2+90="& $x1/2+90 & " $y0+($y1)/2+120+$ySmeshMozilaVstupit="& $y0+($y1)/2+120+$ySmeshMozilaVstupit &  @CRLF)
EndIf

if $GoProtocol=1 then
FileWrite($h2File, "$EnableSheep="&$EnableSheep[0] & $EnableSheep[1]& $EnableSheep[2]&$EnableSheep[3]&$EnableSheep[4]&$EnableSheep[5]&$EnableSheep[6]&  @CRLF)
FileWrite($h2File, "$SheepGoHomeFromVsec="&$SheepGoHomeFromVsec[0] & $SheepGoHomeFromVsec[1]& $SheepGoHomeFromVsec[2]&$SheepGoHomeFromVsec[3]&$SheepGoHomeFromVsec[4]&$SheepGoHomeFromVsec[5]&$SheepGoHomeFromVsec[6]&  @CRLF)
FileWrite($h2File, "$BattleSheep="&$BattleSheep[0] & $BattleSheep[1]& $BattleSheep[2]&$BattleSheep[3]&$BattleSheep[4]&$BattleSheep[5]&$BattleSheep[6]&  @CRLF)
FileWrite($h2File, "$VegaSheepNomInSearch[0]="&$VegaSheepNomInSearch[0][0] & $VegaSheepNomInSearch[0][1]& $VegaSheepNomInSearch[0][2]&$VegaSheepNomInSearch[0][3]&$VegaSheepNomInSearch[0][4]&$VegaSheepNomInSearch[0][5]&$VegaSheepNomInSearch[0][6]&  @CRLF)
FileWrite($h2File, "$VegaSheepNomInSearch[1]="&$VegaSheepNomInSearch[1][0] & $VegaSheepNomInSearch[1][1]& $VegaSheepNomInSearch[1][2]&$VegaSheepNomInSearch[1][3]&$VegaSheepNomInSearch[1][4]&$VegaSheepNomInSearch[1][5]&$VegaSheepNomInSearch[1][6]&  @CRLF)
FileWrite($h2File, "$SheepGoHomeAfterBattle="&$SheepGoHomeAfterBattle[0] & $SheepGoHomeAfterBattle[1]& $SheepGoHomeAfterBattle[2]&$SheepGoHomeAfterBattle[3]&$SheepGoHomeAfterBattle[4]&$SheepGoHomeAfterBattle[5]&$SheepGoHomeAfterBattle[6]&  @CRLF)
FileWrite($h2File, "$SheepGoHomeInSektor="&$SheepGoHomeInSektor[0] & $SheepGoHomeInSektor[1]& $SheepGoHomeInSektor[2]&$SheepGoHomeInSektor[3]&$SheepGoHomeInSektor[4]&$SheepGoHomeInSektor[5]&$SheepGoHomeInSektor[6]&  @CRLF)
FileWrite($h2File, "$SheepGoRepair="&$SheepGoRepair[0] & $SheepGoRepair[1]& $SheepGoRepair[2]&$SheepGoRepair[3]&$SheepGoRepair[4]&$SheepGoRepair[5]&$SheepGoRepair[6]&  @CRLF)
FileWrite($h2File, "$SheepGoFastRepair="&$SheepGoFastRepair[0] & $SheepGoFastRepair[1]& $SheepGoFastRepair[2]&$SheepGoFastRepair[3]&$SheepGoFastRepair[4]&$SheepGoFastRepair[5]&$SheepGoFastRepair[6]&  @CRLF)
FileWrite($h2File, "$RepairNom="&$RepairNom[0] & $RepairNom[1]& $RepairNom[2]&$RepairNom[3]&$RepairNom[4]&$RepairNom[5]&$RepairNom[6]&  @CRLF)
FileWrite($h2File, "$SheepEndAssistants="&$SheepEndAssistants[0] & $SheepEndAssistants[1]& $SheepEndAssistants[2]&$SheepEndAssistants[3]&$SheepEndAssistants[4]&$SheepEndAssistants[5]&$SheepEndAssistants[6]&  @CRLF)
FileWrite($h2File, "$SheepConvoyNomber="& $SheepConvoyNomber[0] & $SheepConvoyNomber[1]& $SheepConvoyNomber[2]&$SheepConvoyNomber[3]&$SheepConvoyNomber[4]&$SheepConvoyNomber[5]&$SheepConvoyNomber[6] &  @CRLF)
FileWrite($h2File, "$SheepConvoyFlag="&$SheepConvoyFlag[0] & $SheepConvoyFlag[1]& $SheepConvoyFlag[2]&$SheepConvoyFlag[3]&$SheepConvoyFlag[4]&$SheepConvoyFlag[5]&$SheepConvoyFlag[6]&  @CRLF)

EndIf

Func _GoSpace()
 $coord = PixelSearch($x0+$x1+$xBtnSpace-5,$y0+$y1+$yBtnSpace-5,$x0+$x1+$xBtnSpace+5,$y0+$y1+$yBtnSpace+5, $YelowSpace,10)
	  If @error Then
;~ 		 Если ошибка то возращаем состояние в космос
		 _DelMessageByFightAnotherFleet ()
		 $coord = PixelSearch($x0+$x1/2+$xBtnExit-5,$y0+$y1/2+$yBtnExit-10,$x0+$x1/2+$xBtnExit+5,$y0+$y1/2+$yBtnExit-20, $BlueExit,10)
		 IF not @error Then
			MouseClick("left",$x0+$x1/2+$xBtnExit,$y0+$y1/2+$yBtnExit-10,1,1)
			Sleep($TimeSmallConst+random($TimeSmallRnd))
			EndIf
	  EndIf
   EndFunc

Func _DelMessageByFightAnotherFleet ()
   $coord = PixelSearch($x1/2+80,$y0+($y1)/2+115,$x1/2+90,$y0+($y1)/2+125+$ySmeshMozilaVstupit, $White,$WhiteRazn)
While not @error
;~ 	   Нажать "Убрать"
if $GoProtocol=1 then
FileWrite($h2File, "Уб ")
EndIf
	  MouseClick("left",$x1/2+100+random(20),$y0+($y1)/2+100,1,1)
	  Sleep($TimeSmallConst+random($TimeSmallRnd))
	  $coord = PixelSearch($x1/2+80,$y0+($y1)/2+115,$x1/2+90,$y0+($y1)/2+125+$ySmeshMozilaVstupit, $White,$WhiteRazn)
   WEnd
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
;~    If ($i<>$SelectSheep) then
_GoSpace()
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
;~    EndIf
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
   MouseClick("left",$x1+$XOtmBtn,$y0+$YOtmBtn,1,1)
   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))

;~ Выбрать вкладку "Отмеченные"
if $GoProtocol=1 then
FileWrite($h2File, "VOtm")
EndIf
   MouseClick("left",$x1/2+$XOtmecennieBtn+random(50),$y0+($y1)/2-5*$yOtmetki+$YOtmecennieBtn,1,1)
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
;~ 	  $coord = PixelSearch($xNumberBtn,$yNumberBtn,$xNumberBtn+5,$yNumberBtn+8, $WhiteBtn,10)
;~ 	  If @error Then
;~ 		 _SelectSheep($i)
;~ 		 EndIf
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
   $coord = PixelSearch($xNumberBtn,$yNumberBtn,$xNumberBtn+5,$yNumberBtn+63, $WhiteBtn,10)
   If @error Then
	  _SelectSheep($i)
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
		 if $GoProtocol=1 then
		 FileWrite($h2File, " StartRep "&$SheepRem&" ")
		 EndIf
;~ Проходим по всем флотам в порядке установленном в массиве $RepairNom
   While ($j<8) and ($EndWhileRepair=0)
;~ 	  Если первым нашли флот в ремонте, то завершить поиск
	  if ($SheepRem=$RepairNom[$j-1]) Then
		 $EndWhileRepair=1
	  Elseif ($SheepRem<>$RepairNom[$j-1]) and ($EndWhileRepair=0) and ($EnableSheep[$RepairNom[$j-1]-1]=1) and ($StateSheep[$RepairNom[$j-1]-1]=7) Then
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
			   $coord = PixelSearch($xNumberBtn,$yNumberBtn-13,$xNumberBtn+13,$yNumberBtn+63, $WhiteBtn,10)
			   If @error Then
				  _SelectSheep($SheepRem)
				  EndIf
			   MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
			   Sleep($TimeMediumConst+random($TimeMediumRnd))
			   EndIf
			EndIf
		 _SelectSheep ($RepairNom[$j-1])
		 if $GoProtocol=1 then
		 FileWrite($h2File, "Rep"&$RepairNom[$j-1]&" ")
		 EndIf
		 $coord = PixelSearch($xNumberBtn,$yNumberBtn-13,$xNumberBtn+13,$yNumberBtn+63, $WhiteBtn,10)
		 If @error Then
			_SelectSheep($RepairNom[$j-1])
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

Func _SelectFastRepairFleet ($i,ByRef $NomSheepInFastRepair)
      if $GoProtocol=1 then
FileWrite($h2File, " R ")
EndIf

;~    Проверка на возможность нажать ремонт
	  $coord = PixelSearch($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10,$x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10, $BlueRepair,10)
	  If @error Then
;~ 	 	 Добавляем новый корабль
		 $NomSheepInFastRepair=$NomSheepInFastRepair+1
if $GoProtocol=1 then
FileWrite($h2File, " NextSheep "&$NomSheepInFastRepair&" ")
EndIf
   ;~    Проверка имелся ли корабль во флоте
		 If ($NomSheepInFastRepair<=6) and ($SheepInFleetBase[$NomSheepInFastRepair-1]=1) Then
			$coord = PixelSearch($x0+$x1/2+$xBtnLastSheep,$y0+$y1/2+$yBtnLastSheep-10,$x0+$x1/2+$xBtnLastSheep+10,$y0+$y1/2+$yBtnLastSheep-20, $WhiteSpace2,10)
			$KolWhileGo=0
			While (@error) and ($KolWhileGo<=10)
			   $KolWhileGo=$KolWhileGo+1
;~ 	  		Выбираем место корабля
if $GoProtocol=1 then
FileWrite($h2File, " BtSheep "&$NomSheepInFastRepair&" ")
EndIf
			   MouseClick("left",$xSheepInBase[$NomSheepInFastRepair-1]+random(20),$ySheepInBase[$NomSheepInFastRepair-1]+random(20),1,1)
			   Sleep($TimeSmallConst+random($TimeSmallRnd))
			   _DelMessageByFightAnotherFleet ()
			   $coord = PixelSearch($x0+$x1/2+$xBtnLastSheep,$y0+$y1/2+$yBtnLastSheep-10,$x0+$x1/2+$xBtnLastSheep+10,$y0+$y1/2+$yBtnLastSheep-20, $WhiteSpace2,10)
			   WEnd
			$KolWhileGo=0
			While (not @error) and ($KolWhileGo<=10)
			   $KolWhileGo=$KolWhileGo+1
;~ 	  		Нажимаем "последние корабли"
if $GoProtocol=1 then
FileWrite($h2File, "LastSheep ")
EndIf
			   MouseClick("left",$x0+$x1/2+$xBtnLastSheep+random(20),$y0+$y1/2+$yBtnLastSheep-10,1,1)
			   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
			   _DelMessageByFightAnotherFleet ()
;~ 	  		Выбираем первый корабль
if $GoProtocol=1 then
FileWrite($h2File, "ShSel ")
EndIf
			   MouseClick("left",$x0+$x1/2+$xBtnFirstSheep+random(20),$y0+$y1/2+$yBtnFirstSheep-10+random(20),1,1)
			   Sleep($TimeSmallSmallConst+random($TimeSmallSmallRnd))
			   _DelMessageByFightAnotherFleet ()
;~ 	  		Нажимаем "Добавить во флот"
if $GoProtocol=1 then
FileWrite($h2File, "AddSheep ")
EndIf
			   MouseClick("left",$x0+$x1/2+$xBtnDelInFleet+random(20),$y0+$y1/2+$yBtnDelInFleet-10,1,1)
			   Sleep($TimeSmallConst+random($TimeSmallRnd))
			   _DelMessageByFightAnotherFleet ()
			   $coord = PixelSearch($x0+$x1/2+$xBtnLastSheep,$y0+$y1/2+$yBtnLastSheep-10,$x0+$x1/2+$xBtnLastSheep+10,$y0+$y1/2+$yBtnLastSheep-20, $WhiteSpace2,10)
			   WEnd
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
			$KolWhileGo=0
			While (not @error) and ($KolWhileGo<=10)
			   $KolWhileGo=$KolWhileGo+1
;~ 	  			Если ремонт не активирован, то
;~ 	 			 Нажимаем ремонт
if $GoProtocol=1 then
FileWrite($h2File, "BtRem ")
EndIf
				  MouseClick("left",$x0+$x1/2+$xBtnRepairInBase+random(20),$y0+$y1/2+$yBtnRepairInBase-10,1,1)
				  Sleep($TimeSmallConst+random($TimeSmallRnd))
				  _DelMessageByFightAnotherFleet ()
				  $MinMouseClick=@MIN
				  $coord = PixelSearch($x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10,$x0+$x1/2+$xBtnRepairInBase,$y0+$y1/2+$yBtnRepairInBase-10, $BlueRepair,10)
				  WEnd
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
FileWrite($h2File, " NomFlFR "&$NomFleetInFastRepir&" ")
EndIf

If $NomSheepInFastRepair>6 Then
   $NomSheepInFastRepair=0
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
		 $coord = PixelSearch($xNumberBtn,$yNumberBtn,$xNumberBtn+5,$yNumberBtn+63, $WhiteBtn,10)
		 $KolWhileGo=0
		 While (@error) and ($KolWhileGo<=10)
			$KolWhileGo=$KolWhileGo+1
			_SelectSheep($SheepRem)
 			Sleep($TimeSmallConst+random($TimeSmallRnd))
			$coord = PixelSearch($xNumberBtn,$yNumberBtn,$xNumberBtn+5,$yNumberBtn+63, $WhiteBtn,10)
			WEnd
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
$coord = PixelSearch($xNumberBtn,$yNumberBtn,$xNumberBtn+5,$yNumberBtn+63, $WhiteBtn,10)
$KolWhileGo=0
While (@error) and ($KolWhileGo<=10)
   $KolWhileGo=$KolWhileGo+1
   _SelectSheep($i)
   Sleep($TimeSmallConst+random($TimeSmallRnd))
   $coord = PixelSearch($xNumberBtn,$yNumberBtn,$xNumberBtn+5,$yNumberBtn+63, $WhiteBtn,10)
   WEnd
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
			$coord = PixelSearch($xSheepInBase[$NomSheepInFastRepair-1]+$xSheepInBaseSmesh,$ySheepInBase[$NomSheepInFastRepair-1]+$ySheepInBaseSmesh,$xSheepInBase[$NomSheepInFastRepair-1]+$xSheepInBaseSmesh,$ySheepInBase[$NomSheepInFastRepair-1]+$ySheepInBaseSmesh, $BlueSheepSelectRepair,8)
			$KolWhileGo=0
			While (@error) and ($KolWhileGo<=10)
			   $KolWhileGo=$KolWhileGo+1
if $GoProtocol=1 then
FileWrite($h2File, "BtSheep "&$NomSheepInFastRepair&" ")
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
			   $coord = PixelSearch($xSheepInBase[$NomSheepInFastRepair-1]+$xSheepInBaseSmesh,$ySheepInBase[$NomSheepInFastRepair-1]+$ySheepInBaseSmesh,$xSheepInBase[$NomSheepInFastRepair-1]+$xSheepInBaseSmesh,$ySheepInBase[$NomSheepInFastRepair-1]+$ySheepInBaseSmesh, $BlueSheepSelectRepair,8)
			WEnd
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
   if $GoProtocol=1 then
FileWrite($h2File, " SetNFR " &$NomFleetInFastRepir)
EndIf
EndIf



if $GoProtocol=1 then
FileWrite($h2File, " FFR "&$NomSheepInFastRepair&" ")
EndIf

$ExitWhileRepair=0
While ($NomSheepInFastRepair<=6) and ($ExitWhileRepair=0)
;~  Проверка Идет ремонт или нет
   if $GoProtocol=1 then
FileWrite($h2File, " Wh ")
EndIf
;~ MouseMove($x0+$x1/2+$xBtnFastRepairInBase+3-5,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3,1)
$coord = PixelSearch($x0+$x1/2+$xBtnFastRepairInBase+3-5,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3,$x0+$x1/2+$xBtnFastRepairInBase+5,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3, $Black,10)
;~ MouseMove($x0+$x1/2+$xBtnFastRepairInBase+3-5,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3+100,1)
If @error Then
   if $GoProtocol=1 then
FileWrite($h2File, " NotR ")
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
   Else
	  $coord = PixelSearch($x0+$x1/2+$xBtnFastRepairInBase-5,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3,$x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair+3-15, $YelowRepair2,10)
	  If @error Then
		 _SelectFastRepairFleet ($i,$NomSheepInFastRepair)
		 EndIf
   EndIf
;~ 	Проверка на возможность быстрого ремонта

   If PixelGetColor($x0+$x1/2+$xBtnFastRepairInBase,$y0+$y1/2+$yBtnFastRepairInBase-20+$yFastRepair)=$WhiteRepair Then
if $GoProtocol=1 then
   FileWrite($h2File, "BtFRem ")
EndIf
;~ 	  Нажимаем Ремонт "Даром"
	  MouseClick("left",$x0+$x1/2+$xBtnFastRepairInBase+random(20),$y0+$y1/2+$yBtnFastRepairInBase-20,1,1)
	  Sleep($TimeSmallConst+random($TimeSmallRnd))
	  _DelMessageByFightAnotherFleet ()
	  If $NomSheepInFastRepair=6 Then
		 $NomFleetInFastRepir=7
	  EndIf
   Else
	  $ExitWhileRepair=1
	  EndIf
   Else
	  _SelectFastRepairFleet ($i,$NomSheepInFastRepair)
   EndIf

WEnd

$coord = PixelSearch($x0+$x1/2+$xBtnExit-5,$y0+$y1/2+$yBtnExit-10,$x0+$x1/2+$xBtnExit+5,$y0+$y1/2+$yBtnExit-20, $BlueExit,10)
$KolWhileGo=0
While (not @error) and ($KolWhileGo<=10)
   $KolWhileGo=$KolWhileGo+1
if $GoProtocol=1 then
   FileWrite($h2File, " BtnEx ")
EndIf
   MouseClick("left",$x0+$x1/2+$xBtnExit,$y0+$y1/2+$yBtnExit-10,1,1)
   Sleep($TimeSmallConst+random($TimeSmallRnd))
   _DelMessageByFightAnotherFleet ()
   $MinMouseClick=@MIN
   $coord = PixelSearch($x0+$x1/2+$xBtnExit-5,$y0+$y1/2+$yBtnExit-10,$x0+$x1/2+$xBtnExit+5,$y0+$y1/2+$yBtnExit-20, $BlueExit,10)
   WEnd

If $NomSheepInFastRepair>6 Then
   $SheepRem=0
   $NomFleetInFastRepir=0
EndIf
if $GoProtocol=1 then
   FileWrite($h2File, " Ex "&$NomFleetInFastRepir)
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
   $coord = PixelSearch($xNumberBtn,$yNumberBtn-13,$xNumberBtn+13,$yNumberBtn+63, $WhiteBtn,10)
	  If @error Then
	  _SelectSheep($i)
	  EndIf
;~    $SheepConvoyState[$i-1]=3
   $dy=0
   _GoDy ($SelectSheep,$SheepConvoyNomber[$i-1],$dy)
;~    Нажать кнопку сопровождать
if $GoProtocol=1 then
   FileWrite($h2File, "Bt1 ")
EndIf
   MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2+random(20),$yBtn,1,1)
   Sleep($TimeSmallConst+random($TimeSmallRnd))
;~    Выбрать корабль сопровождения
if $GoProtocol=1 then
FileWrite($h2File, "Conv"&$SheepConvoyNomber[$i-1]&" ")
EndIf
   MouseClick("left",$sheeprightIcon-5-random(20),$ysheep1+($SheepConvoyNomber[$i-1]-1)*$dysheep+$dy+$dysheep/2+random(10),1,1)
   if $GoProtocol=1 then
	  FileWrite($h2File, "MCl"&$SheepConvoyNomber[$i-1]&" ")
	  EndIf
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
	  Sleep($TimeSmallConst+random($TimeSmallRnd))
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
	  ;~ Определение состояния всех флотов.
	  $i=1
	  While $i<=7
		 _GetSostSheep($SelectSheep,$i)
		 $i=$i+1
		 WEnd
   EndIf
;~    Отключение ассистента
   If ($TimeStopAssistent=@HOUR) and ($TimeStopAssistentMin<=@MIN) Then
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
;~ 	  Проверка включен космос или нет
	  _GoSpace()
;~ 	   Определение состояния корабля
	  _GetSostSheep($SelectSheep,$i)
;~ 	  Проверка на Vsec
;~ 	  Определение времени ближайшего вылета VSec
	  $NomVsec=0
	  While ($NomVsec<=7) and ($VsecTime[$NomVsec]<@HOUR)
		 $NomVsec=$NomVsec+1
	  WEnd
	  $SearchSheepRem=0;
;~ 	  Если разница между текущем временем и временем вылета меньше ConstTimeVozvrat минут и включен отзыв на всек ,то
	  IF ($NomVsec<=8) and (($VsecTime[$NomVsec]=@HOUR) or (($VsecTime[$NomVsec]-@HOUR=1) and (@MIN>$ConstTimeVozvratMin)) or (($NomVsec<>0) and ($VsecTime[$NomVsec-1]-@HOUR=1) and (@MIN>10)))  and ($SheepGoHomeFromVsec[$i-1]=1)  Then
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
			If ($NomFleetInFastRepir=$i) Then
			   _FastRepairFleet($i)
			Else
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
			EndIf
		 ElseIf ($StateSheep[$i-1]=2) or ($StateSheep[$i-1]=9) Then
;~ 			Корабль СИНИЙ на в космосе стоит
			$SheepInFight[$i-1]=0
;~ 			Установка состояния что флот находится в сопровождении
			if ($StateSheep[$i-1]=9) Then
			   $SheepConvoyState[$i-1]=3
			   EndIf
;~ 			Проверка необходимости ожидания сопровождения
			if (($SheepConvoyFlag[$i-1]=1) or ($SheepConvoyNomber[$i-1]<>0)) and ($SheepConvoyState[$i-1]<>3) Then
			   _SheepGoFlyToConvoy(2,$i)
;~ 			Если корабль провел бой и его надо вернуть
			ElseIf ($SheepGoHomeAfterBattle[$i-1]=1) and ($StateSheepDestroy[$i-1]=1) Then
			   	_SheepGoHome($i)
;~ 			Если корабль остановился в секторе и его надо вернуть
			ElseIf ($SheepGoHomeInSektor[$i-1]=1) then
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
if $GoProtocol=1 then
FileWrite($h2File, "NR "&$SheepRem&" ")
EndIf
			if $SheepRem=$i Then
;~ 				Сбросить номер ремонтируемого флота
			   $SheepRem=0
			EndIf
;~ 			Попытка запустить корабль в бой
			If ($SheepGoRepair[$i-1]=0)  Then
			   if $SheepConvoyFlag[$i-1]=1 Then
				  _SheepGoFlyToConvoy(1,$i)
			   ElseIf ($BattleSheep[$i-1]=1) then
				  _GoBattleFleet($i)
			   EndIf
			EndIf
;~ 			Проверка необходимости ремонта флота
if $GoProtocol=1 then
FileWrite($h2File, "NFR "&$NomFleetInFastRepir&" ")
EndIf
			IF ($NomFleetInFastRepir=0) or ($NomFleetInFastRepir=$i) Then
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
			$SearchSheepRem=$i
			If $NomFleetInFastRepir=$i Then
			   _FastRepairFleet($i)
			   EndIf
;~  FileWrite($hFile, "УСТАНОВИТЬ $SheepRem="&$SheepRem&  @CRLF)
		 ElseIf $StateSheep[$i-1]=0 Then
		 $SearchSheepRem=$i
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
			$SearchSheepRem=$i
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
;~ 	  IF $SearchSheepRem=0 Then
;~ 		 $SheepRem=0
;~ 		 $NomFleetInFastRepir=0
;~ 		 EndIf
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
   $coord = PixelSearch($xBtnOk-8,$yBtnOk+11,$xBtnOk-8,$yBtnOk+13, $White,10)
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
   IF $AllFleetGoHomeExit=1 Then
	  _AllSheepGoHome()
	  EndIf
   _SaveInFile()
   MsgBox($MB_SYSTEMMODAL, "Выход", "Фарм-Ассистент отключен."&@CRLF&"Информация о статистике сохранена в SessionStatistics.txt", 100)
    Exit
 EndFunc