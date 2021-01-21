unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Spin, USysSetting, UTimer, UZash,ShellApi, Buttons;

type
  TFMain = class(TForm)
    Pn1: TPanel;
    GbFleetSetting: TGroupBox;
    GbAssistentFleet: TGroupBox;
    CbFleetInAssistents1: TCheckBox;
    CbFleetInAssistents2: TCheckBox;
    CbFleetInAssistents3: TCheckBox;
    CbFleetInAssistents4: TCheckBox;
    CbFleetInAssistents5: TCheckBox;
    CbFleetInAssistents6: TCheckBox;
    CbFleetInAssistents7: TCheckBox;
    GbFleetGoAttack: TGroupBox;
    CbFleetInAttack1: TCheckBox;
    CbFleetInAttack2: TCheckBox;
    CbFleetInAttack3: TCheckBox;
    CbFleetInAttack4: TCheckBox;
    CbFleetInAttack5: TCheckBox;
    CbFleetInAttack6: TCheckBox;
    CbFleetInAttack7: TCheckBox;
    GbGoHomeAfterFight: TGroupBox;
    CbFleetGoHomeAfterFight1: TCheckBox;
    CbFleetGoHomeAfterFight2: TCheckBox;
    CbFleetGoHomeAfterFight3: TCheckBox;
    CbFleetGoHomeAfterFight4: TCheckBox;
    CbFleetGoHomeAfterFight5: TCheckBox;
    CbFleetGoHomeAfterFight6: TCheckBox;
    CbFleetGoHomeAfterFight7: TCheckBox;
    GbGoHome: TGroupBox;
    GbAttack: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SgNomFleetVegaAttack: TStringGrid;
    GbGoHomeAfterDamage: TGroupBox;
    CbFleetGoHomeAfterDamage1: TCheckBox;
    CbFleetGoHomeAfterDamage2: TCheckBox;
    CbFleetGoHomeAfterDamage3: TCheckBox;
    CbFleetGoHomeAfterDamage4: TCheckBox;
    CbFleetGoHomeAfterDamage5: TCheckBox;
    CbFleetGoHomeAfterDamage6: TCheckBox;
    CbFleetGoHomeAfterDamage7: TCheckBox;
    GbRepair: TGroupBox;
    Label3: TLabel;
    LbSetRepair: TListBox;
    BtUpFleetInsetRepeir: TButton;
    GbConvoy: TGroupBox;
    GbGoHomeAfterVsek: TGroupBox;
    CbFleetGoHomeAfterVsek1: TCheckBox;
    CbFleetGoHomeAfterVsek2: TCheckBox;
    CbFleetGoHomeAfterVsek3: TCheckBox;
    CbFleetGoHomeAfterVsek4: TCheckBox;
    CbFleetGoHomeAfterVsek5: TCheckBox;
    CbFleetGoHomeAfterVsek6: TCheckBox;
    CbFleetGoHomeAfterVsek7: TCheckBox;
    GbFastRepair: TGroupBox;
    CbFleetFastRepair1: TCheckBox;
    CbFleetFastRepair2: TCheckBox;
    CbFleetFastRepair3: TCheckBox;
    CbFleetFastRepair4: TCheckBox;
    CbFleetFastRepair5: TCheckBox;
    CbFleetFastRepair6: TCheckBox;
    CbFleetFastRepair7: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SeFleetConvoy1: TSpinEdit;
    SeFleetConvoy2: TSpinEdit;
    SeFleetConvoy3: TSpinEdit;
    SeFleetConvoy4: TSpinEdit;
    SeFleetConvoy5: TSpinEdit;
    SeFleetConvoy6: TSpinEdit;
    SeFleetConvoy7: TSpinEdit;
    BtGo: TButton;
    Od1: TOpenDialog;
    Sd1: TSaveDialog;
    CbAttackBaseInevent: TCheckBox;
    Label12: TLabel;
    SeEndAssistentsHour: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    BtSysSetting: TButton;
    Label16: TLabel;
    SeEndAssistentsMin: TSpinEdit;
    CbGoHmeFleetByExit: TCheckBox;
    BtTimers: TButton;
    btnSave: TSpeedButton;
    btnLoad: TSpeedButton;
    RgSelectTypeWindow: TRadioGroup;
    BtAutorizations: TButton;
    GbGoHomeInSektor: TGroupBox;
    CbFleetGoHomeInSektor1: TCheckBox;
    CbFleetGoHomeInSektor2: TCheckBox;
    CbFleetGoHomeInSektor3: TCheckBox;
    CbFleetGoHomeInSektor4: TCheckBox;
    CbFleetGoHomeInSektor5: TCheckBox;
    CbFleetGoHomeInSektor6: TCheckBox;
    CbFleetGoHomeInSektor7: TCheckBox;
    procedure BtUpFleetInsetRepeirClick(Sender: TObject);
    procedure CbFleetInAssistents1Click(Sender: TObject);
    procedure CbFleetInAssistents2Click(Sender: TObject);
    procedure CbFleetInAssistents3Click(Sender: TObject);
    procedure CbFleetInAssistents4Click(Sender: TObject);
    procedure CbFleetInAssistents5Click(Sender: TObject);
    procedure CbFleetInAssistents6Click(Sender: TObject);
    procedure CbFleetInAssistents7Click(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure BtLoadSettingFleetClick(Sender: TObject);
    procedure BtSysSettingClick(Sender: TObject);
    procedure BtGoClick(Sender: TObject);
    procedure BtTimersClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtAutorizationsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  NomPlayer:LongWord;

implementation

{$R *.dfm}

procedure TFMain.BtUpFleetInsetRepeirClick(Sender: TObject);
var
  i:LongWord;
  st:string;
begin
i:=0;
While (i<=7) and (not LbSetRepair.Selected[i])  do
  Inc(i);
If (i<=7) and (i<>0) then
  begin
  st:=LbSetRepair.Items.Strings[i];
  LbSetRepair.Items.Strings[i]:=LbSetRepair.Items.Strings[i-1];
  LbSetRepair.Items.Strings[i-1]:=st;
  LbSetRepair.Selected[i]:=False;
  LbSetRepair.Selected[i-1]:=True;
  end;
end;

procedure GoChangeFllet(CbFleetInAssistents1,CbFleetInAttack1,CbFleetGoHomeAfterFight1,CbFleetGoHomeAfterDamage1,CbFleetGoHomeAfterVsek1,CbFleetGoHomeInSektor,CbFleetFastRepair1:TCheckBox; SeFleetConvoy1:TSpinEdit);
begin
CbFleetInAttack1.Enabled:=CbFleetInAssistents1.Checked;
CbFleetGoHomeAfterFight1.Enabled:=CbFleetInAssistents1.Checked;
CbFleetGoHomeAfterDamage1.Enabled:=CbFleetInAssistents1.Checked;
CbFleetGoHomeAfterVsek1.Enabled:=CbFleetInAssistents1.Checked;
CbFleetGoHomeInSektor.Enabled:=CbFleetInAssistents1.Checked;
CbFleetFastRepair1.Enabled:=CbFleetInAssistents1.Checked;
SeFleetConvoy1.Enabled:=CbFleetInAssistents1.Checked;
SeFleetConvoy1.Value:=0;
end;

procedure TFMain.CbFleetInAssistents1Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents1,CbFleetInAttack1,CbFleetGoHomeAfterFight1,CbFleetGoHomeAfterDamage1,CbFleetGoHomeAfterVsek1,CbFleetGoHomeInSektor1,CbFleetFastRepair1,SeFleetConvoy1);
end;

