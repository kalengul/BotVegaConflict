#include <MsgBoxConstants.au3>
#include <Date.au3>
;~ Размеры рабочей области
Opt("CaretCoordMode", 2)
Global $aClientSize = WinGetClientSize("VEGA Conflict")
Global $aPos=WinGetPos("VEGA Conflict")
While @error=1
   $aClientSize = WinGetClientSize("VEGA Conflict")
   $aPos=WinGetPos("VEGA Conflict")
WEnd
Global $x0=0+$aPos[0]+9
Global $y0=29+$aPos[1]
;~ Для ноута
;~ $y0=$y0+1

Global $x1=$aClientSize[0]
Global $y1=$aClientSize[1]

;~ Константы для цветов
Global $Red=0xD56E6E
Global $Yelow=0xE1965B
Global $Blue=0x4FA5C2
Global $SkyBlue=0x4EA4C1
Global $White=0xFFFFFF
Global $WhiteSpace=0xC3EBF3

;~ Пункты кораблей
;~ Верхняя граница 1-го корабля
Global $ysheep1=($y1/2-220+$y0)
;~ Левая граница развернутых пунктов кораблей
Global $sheepleft=$x0+$x1-225
Global $SheepLeftClick=$x0+$sheepleft+15
;~ Правая граница иконки развернутых пунктов кораблей
Global $sheeprightIcon=$x0+$sheepleft+30
;~ Ширина окна с кораблями
Global $dysheep=43

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
Global $xFight=15
;~ Y смещение для Боя
Global $yFight=12
;~ X смещение для сопровождения
Global $xConnect=9
;~ Y смещение для сопровождения
Global $yConnect=14

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
;~ Переменная времен вылета Vsec
Global $VsecTime [8] =[2,5,8,11,14,17,20,23]
;~ Время возврата флотов перед VSec в минутах
Global $ConstTimeVozvratMin =45
;~ Переменная наличия Всека в секторе
Global $TimeGoVsek=0
;~ Переменная отвечающая за клик мыши
Global $MinMouseClick=@MIN
;~ Переменная отвечающая за номер ремонтируемого корабля
Global $SheepRem=0
;~ Переменная для выхода из цикла
Global $ExitWhile=0
$hFile = FileOpen("test.txt", 1)

;~ НАСТРОЙКИ программы
;~ ИСпользуемые в боте флоты
Global $EnableSheep [7] =[0,0,0,1,1,0,1]
;~ Какие флоты отзывать в случае вылета Всека
Global $SheepGoHomeFromVsec [7] = [1,1,1,1,0,0,0]
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
;~ Время (час) выключения бота (больше 24 - выключение не происходит)
Global $TimeStopAssistent=25

HotKeySet("{ESC}","_stop")
HotKeySet("{Pause}","_FPause")
HotKeySet("+!s","_SaveInFile")
Dim $iPause=False

$hFile = FileOpen("SessionStatistics.txt", 1)
FileWrite($hFile,"Дата старта сеанса - "&_NowDate()&" Время старта сеанса - "& _NowTime()&  @CRLF)

;~ $hFile = FileOpen("CoordinateAssists.txt", 2)
;~ FileWrite($hFile, "$Blue="& $Blue & " $Red="& $Red & " $SkyBlue="& $SkyBlue &  @CRLF)
FileWrite($hFile, "X0="& $x0 & " Y0="& $y0 &  @CRLF)
FileWrite($hFile, "X1="& $x1 & " Y1="& $y1 &  @CRLF)
FileWrite($hFile, "$sheepleft="& $sheepleft& "$sheeprightIcon="& $sheeprightIcon & "$SheepLeftClick="& $SheepLeftClick&  @CRLF)
FileWrite($hFile, "$ysheep1="& $ysheep1&  @CRLF)
FileWrite($hFile, "$ysheep2="& $ysheep1+(1)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep3="& $ysheep1+(2)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep4="& $ysheep1+(3)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep5="& $ysheep1+(4)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep6="& $ysheep1+(5)*$dysheep&  @CRLF)
FileWrite($hFile, "$ysheep7="& $ysheep1+(6)*$dysheep&  @CRLF)
;~ FileWrite($hFile, "Позиция осановка или движение в космосе="&$sheepleft+$xOstDvish&"y="&$ysheep1+(4)*$dysheep+$yOstDvish&  @CRLF)
;~ FileWrite($hFile, "Позиция 2 движеня в космосе="&$sheepleft+$x2Dvish&"y="&$ysheep1+(4)*$dysheep+$y2Dvish&  @CRLF)
;~ FileWrite($hFile, "Позиция на базе="&$sheepleft+$xBase&"y="&$ysheep1+(4)*$dysheep+$yBase&  @CRLF)
;~ FileWrite($hFile, "Позиция ремонт="&$sheepleft+$xRepair&"y="&$ysheep1+(4)*$dysheep+$yRepair&  @CRLF)
;~ FileWrite($hFile, "Надпись в середине x1="&$xBtnOk-10&"y1="&$yBtnOk-10&"x2="&$xBtnOk+10&"y2="&$yBtnOk+10&  @CRLF)

