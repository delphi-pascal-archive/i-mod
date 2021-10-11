unit SeuilRGB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSeuilRGBForm = class(TForm)
    ApplyBtn: TButton;
    CancelBtn: TButton;
    MinLabel: TLabel;
    MinValue: TSpinEdit;
    MaxLabel: TLabel;
    MaxValue: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  SeuilRGBForm: TSeuilRGBForm;

implementation

uses Main;

{$R *.dfm}

procedure TSeuilRGBForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True; // Doublebuffer
end;

procedure TSeuilRGBForm.CancelBtnClick(Sender: TObject);
begin
 Close;  // On annule
end;

procedure TSeuilRGBForm.ApplyBtnClick(Sender: TObject);
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap);  // On sauvegarde
 MainForm.Img.RGB_Threshold(MinValue.Value, MaxValue.Value, MainForm.Img.Picture.Bitmap);
 Close;  // On fixe le seuil RGB (global) et on ferme
end;

end.
