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

MsgBox($MB_SYSTEMMODAL, "�������� ���� �7", "���� �7 ������ ���� � ��������� �������, ���� ������", 100)


While 1
    Sleep(50)
    If _IsPressed("01", $dll) Then ;��������, � �����, ������� ���
        $aCoord=MouseGetPos()
		$ColorCord=PixelGetColor($aCoord[0],$aCoord[1])

         ToolTip("������ ���"&@CRLF&"����������: x="&$aCoord[0]&" y="&$aCoord[1]&@CRLF&"����="&$ColorCord, Default, Default, '_IsPressed', 1)
	  If ($ColorCord=$Yelow) and ($TypeCoord=0) Then
		 $TypeCoord=1
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ���� �6", "���������� ����� 7 ��������� � �����."&@CRLF&"�������� ������ ����� �6 ��� ������� ������� ����� �7", 100)
	  ElseIf (($ColorCord=$Red) or ($ColorCord=$Blue)) and ($TypeCoord=1) Then
		 $TypeCoord=2
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ����", "���������� ����� 6 ��������� � �����.", 100)
	  ElseIf ($TypeCoord=2) Then
		 $TypeCoord=3
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ���������� 1-�� ������ �����", "���������� ����� ����� ��������� � �����."&@CRLF&"��������� ����� ���� �� ������", 100)
	  ElseIf ($TypeCoord=3) and ($ColorCord=$White) Then
		 $TypeCoord=4
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ���������� 2-�� ������ �����", "���������� 1�� ������ ��������� � �����."&@CRLF&"��������� ����� ���� �� ������", 100)
	  ElseIf ($TypeCoord=4) and ($ColorCord=$White) Then
		 $TypeCoord=5
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ���������� 3-�� ������ �����", "���������� 2�� ������ ��������� � �����."&@CRLF&"��������� ����� ���� �� ������", 100)
	  ElseIf ($TypeCoord=5) and ($ColorCord=$White) Then
		 $TypeCoord=6
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ���������� 4-�� ������ �����", "���������� 3�� ������ ��������� � �����."&@CRLF&"��������� ����� ���� �� ������", 100)
	  ElseIf ($TypeCoord=6) and ($ColorCord=$White) Then
		 $TypeCoord=7
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
 		 MsgBox($MB_SYSTEMMODAL, "�������� ���������� ������ �����", "���������� 4�� ������ ��������� � �����."&@CRLF&"��������� ����� ���� �� ������", 100)
	  ElseIf ($TypeCoord=7) and ($ColorCord=$White) Then
		 $TypeCoord=8
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "�������� ���������� ������ �� ��� ��������� ������", "���������� ������ ����� ��������� � �����."&@CRLF&"��������� ����� ���� �� ������", 100)
	  ElseIf ($TypeCoord=8) and ($ColorCord=$White) Then
		 $TypeCoord=9
		 FileWrite($hFile, $aCoord[0] & ":" & $aCoord[1] & @CRLF)
		 MsgBox($MB_SYSTEMMODAL, "��� ���������� ��������� � �����", "��� ���������� ��������� � �����", 100)

		 EndIf
EndIf

WEnd
Func stop()
    Exit
 EndFunc



DllClose($dll)
