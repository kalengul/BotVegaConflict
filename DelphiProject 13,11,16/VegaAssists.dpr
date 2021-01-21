program VegaAssists;

uses
  Forms,
  UMain in 'UMain.pas' {FMain},
  USysSetting in '..\Распознование\USysSetting.pas' {FSysSetting};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSysSetting, FSysSetting);
  Application.Run;
end.
