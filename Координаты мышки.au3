#include <Misc.au3>
#include <MsgBoxConstants.au3>
HotKeySet("{ESC}","stop")

$hFile = FileOpen("test.txt", 10)
$dll = DllOpen("user32.dll")
$TypeCoord=0
$Red=0xD56E6E
$Yelow=0xE1965B
$Blue=0x4FA5C2
$White=0xFFFFFF

MsgBox($MB_SYSTEMMODAL, "Выберите флот №7", "Флот №7 должен быть в состоянии ремонта, цвет Желтый", 100)


While 1
    Sleep(50)
    If _IsPressed("01", $dll) Then ;Ожидание, в цикле, нажатия ЛКМ
        $aCoord=MouseGetPos()
		$ColorCord=PixelGetColor($aCoord[0],$aCoord[1])

         ToolTip("Нажата ЛКМ"&@CRLF&"Координаты: x="&$aCoord[0]&" y="&$aCoord[1]&@CRLF&"Цвет="&$ColorCord, Default, Default, '_IsPressed', 1)
	  If ($ColorCord=$Yelow) and ($TypeCoord=0) Then
		 $TypeCoord=1
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите флот №6", "Координаты флота 7 сохранены в файле."&@CRLF&"Выберите иконку флоты №6 над иконкой ремонта флота №7", 100)
	  ElseIf (($ColorCord=$Red) or ($ColorCord=$Blue)) and ($TypeCoord=1) Then
		 $TypeCoord=2
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите порт", "Координаты флота 6 сохранены в файле.", 100)
	  ElseIf ($TypeCoord=2) Then
		 $TypeCoord=3
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите координаты 1-ой кнопки внизу", "Координаты флота порта сохранены в файле."&@CRLF&"Выбретите БЕЛЫЙ цвет на кнопке", 100)
	  ElseIf ($TypeCoord=3) and ($ColorCord=$White) Then
		 $TypeCoord=4
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите координаты 2-ой кнопки внизу", "Координаты 1ой кнопки сохранены в файле."&@CRLF&"Выбретите БЕЛЫЙ цвет на кнопке", 100)
	  ElseIf ($TypeCoord=4) and ($ColorCord=$White) Then
		 $TypeCoord=5
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите координаты 3-ый кнопки внизу", "Координаты 2ой кнопки сохранены в файле."&@CRLF&"Выбретите БЕЛЫЙ цвет на кнопке", 100)
	  ElseIf ($TypeCoord=5) and ($ColorCord=$White) Then
		 $TypeCoord=6
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите координаты 4-ой кнопки внизу", "Координаты 3ей кнопки сохранены в файле."&@CRLF&"Выбретите БЕЛЫЙ цвет на кнопке", 100)
	  ElseIf ($TypeCoord=6) and ($ColorCord=$White) Then
		 $TypeCoord=7
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
 		 MsgBox($MB_SYSTEMMODAL, "Выберите координаты кнопки найти", "Координаты 4ой кнопки сохранены в файле."&@CRLF&"Выбретите БЕЛЫЙ цвет на кнопке", 100)
	  ElseIf ($TypeCoord=7) and ($ColorCord=$White) Then
		 $TypeCoord=8
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Выберите координаты кнопки ОК при неудачном поиске", "Координаты кнопки Найти сохранены в файле."&@CRLF&"Выбретите БЕЛЫЙ цвет на кнопке", 100)
	  ElseIf ($TypeCoord=8) and ($ColorCord=$White) Then
		 $TypeCoord=9
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "Все координаты сохранены в файле", "Все координаты сохранены в файле", 100)

		 EndIf
EndIf

WEnd
Func stop()
    Exit
 EndFunc



DllClose($dll)
