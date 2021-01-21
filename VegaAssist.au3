;~ Sleep(10000)
;~ Размеры рабочей области
Opt("CaretCoordMode", 2)
$aClientSize = WinGetClientSize("VEGA Conflict")
$x0=0
$y0=20
$x1=$aClientSize[0]
$y1=$aClientSize[1]

;~ Константы для цветов
$Red=0xD56E6E
$Yelow=0xE1965B
$Blue=0x4FA5C2
$White=0xFFFFFF
$WhiteSpace=0xC3EBF3

;~ Пункты кораблей слева
$ysheep1=$y1/2-200
$sheepleft=$x1-225
$SheepLeftClick=$sheepleft+15
$sheeprightIcon=$sheepleft+30
$SelectSheep=7
$dysheep=43
;~ $ysheep1+($i-1)*$dysheep+$dy+$dysheep/2

;~ Кнопки в нижней панели
$xBtn1=$x1/2-95*2
$dxBtn=95
$yBtn=$y1-35-20

;~ Кнопка ОК в центре экрана
$xBtnOk=($x1)/2+$x0
$yBtnOk=($y1)/2+$y0+80

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

;~ Переменная состояния флота
Local $StateSheep [7] = [0,0,0,0,0,0,0]
;~ Переменная времен вылета Vsec
Local $VsecTime [8] =[2,5,8,11,14,17,20,23]
;~ Время возврата флотов перед VSec в минутах
$ConstTimeVozvratMin =45
;~ Переменная наличия Всека в секторе
$TimeGoVsek=0
;~ Переменная отвечающая за номер ремонтируемого корабля
$SheepRem=0
;~ Переменная для выхода из цикла
$ExitWhile=0
$hFile = FileOpen("test.txt", 1)

;~ НАСТРОЙКИ программы
;~ ИСпользуемые в боте флоты
Local $EnableSheep [7] =[1,0,0,0,1,1,1]
;~ Переменная возможности флота воевать
Local $BatleSheep [7]= [0,0,0,0,1,1,1]
;~ Порядок ремонта. В массиве номера флотов
Local $RepairNom [7]= [7,6,5,4,1,2,3]
;~ Какие отметки из списка бить флотам
Local $VegaSheepNomInSearch [7] = [0,0,0,0,1,3,4]
;~ Какие флоты ремонтировать
Local $SheepGoRepair [7] = [1,1,1,1,0,1,1]
;~ Какие флоты отзывать в случае вылета Всека
Local $SheepGoHomeFromVsec [7] = [1,1,1,1,1,1,1]

HotKeySet("{ESC}","stop")
HotKeySet("{Pause}","FPause")
Dim $iPause=False

;~ If WinActive("VEGA Conflict") Then

;~ Бесконечный цикл
While 1

;~ Цикл по всем флотам
   $i=7
   While $i>=1
	If $iPause Then
	  FPause()
	  EndIf
	If ($EnableSheep[$i-1]=1) and (WinActive("VEGA Conflict")) Then
;~ 	  Проверка на Vsec
;~ 	  Определение времени ближайшего вылета VSec
	  $NomVsec=0
	  While ($NomVsec<=7) and ($VsecTime[$NomVsec]<@HOUR)
		 $NomVsec=$NomVsec+1
	  WEnd
;~ 	  Если разница между текущем временем и временем вылета меньше ConstTimeVozvrat минут
	  IF ($VsecTime[$NomVsec]-@HOUR<=1) and (@MIN>$ConstTimeVozvratMin)  and ($SheepGoHomeFromVsec[$i-1]=1) Then
		 $TimeGoVsek=1
;~ 		 Выбрать корабль
		 If $SelectSheep<$i Then
			$dy=138
		 Else
			$dy=0
		 EndIf
		 MouseClick("left",$sheeprightIcon-5,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2,1,1)
		 Sleep(500+random(1000))
		 $SelectSheep=$i
;~ 	    Если корабль в космосе
		$coord = PixelSearch($xBtn1+2*$dxBtn,$yBtn-20,$xBtn1+3*$dxBtn,$yBtn+20, $WhiteSpace)
		If  (not @error) Then
;~ 	        Вернуть корабль
			MouseClick("left",$xBtn1+3*$dxBtn-$dxBtn/2,$yBtn,1,1)
			Sleep(500+random(1000))
		 EndIf
	  Else
		 $TimeGoVsek=0
	  EndIf
