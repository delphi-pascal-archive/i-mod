unit RGBOp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TRGBOpForm = class(TForm)
    AddRGBGrpBox: TGroupBox;
    AddRPanel: TPanel;
    AddRBar: TTrackBar;
    AddGPanel: TPanel;
    AddGBar: TTrackBar;
    AddBPanel: TPanel;
    AddBBar: TTrackBar;
    RetreiveRGBGrpBox: TGroupBox;
    RetRPanel: TPanel;
    RetRBar: TTrackBar;
    RetGPanel: TPanel;
    RetGBar: TTrackBar;
    RetBPanel: TPanel;
    RetBBar: TTrackBar;
    PrevGrpBox: TGroupBox;
    AfterImg: TImage;
    BeforeImg: TImage;
    BeforeLabel: TLabel;
    AfterLabel: TLabel;
    ApplyBtn: TButton;
    PreviewBtn: TButton;
    CloseBtn: TButton;
    AddRLabel: TLabel;
    AddGLabel: TLabel;
    AddBLabel: TLabel;
    RetRLabel: TLabel;
    RetGLabel: TLabel;
    RetBLabel: TLabel;
    procedure CloseBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeInfoLabels(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  RGBOpForm: TRGBOpForm;

implementation

uses Main;

{$R *.dfm}

procedure TRGBopForm.ChangeInfoLabels(Sender: TObject);
begin
 if Sender is TTrackBar then
  case TTrackBar(Sender).Tag of // Bel exemple des Sender + Tag
  1: AddRLabel.Caption := IntToStr(TTrackBar(Sender).Position);
  2: AddGLabel.Caption := IntToStr(TTrackBar(Sender).Position);
  3: AddBLabel.Caption := IntToStr(TTrackBar(Sender).Position);
  4: RetRLabel.Caption := IntToStr(TTrackBar(Sender).Position);
  5: RetGLabel.Caption := IntToStr(TTrackBar(Sender).Position);
  6: RetBLabel.Caption := IntToStr(TTrackBar(Sender).Position);
  end;      // Selon le tag des trackbar, on change le label correspondant
end;

procedure TRGBOpForm.CloseBtnClick(Sender: TObject);
begin
 Close; // On annule
end;

procedure TRGBOpForm.PreviewBtnClick(Sender: TObject);
Var
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create; // Prévisualisation
 Bmp.Assign(MainForm.Img.Picture.Bitmap);
 BeforeImg.Picture.Bitmap.Assign(Bmp);
 AfterImg.Picture.Bitmap.Assign(Bmp);
 if AddRBar.Position <> 0 then MainForm.Img.AddRed(AddRBar.Position, AfterImg.Picture.Bitmap);
 if AddGBar.Position <> 0 then MainForm.Img.AddGreen(AddGBar.Position, AfterImg.Picture.Bitmap);
 if AddBBar.Position <> 0 then MainForm.Img.AddBlue(AddBBar.Position, AfterImg.Picture.Bitmap); // On ajoute, on annule, selon les valeurs
 if RetRBar.Position <> 0 then MainForm.Img.RetreiveRed(RetRBar.Position, AfterImg.Picture.Bitmap);
 if RetGBar.Position <> 0 then MainForm.Img.RetreiveGreen(RetGBar.Position, AfterImg.Picture.Bitmap);
 if RetBBar.Position <> 0 then MainForm.Img.RetreiveBlue(RetBBar.Position, AfterImg.Picture.Bitmap);
 Bmp.Free; // On libère
end;

procedure TRGBOpForm.ApplyBtnClick(Sender: TObject);
Var
 Bmp: TBitmap;
begin
  BackupImg.Assign(MainForm.Img.Picture.Bitmap);
 Bmp := TBitmap.Create; // On sauvegarde, on crée le bitmap tampon
 Bmp.Assign(MainForm.Img.Picture.Bitmap);
 if AddRBar.Position <> 0 then MainForm.Img.AddRed(AddRBar.Position, Bmp);
 if AddGBar.Position <> 0 then MainForm.Img.AddGreen(AddGBar.Position, Bmp);
 if AddBBar.Position <> 0 then MainForm.Img.AddBlue(AddBBar.Position, Bmp); // On ajoute, on annule, selon les valeurs
 if RetRBar.Position <> 0 then MainForm.Img.RetreiveRed(RetRBar.Position, Bmp);
 if RetGBar.Position <> 0 then MainForm.Img.RetreiveGreen(RetGBar.Position, Bmp);
 if RetBBar.Position <> 0 then MainForm.Img.RetreiveBlue(RetBBar.Position, Bmp);
 MainForm.Img.Picture.Bitmap.Assign(Bmp); // On affiche les changements
 Bmp.Free;  // On libère
 Close;  // On ferme
end;

procedure TRGBOpForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 AddRGBGrpBox.DoubleBuffered := True;
 RetreiveRGBGrpBox.DoubleBuffered := True;
 AddRPanel.DoubleBuffered := True;
 AddGPanel.DoubleBuffered := True;
 AddBPanel.DoubleBuffered := True;
 RetRPanel.DoubleBuffered := True;
 RetGPanel.DoubleBuffered := True;
 RetBPanel.DoubleBuffered := True;
 PrevGrpBox.DoubleBuffered := True;
end;

end.
