unit BinThreshold;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TBinarizeForm = class(TForm)
    InfoLabel: TLabel;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    BinThresholdValue: TSpinEdit;
    BinChoiceBox: TRadioGroup;
    procedure CancelBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  BinarizeForm: TBinarizeForm;

implementation

uses Main;

{$R *.dfm}

procedure TBinarizeForm.CancelBtnClick(Sender: TObject);
begin
 Close;  // On annule l'op�ration
end;

procedure TBinarizeForm.ApplyBtnClick(Sender: TObject);
begin
 BackupImg.Assign(MainForm.Img.Picture.Bitmap);

 MainForm.Img.Binarize(BinThresholdValue.Value, // Le seuil de binarisation
 Boolean(BinChoiceBox.ItemIndex), // Noir ou blanc si �galit� au seuil
 MainForm.Img.Picture.Bitmap); // L'image principale

 // Ce n'est pas dans mes habitudes de couper des param�tres comme �a, mais c'est plus lisible

 Close;  // Quand c'est fini on ferme
end;

procedure TBinarizeForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;  // Doublebuffer
 BinChoiceBox.DoubleBuffered := True;
end;

end.
