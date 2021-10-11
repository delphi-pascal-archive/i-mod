unit ColorPrec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TPrecForm = class(TForm)
    InfoLabel: TLabel;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    PrecisionThreshold: TSpinEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  PrecForm: TPrecForm;

implementation

uses Main;

{$R *.dfm}

procedure TPrecForm.CancelBtnClick(Sender: TObject);
begin
 Close; // On ferme
end;

procedure TPrecForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);
 MainForm.Img.Precise(PrecisionThreshold.Value, MainForm.Img.Picture.Bitmap);
 Close;   // On effectue la précision
end;

procedure TPrecForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True; // doublebuffered
end;

end.