procedure TFMain.CbFleetInAssistents2Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents2,CbFleetInAttack2,CbFleetGoHomeAfterFight2,CbFleetGoHomeAfterDamage2,CbFleetGoHomeAfterVsek2,CbFleetGoHomeInSektor2,CbFleetFastRepair2,SeFleetConvoy2);
end;

procedure TFMain.CbFleetInAssistents3Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents3,CbFleetInAttack3,CbFleetGoHomeAfterFight3,CbFleetGoHomeAfterDamage3,CbFleetGoHomeAfterVsek3,CbFleetGoHomeInSektor3,CbFleetFastRepair3,SeFleetConvoy3);
end;

procedure TFMain.CbFleetInAssistents4Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents4,CbFleetInAttack4,CbFleetGoHomeAfterFight4,CbFleetGoHomeAfterDamage4,CbFleetGoHomeAfterVsek4,CbFleetGoHomeInSektor4,CbFleetFastRepair4,SeFleetConvoy4);
end;

procedure TFMain.CbFleetInAssistents5Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents5,CbFleetInAttack5,CbFleetGoHomeAfterFight5,CbFleetGoHomeAfterDamage5,CbFleetGoHomeAfterVsek5,CbFleetGoHomeInSektor5,CbFleetFastRepair5,SeFleetConvoy5);
end;

procedure TFMain.CbFleetInAssistents6Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents6,CbFleetInAttack6,CbFleetGoHomeAfterFight6,CbFleetGoHomeAfterDamage6,CbFleetGoHomeAfterVsek6,CbFleetGoHomeInSektor6,CbFleetFastRepair6,SeFleetConvoy6);
end;

