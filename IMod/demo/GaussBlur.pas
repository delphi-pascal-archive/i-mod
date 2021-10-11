unit GaussBlur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TGaussForm = class(TForm)
    ApplyBtn: TButton;
    CancelBtn: TButton;
    InfoLabel: TLabel;
    GaussValue: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  GaussForm: TGaussForm;

implementation

uses Main;

{$R *.dfm}

procedure TGaussForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;  // Doublebuffered
end;

procedure TGaussForm.CancelBtnClick(Sender: TObject);
begin
 Close;   // On ferme
end;

procedure TGaussForm.ApplyBtnClick(Sender: TObject);
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap); // On sauvegarde
 MainForm.Img.Gaussian_Blur(GaussValue.Value, MainForm.Img.Picture.Bitmap);
 Close;  // On effectue et on ferme
end;

end.
