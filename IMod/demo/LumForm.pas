unit LumForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TLumiForm = class(TForm)
    LumGrpBox: TGroupBox;
    MinLabel: TLabel;
    MaxLabel: TLabel;
    LumValue: TTrackBar;
    LumValueInfo: TLabel;
    CancelBtn: TButton;
    ApplyBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure LumValueChange(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  LumiForm: TLumiForm;

implementation

uses Main;

{$R *.dfm}

procedure TLumiForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;  // Doublebuffered
 LumGrpBox.DoubleBuffered := True;
end;

procedure TLumiForm.LumValueChange(Sender: TObject);
begin
 LumValueInfo.Caption := IntToStr(LumValue.Position);
end;           // Quand on bouge la trackbar, on affiche à combien on est

procedure TLumiForm.CancelBtnClick(Sender: TObject);
begin
 Close; // On annule
end;

procedure TLumiForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);
 if LumValue.Position > 0 then MainForm.Img.AddLight(LumValue.Position, MainForm.Img.Picture.Bitmap);
 if LumValue.Position < 0 then MainForm.Img.AddDarkness(LumValue.Position * -1, MainForm.Img.Picture.Bitmap);
 Close; // Si supérieur à 0 on ajoute, sinon on en enlève
end;

end.
