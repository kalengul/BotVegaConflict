While 1
   IF PixelGetColor (869, 698)<>0xD4F8FF Then
	  MouseClick("left", 1335, 474, 1, 1)
   EndIf
Send("E")

   Sleep(3000)
   If PixelGetColor (1166, 473)=0xD56E6E Then
	  MouseClick("left", 848, 723, 1, 1)
   EndIf
WEnd