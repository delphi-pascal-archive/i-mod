program RetoucheExe;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  BoolOps in 'BoolOps.pas' {BoolOpForm},
  ImgShow in 'ImgShow.pas' {ImgShowForm},
  RGBOp in 'RGBOp.pas' {RGBOpForm},
  GaussBlur in 'GaussBlur.pas' {GaussForm},
  ColorPrec in 'ColorPrec.pas' {PrecForm},
  BinThreshold in 'BinThreshold.pas' {BinarizeForm},
  LumForm in 'LumForm.pas' {LumiForm},
  SatForm in 'SatForm.pas' {SaturForm},
  ReplaceColor in 'ReplaceColor.pas' {ReplaceForm},
  Reconst in 'Reconst.pas' {ReconstForm},
  SeuilRGB in 'SeuilRGB.pas' {SeuilRGBForm},
  SeuilR in 'SeuilR.pas' {SeuilRForm},
  SeuilG in 'SeuilG.pas' {SeuilGForm},
  SeuilB in 'SeuilB.pas' {SeuilBForm},
  Rotation in 'Rotation.pas' {RotationForm},
  IsColor in 'IsColor.pas' {IsColorForm},
  About in 'About.pas' {AboutBox};

{$R *.res}
{$R WindowsXP.RES}

begin
  Application.Initialize;
  Application.Title := 'IMod';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBoolOpForm, BoolOpForm);
  Application.CreateForm(TImgShowForm, ImgShowForm);
  Application.CreateForm(TRGBOpForm, RGBOpForm);
  Application.CreateForm(TGaussForm, GaussForm);
  Application.CreateForm(TPrecForm, PrecForm);
  Application.CreateForm(TBinarizeForm, BinarizeForm);
  Application.CreateForm(TLumiForm, LumiForm);
  Application.CreateForm(TSaturForm, SaturForm);
  Application.CreateForm(TReplaceForm, ReplaceForm);
  Application.CreateForm(TReconstForm, ReconstForm);
  Application.CreateForm(TSeuilRGBForm, SeuilRGBForm);
  Application.CreateForm(TSeuilRForm, SeuilRForm);
  Application.CreateForm(TSeuilGForm, SeuilGForm);
  Application.CreateForm(TSeuilBForm, SeuilBForm);
  Application.CreateForm(TRotationForm, RotationForm);
  Application.CreateForm(TIsColorForm, IsColorForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