;~ 	  Цвет синий (1,2,3)
	  If $SelectSheep<$i Then
		 $dy=138
	  Else
		 $dy=0
	  EndIf
	  $coord = PixelSearch($sheepleft,$ysheep1+($i-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($i)*$dysheep+$dy, $Blue)
	  If  ((not @error) or (($SheepGoRepair[$i-1]=0) and (PixelGetColor($sheepleft+11,$ysheep1+($i-1)*$dysheep+$dy+16)=$Red))) and ($TimeGoVsek=0) Then
		 ;~ Если флот стоял на ремонте
		 if $SheepRem=$i Then
;~ 			Сбросить номер ремонтируемого флота
			$SheepRem=0
		 EndIf
;~ 		 Выбрать корабль
		 If $SelectSheep<$i Then
			$dy=138
		 Else
			$dy=0
		 EndIf
;~ 		 Проверка летает ли корабль или нет
		 if not (PixelGetColor($sheeprightIcon-8,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2-1)=$Blue) Then

		 MouseClick("left",$sheeprightIcon-5,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2,1,1)
		 $SelectSheep=$i
		 Sleep(300+random(300))
;~ 		 Проверка в космосе корабль или на планете по активности 3-ей кнопки
		 If $SelectSheep<$i Then
			$dy=138
		 Else
			$dy=0
		 EndIf
		 $coord = PixelSearch($xBtn1+2*$dxBtn,$yBtn-20,$xBtn1+3*$dxBtn,$yBtn+20, $WhiteSpace)
;~ 		 Если флот может воевать (задан пользователем) и состояние 1 или 2, то

		 IF ($BatleSheep[$i-1]=1)  Then
;~ 			Выбрать флот веги из списка возможных
;~ 			Нажать кнопку с отметками
			MouseClick("left",$x1-200,$y0+30,1,1)
			Sleep(300+random(300))
;~ 			Выбрать вкладку "Отмеченные"
			MouseClick("left",$x1/2-400+150,$y0+($y1-$y0)/2/2-25,1,10)
			Sleep(300+random(300))
;~ 			Выбрать нужный флот
			MouseClick("left",$x1/2-400+150,$y0+($y1-$y0)/2/2-25+54*$VegaSheepNomInSearch[$i-1],1,10)
;~ 			Sleep(5000+Random(2000))
;~ 			Нажать «Найти»

   ;~     		Имитируем задержку пользователя
			Sleep(1000+random(300))
;~ 			Если в середине появилась надпись
			$coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White)
			If not @error Then
;~ 	   			Нажать «ОК»
			   MouseClick("left",$xBtnOk,$yBtnOk,1,1)
			   Sleep(300+random(300))
			Else
;~ 	  			Нажать «Атака» (1 кнопка)
				MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2,$yBtn,1,1)
				Sleep(300+random(300))
			 EndIf

;~ 			MouseClick("left",$x1-300,$y0+80,1,1)
;~     		Имитируем задержку пользователя
			Sleep(3000+random(3000))
;~ 			Проверка насчет сообщения об атакованном флоте
			$coord = PixelSearch($x1/2,$y0+($y1+$y0)/2+80,$x1/2+90,$y0+($y1+$y0)/2+120, $White)
			If not @error Then
;~ 			   Нажать "Вступить"
			   MouseClick("left",$x1/2-45,$y0+($y1+$y0)/2+100,1,1)
			   Sleep(500+random(1000))
			EndIf
;~ 			Повторная проверка на предмет сообщения об отсутствии флота
;~ 			Если в середине появилась надпись
			$coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White)
			If not @error Then
;~ 	   			Нажать «ОК»
			   MouseClick("left",$xBtnOk,$yBtnOk,1,1)
			   Sleep(300+random(300))
			EndIf
		  EndIf
		  EndIf
	  EndIf
