unit Rotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TRotationForm = class(TForm)
    DegreeGrpBox: TRadioGroup;
    DirectionGrpBox: TRadioGroup;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  RotationForm: TRotationForm;

implementation

uses Main;

{$R *.dfm}

procedure TRotationForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 DegreeGrpBox.DoubleBuffered := True; // Doublebuffered
 DirectionGrpBox.DoubleBuffered := True;
end;

procedure TRotationForm.CancelBtnClick(Sender: TObject);
begin
 Close;  // On annule
end;

procedure TRotationForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);
 case DirectionGrpBox.ItemIndex of
 0: // Horaire
  case DegreeGrpBox.ItemIndex of
  0: MainForm.Img.Rotate_90(True, MainForm.Img.Picture.Bitmap);
  1: MainForm.Img.Rotate_180(True, MainForm.Img.Picture.Bitmap); // On effectue
  2: MainForm.Img.Rotate_270(True, MainForm.Img.Picture.Bitmap);
  end;
 1: // Antihoraire
  case DegreeGrpBox.ItemIndex of
  0: MainForm.Img.Rotate_90(False, MainForm.Img.Picture.Bitmap);
  1: MainForm.Img.Rotate_180(False, MainForm.Img.Picture.Bitmap);  // On effectue
  2: MainForm.Img.Rotate_270(False, MainForm.Img.Picture.Bitmap);
  end;
 end;

 Close;  // On ferme
end;

end.
