unit ImgShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImageAndMore;

type
  TImgShowForm = class(TForm)
    ShowType: TRadioGroup;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  ImgShowForm: TImgShowForm;

implementation

uses MAIN;

{$R *.dfm}

procedure TImgShowForm.CancelBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TImgShowForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;    // Doublebuffered
 ShowType.DoubleBuffered := True;
end;

procedure TImgShowForm.FormShow(Sender: TObject);
begin
 ShowType.ItemIndex := -1; // On met à -1 (rien)
 if MainForm.Img.Center then ShowType.ItemIndex := 0;
 if MainForm.Img.Stretch then ShowType.ItemIndex := 1; // Selon la forme de l'image ...
 if MainForm.Img.Proportional then ShowType.ItemIndex := 2;
 if ShowType.ItemIndex = -1 then ShowType.ItemIndex := 3;  // Si elle est telle qu'elle on le montre
end;

procedure TImgShowForm.ApplyBtnClick(Sender: TObject);
begin
 MainForm.Img.Center := False;
 MainForm.Img.Stretch := False;   // Tout à faux
 MainForm.Img.Proportional := False;

 case ShowType.ItemIndex of
 0: MainForm.Img.Center := True;
 1: MainForm.Img.Stretch := True; // Selon l'itemindex on change
 2: MainForm.Img.Proportional := True;
 end;

 if (MainForm.Img.Center) or (MainForm.Img.Stretch) or (MainForm.Img.Proportional) then
  mainForm.Img.Align := alClient else
   begin
    MainForm.Img.Align := alNone;
    MainForm.Img.AutoSize := True;  // Pour le redimensionnement
    MainForm.Img.AutoSize := False;
   end;

 Close; // On ferme
 
end;

end.
