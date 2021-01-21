unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
  MAr:array [1..8,1..49] of LongWord;
  nom:LongWord;

implementation

{$R *.dfm}

procedure LoadFile;
var
  f:TextFile;
  i,j,n,k:LongWord;
  st:string;
begin
AssignFile(f,'Coord.txt');
Reset(f);
n:=0;
For i:=1 to 8 do
  begin
  Readln(f,st);
  If i=1 then
    Delete(St,1,3);
  for j:=1 to 48 do
    begin
    MAr[i,j]:=StrToInt(Copy(St,1,pos(':',st)-1));
    Delete(St,1,pos(':',st));
    end;
  end;
CloseFile(f);
nom:=n-1;
end;


function GoF(Color:LongWord):Double;
var
  R,G,B:Byte;
begin
  R:=Byte(Color);
  G:=Byte(Color shr 8);
  B:=Byte(Color shr 16);
Result:=B+G+R;

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

procedure GoAllMXAndDx(X0,Y0:LongWord; var NomMinMx,NomMinDx:Byte);
var
  mx,dx:double;
  minMx,MinDx:double;

begin
GoMx(Number2,X0,Y0,Mx);
GoDx(Number2,X0,Y0,Mx,dx);

minMx:=Mx; NomMinMx:=2;
MinDx:=dx;  NomMinDx:=2;
GoMx(Number3,X0,Y0,Mx);
GoDx(Number3,X0,Y0,Mx,dx);

If Mx>minMx then begin
minMx:=Mx; NomMinMx:=3; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=3;  end;
GoMx(Number5,X0,Y0,Mx);
GoDx(Number5,X0,Y0,Mx,dx);

If Mx>minMx then begin
minMx:=Mx; NomMinMx:=5; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=5;  end;
GoMx(Number6,X0,Y0,Mx);
GoDx(Number6,X0,Y0,Mx,dx);

If Mx>minMx then begin
minMx:=Mx; NomMinMx:=6; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=6;  end;
GoMx(Number7,X0,Y0,Mx);
GoDx(Number7,X0,Y0,Mx,dx);

If Mx>minMx then begin
minMx:=Mx; NomMinMx:=7; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=7;  end;
GoMx(Number0,X0,Y0,Mx);
GoDx(Number0,X0,Y0,Mx,dx);

If Mx>minMx then begin
minMx:=Mx; NomMinMx:=0; end;
If dx<MinDx then begin
MinDx:=dx;  NomMinDx:=0;  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  NomMx1,NomMx2,NomMx3,NomMx4,NomMx5,NomMx6,
  NomDx1,NomDx2,NomDx3,NomDx4,NomDx5,NomDx6:Byte;
begin
LoadFile;
GoAllMXAndDx(1,1,NomMx1,NomDx1);
GoAllMXAndDx(8,1,NomMx2,NomDx2);
GoAllMXAndDx(15,1,NomMx3,NomDx3);
GoAllMXAndDx(31,1,NomMx4,NomDx4);
GoAllMXAndDx(38,1,NomMx5,NomDx5);
GoAllMXAndDx(45,1,NomMx6,NomDx6);
Label1.Caption:=IntToStr(NomDx1)+IntToStr(NomDx2)+IntToStr(NomDx3)+' , '+IntToStr(NomDx4)+IntToStr(NomDx5)+IntToStr(NomDx6);
end;

end.
