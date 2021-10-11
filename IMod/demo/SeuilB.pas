unit SeuilB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSeuilBForm = class(TForm)
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
  SeuilBForm: TSeuilBForm;

implementation

uses Main;

{$R *.dfm}

procedure TSeuilBForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;   // Doublebuffered
end;

procedure TSeuilBForm.CancelBtnClick(Sender: TObject);
begin
 Close; // On annule
end;

procedure TSeuilBForm.ApplyBtnClick(Sender: TObject);
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap); // On sauvegarde
 MainForm.Img.B_Threshold(MinValue.Value, MaxValue.Value, MainForm.Img.Picture.Bitmap);
 Close;  // On fixe le seuil
end;

end.