procedure TFMain.CbFleetInAssistents7Click(Sender: TObject);
begin
GoChangeFllet(CbFleetInAssistents7,CbFleetInAttack7,CbFleetGoHomeAfterFight7,CbFleetGoHomeAfterDamage7,CbFleetGoHomeAfterVsek7,CbFleetGoHomeInSektor7,CbFleetFastRepair7,SeFleetConvoy7);
end;

procedure SaveFileSettingFleet (NameFile:String; FileSaveDisk:Boolean);
var
  f:TextFile;
  i,j:Byte;

  procedure GoCbInFile (Cb:TCheckBox);
  begin
  if Cb.Checked then
    Writeln(f,'1')
  else
    Writeln (f,'0');
  end;

begin
with FMain do
begin
  AssignFile(f,NameFile);
  Rewrite(f);
  GoCbInFile(CbFleetInAssistents1);
  GoCbInFile(CbFleetInAssistents2);
  GoCbInFile(CbFleetInAssistents3);
  GoCbInFile(CbFleetInAssistents4);
  If FileSaveDisk then   Writeln(f,'1');
  GoCbInFile(CbFleetInAssistents5);
  GoCbInFile(CbFleetInAssistents6);
  GoCbInFile(CbFleetInAssistents7);

  GoCbInFile(CbFleetInAttack1);
  GoCbInFile(CbFleetInAttack2);
  GoCbInFile(CbFleetInAttack3);
  GoCbInFile(CbFleetInAttack4);
  If FileSaveDisk then  Writeln(f,'0');
  GoCbInFile(CbFleetInAttack5);
  GoCbInFile(CbFleetInAttack6);
  GoCbInFile(CbFleetInAttack7);

  for i:=0 to 4 do
    begin
    For j:=0 to 6 do
      if SgNomFleetVegaAttack.Cells[i,j]='' then
        Writeln(f,'0')
      else
        Writeln(f,SgNomFleetVegaAttack.Cells[i,j])
    end;

  GoCbInFile(CbFleetGoHomeAfterFight1);
  GoCbInFile(CbFleetGoHomeAfterFight2);
  GoCbInFile(CbFleetGoHomeAfterFight3);
  GoCbInFile(CbFleetGoHomeAfterFight4);
  GoCbInFile(CbFleetGoHomeAfterFight5);
  GoCbInFile(CbFleetGoHomeAfterFight6);
  GoCbInFile(CbFleetGoHomeAfterFight7);

  GoCbInFile(CbFleetGoHomeAfterDamage1);
  GoCbInFile(CbFleetGoHomeAfterDamage2);
  GoCbInFile(CbFleetGoHomeAfterDamage3);
  GoCbInFile(CbFleetGoHomeAfterDamage4);
  GoCbInFile(CbFleetGoHomeAfterDamage5);
  GoCbInFile(CbFleetGoHomeAfterDamage6);
  GoCbInFile(CbFleetGoHomeAfterDamage7);

  GoCbInFile(CbFleetGoHomeAfterVsek1);
  GoCbInFile(CbFleetGoHomeAfterVsek2);
  GoCbInFile(CbFleetGoHomeAfterVsek3);
  GoCbInFile(CbFleetGoHomeAfterVsek4);
  GoCbInFile(CbFleetGoHomeAfterVsek5);
  GoCbInFile(CbFleetGoHomeAfterVsek6);
  GoCbInFile(CbFleetGoHomeAfterVsek7);

  GoCbInFile(CbFleetFastRepair1);
  GoCbInFile(CbFleetFastRepair2);
  GoCbInFile(CbFleetFastRepair3);
  GoCbInFile(CbFleetFastRepair4);
  GoCbInFile(CbFleetFastRepair5);
  GoCbInFile(CbFleetFastRepair6);
  GoCbInFile(CbFleetFastRepair7);

  Writeln(f, IntToStr(SeFleetConvoy1.Value));
  Writeln(f, IntToStr(SeFleetConvoy2.Value));
  Writeln(f, IntToStr(SeFleetConvoy3.Value));
  Writeln(f, IntToStr(SeFleetConvoy4.Value));
  Writeln(f, IntToStr(SeFleetConvoy5.Value));
  Writeln(f, IntToStr(SeFleetConvoy6.Value));
  Writeln(f, IntToStr(SeFleetConvoy7.Value));

  for i:=0 to 6 do
   Writeln(f, LbSetRepair.Items[i]);

  GoCbInFile(CbAttackBaseInevent);
  Writeln(f,IntToStr(SeEndAssistentsHour.Value));
  Writeln(f,IntToStr(SeEndAssistentsMin.Value));
  GoCbInFile(CbGoHmeFleetByExit);

  Case RgSelectTypeWindow.ItemIndex of
    0:Writeln(f,'VEGA Conflict');
    1:Writeln(f,'KIXEYE.com - Mozilla Firefox');
    end;

  GoCbInFile(CbFleetGoHomeInSektor1);
  GoCbInFile(CbFleetGoHomeInSektor2);
  GoCbInFile(CbFleetGoHomeInSektor3);
  GoCbInFile(CbFleetGoHomeInSektor4);
  GoCbInFile(CbFleetGoHomeInSektor5);
  GoCbInFile(CbFleetGoHomeInSektor6);
  GoCbInFile(CbFleetGoHomeInSektor7);

  CloseFile(f);
