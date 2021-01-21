unit USysSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFSysSetting = class(TForm)
    GbSysSetting: TGroupBox;
    LeX0: TLabeledEdit;
    LeY0: TLabeledEdit;
    LeX1: TLabeledEdit;
    LeY1: TLabeledEdit;
    LeY0Zag: TLabeledEdit;
    Gb5: TGroupBox;
    LeSmeshFleet1: TLabeledEdit;
    LeSmeshLeftfleet: TLabeledEdit;
    LeSmeshRightIconFleet: TLabeledEdit;
    LeWeightElSheep: TLabeledEdit;
    LeWeightSostavFleet: TLabeledEdit;
    Gb6: TGroupBox;
    LeXOstanDvish: TLabeledEdit;
    LeYOstanDvish: TLabeledEdit;
    LeXDvish2: TLabeledEdit;
    LeYDvish2: TLabeledEdit;
    LeXBase: TLabeledEdit;
    LeYBase: TLabeledEdit;
    LeXRepair: TLabeledEdit;
    LeYRepair: TLabeledEdit;
    LeXFight: TLabeledEdit;
    LeYFight: TLabeledEdit;
    LeXConnect1: TLabeledEdit;
    LeXConnect2: TLabeledEdit;
    LeYConnect1: TLabeledEdit;
    LeYConnect2: TLabeledEdit;
    LeX1ConnectFly: TLabeledEdit;
    LeX2ConnectFly: TLabeledEdit;
    LeX3ConnectFly: TLabeledEdit;
    LeY1ConnectFly: TLabeledEdit;
    LeY2ConnectFly: TLabeledEdit;
    GbBtn: TGroupBox;
    LeXOk: TLabeledEdit;
    LeYOk: TLabeledEdit;
    LeXLeftBtn: TLabeledEdit;
    LeopBtn: TLabeledEdit;
    LeHeigthBtn: TLabeledEdit;
    LeXBaseBtn: TLabeledEdit;
    LeYBaseBtn: TLabeledEdit;
    LeXSpaceBtn: TLabeledEdit;
    LeYSpaceBtn: TLabeledEdit;
    GbOtmetki: TGroupBox;
    LeWeigthOtm: TLabeledEdit;
    LeXOtmBtn: TLabeledEdit;
    LeYOtmBtn: TLabeledEdit;
    LeXOtmechennieBtn: TLabeledEdit;
    GbAttackOnBase: TGroupBox;
    LeXDelAttackOnBase: TLabeledEdit;
    LeYDelAttackonBase: TLabeledEdit;
    LeXRepainAttackOnBase: TLabeledEdit;
    LeYRepairAttackOnBase: TLabeledEdit;
    GbRepair: TGroupBox;
    LeXYSheepRepair: TLabeledEdit;
    LeRastSheeprepair: TLabeledEdit;
    LeXDelInFleet: TLabeledEdit;
    LeYDelInFleet: TLabeledEdit;
    LeXRepairBtn: TLabeledEdit;
    LeYRepairBtn: TLabeledEdit;
    LeXFastRepairBtn: TLabeledEdit;
    LeYFastRepairBtn: TLabeledEdit;
    LeXSearchFastRepairBtn: TLabeledEdit;
    LeYSearchFastRepairBtn: TLabeledEdit;
    LeXLastSheepBtn: TLabeledEdit;
    LeYLastSheepBtn: TLabeledEdit;
    LeYLastSheep: TLabeledEdit;
    LeXLastSheep: TLabeledEdit;
    LeXKrestBtn: TLabeledEdit;
    LeYKrestBtn: TLabeledEdit;
    LeXSheepInVerf: TLabeledEdit;
    LeYSheepInVerf: TLabeledEdit;
    btnSave: TSpeedButton;
    btnLoad: TSpeedButton;
    BtGoSysSettinInStandartFile: TButton;
    GbParLevelFleet: TGroupBox;
    LeYFirstNumberLevelBtn: TLabeledEdit;
    LeXFirstNumberLevelBtn: TLabeledEdit;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtGoSysSettinInStandartFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


procedure SaveSysSetting(NameFile:string);
var
  FSysSetting: TFSysSetting;

implementation

{$R *.dfm}

uses UMain;

procedure SaveSysSetting(NameFile:string);
var
  f:TextFile;
