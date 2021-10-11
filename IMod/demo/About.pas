unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg;

type
  TAboutBox = class(TForm)
    AboutPanel: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
 Close;   // Quand tu en as assez de la fenêtre tu peux la fermer
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;  // Pour eviter les scintillements
 AboutPanel.DoubleBuffered := True;
end;

end.
 
