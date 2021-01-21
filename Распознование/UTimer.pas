unit UTimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TFTimer = class(TForm)
    Pn1: TPanel;
    Pn2: TPanel;
    MeTimer: TMemo;
    LeTimeSmallSmallConst: TLabeledEdit;
    LeTimeSmallSmallRnd: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    LeTimeSmallConst: TLabeledEdit;
    LeTimeSmallRnd: TLabeledEdit;
    LeTimeMediumConst: TLabeledEdit;
    LeTimeMediumRnd: TLabeledEdit;
    LeTimeLargeConst: TLabeledEdit;
    LeTimeLargeRnd: TLabeledEdit;
    EdSheepConst: TEdit;
    EdSheepRnd: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdSheepCircleConst: TEdit;
    EdSheepCircleRnd: TEdit;
    EdFastRepair: TEdit;
    btnSave: TSpeedButton;
    btnLoad: TSpeedButton;
    BtGoTimeToFile: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure BtGoTimeToFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTimer: TFTimer;

implementation

{$R *.dfm}

uses UMain;

procedure SaveTimerFile(NameFile:string);
var
  f:TextFile;
begin
with FTimer do
begin
AssignFile(f,NameFile);
Rewrite(f);
Writeln(f,LeTimeSmallSmallConst.Text);
Writeln(f,LeTimeSmallSmallRnd.Text);
Writeln(f,LeTimeSmallConst.Text);
Writeln(f,LeTimeSmallRnd.Text);
Writeln(f,LeTimeMediumConst.Text);
Writeln(f,LeTimeMediumRnd.Text);
Writeln(f,LeTimeLargeConst.Text);
Writeln(f,LeTimeLargeRnd.Text);
Writeln(f,EdSheepConst.Text);
Writeln(f,EdSheepRnd.Text);
Writeln(f,EdSheepCircleConst.Text);
Writeln(f,EdSheepCircleRnd.Text);
Writeln(f,EdFastRepair.Text);
CloseFile(f);
end;
end;

procedure LoadTimerFile (NameFile:string);
var
  f:TextFile;
  st:string;
begin
with FTimer do
begin
AssignFile(f,NameFile);
Reset(f);
Readln(f,st);
LeTimeSmallSmallConst.Text:=st;
Readln(f,st);
LeTimeSmallSmallRnd.Text:=st;
Readln(f,st);
LeTimeSmallConst.Text:=st;
Readln(f,st);
LeTimeSmallRnd.Text:=st;
Readln(f,st);
LeTimeMediumConst.Text:=st;
Readln(f,st);
LeTimeMediumRnd.Text:=st;
Readln(f,st);
LeTimeLargeConst.Text:=st;
Readln(f,st);
LeTimeLargeRnd.Text:=st;
Readln(f,st);
EdSheepConst.Text:=st;
Readln(f,st);
EdSheepRnd.Text:=st;
Readln(f,st);
EdSheepCircleConst.Text:=st;
Readln(f,st);
EdSheepCircleRnd.Text:=st;
Readln(f,st);
EdFastRepair.Text:=st;
CloseFile(f);
end;
end;

procedure TFTimer.btnSaveClick(Sender: TObject);
begin
If FMain.Sd1.Execute then
  begin
  SaveTimerFile(FMain.Sd1.FileName);
  ShowMessage('Настройки задержек сохранены в файле - '+FMain.Sd1.FileName);
  end;
end;

procedure TFTimer.btnLoadClick(Sender: TObject);
begin
If FMain.Od1.Execute then
  begin
  LoadTimerFile(FMain.Od1.FileName);
  ShowMessage('Настройки задержек загружены из файла - '+FMain.Od1.FileName);
  end;
end;

procedure TFTimer.BtGoTimeToFileClick(Sender: TObject);
begin
SaveTimerFile('SettingTimeInAssistans.txt');
  ShowMessage('Настройки задержек сохранены в файле - SettingTimeInAssistans.txt');
end;

end.
