unit SatForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TSaturForm = class(TForm)
    SaturGrpBox: TGroupBox;
    MinLabel: TLabel;
    MaxLabel: TLabel;
    SaturValue: TTrackBar;
    SaturValueLabel: TLabel;
    CancelBtn: TButton;
    ApplyBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SaturValueChange(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  SaturForm: TSaturForm;

implementation

uses Main;

{$R *.dfm}

procedure TSaturForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True; // Doublebuffered
 SaturGrpBox.DoubleBuffered := True;
end;

procedure TSaturForm.SaturValueChange(Sender: TObject);
begin
 SaturValueLabel.Caption := IntToStr(SaturValue.Position);
end;   // On change le label d'information

procedure TSaturForm.CancelBtnClick(Sender: TObject);
begin
 Close;  // On annule
end;

procedure TSaturForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);
 if SaturValue.Position > 0 then MainForm.Img.Add_Saturation(SaturValue.Position, MainForm.Img.Picture.Bitmap);
 if SaturValue.Position < 0 then MainForm.Img.Retreive_Saturation(SaturValue.Position * -1, MainForm.Img.Picture.Bitmap);
 Close;  // Si supérieur à 0, on ajoute saturation, sinon on enlève
end;

end.