end;
end;

procedure LoadFileSettingFleet (NameFile:String);
var
  f:TextFile;
  i,j:Byte;
  st:string;
begin
with FMain do
begin
  AssignFile(f,NameFile);
  Reset(f);
  Readln(f,st);
  CbFleetInAssistents1.Checked:=st='1';
  Readln(f,st);
  CbFleetInAssistents2.Checked:=st='1';
  Readln(f,st);
  CbFleetInAssistents3.Checked:=st='1';
  Readln(f,st);
  CbFleetInAssistents4.Checked:=st='1';
  Readln(f,st);
  Readln(f,st);
  CbFleetInAssistents5.Checked:=st='1';
  Readln(f,st);
  CbFleetInAssistents6.Checked:=st='1';
  Readln(f,st);
  CbFleetInAssistents7.Checked:=st='1';

  Readln(f,st);
  CbFleetInAttack1.Checked:=st='1';
  Readln(f,st);
  CbFleetInAttack2.Checked:=st='1';
  Readln(f,st);
  CbFleetInAttack3.Checked:=st='1';
  Readln(f,st);
  CbFleetInAttack4.Checked:=st='1';
  Readln(f,st);
  Readln(f,st);
  CbFleetInAttack5.Checked:=st='1';
  Readln(f,st);
  CbFleetInAttack6.Checked:=st='1';
  Readln(f,st);
  CbFleetInAttack7.Checked:=st='1';


  for i:=0 to 4 do
    begin
    For j:=0 to 6 do
      begin
      Readln(f,st);
      SgNomFleetVegaAttack.Cells[i,j]:=st;
      end;
    end;

  Readln(f,st);
  CbFleetGoHomeAfterFight1.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterFight2.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterFight3.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterFight4.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterFight5.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterFight6.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterFight7.Checked:=st='1';

  Readln(f,st);
  CbFleetGoHomeAfterDamage1.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterDamage2.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterDamage3.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterDamage4.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterDamage5.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterDamage6.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterDamage7.Checked:=st='1';

  Readln(f,st);
  CbFleetGoHomeAfterVsek1.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterVsek2.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterVsek3.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterVsek4.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterVsek5.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterVsek6.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeAfterVsek7.Checked:=st='1';

  Readln(f,st);
  CbFleetFastRepair1.Checked:=st='1';
  Readln(f,st);
  CbFleetFastRepair2.Checked:=st='1';
  Readln(f,st);
  CbFleetFastRepair3.Checked:=st='1';
  Readln(f,st);
  CbFleetFastRepair4.Checked:=st='1';
  Readln(f,st);
  CbFleetFastRepair5.Checked:=st='1';
  Readln(f,st);
  CbFleetFastRepair6.Checked:=st='1';
  Readln(f,st);
  CbFleetFastRepair7.Checked:=st='1';

  Readln(f,st);
  SeFleetConvoy1.Value:=StrToInt(st);
  Readln(f,st);
  SeFleetConvoy2.Value:=StrToInt(st);
  Readln(f,st);
  SeFleetConvoy3.Value:=StrToInt(st);
  Readln(f,st);
  SeFleetConvoy4.Value:=StrToInt(st);
  Readln(f,st);
  SeFleetConvoy5.Value:=StrToInt(st);
  Readln(f,st);
  SeFleetConvoy6.Value:=StrToInt(st);
  Readln(f,st);
  SeFleetConvoy7.Value:=StrToInt(st);

  LbSetRepair.Clear;
  for i:=0 to 6 do
    begin
    Readln(f, st);
    LbSetRepair.AddItem(st,LbSetRepair);
    end;

  Readln(f,st);
  CbAttackBaseInevent.Checked:=st='1';

  Readln(f,st);
  SeEndAssistentsHour.Value:=StrToInt(st);

  Readln(f,st);
  SeEndAssistentsMin.Value:=StrToInt(st);

  Readln(f,st);
  CbGoHmeFleetByExit.Checked:=st='1';

  Readln(f,st);
  if st='VEGA Conflict' then
    RgSelectTypeWindow.ItemIndex:=0;
   if st='KIXEYE.com - Mozilla Firefox' then
    RgSelectTypeWindow.ItemIndex:=1;

    Readln(f,st);
  CbFleetGoHomeInSektor1.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeInSektor2.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeInSektor3.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeInSektor4.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeInSektor5.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeInSektor6.Checked:=st='1';
  Readln(f,st);
  CbFleetGoHomeInSektor7.Checked:=st='1';

  CloseFile(f);
