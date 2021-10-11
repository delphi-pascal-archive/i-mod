unit SeuilR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSeuilRForm = class(TForm)
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
  SeuilRForm: TSeuilRForm;

implementation

uses Main;

{$R *.dfm}

procedure TSeuilRForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True; // On doublebuffered
end;

procedure TSeuilRForm.CancelBtnClick(Sender: TObject);
begin
 Close;  // On annule
end;

procedure TSeuilRForm.ApplyBtnClick(Sender: TObject);
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap); // On sauvegarde
 MainForm.Img.R_Threshold(MinValue.Value, MaxValue.Value, MainForm.Img.Picture.Bitmap);
 Close;  // On fixe le seuil rouge et on ferme
end;

end.
