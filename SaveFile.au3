$hFile = FileOpen("Coord.txt", 2)

HotKeySet("{Pause}","_FPause")

Func _FPause ()
 For $i=35 to 43
   For $j=1530 to 1579
	  $pix=PixelGetColor($j,$i)
	 FileWrite($hFile, $pix & ":")
  Next
 FileWrite($hFile,  @CRLF)
 Next
FileClose($hFile)

Run("PRasp.exe", "")
EndFunc

While 1
   WEnd