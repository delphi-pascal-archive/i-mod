unit SeuilG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSeuilGForm = class(TForm)
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
  SeuilGForm: TSeuilGForm;

implementation

uses Main;

{$R *.dfm}

procedure TSeuilGForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True; // Doublebuffered
end;

procedure TSeuilGForm.CancelBtnClick(Sender: TObject);
begin
 Close; // On annule
end;

procedure TSeuilGForm.ApplyBtnClick(Sender: TObject);
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap); // On sauvegarde
 MainForm.Img.G_Threshold(MinValue.Value, MaxValue.Value, MainForm.Img.Picture.Bitmap);
 Close;      // On fixe le seuil vert, et on ferme
end;

end.
