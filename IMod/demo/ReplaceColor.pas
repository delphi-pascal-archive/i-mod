unit ReplaceColor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TReplaceForm = class(TForm)
    ColorDialog: TColorDialog;
    ColorToChangeGrpBox: TGroupBox;
    ColorShape1: TShape;
    ChooseColor1Btn: TButton;
    ChangeColorGrpBox: TGroupBox;
    ColorShape2: TShape;
    ChooseColor2Btn: TButton;
    ToleranceLabel: TLabel;
    ToleranceValue: TSpinEdit;
    ApplyBtn: TButton;
    CloseBtn: TButton;
    procedure ChooseColor1BtnClick(Sender: TObject);
    procedure ChooseColor2BtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  ReplaceForm: TReplaceForm;

implementation

uses Main;

{$R *.dfm}

procedure TReplaceForm.ChooseColor1BtnClick(Sender: TObject);
begin
 if ColorDialog.Execute then ColorShape1.Brush.Color := ColorDialog.Color;
end;      // On change la couleur à remplacer

procedure TReplaceForm.ChooseColor2BtnClick(Sender: TObject);
begin
 if ColorDialog.Execute then ColorShape2.Brush.Color := ColorDialog.Color;
end;   // On change la couleur de remplacement

procedure TReplaceForm.CloseBtnClick(Sender: TObject);
begin
 Close; // On ferme
end;

procedure TReplaceForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);  // On sauvegarde
 MainForm.Img.ReplaceColors(MainForm.Img.Picture.Bitmap, ColorShape1.Brush.Color, ColorShape2.Brush.Color, ToleranceValue.Value);
 Close;  // On effectue et on ferme
end;

procedure TReplaceForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 ColorToChangeGrpBox.DoubleBuffered := True;
 ChangeColorGrpBox.DoubleBuffered := True; // Doublebuffered
end;

end.