begin
with FSysSetting do
begin
AssignFile(f,NameFile);
Rewrite(f);
Writeln(f,LeX0.Text);
Writeln(f,LeY0.Text);
Writeln(f,LeX1.Text);
Writeln(f,LeY1.Text);
Writeln(f,LeY0Zag.Text);
Writeln(f,LeSmeshFleet1.Text);
Writeln(f,LeSmeshLeftfleet.Text);
Writeln(f,LeSmeshRightIconFleet.Text);
Writeln(f,LeWeightElSheep.Text);
Writeln(f,LeWeightSostavFleet.Text);
Writeln(f,LeXOstanDvish.Text);
Writeln(f,LeYOstanDvish.Text);
Writeln(f,LeXDvish2.Text);
Writeln(f,LeYDvish2.Text);
Writeln(f,LeXBase.Text);
Writeln(f,LeYBase.Text);
Writeln(f,LeXRepair.Text);
Writeln(f,LeYRepair.Text);
Writeln(f,LeXFight.Text);
Writeln(f,LeYFight.Text);
Writeln(f,LeXConnect1.Text);
Writeln(f,LeYConnect1.Text);
Writeln(f,LeXConnect2.Text);
Writeln(f,LeYConnect2.Text);
Writeln(f,LeX1ConnectFly.Text);
Writeln(f,LeY1ConnectFly.Text);
Writeln(f,LeX2ConnectFly.Text);
Writeln(f,LeY2ConnectFly.Text);
Writeln(f,LeX3ConnectFly.Text);
Writeln(f,LeXOk.Text);
Writeln(f,LeYOk.Text);
Writeln(f,LeXLeftBtn.Text);
Writeln(f,LeopBtn.Text);
Writeln(f,LeHeigthBtn.Text);
Writeln(f,LeXBaseBtn.Text);
Writeln(f,LeYBaseBtn.Text);
Writeln(f,LeXSpaceBtn.Text);
Writeln(f,LeYSpaceBtn.Text);
Writeln(f,LeXOtmBtn.Text);
Writeln(f,LeYOtmBtn.Text);
Writeln(f,LeXOtmechennieBtn.Text);
Writeln(f,LeWeigthOtm.Text);
Writeln(f,LeXDelAttackOnBase.Text);
Writeln(f,LeYDelAttackonBase.Text);
Writeln(f,LeXRepainAttackOnBase.Text);
Writeln(f,LeYRepairAttackOnBase.Text);
Writeln(f,LeXYSheepRepair.Text);
Writeln(f,LeRastSheeprepair.Text);
Writeln(f,LeXDelInFleet.Text);
Writeln(f,LeYDelInFleet.Text);
Writeln(f,LeXRepairBtn.Text);
Writeln(f,LeYRepairBtn.Text);
Writeln(f,LeXFastRepairBtn.Text);
Writeln(f,LeYFastRepairBtn.Text);
Writeln(f,LeXSearchFastRepairBtn.Text);
Writeln(f,LeYSearchFastRepairBtn.Text);
Writeln(f,LeXLastSheepBtn.Text);
Writeln(f,LeYLastSheepBtn.Text);
Writeln(f,LeXLastSheep.Text);
Writeln(f,LeYLastSheep.Text);
Writeln(f,LeXKrestBtn.Text);
Writeln(f,LeYKrestBtn.Text);
Writeln(f,LeXSheepInVerf.Text);
Writeln(f,LeYSheepInVerf.Text);
Writeln(f,LeXFirstNumberLevelBtn.Text);
Writeln(f,LeYFirstNumberLevelBtn.Text);
CloseFile(f);
end;
end;

procedure LoadSysSetting(NameFile:string);
var
  f:TextFile;
  st:string;