;~ 	  Цвет красный (4,5,6,7)
	  If $SelectSheep<$i Then
		 $dy=138
	  Else
		 $dy=0
	  EndIf
 	  $coord = PixelSearch($sheepleft,$ysheep1+($i-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($i)*$dysheep+$dy, $Red)
	  If  (not @error) and ($SheepGoRepair[$i-1]=1) Then
;~ 	     Выбрать корабль
		 If $SelectSheep<$i Then
			$dy=138
		 Else
			$dy=0
		 EndIf
		 MouseClick("left",$sheeprightIcon-5,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2,1,1)
		 $SelectSheep=$i
		 Sleep(500+random(1000))
;~ 		 Проверка в космосе корабль или на планете по активности 3-ей кнопки
		 $coord = PixelSearch($xBtn1+2*$dxBtn,$yBtn-20,$xBtn1+3*$dxBtn,$yBtn+20, $WhiteSpace)
;~ 	     Если состояние 5 или 6, то
		 If not @error Then
;~ 			Нажать «Отозвать» (3 кнопка)
			MouseClick("left",$xBtn1+3*$dxBtn-$dxBtn/2,$yBtn,1,1)
			Sleep(500+random(1000))
;~ 		 Если состояние 7, то
		 Else
			$j=1
			$ExitWhile=0
			While ($j<8) and ($ExitWhile=0)
;~ 			Проходим по всем флотам в порядке ремонта
			   If $SelectSheep<$RepairNom[$j-1] Then
				  $dy=138
			   Else
				  $dy=0
			   EndIf
			   $coord = PixelSearch($sheepleft,$ysheep1+($RepairNom[$j-1]-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($RepairNom[$j-1])*$dysheep+$dy, $Yelow)
;~ 				Если цвет флота желтый, то
			   If not @error Then
				  $ExitWhile=1
;~ 					Выход из цикла
			   EndIf
			   If $SelectSheep<$RepairNom[$j-1] Then
				  $dy=138
			   Else
				  $dy=0
			   EndIf
			   $coord = PixelSearch($sheepleft,$ysheep1+($RepairNom[$j-1]-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($RepairNom[$j-1])*$dysheep+$dy, $Red)
;~ 			   Если цвет флота красный, то
			   If ($ExitWhile=0) and (not @error) and (PixelGetColor($sheeprightIcon-11,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2-1)=$Red)Then
;~ 				  Если идет ремонт, то
				  If $SheepRem<>0 Then
					 If $SelectSheep<$SheepRem Then
						$dy=138
					 Else
						$dy=0
					 EndIf
					 $coord = PixelSearch($sheepleft,$ysheep1+($SheepRem-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($SheepRem)*$dysheep+$dy, $Yelow)
;~ 					Если ремонтируемый флот желтый, то
					 if not @error Then
;~ 						Выбираем ремонтируемый корабль
						If $SelectSheep<$SheepRem Then
						   $dy=138
						Else
						   $dy=0
						EndIf
						MouseClick("left",$sheeprightIcon-5,$ysheep1+($SheepRem-1)*$dysheep+$dy+$dysheep/2,1,1)
						$SelectSheep=$SheepRem
						Sleep(500+random(1000))
;~ 						Нажимаем «Ремонт» (4 кнопка)
						$SheepRem=0
						MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
						Sleep(500+random(1000))
					 EndIf
				  EndIf
;~ 				  Выбираем текущий флот
				  If $SelectSheep<$RepairNom[$j-1] Then
					 $dy=138
				  Else
					 $dy=0
				  EndIf
				  IF $RepairNom[$j-1]<>$i then
				    MouseClick("left",$sheeprightIcon-5,$ysheep1+($RepairNom[$j-1]-1)*$dysheep+$dy+$dysheep/2,1,1)
					Sleep(500+random(1000))
					EndIf
				  $SelectSheep=$RepairNom[$j-1]

;~ 				  Нажимаем «Ремонт» (4 кнопка)
				  MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
				  Sleep(500+random(1000))
				  $ExitWhile=1
;~ 				  Устанавливаем номер ремонтируемого флота
				  $SheepRem=$RepairNom[$j-1]
			   EndIf
			$j=$j+1
			WEnd
;~ 			Выход из цикла
		 EndIf
	  EndIf
;~ 	  Цвет желтый (8)
	  If $SelectSheep<$i Then
		 $dy=138
	  Else
		 $dy=0
	  EndIf
 	  $coord = PixelSearch($sheepleft,$ysheep1+($i-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($i)*$dysheep+$dy, $Yelow)
	  If  (not @error) Then
;~ 		 Запоминаем номер ремонтируемого флота
		 $SheepRem=$i
	  EndIf
   EndIf
	  Sleep(50)
	  $i=$i-1
   WEnd
;~ Конец цикла по всем флотам
WEnd

Func FPause()
    $iPause = Not $iPause
    While $iPause
        Sleep(25)
    WEnd
EndFunc

Func stop()
    Exit
 EndFunc