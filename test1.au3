Opt("WinTitleMatchMode", 4)
WinWait("VEGA Conflict","")
Global $Nom=0
While 1
If PixelGetColor (1160, 467)=0xD56E6E Then
   IF PixelGetColor (869, 698)<>0xD4F8FF Then
	  MouseClick("left", 1335, 474, 1, 1)
   EndIf
   Sleep(5000)
   Send("E")
   Sleep(60000)

ElseIf PixelGetColor (1166, 473)=0xD56E6E Then
   MouseClick("left", 1232, 719, 1, 1)
   Sleep(5000)
   MouseClick("left", 615, 361, 1, 1)
   Sleep(5000)
   MouseClick("left", 848, 723, 1, 1)
   Sleep(5000)
   MouseClick("left", 1323, 467, 1, 1)
   Sleep(5000)
   MouseClick("left", 848, 723, 1, 1)
   Sleep(5000)

   Sleep(60000)
ElseIf PixelGetColor (1164, 472)=0xE1965B Then
   MouseClick("left", 1000, 136, 1, 1)
   Sleep(60000)
ElseIf (PixelGetColor (155, 215)<>0xFFFFFF) and (PixelGetColor (20, 211)<>0xFFFFFF) Then
  If  PixelGetColor (1335, 474)<>0xFFFFFF Then
   IF PixelGetColor (1166, 429)=0xD56E6E Then
	 MouseClick("left", 1297, 429, 1, 1)
	  Sleep(500)
	   MouseClick("left", 848, 723, 1, 1)
	   Sleep(500)
	   MouseClick("left",1329, 613, 1, 1)
   EndIf
    MouseClick("left", 1080, 105, 1, 1)
    Sleep (2000+Random(0,3000,1))
    IF PixelGetColor (694, 507)=0xFFFFFF Then
       MouseClick("left", 694, 507, 1, 1)
    Else
       MouseClick("left", 542, 723, 1, 1)
    EndIf
    Sleep (30000+Random(0,10000,1))
  Else
    Sleep(Random(30000))
 EndIf
Else
   IF PixelGetColor (869, 698)<>0xD4F8FF Then
	  MouseClick("left", 1335, 474, 1, 1)
   EndIf
   Sleep(1000)
   Send("E")

   Sleep(300000+Random(60000))

EndIf
WEnd
