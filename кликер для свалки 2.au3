MsgBox(4096,"��������!", "���� ������ ���� ��������, ������ �������, ����� ������� �� �����!")

WinActivate("[CLASS:UnityWndClass]","") 				;���������� ���� � ����������
WinWaitActive("[CLASS:UnityWndClass]","",3)

Const $iCapsLock = 0x14     ; ����-��� CAPS LOCK

$xcpecknopka= 1330
$ycpecknopka= 891

MouseMove($xcpecknopka,$ycpecknopka,1)

If MsgBox(4 + 32, '������', '������ ���������� �����?') = 6 Then

	$p= InputBox ( "���� ������", "������� ��� �������?:" )

	for $i=$p to 1 step -1

	      #Region - ��������� ������� ��� ���������� ������� CAPS LOCK

$errCaps = DllCall("user32.dll", "int", "GetKeyState", "int", $iCapsLock) ; ���������� ��������� ������ �������
If $errCaps[0] Then
   Exit ; ���� �������� ��� ������ - �����
   MsgBox(4096, "!!!", "ERROR!!!")
   EndIf
#EndRegion - ��������� ������� ��� ���������� ������� CAPS LOCK

		MouseClick("left",$xcpecknopka,$ycpecknopka)
		Sleep(300)
		MouseClick("left",$xcpecknopka,$ycpecknopka)
	Sleep(2000)
	Next

	MsgBox(4096, '���������', '������ ���������')
	Exit
Else

$xcpecknopka= InputBox ( "���� ���������", "������� X-���������� ������ ���������������:" )
$ycpecknopka= InputBox ( "���� ���������", "������� Y-���������� ������ ���������������:" )

MouseMove($xcpecknopka,$ycpecknopka,1)

If MsgBox(4 + 32, '������', '������ ���������� �����?') = 6 Then

   $p= InputBox ( "���� ������", "������� ��� �������?:" )

	for $i=$p to 1 step -1

	      #Region - ��������� ������� ��� ���������� ������� CAPS LOCK

$errCaps = DllCall("user32.dll", "int", "GetKeyState", "int", $iCapsLock) ; ���������� ��������� ������ �������
If $errCaps[0] Then
   Exit ; ���� �������� ��� ������ - �����
   MsgBox(4096, "!!!", "ERROR!!!")
   EndIf
#EndRegion - ��������� ������� ��� ���������� ������� CAPS LOCK

		MouseClick("left",$xcpecknopka,$ycpecknopka)
		Sleep(300)
		MouseClick("left",$xcpecknopka,$ycpecknopka)

	Sleep(2000)
	Next

	MsgBox(4096, '���������', '������ ���������')
	Exit
Else

MsgBox(16, '����', '�� �� ����')
Exit

EndIf
EndIf