;~ If WinActive("VEGA Conflict") Then

Func _GoDy ($SelectSheep,$i,ByRef $dy)
   If $SelectSheep<$i Then
	  $dy=138
   Else
	  $dy=0
   EndIf
EndFunc

Func _SelectSheep (ByRef $i)
   ;~ 	Выбрать Флот
   _GoDy ($SelectSheep,$i,$dy)
   MouseClick("left",$sheeprightIcon-5,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2,1,10)
;~    FileWrite($hFile, "$Select sheep="&$i&  @CRLF)
;~    FileWrite($hFile, "x="&$sheeprightIcon-5&"y="&$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2&  @CRLF)
   $MinMouseClick=@MIN
   $SelectSheep=$i
   Sleep(300+random(300))
EndFunc

Func _GoBattleFleet($i)
$Nom=0
$GoAttack=0
while ($Nom<4) and ($VegaSheepNomInSearch[$Nom][$i-1]<>0) and ($GoAttack=0)
   _SelectSheep ($i)
   $StateKolRequestAttackSheep[$i-1]=$StateKolRequestAttackSheep[$i-1]+1
;~ Выбрать флот веги из списка возможных
;~ Нажать кнопку с отметками
   MouseClick("left",$x1-200,$y0+30,1,1)
   Sleep(300+random(300))
;~ Выбрать вкладку "Отмеченные"
   MouseClick("left",$x1/2-400+150,$y0+($y1-$y0)/2-5*$yOtmetki,1,10)
   Sleep(300+random(300))
;~ Выбрать нужный флот
   MouseClick("left",$x1/2-400+150,$y0+($y1-$y0)/2+(-5+$VegaSheepNomInSearch[$Nom][$i-1])*$yOtmetki,1,10)


;~ Имитируем задержку пользователя
   Sleep(1000+random(1000))
;~ Если в середине появилась надпись
   $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White)
   If not @error Then
;~ 	   Нажать «ОК»
	  $GoAttack=0
	  MouseClick("left",$xBtnOk,$yBtnOk,1,1)
	  Sleep(300+random(300))
   Else
;~ 	  Нажать «Атака» (1 кнопка)
	  $GoAttack=1
	  MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2,$yBtn,1,1)
	  Sleep(300+random(300))
;~ 	  Увеличить количество атакованных флотов
	  $StateKolSelectAttackSheep[$i-1]=$StateKolSelectAttackSheep[$i-1]+1
   EndIf

;~ Имитируем задержку пользователя
   Sleep(3000+random(3000))
;~ Проверка насчет сообщения об атакованном флоте
   $coord = PixelSearch($x1/2,$y0+($y1+$y0)/2+80,$x1/2+90,$y0+($y1+$y0)/2+120, $White)
   If not @error Then
;~ 	   Нажать "Вступить"
	  MouseClick("left",$x1/2-45,$y0+($y1+$y0)/2+100,1,1)
	  Sleep(500+random(1000))
   EndIf
;~ 	Повторная проверка на предмет сообщения об отсутствии флота
;~ 	Если в середине появилась надпись
   $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White)
   If not @error Then
;~ 	   Нажать «ОК»
	  MouseClick("left",$xBtnOk,$yBtnOk,1,1)
	  Sleep(300+random(300))
   EndIf
   $MinMouseClick=@MIN
   $Nom=$Nom+1
WEnd
EndFunc

Func _SheepGoHome($i)
   _SelectSheep ($i)
;~ Нажать кнопку вернуть корабль
   MouseClick("left",$xBtn1+3*$dxBtn-$dxBtn/2,$yBtn,1,1)
   $MinMouseClick=@MIN
   Sleep(500+random(1000))
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
;~  		Если флот найден, то отключаем ремонт
			_SelectSheep ($SheepRem)
			MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
			Sleep(500+random(1000))
			EndIf
		 _SelectSheep ($RepairNom[$j-1])
		 MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
		 $MinMouseClick=@MIN
		 Sleep(500+random(1000))
		 $SheepRem=$RepairNom[$j-1]
;~ FileWrite($hFile, "$SheepRem="&$SheepRem&  @CRLF)
;~ 		Включаем ремонт найденного флота
		 EndIf
	  $j=$j+1
	  WEnd
