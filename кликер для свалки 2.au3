MsgBox(4096,"Внимание!", "Игра должна быть запущена, свалка открыта, схема выбрана на обмен!")

WinActivate("[CLASS:UnityWndClass]","") 				;активируем окно с программой
WinWaitActive("[CLASS:UnityWndClass]","",3)

Const $iCapsLock = 0x14     ; скан-код CAPS LOCK

$xcpecknopka= 1330
$ycpecknopka= 891

MouseMove($xcpecknopka,$ycpecknopka,1)

If MsgBox(4 + 32, 'Вопрос', 'Кнопка определена верно?') = 6 Then

	$p= InputBox ( "Ввод данных", "Сколько раз тыкнуть?:" )

	for $i=$p to 1 step -1

	      #Region - ОСТАНОВКА СКРИПТА ПРИ ВКЛЮЧЕННОЙ КЛАВИШЕ CAPS LOCK

$errCaps = DllCall("user32.dll", "int", "GetKeyState", "int", $iCapsLock) ; Определяем состояние нужной клавиши
If $errCaps[0] Then
   Exit ; Если включена или нажата - выход
   MsgBox(4096, "!!!", "ERROR!!!")
   EndIf
#EndRegion - ОСТАНОВКА СКРИПТА ПРИ ВКЛЮЧЕННОЙ КЛАВИШЕ CAPS LOCK

		MouseClick("left",$xcpecknopka,$ycpecknopka)
		Sleep(300)
		MouseClick("left",$xcpecknopka,$ycpecknopka)
	Sleep(2000)
	Next

	MsgBox(4096, 'Результат', 'Работа Завершена')
	Exit
Else

$xcpecknopka= InputBox ( "Ввод ккординат", "введите X-координату кнопки спецпредложение:" )
$ycpecknopka= InputBox ( "Ввод ккординат", "введите Y-координату кнопки спецпредложение:" )

MouseMove($xcpecknopka,$ycpecknopka,1)

If MsgBox(4 + 32, 'Вопрос', 'Кнопка определена верно?') = 6 Then

   $p= InputBox ( "Ввод данных", "Сколько раз тыкнуть?:" )

	for $i=$p to 1 step -1

	      #Region - ОСТАНОВКА СКРИПТА ПРИ ВКЛЮЧЕННОЙ КЛАВИШЕ CAPS LOCK

$errCaps = DllCall("user32.dll", "int", "GetKeyState", "int", $iCapsLock) ; Определяем состояние нужной клавиши
If $errCaps[0] Then
   Exit ; Если включена или нажата - выход
   MsgBox(4096, "!!!", "ERROR!!!")
   EndIf
#EndRegion - ОСТАНОВКА СКРИПТА ПРИ ВКЛЮЧЕННОЙ КЛАВИШЕ CAPS LOCK

		MouseClick("left",$xcpecknopka,$ycpecknopka)
		Sleep(300)
		MouseClick("left",$xcpecknopka,$ycpecknopka)

	Sleep(2000)
	Next

	MsgBox(4096, 'Результат', 'Работа Завершена')
	Exit
Else

MsgBox(16, 'Итог', 'Да ну тебя')
Exit

EndIf
EndIf