unit Reconst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TReconstForm = class(TForm)
    ColorDialog: TColorDialog;
    ColorGrpBox: TGroupBox;
    ColorShape: TShape;
    ChooseColorBtn: TButton;
    ToleranceLabel: TLabel;
    ToleranceValue: TSpinEdit;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    procedure ChooseColorBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  ReconstForm: TReconstForm;

implementation

uses Main;

{$R *.dfm}

procedure TReconstForm.ChooseColorBtnClick(Sender: TObject);
begin
 if ColorDialog.Execute then ColorShape.Brush.Color := ColorDialog.Color;
end;       // On change la couleur à reconstruire

procedure TReconstForm.CancelBtnClick(Sender: TObject);
begin
 Close;  // On annule
end;

procedure TReconstForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);  // On met en sauvegarde
 MainForm.Img.ToleranceFill(MainForm.Img.Picture.Bitmap, ColorShape.Brush.Color, ToleranceValue.Value);
 Close; // On effectue et on ferme
end;

procedure TReconstForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;  // Doublebuffered
 ColorGrpBox.DoubleBuffered := True;
end;

end.