EndFunc
;~ Бесконечный цикл
While 1
;~    Отключение ассистента
   If $TimeStopAssistent=@HOUR Then
	  _stop
	  EndIf
   $dy=0
;~ Цикл по всем флотам
   $i=7
   While $i>=1
;~ FileWrite($hFile, "флота "&$i&" $EnableSheep="&$EnableSheep[$i-1]&  @CRLF)
	If $iPause Then
	  _FPause()
	  EndIf
	If ($EnableSheep[$i-1]=1) and (WinActive("VEGA Conflict")) Then
;~ 	   Определение состояния корабля

	  _GoDy ($SelectSheep,$i,$dy)
;~ FileWrite($hFile, "Точка x="&$sheepleft+$xOstDvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish&"="&PixelGetColor($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish)&  @CRLF)
;~ FileWrite($hFile, "Точка x="&$sheepleft+$x2Dvish&" y="&$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish&"="&PixelGetColor($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish)&  @CRLF)
;~ FileWrite($hFile, "Точка x="&$sheepleft+$xBase&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yBase&"="&PixelGetColor($sheepleft+$xBase,$ysheep1+($i-1)*$dysheep+$dy+$yBase)&  @CRLF)
;~ FileWrite($hFile, "Точка x="&$sheepleft+$xConnect&" y="&$ysheep1+($i-1)*$dysheep+$dy+$yConnect&"="&PixelGetColor($sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect)&  @CRLF)

	  If PixelGetColor($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish)=$Blue Then
;~ 		 Остановка или движение СИНЕГО флота
		 If PixelGetColor($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish)=$Blue Then
;~ 			Пройдена вторая проверка на движение
			$StateSheep[$i-1]=3
		 Else
			$StateSheep[$i-1]=2
;~ 			Проверка не  пройдена корабль стоит
		 EndIf
	  ElseIf PixelGetColor($sheepleft+$xBase,$ysheep1+($i-1)*$dysheep+$dy+$yBase)=$Blue Then
;~ 		 Проверка на нахождение на базе СИНЕГО корабля пройдена
		$StateSheep[$i-1]=1
	  ElseIf PixelGetColor($sheepleft+$xOstDvish,$ysheep1+($i-1)*$dysheep+$dy+$yOstDvish)=$Red Then
;~ 		 Остановка или движение КРАСНОГО флота
		 If PixelGetColor($sheepleft+$x2Dvish,$ysheep1+($i-1)*$dysheep+$dy+$y2Dvish)=$Red Then
;~ 			Пройдена вторая проверка на движение
			$StateSheep[$i-1]=6
		 Else
			$StateSheep[$i-1]=5
;~ 			Проверка не  пройдена корабль стоит
		 EndIf
	  ElseIf PixelGetColor($sheepleft+$xBase,$ysheep1+($i-1)*$dysheep+$dy+$yBase)=$Red Then
;~ 		 Проверка на нахождение на базе КРАСНОГО корабля пройдена
		$StateSheep[$i-1]=7
	  ElseIf PixelGetColor($sheepleft+$xRepair,$ysheep1+($i-1)*$dysheep+$dy+$yRepair)=$Yelow Then
		$StateSheep[$i-1]=8
	  ElseIf PixelGetColor($sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect)=$Red Then
		$StateSheep[$i-1]=10
	  ElseIf PixelGetColor($sheepleft+$xConnect,$ysheep1+($i-1)*$dysheep+$dy+$yConnect)=$SkyBlue Then
		$StateSheep[$i-1]=9
	 Else
		$StateSheep[$i-1]=4
	  EndIf

;~ 	  Проверка на Vsec
;~ 	  Определение времени ближайшего вылета VSec
	  $NomVsec=0
	  While ($NomVsec<=7) and ($VsecTime[$NomVsec]<@HOUR)
		 $NomVsec=$NomVsec+1
	  WEnd
;~ 	  Если разница между текущем временем и временем вылета меньше ConstTimeVozvrat минут и включен отзыв на всек ,то
	  IF (($VsecTime[$NomVsec]=@HOUR) or (($VsecTime[$NomVsec]-@HOUR=1) and (@MIN>$ConstTimeVozvratMin)))  and ($SheepGoHomeFromVsec[$i-1]=1)  Then
		 $TimeGoVsek=1
;~ 		 Если корабль в космосе стоит (Красный или Синий)
		 if ($StateSheep[$i-1]=2) or ($StateSheep[$i-1]=5) then
			   _SheepGoHome($i)
			EndIf
	  Else
		 $TimeGoVsek=0
	  EndIf
