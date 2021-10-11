unit IsColor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TIsColorForm = class(TForm)
    ColorDialog: TColorDialog;
    FindColorGrpBox: TGroupBox;
    ColorShape: TShape;
    ChooseColorBtn: TButton;
    ToleranceLabel: TLabel;
    ToleranceValue: TSpinEdit;
    CloseBtn: TButton;
    ResultLabel: TLabel;
    procedure ChooseColorBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FindColor(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  IsColorForm: TIsColorForm;

implementation

uses Main;

{$R *.dfm}

procedure TIsColorForm.FindColor(Sender: TObject);
Var
 R, G, B: Byte;  // Pour l'inversion des couleurs
begin
 R := GetRValue(ColorShape.Brush.Color);
 G := GetGValue(ColorShape.Brush.Color);
 B := GetBValue(ColorShape.Brush.Color); // Pour que le label soit bien visible (imaginez noir sur noir ^^)
 ResultLabel.Font.Color := rgb(255 - R, 255 - G, 255 - B);

 case MainForm.Img.IsColorPresent(MainForm.Img.Picture.Bitmap, ColorShape.Brush.Color, ToleranceValue.Value) of
 True: ResultLabel.Caption := 'Cette couleur a été trouvée';
 False: ResultLabel.Caption := 'Cette couleur n''a pas été trouvée';
 end;      // Si elle a été trouvée ou pas
end;

procedure TIsColorForm.ChooseColorBtnClick(Sender: TObject);
begin
 if ColorDialog.Execute then
 begin
 ColorShape.Brush.Color := ColorDialog.Color;
 FindColor(self); // On change la couleur, et on cherche
 end;
end;

procedure TIsColorForm.CloseBtnClick(Sender: TObject);
begin
 Close;   // On ferme
end;

procedure TIsColorForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;    // Doublebuffer
 FindColorGrpBox.DoubleBuffered := True;
end;

end.
