program VegaAssists;

uses
  Forms,
  UMain in 'UMain.pas' {FMain},
  USysSetting in 'USysSetting.pas' {FSysSetting},
  UTimer in 'UTimer.pas' {FTimer},
  UZash in 'UZash.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSysSetting, FSysSetting);
  Application.CreateForm(TFTimer, FTimer);
  Application.Run;
end.