;~ FileWrite($hFile, "Состояние флота "&$i&" ="&$StateSheep[$i-1]&  @CRLF)
;~ 	  Если корабль на Vsek не реагирует, или Vsek не в космосе, то
	  If $TimeGoVsek=0 Then
		 If $StateSheep[$i-1]=1 Then
;~ 			Корабль СИНИЙ на планете
;~ 			Обнуления количества уничтоженных флотов
			 $StateSheepDestroy[$i-1]=0
			 $SheepInFight[$i-1]=0
		 ;~ Если флот стоял на ремонте
			if $SheepRem=$i Then
;~ 				Сбросить номер ремонтируемого флота
			   $SheepRem=0
			EndIf
;~ 		    Если флот может воевать (задан пользователем)
			IF ($BattleSheep[$i-1]=1)  Then
			  _GoBattleFleet($i)
			EndIf
		 ElseIf ($StateSheep[$i-1]=2) or ($StateSheep[$i-1]=9) Then
;~ 			Корабль СИНИЙ на в космосе стоит
			$SheepInFight[$i-1]=0
;~ 			Если корабль провел бой и его надо вернуть
			If ($SheepGoHomeAfterBattle[$i-1]=1) and ($StateSheepDestroy[$i-1]=1) Then
			   	_SheepGoHome($i)
			ElseIf ($BattleSheep[$i-1]=1)  Then
;~ 			   Если флот может воевать (задан пользователем)
			_GoBattleFleet($i)

			EndIf
		 ElseIf $StateSheep[$i-1]=3 Then
;~ 			Корабль СИНИЙ в космосе летит
			$SheepInFight[$i-1]=0
		 ElseIf $StateSheep[$i-1]=4 Then
;~ 			Корабль В БОЮ
			$StateSheepDestroy[$i-1]=1
			If $SheepInFight[$i-1]=0 then
			   $SheepInFight[$i-1]=1
			   $StateKolAllSheepDestroy[$i-1]=$StateKolAllSheepDestroy[$i-1]+1
			   EndIf
		 ElseIf ($StateSheep[$i-1]=5) or ($StateSheep[$i-1]=10) Then
;~ 			Корабль КРАСНЫЙ в космосе стоит
			$SheepInFight[$i-1]=0

;~ 			Если корабль  надо вернуть (после боя или в результате повреждений)
			If ($SheepGoHomeAfterBattle[$i-1]=1) or ($SheepGoRepair[$i-1]=1) Then
			   	_SheepGoHome($i)
			ElseIf ($BattleSheep[$i-1]=1)  Then
;~ 			   Если флот может воевать (задан пользователем)
				  _GoBattleFleet($i)
			EndIf
		 ElseIf $StateSheep[$i-1]=6 Then
;~ 			Корабль КРАСНЫЙ в космосе летит
			$SheepInFight[$i-1]=0
		 ElseIf $StateSheep[$i-1]=7 Then
;~ 			Корабль КРАСНЫЙ на базе
;~ 			Попытка запустить корабль в бой
			If ($BattleSheep[$i-1]=1) and ($SheepGoRepair[$i-1]=0)  Then
			   _GoBattleFleet($i)
			EndIf
;~ 			Проверка необходимости ремонта флота
			_RepairFleet()
		 ElseIf $StateSheep[$i-1]=8 Then
;~ 			Корабль ЖЕЛТЫЙ на ремонте
			$SheepRem=$i
;~  FileWrite($hFile, "УСТАНОВИТЬ $SheepRem="&$SheepRem&  @CRLF)
;~
		 EndIf
	  Else
		 If $StateSheep[$i-1]=7 Then
			_RepairFleet()
		 ElseIf $StateSheep[$i-1]=8 Then
;~ 			Корабль ЖЕЛТЫЙ на ремонте
			$SheepRem=$i
;~  FileWrite($hFile, "УСТАНОВИТЬ $SheepRem="&$SheepRem&  @CRLF)
		 EndIf
	  EndIf
   EndIf
	  Sleep(500)
	  $i=$i-1
   WEnd

;~ Клик мышкой если его долго не было
If ($MinMouseClick<>@MIN) and Mod(Abs($MinMouseClick-@MIN),2)=0 Then
   MouseClick("left",$x1/2,$y1/2,1,1)
   $MinMouseClick=@MIN
   EndIf
Sleep(5000)
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
   FileWrite($hFile, "Средний процент ="&$AllSelectAttackProc/$n&   @CRLF)
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
   FileWrite($hFile, "Средний процент ="&$AllSelectDestroyProc/$n&   @CRLF)
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
   _SaveInFile()
   MsgBox($MB_SYSTEMMODAL, "Выход", "Фарм-Ассистент отключен."&@CRLF&"Информация о статистике сохранена в SessionStatistics.txt", 100)
    Exit
 EndFunc