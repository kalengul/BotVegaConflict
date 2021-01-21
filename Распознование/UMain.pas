unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, CheckLst, ExtCtrls;



type
  TForm1 = class(TForm)
    Sg1: TStringGrid;
    btn1: TBitBtn;
    Lb1: TListBox;
    Clb1: TCheckListBox;
    btn2: TBitBtn;
    tmr1: TTimer;
    Bt1: TButton;
    Bt2: TButton;
    Memo1: TMemo;
    Bt3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure Clb1Click(Sender: TObject);
    procedure Sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure tmr1Timer(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure Bt1Click(Sender: TObject);
    procedure Bt2Click(Sender: TObject);
    procedure Bt3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TElementKol = record
              Element,Kol:Longword;
              end;
DArray= array [1..8,1..5] of Byte;

const

Number0:DArray = ((0,1,1,1,0),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(0,1,1,1,0));

Number1:DArray =  ((0,0,1,1,0),
						(0,1,1,1,0),
						(0,0,0,1,0),
						(0,0,0,1,0),
						(0,0,0,1,0),
						(0,0,0,1,0),
						(0,0,0,1,0),
						(0,0,0,1,0));

Number2:DArray = ((1,1,1,1,0),
						(0,0,0,1,1),
						(0,0,0,1,1),
						(0,0,0,1,0),
						(0,0,1,0,0),
						(0,1,0,0,0),
						(1,1,0,0,0),
						(1,1,1,1,1));

Number3:DArray = ((1,1,1,1,0),
						(0,0,0,1,1),
						(0,0,0,1,0),
						(0,1,1,1,0),
						(0,0,0,1,0),
						(0,0,0,0,1),
						(0,0,0,1,1),
						(1,1,1,1,0));

Number4:DArray = ((0,0,1,0,0),
						(0,1,1,0,0),
						(0,1,0,0,0),
						(1,1,0,1,0),
						(1,0,0,1,0),
						(1,1,1,1,1),
						(0,0,0,1,0),
						(0,0,0,1,0));

Number5:DArray =  ((0,1,1,1,1),
						(1,1,0,0,0),
						(1,0,0,0,0),
						(0,1,1,1,0),
						(0,0,0,0,1),
						(0,0,0,0,1),
						(0,0,0,1,1),
						(1,1,1,1,0));

Number6:DArray =  ((0,1,1,1,0),
						(1,0,0,0,0),
						(1,0,0,0,0),
						(1,1,1,1,0),
						(1,0,0,1,1),
						(1,0,0,0,1),
						(1,1,0,1,1),
						(0,1,1,1,0));

Number7:DArray =  ((1,1,1,1,1),
						(0,0,0,0,1),
						(0,0,0,1,0),
						(0,0,0,1,0),
						(0,0,1,0,0),
						(0,0,1,0,0),
						(0,1,0,0,0),
						(0,1,0,0,0));

Number8:DArray =  ((0,1,1,1,0),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(0,1,1,1,0),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(0,1,1,1,0));

Number9:DArray =  ((0,1,1,1,0),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(1,0,0,0,1),
						(0,1,1,1,1),
						(0,0,0,0,1),
						(0,0,0,1,1),
						(1,1,1,1,0));



var
  Form1: TForm1;
  MAr:array [1..8,1..51] of LongWord;
  Znat:array of TElementKol;
  nom:LongWord;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  f:TextFile;
  i,j,n,k:LongWord;
  st:string;
begin
AssignFile(f,'Coord.txt');
Reset(f);
n:=0;
SetLength(Znat,n);

For i:=1 to 8 do
  begin
  Readln(f,st);
  If i=1 then
    Delete(St,1,3);
  for j:=1 to 48 do
    begin
    MAr[i,j]:=StrToInt(Copy(St,1,pos(':',st)-1));
    Delete(St,1,pos(':',st));
    k:=0;
    While (n<>0) and (k<n) and (Znat[k].Element<>MAr[i,j]) do
      inc(k);
    if k=n then
      begin
      SetLength(Znat,n+1);
      Znat[k].Element:=MAr[i,j];
      Znat[k].Kol:=1;
      Inc(n);
      end
    else
      Znat[k].Kol:=Znat[k].Kol+1;
    end;
  end;
CloseFile(f);
CLb1.Clear;
for k:=0 to n-1 do
  CLb1.Items.Add(IntToStr(Znat[k].Element)+':'+IntToStr(Znat[k].Kol));
nom:=n-1;
end;

procedure TForm1.Clb1Click(Sender: TObject);
var
  i,j,k,n:LongWord;
  La:LongWord;
  st,st1:string;
begin
for k:=0 to Clb1.Count-1 do
  If Clb1.Selected[k] then
    begin
    st1:=Clb1.Items.Strings[k];
      st:=Copy(st1,1,pos(':',st1)-1);
    La:=StrToInt(st);
    For i:=1 to 8 do
      for j:=1 to 48 do
        IF MAr[i,j]=La then
          Sg1.Cells[j,i]:='1';
    end;
end;

procedure TForm1.Sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
Lb1.Items.Add(IntToStr(MAr[ARow,ACol]))

end;

procedure TForm1.tmr1Timer(Sender: TObject);
var
  i,j,k,n:LongWord;
  La:LongWord;
  st,st1:string;
begin
If nom<>0 then
  Dec(nom);
  st1:=Clb1.Items.Strings[Nom];
      st:=Copy(st1,1,pos(':',st1)-1);
    La:=StrToInt(st);
    For i:=1 to 8 do
      for j:=1 to 48 do
        IF MAr[i,j]=La then
          Sg1.Cells[j,i]:='1';
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
tmr1.Enabled:=True;
end;

procedure TForm1.Bt1Click(Sender: TObject);
begin
tmr1.Enabled:=False;
end;

function GoCaptureToNumber (x1,y1:Longword):Byte;
var
  Mx,La2x,Dx,minDx:double;
  i,NomMinD:Byte;
begin

minDx:=10000000000000000;
Form1.Memo1.Lines.Add('');
for i:=0 to 9 do
  begin
  Mx:=0;
  La2x:=0;
  case i of
    2:begin
      Mx:=MAr[x1,y1]+MAr[x1+1,y1]+MAr[x1+2,y1]+MAr[x1+3,y1]+MAr[x1+3,y1+1]+MAr[x1+3,y1+2]+MAr[x1+3,y1+3]+MAr[x1+2,y1+4]+MAr[x1+1,y1+5]+MAr[x1,y1+6]+MAr[x1,y1+7]+MAr[x1+1,y1+7]+MAr[x1+2,y1+7]+MAr[x1+3,y1+7]+MAr[x1+4,y1+7]+MAr[x1+1,y1+6];
      Mx:=MX/16;
      La2x:=sqr(MAr[x1,y1])+sqr(MAr[x1+1,y1])+sqr(MAr[x1+2,y1])+sqr(MAr[x1+3,y1])+sqr(MAr[x1+3,y1+1])+sqr(MAr[x1+3,y1+2])+sqr(MAr[x1+3,y1+3])+sqr(MAr[x1+2,y1+4])+sqr(MAr[x1+1,y1+5])+sqr(MAr[x1,y1+6])+sqr(MAr[x1,y1+7])+sqr(MAr[x1+1,y1+7])+sqr(MAr[x1+2,y1+7])+sqr(MAr[x1+3,y1+7])+sqr(MAr[x1+4,y1+7])+sqr(MAr[x1+1,y1+6]);
      La2x:=La2x/16;
      Dx:=sqr(MAr[x1,y1]-Mx)+sqr(MAr[x1+1,y1]-Mx)+sqr(MAr[x1+2,y1]-Mx)+sqr(MAr[x1+3,y1]-Mx)+sqr(MAr[x1+3,y1+1]-Mx)+sqr(MAr[x1+3,y1+2]-Mx)+sqr(MAr[x1+3,y1+3]-Mx)+sqr(MAr[x1+2,y1+4]-Mx)+sqr(MAr[x1+1,y1+5]-Mx)+sqr(MAr[x1,y1+6]-Mx)+sqr(MAr[x1,y1+7]-Mx)+sqr(MAr[x1+1,y1+7]-Mx)+sqr(MAr[x1+2,y1+7]-Mx)+sqr(MAr[x1+3,y1+7]-Mx)+sqr(MAr[x1+4,y1+7]-Mx)+sqr(MAr[x1+1,y1+6]-Mx);
      Dx:=dx/16;
      Form1.Memo1.Lines.Add('2 Mx='+FloatToStr(Mx)+' La2='+FloatToStr(La2x)+' Dx='+FloatToStr(Dx));
      If minDx>Dx then
        begin
        minDx:=Dx;
        NomMinD:=2;
        end;
      end;
    3:begin
      Mx:=MAr[x1,y1]+MAr[x1+1,y1]+MAr[x1+2,y1]+MAr[x1+3,y1]+MAr[x1+4,y1+1]+MAr[x1+3,y1+2]+MAr[x1+3,y1+3]+MAr[x1+2,y1+3]+MAr[x1+1,y1+3]+MAr[x1+3,y1+4]+MAr[x1+4,y1+5]+MAr[x1+4,y1+6]+MAr[x1,y1+7]+MAr[x1+1,y1+7]+MAr[x1+2,y1+7]+MAr[x1+3,y1+7];
      Mx:=MX/16;
      La2x:=sqr(MAr[x1,y1])+sqr(MAr[x1+1,y1])+sqr(MAr[x1+2,y1])+sqr(MAr[x1+3,y1])+sqr(MAr[x1+4,y1+1])+sqr(MAr[x1+3,y1+2])+sqr(MAr[x1+3,y1+3])+sqr(MAr[x1+2,y1+3])+sqr(MAr[x1+1,y1+3])+sqr(MAr[x1+3,y1+4])+sqr(MAr[x1+4,y1+5])+sqr(MAr[x1+4,y1+6])+sqr(MAr[x1,y1+7])+sqr(MAr[x1+1,y1+7])+sqr(MAr[x1+2,y1+7])+sqr(MAr[x1+3,y1+7]);
      La2x:=La2x/16;
      Dx:=sqr(MAr[x1,y1]-Mx)+sqr(MAr[x1+1,y1]-Mx)+sqr(MAr[x1+2,y1]-Mx)+sqr(MAr[x1+3,y1]-Mx)+sqr(MAr[x1+4,y1+1]-Mx)+sqr(MAr[x1+3,y1+2]-Mx)+sqr(MAr[x1+3,y1+3]-Mx)+sqr(MAr[x1+2,y1+3]-Mx)+sqr(MAr[x1+1,y1+3]-Mx)+sqr(MAr[x1+3,y1+4]-Mx)+sqr(MAr[x1+4,y1+5]-Mx)+sqr(MAr[x1+4,y1+6]-Mx)+sqr(MAr[x1,y1+7]-Mx)+sqr(MAr[x1+1,y1+7]-Mx)+sqr(MAr[x1+2,y1+7]-Mx)+sqr(MAr[x1+3,y1+7]-Mx);
      Dx:=Dx/16;

      Form1.Memo1.Lines.Add('3 Mx='+FloatToStr(Mx)+' La2='+FloatToStr(La2x)+' Dx='+FloatToStr(Dx));
      If minDx>Dx then
        begin
        minDx:=Dx;
        NomMinD:=3;
        end;
      end;
    5:begin
      Mx:=MAr[x1+4,y1]+MAr[x1+1,y1]+MAr[x1+2,y1]+MAr[x1+3,y1]+MAr[x1,y1+1]+MAr[x1,y1+2]+MAr[x1+3,y1+3]+MAr[x1+2,y1+3]+MAr[x1+1,y1+3]+MAr[x1+4,y1+4]+MAr[x1+4,y1+5]+MAr[x1+4,y1+6]+MAr[x1,y1+7]+MAr[x1+1,y1+7]+MAr[x1+2,y1+7]+MAr[x1+3,y1+7];
      Mx:=MX/16;
      La2x:=sqr(MAr[x1+4,y1])+sqr(MAr[x1+1,y1])+sqr(MAr[x1+2,y1])+sqr(MAr[x1+3,y1])+sqr(MAr[x1,y1+1])+sqr(MAr[x1,y1+2])+sqr(MAr[x1+3,y1+3])+sqr(MAr[x1+2,y1+3])+sqr(MAr[x1+1,y1+3])+sqr(MAr[x1+4,y1+4])+sqr(MAr[x1+4,y1+5])+sqr(MAr[x1+4,y1+6])+sqr(MAr[x1,y1+7])+sqr(MAr[x1+1,y1+7])+sqr(MAr[x1+2,y1+7])+sqr(MAr[x1+3,y1+7]);
      La2x:=La2x/16;
      Dx:=sqr(MAr[x1+4,y1]-Mx)+sqr(MAr[x1+1,y1]-Mx)+sqr(MAr[x1+2,y1]-Mx)+sqr(MAr[x1+3,y1]-Mx)+sqr(MAr[x1,y1+1]-Mx)+sqr(MAr[x1,y1+2]-Mx)+sqr(MAr[x1+3,y1+3]-Mx)+sqr(MAr[x1+2,y1+3]-Mx)+sqr(MAr[x1+1,y1+3]-Mx)+sqr(MAr[x1+4,y1+4]-Mx)+sqr(MAr[x1+4,y1+5]-Mx)+sqr(MAr[x1+4,y1+6]-Mx)+sqr(MAr[x1,y1+7]-Mx)+sqr(MAr[x1+1,y1+7]-Mx)+sqr(MAr[x1+2,y1+7]-Mx)+sqr(MAr[x1+3,y1+7]-Mx);
      Dx:=Dx/16;
      Form1.Memo1.Lines.Add('5 Mx='+FloatToStr(Mx)+' La2='+FloatToStr(La2x)+' Dx='+FloatToStr(Dx));
      If minDx>Dx then
        begin
        minDx:=Dx ;
        NomMinD:=5;
        end;
      end;
    6:begin
      Mx:=MAr[x1+1,y1]+MAr[x1+2,y1]+MAr[x1+3,y1]+MAr[x1+1,y1+3]+MAr[x1+2,y1+3]+MAr[x1+3,y1+3]+MAr[x1+1,y1+7]+MAr[x1+2,y1+7]+MAr[x1+3,y1+7];
      Mx:=MX/16;
      La2x:=sqr(MAr[x1+1,y1])+sqr(MAr[x1+2,y1])+sqr(MAr[x1+3,y1])+sqr(MAr[x1,y1+1])+sqr(MAr[x1,y1+2])+sqr(MAr[x1+3,y1+3])+sqr(MAr[x1+2,y1+3])+sqr(MAr[x1+1,y1+3])+sqr(MAr[x1+4,y1+4])+sqr(MAr[x1+4,y1+5])+sqr(MAr[x1+4,y1+6])+sqr(MAr[x1,y1+7])+sqr(MAr[x1+1,y1+7])+sqr(MAr[x1+2,y1+7])+sqr(MAr[x1+3,y1+7]);
      La2x:=La2x/16;
      Dx:=sqr(MAr[x1+1,y1]-Mx)+sqr(MAr[x1+2,y1]-Mx)+sqr(MAr[x1+3,y1]-Mx)+sqr(MAr[x1,y1+1]-Mx)+sqr(MAr[x1,y1+2]-Mx)+sqr(MAr[x1+3,y1+3]-Mx)+sqr(MAr[x1+2,y1+3]-Mx)+sqr(MAr[x1+1,y1+3]-Mx)+sqr(MAr[x1+4,y1+4]-Mx)+sqr(MAr[x1+4,y1+5]-Mx)+sqr(MAr[x1+4,y1+6]-Mx)+sqr(MAr[x1,y1+7]-Mx)+sqr(MAr[x1+1,y1+7]-Mx)+sqr(MAr[x1+2,y1+7]-Mx)+sqr(MAr[x1+3,y1+7]-Mx);
      Dx:=Dx/16;
      Form1.Memo1.Lines.Add('6 Mx='+FloatToStr(Mx)+' La2='+FloatToStr(La2x)+' Dx='+FloatToStr(Dx));
      If minDx>Dx then
        begin
        minDx:=Dx ;
        NomMinD:=6;
        end;
      end;
    end;
  end;
Result:=NomMinD;
end;

procedure TForm1.Bt2Click(Sender: TObject);
var
  x0,y0:LongWord;
  nom:Byte;
begin
nom:=GoCaptureToNumber (5,2);
Form1.Memo1.Lines.Add('Первая цифра - '+IntToStr(nom));
nom:=GoCaptureToNumber (12,2);
Form1.Memo1.Lines.Add('Вторая цифра - '+IntToStr(nom));
nom:=GoCaptureToNumber (19,2);
Form1.Memo1.Lines.Add('Третья цифра - '+IntToStr(nom));
nom:=GoCaptureToNumber (5,13);
Form1.Memo1.Lines.Add('Первая цифра - '+IntToStr(nom));
nom:=GoCaptureToNumber (12,13);
Form1.Memo1.Lines.Add('Вторая цифра - '+IntToStr(nom));
nom:=GoCaptureToNumber (19,13);
Form1.Memo1.Lines.Add('Третья цифра - '+IntToStr(nom));
end;

function GoF(Color:LongWord):Double;
var
  R,G,B:Byte;
begin
  R:=Byte(Color);
  G:=Byte(Color shr 8);
  B:=Byte(Color shr 16);
Result:=B;

end;

procedure GoMx(Number:DArray; x0,y0:LongWord; var Mx:Double);
var
  i,j,n:LongWord;
begin
  n:=0;
  Mx:=0;
For i:=x0 to x0+4 do
  For j:=y0 to y0+7 do
    if Number[j+1-y0,i+1-x0]=1 then
      begin
      Mx:=Mx+GoF(MAr[j,i]);
      Form1.Sg1.Cells[i,j]:='1';
      Inc(n);
      end;
If n<>0 then
Mx:=Mx/n;
end;

procedure GoDx(Number:DArray; x0,y0:LongWord; Mx:Double; var Dx:Double);
var
  i,j,n:LongWord;
begin
  n:=0;
  Dx:=0;
For i:=x0 to x0+4 do
  For j:=y0 to y0+7 do
    if Number[j+1-y0,i+1-x0]=1 then
      begin
      Dx:=Dx+(GoF(MAr[j,i])-Mx)*(GoF(MAr[j,i])-Mx);
      Inc(n);
      end;
If n<>0 then
Dx:=Dx/n;
end;

procedure GoAllMXAndDx(X0,Y0:LongWord);
var
  mx,dx:double;
  minMx,MinDx:double;
  NomMinMx,NomMinDx:Byte;
begin
GoMx(Number1,X0,Y0,Mx);
GoDx(Number1,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('1 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
minMx:=Mx; NomMinMx:=1;
MinDx:=dx;  NomMinDx:=1;
GoMx(Number2,X0,Y0,Mx);
GoDx(Number2,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('2 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=2; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=2;  end;
GoMx(Number3,X0,Y0,Mx);
GoDx(Number3,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('3 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=3; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=3;  end;
GoMx(Number4,X0,Y0,Mx);
GoDx(Number4,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('4 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=4; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=4;  end;
GoMx(Number5,X0,Y0,Mx);
GoDx(Number5,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('5 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=5; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=5;  end;
GoMx(Number6,X0,Y0,Mx);
GoDx(Number6,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('6 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=6; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=6;  end;
GoMx(Number7,X0,Y0,Mx);
GoDx(Number7,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('7 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=7; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=7;  end;
GoMx(Number8,X0,Y0,Mx);
GoDx(Number8,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('8 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=8; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=8;  end;
GoMx(Number9,X0,Y0,Mx);
GoDx(Number9,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('9 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=9; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=9;  end;
GoMx(Number0,X0,Y0,Mx);
GoDx(Number0,X0,Y0,Mx,dx);
Form1.Memo1.Lines.Add('0 - Mx='+FloatToStr(Mx)+' Dx='+FloatToStr(Dx));
If Mx>minMx then begin
minMx:=Mx; NomMinMx:=0; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=0;  end;
Form1.Memo1.Lines.Add('Mx='+IntToStr(NomMinMx)+' Dx='+IntToStr(NomMinDx));
Form1.Memo1.Lines.Add('');
end;

procedure TForm1.Bt3Click(Sender: TObject);
begin
GoAllMXAndDx(1,1);
GoAllMXAndDx(8,1);
GoAllMXAndDx(15,1);
GoAllMXAndDx(31,1);
GoAllMXAndDx(38,1);
GoAllMXAndDx(45,1);

end;

end.



