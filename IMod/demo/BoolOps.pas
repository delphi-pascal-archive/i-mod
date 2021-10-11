unit BoolOps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImageAndMore, ExtCtrls, StdCtrls;

type
  TBoolOpForm = class(TForm)
    OperationBox: TRadioGroup;
    ConstantGrpBox: TGroupBox;
    ColorShape: TShape;
    ChooseColorBtn: TButton;
    PrevLabel: TLabel;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    PreviewBtn: TButton;
    PreviewGrpBox: TGroupBox;
    AfterImg: TImage;
    BeforeImg: TImage;
    BeforeLabel: TLabel;
    AfterLabel: TLabel;
    ColorDialog: TColorDialog;
    procedure CancelBtnClick(Sender: TObject);
    procedure ChooseColorBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  BoolOpForm: TBoolOpForm;

implementation

uses Main;

{$R *.dfm}

procedure TBoolOpForm.CancelBtnClick(Sender: TObject);
begin
 Close; // On ferme
end;

procedure TBoolOpForm.ChooseColorBtnClick(Sender: TObject);
begin
 if ColorDialog.Execute then ColorShape.Brush.Color := ColorDialog.Color;
end;       // On change la couleur constante

procedure TBoolOpForm.PreviewBtnClick(Sender: TObject);
Var
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create; // On crée le bitmap
 Bmp.Assign(MainForm.Img.Picture.Bitmap);  // On lui donne le bitmap de l'image principale
 BeforeImg.Picture.Bitmap.Assign(Bmp); // Image "avant"
 AfterImg.Picture.Bitmap.Assign(Bmp); // Image "après"
 case OperationBox.ItemIndex of
 0: MainForm.Img.Blend_Const(Bmp, ColorShape.Brush.Color, AfterImg.Picture.Bitmap);
 1: MainForm.Img.XOR_Blend_Const(Bmp, ColorShape.Brush.Color, AfterImg.Picture.Bitmap);
 2: MainForm.Img.OR_Blend_Const(Bmp, ColorShape.Brush.Color, AfterImg.Picture.Bitmap);
 3: MainForm.Img.AND_Blend_Const(Bmp, ColorShape.Brush.Color, AfterImg.Picture.Bitmap);
 end;         // Selon le type d'opération qu'il veut faire, on les effectue (sur le bitmap de prévisualisation)
 Bmp.Free; // On libère le bitmap
end;

procedure TBoolOpForm.ApplyBtnClick(Sender: TObject);
Var
 Bmp: TBitmap;
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap);  // Sauvegarde de l'image
 Bmp := TBitmap.Create;  // On crée
 Bmp.Assign(MainForm.Img.Picture.Bitmap);  // On assigne
 case OperationBox.ItemIndex of
 0: MainForm.Img.Blend_Const(Bmp, ColorShape.Brush.Color, MainForm.Img.Picture.Bitmap);
 1: MainForm.Img.XOR_Blend_Const(Bmp, ColorShape.Brush.Color, MainForm.Img.Picture.Bitmap);
 2: MainForm.Img.OR_Blend_Const(Bmp, ColorShape.Brush.Color, MainForm.Img.Picture.Bitmap);
 3: MainForm.Img.AND_Blend_Const(Bmp, ColorShape.Brush.Color, MainForm.Img.Picture.Bitmap);
 end;             // On effectue les opérations
 Bmp.Free;   // On libère
 Close; // On ferme
end;

procedure TBoolOpForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 ConstantGrpBox.DoubleBuffered := True;   // Doublebuffered
 PreviewGrpBox.DoubleBuffered := True;
 OperationBox.DoubleBuffered := True;
end;

end.
