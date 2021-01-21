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

;~ Кнопки в нижней панели
$xBtn1=$x1/2-95*2
$dxBtn=95
$yBtn=$y1-35-20

;~ Кнопка ОК в центре экрана
$xBtnOk=($x1)/2+$x0
$yBtnOk=($y1)/2+$y0+80

;~ Переменная отвечающая за номер ремонтируемого корабля
$SheepRem=0
;~ Переменная состояния флота
$StateSheep [7] = [0,0,0,0,0,0,0]
$hFile = FileOpen("test.txt", 1)


$j=0
While 1

;~ Выбор флота с номером 7
   $i=7
   If $SelectSheep<$i Then
	  $dy=138
   Else
	  $dy=0
   EndIf
   If  $SelectSheep<>$i Then
     MouseClick("left",$SheepLeftClick,$ysheep1+($i-1)*43+$dy+25,1,1)
   EndIf
  ;~    Имитируем задержку пользователя
   Sleep(1000+Random(5000))
;~ Проверяем флот i на синюю иконку
   $coord = PixelSearch($sheepleft,$ysheep1+($i-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($i)*$dysheep+$dy, $Blue)
   If  not @error Then
;~    Поиск противника, отмеченного в поле меток
;~    Кнопка "Найти"
     MouseClick("left",$x1-300,$y0+80,1,1)
;~    Имитируем задержку пользователя
     Sleep(3000+Random(10000))
;~    Проверяем центр экрана на предмет выскочившего окна
     $coord = PixelSearch($xBtnOk-10,$yBtnOk-10,$xBtnOk+10,$yBtnOk+10, $White)
     If not @error Then
;~ 	   Если окно выскочило нажимаем ОК
	   MouseClick("left",$xBtnOk,$yBtnOk,1,1)
      Else
;~ 	   Иначе нажимаем 1ю кнопку (Атаковать)
	   MouseClick("left",$xBtn1+1*$dxBtn-$dxBtn/2,$yBtn,1,1)
	EndIf
;~ 	Включаем ремонт оставшихся кораблей
 $SheepRem=0
 If $SheepRem=0 then
	  $i=7
;~ Постановка на ремонт флота с номером i
	  While ($i>=1) & ($SheepRem=0)
;~ Проверка, активен ли флот (открыт ли состав кораблей)
	  If $SelectSheep<$i Then
;~ Смещение на величину состава флота
		 $dy=138
	  Else
		 $dy=0
	  EndIf
;~ Ищем флот с красным цветом
	  $coord = PixelSearch($sheepleft,$ysheep1+($i-1)*$dysheep+$dy,$sheeprightIcon,$ysheep1+($i)*$dysheep+$dy, $Red)
	  If Not @error Then
;~ 	  Если красный цвет найден, то выбираем флот
		 If  $SelectSheep<>$i Then
			MouseClick("left",$SheepLeftClick,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2,1,1)
			Sleep(1000)
			$SelectSheep=$i
			EndIf
;~ 	  Проверяем в космосе корабль или нет по наличию белого цвета на 3-ей кнопки снизу
		 $coord = PixelSearch($xBtn1+2*$dxBtn,$yBtn-20,$xBtn1+3*$dxBtn,$yBtn+20, $WhiteSpace)
		 If Not @error Then
;~ 	  Если красный корабль в космосе - возращаем его (3 кнопка - вернуть)
			MouseClick("left",$xBtn1+3*$dxBtn-$dxBtn/2,$yBtn,1,1)
			Sleep(1000)
		 Else
;~ 	  Если красный корабль в порту, то проверяем активность 4ой кнопки
			$coord = PixelSearch($xBtn1+3*$dxBtn,$yBtn-20,$xBtn1+4*$dxBtn,$yBtn+20, $WhiteSpace)
			If Not @error Then
		 ;~ Если кнопка активная, то тыкаем на 4-ую кнопку (Ремонт)
			   MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
			   Sleep(1000)
			   $SheepRem=$i
			   EndIf
		 EndIf
	  EndIf
;~ Переходим к следующем флоту.  Задержка на 1 сек.
   $i=$i-1
   Sleep(1000)
   WEnd
EndIf
 Else
;~ 	  Проверяем в космосе корабль или нет по наличию белого цвета на 3-ей кнопки снизу
      $coord = PixelSearch($xBtn1+2*$dxBtn,$yBtn-20,$xBtn1+3*$dxBtn,$yBtn+20, $WhiteSpace)
	  If Not @error Then
;~ 	  Если i-ый корабль в космосе - возращаем его (3 кнопка - вернуть)
		 MouseClick("left",$xBtn1+3*$dxBtn-$dxBtn/2,$yBtn,1,1)
		 Sleep(1000)
	  Else
;~ 	  Если красный корабль в порту, то проверяем активность 4ой кнопки
	  $coord = PixelSearch($xBtn1+3*$dxBtn,$yBtn-20,$xBtn1+4*$dxBtn,$yBtn+20, $WhiteSpace)
	  If Not @error Then
		 ;~ Если кнопка активная, то тыкаем на 4-ую кнопку (Ремонт)
		 MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
		 Sleep(1000)
		 $SheepRem=7
	  Else
;~ 		 Иначе отключаем ремонт у ремонтирующегося корабля
;~ 		 Выбираем корабль по номером SheepRem
		 MouseClick("left",$SheepLeftClick,$ysheep1+($SheepRem-1)*$dysheep+$dy+$dysheep/2,1,1)
		 Sleep(1000)
;~ 		 Нажимаем 4ю кнопку
		 MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
   		 Sleep(1000)
;~ 		 Выбираем корабль с номером i
		 MouseClick("left",$SheepLeftClick,$ysheep1+($i-1)*$dysheep+$dy+$dysheep/2,1,1)
		 Sleep(1000)
;~ 		 нажимаем 4ю кнопку
		 MouseClick("left",$xBtn1+4*$dxBtn-$dxBtn/2,$yBtn,1,1)
   		 Sleep(1000)
		 $SheepRem=$i

		 EndIf
	  EndIf
	EndIf

   WEnd