end;
end;

function ExecAndWait(const FileName,
                     Params: ShortString;
                     const WinState: Word): boolean; export; 
var 
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation; 
  CmdLine: ShortString;
begin

  CmdLine := '"' + Filename + '" ' + Params; 
  FillChar(StartInfo, SizeOf(StartInfo), #0); 
  with StartInfo do 
  begin 
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW; 
    wShowWindow := WinState; 
  end; 
  Result := CreateProcess(nil, PChar( String( CmdLine ) ), nil, nil, false, 
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, 
                          PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);

  if Result then 
  begin 
    WaitForSingleObject(ProcInfo.hProcess, INFINITE); 
    { Free the Handles } 
    CloseHandle(ProcInfo.hProcess); 
    CloseHandle(ProcInfo.hThread); 
  end; 
end;

procedure TFMain.BtSaveClick(Sender: TObject);
begin
If Sd1.Execute then
  begin
  SaveFileSettingFleet(Sd1.FileName,True);
  ShowMessage('Настройки флотов сохранены в файле - '+Sd1.FileName);
  end;
end;

procedure TFMain.BtLoadSettingFleetClick(Sender: TObject);
begin
If Od1.Execute then
  begin
  LoadFileSettingFleet(Od1.FileName);
  ShowMessage('Настройки флотов загружены из файла - '+Od1.FileName);
  end;
end;

procedure TFMain.BtSysSettingClick(Sender: TObject);
begin
FSysSetting.ShowModal;
end;

procedure TFMain.BtGoClick(Sender: TObject);
begin

if NomPlayer<>MaxInt then
begin
//SaveSysSetting('SysSettingAssistans.txt');
SaveFileSettingFleet('SettingFletInAssistans.txt',False);
ShellExecute(Handle, nil, 'VegaAssistExecution.exe', nil, nil, SW_SHOW);
Case RgSelectTypeWindow.ItemIndex of
  0:ShowMessage('Ассистент запущен перейдите к программе VegaConflict (Steam) в оконном режиме');
  1:ShowMessage('Ассистент запущен перейдите к программе VegaConflict (Mozilla FireFox) в оконном режиме');
  end;
end;
end;

procedure TFMain.BtTimersClick(Sender: TObject);
begin
FTimer.ShowModal;
end;

procedure TFMain.FormActivate(Sender: TObject);
begin
KolPlayer:=11;
 // BtGo.Enabled:=false;

end;

procedure TFMain.BtAutorizationsClick(Sender: TObject);
begin
ShowMessage('Включите VegaConflict в оконном режиме и нажмите ОК. Программа авторизации считает ID пользователя. Не выходите из Vega Conflict до нажатия кнопки выход.');
SaveFileSettingFleet('SettingFletInAssistans.txt',False);
ExecAndWait(ExtractFilePath(Application.ExeName)+'VgIDGo.exe', '', SW_SHOWNORMAL);
//DeleteFile('SettingFletInAssistans.txt');
NomPlayer:=GoProverka;

  BtGo.Enabled:=True;
case NomPlayer of
  0:ShowMessage('Привет Kalengul');
  1:ShowMessage('Привет SirBonifaciy');
  2:ShowMessage('Привет Gaminator');
  3:ShowMessage('Привет sayAr3s');
  4:ShowMessage('Привет Vootshi');
  5:ShowMessage('Привет Chron');
  6:ShowMessage('Привет sayAr3s');
  7:ShowMessage('Привет Art');
  8:ShowMessage('Привет Maximus');
  9:ShowMessage('Привет Zakardonec');
  10:ShowMessage('Привет Shelldm');
else
  begin
  BtGo.Enabled:=false;
  ShowMessage('Незарегистрированный пользователь');
  end;
  end;
end;

end.