begin
with FSysSetting do
begin
AssignFile(f,NameFile);
Reset(f);
Readln(f,st);
LeX0.Text:=st;
Readln(f,st);
LeY0.Text:=st;
Readln(f,st);
LeX1.Text:=st;
Readln(f,st);
LeY1.Text:=st;
Readln(f,st);
LeY0Zag.Text:=st;
Readln(f,st);
LeSmeshFleet1.Text:=st;
Readln(f,st);
LeSmeshLeftfleet.Text:=st;
Readln(f,st);
LeSmeshRightIconFleet.Text:=st;
Readln(f,st);
LeWeightElSheep.Text:=st;
Readln(f,st);
LeWeightSostavFleet.Text:=st;
Readln(f,st);
LeXOstanDvish.Text:=st;
Readln(f,st);
LeYOstanDvish.Text:=st;
Readln(f,st);
LeXDvish2.Text:=st;
Readln(f,st);
LeYDvish2.Text:=st;
Readln(f,st);
LeXBase.Text:=st;
Readln(f,st);
LeYBase.Text:=st;
Readln(f,st);
LeXRepair.Text:=st;
Readln(f,st);
LeYRepair.Text:=st;
Readln(f,st);
LeXFight.Text:=st;
Readln(f,st);
LeYFight.Text:=st;
Readln(f,st);
LeXConnect1.Text:=st;
Readln(f,st);
LeYConnect1.Text:=st;
Readln(f,st);
LeXConnect2.Text:=st;
Readln(f,st);
LeYConnect2.Text:=st;
Readln(f,st);
LeX1ConnectFly.Text:=st;
Readln(f,st);
LeY1ConnectFly.Text:=st;
Readln(f,st);
LeX2ConnectFly.Text:=st;
Readln(f,st);
LeY2ConnectFly.Text:=st;
Readln(f,st);
LeX3ConnectFly.Text:=st;
Readln(f,st);
LeXOk.Text:=st;
Readln(f,st);
LeYOk.Text:=st;
Readln(f,st);
LeXLeftBtn.Text:=st;
Readln(f,st);
LeopBtn.Text:=st;
Readln(f,st);
LeHeigthBtn.Text:=st;
Readln(f,st);
LeXBaseBtn.Text:=st;
Readln(f,st);
LeYBaseBtn.Text:=st;
Readln(f,st);
LeXSpaceBtn.Text:=st;
Readln(f,st);
LeYSpaceBtn.Text:=st;
Readln(f,st);
LeXOtmBtn.Text:=st;
Readln(f,st);
LeYOtmBtn.Text:=st;
Readln(f,st);
LeXOtmechennieBtn.Text:=st;
Readln(f,st);
LeWeigthOtm.Text:=st;
Readln(f,st);
LeXDelAttackOnBase.Text:=st;
Readln(f,st);
LeYDelAttackonBase.Text:=st;
Readln(f,st);
LeXRepainAttackOnBase.Text:=st;
Readln(f,st);
LeYRepairAttackOnBase.Text:=st;
Readln(f,st);
LeXYSheepRepair.Text:=st;
Readln(f,st);
LeRastSheeprepair.Text:=st;
Readln(f,st);
LeXDelInFleet.Text:=st;
Readln(f,st);
LeYDelInFleet.Text:=st;
Readln(f,st);
LeXRepairBtn.Text:=st;
Readln(f,st);
LeYRepairBtn.Text:=st;
Readln(f,st);
LeXFastRepairBtn.Text:=st;
Readln(f,st);
LeYFastRepairBtn.Text:=st;
Readln(f,st);
LeXSearchFastRepairBtn.Text:=st;
Readln(f,st);
LeYSearchFastRepairBtn.Text:=st;
Readln(f,st);
LeXLastSheepBtn.Text:=st;
Readln(f,st);
LeYLastSheepBtn.Text:=st;
Readln(f,st);
LeXLastSheep.Text:=st;
Readln(f,st);
LeYLastSheep.Text:=st;
Readln(f,st);
LeXKrestBtn.Text:=st;
Readln(f,st);
LeYKrestBtn.Text:=st;
Readln(f,st);
LeXSheepInVerf.Text:=st;
Readln(f,st);
LeYSheepInVerf.Text:=st;
Readln(f,st);
LeXFirstNumberLevelBtn.Text:=st;
Readln(f,st);
LeYFirstNumberLevelBtn.Text:=st;

CloseFile(f);
end;
end;

procedure TFSysSetting.btnLoadClick(Sender: TObject);
begin
If FMain.Od1.Execute then
  begin
  LoadSysSetting(FMain.Od1.FileName);
  ShowMessage('Системные настройки загружены из файла - '+FMain.Od1.FileName);
  end;
end;

procedure TFSysSetting.btnSaveClick(Sender: TObject);
begin
If FMain.Sd1.Execute then
  begin
  SaveSysSetting(FMain.Sd1.FileName);
  ShowMessage('Системные настройки сохранены в файле - '+FMain.Sd1.FileName);
  end;
end;

procedure TFSysSetting.BtGoSysSettinInStandartFileClick(Sender: TObject);
begin
SaveSysSetting('SysSettingAssistans.txt');
ShowMessage('Системные настройки сохранены в файле - SysSettingAssistans.txt');
end;

end.
