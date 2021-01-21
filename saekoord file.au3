#include <MsgBoxConstants.au3>
;~ Размеры рабочей области
Opt("CaretCoordMode", 2)
$aClientSize = WinGetClientSize("VEGA Conflict")
$x0=0
$y0=29
$x1=$aClientSize[0]
$y1=$aClientSize[1]

;~ Константы для цветов
$Red=0xD56E6E
$Yelow=0xE1965B
$Blue=0x4FA5C2
$White=0xFFFFFF
$WhiteSpace=0xC3EBF3

;~ Пункты кораблей
;~ Верхняя граница 1-го корабля
$ysheep1=Floor($y1/2-220+$y0)
;~ Левая граница развернутых пунктов кораблей
$sheepleft=$x1-225
$SheepLeftClick=$sheepleft+15
;~ Правая граница иконки развернутых пунктов кораблей
$sheeprightIcon=$sheepleft+30
;~ Ширина окна с кораблями
$dysheep=43

;~ Параметры координат которые определяют состояние корабля
;~ X смещение для Движения или Остановки в космосе
$xOstDvish=11
;~ Y смещение для Движения или Остановки в космосе
$yOstDvish=16
;~ X смещение для второй проверки Движения в космосе
$x2Dvish=8
;~ Y смещение для второй проверки Движения  в космосе
$y2Dvish=16
;~ X смещение для Базы
$xBase=16
;~ Y смещение для Базы
$yBase=16
;~ X смещение для Ремонта
$xRepair=16
;~ Y смещение для Ремонта
$yRepair=21
;~ X смещение для Боя
$xFight=15
;~ Y смещение для Боя
$yFight=12

;~ Кнопки в нижней панели
;~ Координтаы самой левой кнопки
$xBtn1=$x1/2-95*2
;~ Длина кнопки
$dxBtn=95
;~ Верхняя граница кнопок
$yBtn=$y1-35-40+$y0

;~ Кнопка ОК в центре экрана
$xBtnOk=($x1)/2+$x0
$yBtnOk=($y1)/2+$y0+80



;~ Выбранный в начале запуска ассистента корабль
$SelectSheep=7
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
;~ Переменная времен вылета Vsec
Global $VsecTime [8] =[2,5,8,11,14,17,20,23]
;~ Время возврата флотов перед VSec в минутах
$ConstTimeVozvratMin =45
;~ Переменная наличия Всека в секторе
$TimeGoVsek=0
;~ Переменная отвечающая за клик мыши
$MinMouseClick=@MIN
;~ Переменная отвечающая за номер ремонтируемого корабля
$SheepRem=0
;~ Переменная для выхода из цикла
$ExitWhile=0
$hFile = FileOpen("test.txt", 1)

;~ НАСТРОЙКИ программы
;~ Смещение по Y (Для ПК (1), для Ноута (0.925))
$ParSheshy=1
$OtmSmesh=-50
;~ ИСпользуемые в боте флоты
Global $EnableSheep [7] =[0,0,0,0,1,1,1]
;~ Какие флоты отзывать в случае вылета Всека
Global $SheepGoHomeFromVsec [7] = [1,1,1,1,1,0,0]
;~ Переменная возможности флота воевать
Global $BattleSheep [7]= [0,0,0,0,1,1,1]
;~ Какие отметки из списка бить флотам
Global $VegaSheepNomInSearch [5][7] = [[0,0,0,0,1,3,4],[0,0,0,0,0,0,3],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
;~ Какие флоты возвращать после боя
Global $SheepGoHomeAfterBattle [7] = [0,0,0,0,0,0,0]
;~ Какие флоты возращать на ремонт в случае повреждения
Global $SheepGoRepair [7] = [1,1,1,1,0,1,1]
;~ Порядок ремонта. В массиве номера флотов
Global $RepairNom [7]= [7,6,5,4,1,2,3]

;~ Вывести все переменные в файл
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
FileWrite($hFile, "Кнопка с отметками="&$x1-200&"y="&($y0+30)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Кнопка  Отмеченные="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+$OtmSmesh)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Флот №1="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*1)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Флот №2="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*2)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Флот №3="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*3)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Флот №4="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*4)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Флот №5="&$x1/2-400+150&"y="&($y0+($y1-$y0)/2/2-25+54*5)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Ок="&$xBtnOk&"y="&($yBtnOk)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Кнопка снизу 1="&$xBtn1+1*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Кнопка снизу 2="&$xBtn1+2*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Кнопка снизу 3="&$xBtn1+3*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Кнопка снизу 4="&$xBtn1+4*$dxBtn-$dxBtn/2&"y="&($yBtn)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Вступить="&$x1/2-45&"y="&($y0+($y1+$y0)/2+100)/$ParSheshy&  @CRLF)
FileWrite($hFile, "Позиция осановка или движение в космосе="&$sheepleft+$xOstDvish&"y="&$ysheep1+(4)*$dysheep+$yOstDvish&  @CRLF)
FileWrite($hFile, "Позиция 2 движеня в космосе="&$sheepleft+$x2Dvish&"y="&$ysheep1+(4)*$dysheep+$y2Dvish&  @CRLF)
FileWrite($hFile, "Позиция на базе="&$sheepleft+$xBase&"y="&$ysheep1+(4)*$dysheep+$yBase&  @CRLF)
FileWrite($hFile, "Позиция ремонт="&$sheepleft+$xRepair&"y="&$ysheep1+(4)*$dysheep+$yRepair&  @CRLF)
FileWrite($hFile, "Надпись в середине x1="&$xBtnOk-10&"y1="&$yBtnOk-10&"x2="&$xBtnOk+10&"y2="&$yBtnOk+10&  @CRLF)


;~ FileWrite($hFile, "Точка x="&$sheepleft+$xOstDvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish&"="&PixelGetColor($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish)&  @CRLF)
;~ FileWrite($hFile, "Точка x="&$sheepleft+$x2Dvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish&"="&PixelGetColor($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish)&  @CRLF)
;~ FileWrite($hFile, "Точка x="&$sheepleft+$xBase&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yBase&"="&PixelGetColor($sheepleft+$xBase,$ysheep1+($i-1)*$dysheep+$dy+$yBase)&  @CRLF)
;~ FileWrite($hFile, "флота "&$i&" $EnableSheep="&$EnableSheep[$i-1]&  @CRLF)
;~ FileWrite($hFile, "Состояние флота "&$i&" ="&$StateSheep[$i-1]&  @CRLF)
