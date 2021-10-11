unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImageAndMore, Menus, ExtDlgs, JPEG,  ComCtrls,
  ToolWin, ImgList;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileMenuBtn: TMenuItem;
    OpenMenuBtn: TMenuItem;
    SaveMenuBtn: TMenuItem;
    N15: TMenuItem;
    QuitMenuBtn: TMenuItem;
    ImgShowMenuBtn: TMenuItem;
    Modifierlaffichagedelimage1: TMenuItem;
    TraitementMenuBtn: TMenuItem;
    BoolOperationsMenuBtn: TMenuItem;
    FiltersMenuBtn: TMenuItem;
    RedFilterMenuBtn: TMenuItem;
    BlueFilterMenuBtn: TMenuItem;
    GreenFilterMenuBtn: TMenuItem;
    RedBlueFilterMenuBtn: TMenuItem;
    RedGreenFilterMenuBtn: TMenuItem;
    GreenBlueFilterMenuBtn: TMenuItem;
    InversionsMenuBtn: TMenuItem;
    SimpleInvertMenuBtn: TMenuItem;
    N8: TMenuItem;
    BGRMenuBtn: TMenuItem;
    BRGMenuBtn: TMenuItem;
    RBGMenuBtn: TMenuItem;
    GBRMenuBtn: TMenuItem;
    GRBMenuBtn: TMenuItem;
    RGBOpsMenuBtn: TMenuItem;
    N6: TMenuItem;
    GrayScaleMenuBtn: TMenuItem;
    PTPMenuBtn: TMenuItem;
    SimpleBlurMenuBtn: TMenuItem;
    FingerBlurMenuBtn: TMenuItem;
    GaussianBlurMenuBtn: TMenuItem;
    PixelBlurMenuBtn: TMenuItem;
    N5: TMenuItem;
    ColorAccuratyMenuBtn: TMenuItem;
    GlobalMenuBtn: TMenuItem;
    N3: TMenuItem;
    ChangeColorMenuBtn: TMenuItem;
    N2: TMenuItem;
    ReconstructMenuBtn: TMenuItem;
    SpecialOpsMenuBtn: TMenuItem;
    BinarisationMenuBtn: TMenuItem;
    PixellisationMenuBtn: TMenuItem;
    RotationMenuBtn: TMenuItem;
    N1: TMenuItem;
    FindColorMenuBtn: TMenuItem;
    HelpMenuBtn: TMenuItem;
    AboutMenuBtn: TMenuItem;
    OpenDialog: TOpenPictureDialog;
    ModifyRGBMenuBtn: TMenuItem;
    NightEyeMenuBtn: TMenuItem;
    N7: TMenuItem;
    SaveDialog: TSavePictureDialog;
    N11: TMenuItem;
    UndoMenuBtn: TMenuItem;
    LuminosityMenuBtn: TMenuItem;
    SaturationMenuBtn: TMenuItem;
    ThresholdsMenuBtn: TMenuItem;
    BThresholdMenuBtn: TMenuItem;
    GThresholdMenuBtn: TMenuItem;
    RThresholdMenuBtn: TMenuItem;
    N13: TMenuItem;
    RGBThresholdMenuBtn: TMenuItem;
    FileToolBar: TToolBar;
    OpenToolBtn: TToolButton;
    ToolBarImgs: TImageList;
    SaveToolBtn: TToolButton;
    ToolDivider4: TToolButton;
    ToolDivider3: TToolButton;
    QuitToolBtn: TToolButton;
    ToolDivider2: TToolButton;
    ImgShowToolBtn: TToolButton;
    HelpToolBtn: TToolButton;
    ToolDivider1: TToolButton;
    Status: TStatusBar;
    ImgScrollBox: TScrollBox;
    Img: TImageAndMore;
    procedure Modifierlaffichagedelimage1Click(Sender: TObject);
    procedure BoolOperationsMenuBtnClick(Sender: TObject);
    procedure OpenMenuBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RedFilterMenuBtnClick(Sender: TObject);
    procedure BlueFilterMenuBtnClick(Sender: TObject);
    procedure GreenFilterMenuBtnClick(Sender: TObject);
    procedure RedBlueFilterMenuBtnClick(Sender: TObject);
    procedure RedGreenFilterMenuBtnClick(Sender: TObject);
    procedure GreenBlueFilterMenuBtnClick(Sender: TObject);
    procedure SimpleInvertMenuBtnClick(Sender: TObject);
    procedure BGRMenuBtnClick(Sender: TObject);
    procedure BRGMenuBtnClick(Sender: TObject);
    procedure RBGMenuBtnClick(Sender: TObject);
    procedure GBRMenuBtnClick(Sender: TObject);
    procedure GRBMenuBtnClick(Sender: TObject);
    procedure ModifyRGBMenuBtnClick(Sender: TObject);
    procedure GrayScaleMenuBtnClick(Sender: TObject);
    procedure NightEyeMenuBtnClick(Sender: TObject);
    procedure SaveMenuBtnClick(Sender: TObject);
    procedure SimpleBlurMenuBtnClick(Sender: TObject);
    procedure FingerBlurMenuBtnClick(Sender: TObject);
    procedure PixelBlurMenuBtnClick(Sender: TObject);
    procedure GaussianBlurMenuBtnClick(Sender: TObject);
    procedure ColorAccuratyMenuBtnClick(Sender: TObject);
    procedure QuitMenuBtnClick(Sender: TObject);
    procedure UndoMenuBtnClick(Sender: TObject);
    procedure PixellisationMenuBtnClick(Sender: TObject);
    procedure BinarisationMenuBtnClick(Sender: TObject);
    procedure LuminosityMenuBtnClick(Sender: TObject);
    procedure SaturationMenuBtnClick(Sender: TObject);
    procedure ChangeColorMenuBtnClick(Sender: TObject);
    procedure ReconstructMenuBtnClick(Sender: TObject);
    procedure SeuilGlobal1Click(Sender: TObject);
    procedure SeuilRouge1Click(Sender: TObject);
    procedure SeuilVert1Click(Sender: TObject);
    procedure SeuilBleu1Click(Sender: TObject);
    procedure RotationMenuBtnClick(Sender: TObject);
    procedure FindColorMenuBtnClick(Sender: TObject);
    procedure OpenToolBtnClick(Sender: TObject);
    procedure SaveToolBtnClick(Sender: TObject);
    procedure QuitToolBtnClick(Sender: TObject);
    procedure ImgShowToolBtnClick(Sender: TObject);
    procedure HelpToolBtnClick(Sender: TObject);
    procedure AboutMenuBtnClick(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGBThresholdMenuBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  MainForm: TMainForm;
  CurrentFileName: String='Aucun fichier';
  BackupImg: TBitmap;

implementation

uses ImgShow, BoolOps, RGBOp, GaussBlur, ColorPrec, BinThreshold, LumForm,
  SatForm, ReplaceColor, Reconst, SeuilRGB, SeuilR, SeuilG, SeuilB,
  Rotation, IsColor, About;

{$R *.dfm}

procedure TMainForm.Modifierlaffichagedelimage1Click(Sender: TObject);
begin
 ImgShowForm.ShowModal; // On affiche la fiche pour modifier l'affichage de l'image
end;

procedure TMainForm.BoolOperationsMenuBtnClick(Sender: TObject);
begin
 BoolOpForm.ShowModal; // On affiche la fiche pour les opérations booléennes
end;

procedure TMainForm.OpenMenuBtnClick(Sender: TObject);
var
  Jpeg: TJpegImage; // Pour stocker un éventuel JPEG
  Bmp: TBitmap;  // Pour stocker un eventuel Bitmap
begin
  if OpenDialog.Execute then
  begin        // Si il s'éxecute

  Bmp := TBitmap.Create;  // On crée les 2
  Jpeg := TJpegImage.Create;

  if (ExtractFileExt(OpenDialog.FileName) = '.jpg') or (ExtractFileExt(OpenDialog.FileName) = '.jpeg') then
   begin
    Jpeg.LoadFromFile(OpenDialog.FileName);
    Bmp.Assign(Jpeg);   // Si il a détecté un JPEG alors il ouvre le JPEG et le transforme en bitmpa
   end
    else Bmp.LoadFromFile(OpenDialog.FileName);
               // Dans le cas contraire (pas de JPEG) il ouvre directement le bitmap
    Img.Picture.Bitmap.Assign(Bmp);
    BackupImg.Assign(Bmp);  // On assigne le bitmap à l'image définitive, ainsi qu'a l'image de récupération
    Bmp.Free;
    Jpeg.Free; // On libère le tout
    CurrentFileName := OpenDialog.FileName;  // Le fichier en cours est stocké
    TraitementMenuBtn.Enabled := True;   // On active le menu traitement
    SaveMenuBtn.Enabled := True;   // On active le menu sauvegarde
    ImgShowForm.ApplyBtnClick(self);    // On fait comme si on avait cliqué sur le bouton "Appliquer" dans la fiche pour modifier l'affichage
    Img.SetSelection(False);  // On ne prend pas encore en compte la sélection dans cette application (mais le composant la prend en charge)

         // On affiche le fichier, et ses dimensions, dans la barre de status
    Status.SimpleText := '  "' + CurrentFileName + '", ' + IntToStr(Img.Picture.Bitmap.Width) + ' sur ' + IntToStr(Img.Picture.Bitmap.Height) + '.';
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 FileToolBar.DoubleBuffered := True;
 Status.DoubleBuffered := True;  // On doublebuffer
 ImgScrollBox.DoubleBuffered := True;
 BackupImg := TBitmap.Create;  // On crée l'image de récupération
end;

procedure TMainForm.RedFilterMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.R_Scale(Img.Picture.Bitmap);   // On applique le filtre rouge après avoir stocké l'image (avant le filtre) dans la récupération
end;

procedure TMainForm.BlueFilterMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.B_Scale(Img.Picture.Bitmap);  // Pareil avec filtre bleu
end;

procedure TMainForm.GreenFilterMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.G_Scale(Img.Picture.Bitmap);    // Pareil avec filtre vert
end;

procedure TMainForm.RedBlueFilterMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.RB_Scale(Img.Picture.Bitmap); // Filtre Rouge et Bleu
end;

procedure TMainForm.RedGreenFilterMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.RG_Scale(Img.Picture.Bitmap);    // Filtre rouge et vert
end;

procedure TMainForm.GreenBlueFilterMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.BG_Scale(Img.Picture.Bitmap);   // Filtre vert et bleu
end;

procedure TMainForm.SimpleInvertMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.InvertColors(Img.Picture.Bitmap);  // Inversion simple des couleurs (255 - composante)
end;

procedure TMainForm.BGRMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
 Img.BGR(Img.Picture.Bitmap);  // Inversion permutative (BGR)
end;

procedure TMainForm.BRGMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
  Img.BRG(Img.Picture.Bitmap);  // Inversion permutative (BRG)
end;

procedure TMainForm.RBGMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
  Img.RBG(Img.Picture.Bitmap);  // Inversion permutative (RBG)
end;

procedure TMainForm.GBRMenuBtnClick(Sender: TObject);
begin
  BackupImg.Assign(Img.Picture.Bitmap);
  Img.GBR(Img.Picture.Bitmap);  // Inversion permutative (GBR)
end;

procedure TMainForm.GRBMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
  Img.GRB(Img.Picture.Bitmap);  // Inversion permutative (GRB)
end;

procedure TMainForm.ModifyRGBMenuBtnClick(Sender: TObject);
begin
 RGBOpForm.ShowModal;   // Modification des valeurs RGB
end;

procedure TMainForm.GrayScaleMenuBtnClick(Sender: TObject);
begin
 Img.GrayScale(Img.Picture.Bitmap); // Niveaux de gris
end;

procedure TMainForm.NightEyeMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);   // Effet de nuit (bon j'ai un peu triché ^^)
 Img.B_Scale(Img.Picture.Bitmap);  // On enlève toutes les composantes sauf le bleu
 Img.RetreiveBlue(75, Img.Picture.Bitmap);   // On enlève un peu de bleu, et hop effet nuit
end;

procedure TMainForm.SaveMenuBtnClick(Sender: TObject);
var
  Jpeg: TJpegImage;
begin
  if SaveDialog.Execute then
  begin    // Si on accepte de sauvegarder alors

  Jpeg := TJpegImage.Create; // Au cas ou

  if (ExtractFileExt(SaveDialog.FileName) = '.jpg') or (ExtractFileExt(SaveDialog.FileName) = '.jpeg') then
   begin
    Jpeg.CompressionQuality := 90;  // Si il veut sauver un JPEG alors
    Jpeg.Assign(Img.Picture.Bitmap); // On compresse, on assigne, et on sauve
    Jpeg.SaveToFile(SaveDialog.FileName);
   end
    else Img.Picture.Bitmap.SaveToFile(SaveDialog.FileName);
            // Sinon on sauve juste le bitmap :p
    Jpeg.Free;  // On libère
    CurrentFileName := SaveDialog.FileName;   // Le nouveau nom de fichier
    Status.SimpleText := '  "' + CurrentFileName + '", ' + IntToStr(Img.Picture.Bitmap.Width) + ' sur ' + IntToStr(Img.Picture.Bitmap.Height) + '.';
    end;     // On affiche ...
end;

procedure TMainForm.SimpleBlurMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap); // On met en bitmap récupération
 Img.Blur(Img.Picture.Bitmap); // Flou simple
end;

procedure TMainForm.FingerBlurMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap); // Idem
  Img.Finger_Blur(Img.Picture.Bitmap); // Flou "doigt"
end;

procedure TMainForm.PixelBlurMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap);
  Img.Noise_Blur(Img.Picture.Bitmap);  // Flou pixellisé
end;

procedure TMainForm.GaussianBlurMenuBtnClick(Sender: TObject);
begin
 GaussForm.ShowModal;  // On affiche la fiche pour le flou gaussien
end;

procedure TMainForm.ColorAccuratyMenuBtnClick(Sender: TObject);
begin
 PrecForm.ShowModal;  // Précision des couleurs, la fiche
end;

procedure TMainForm.QuitMenuBtnClick(Sender: TObject);
begin
 if MessageDlg('Voulez-vous vraiment quitter ? Les modifications qui n''ont pas été enregistrées seront perdues.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   BackupImg.Free; // Tu veux quitter ? On libère le bitmap de récupération, et ... ben on ferme
   Close;
  end;
end;

procedure TMainForm.UndoMenuBtnClick(Sender: TObject);
begin
 Img.Picture.Bitmap.Assign(BackupImg);  // On annule la modification à partir du bitmap de récupération
end;

procedure TMainForm.PixellisationMenuBtnClick(Sender: TObject);
begin
 BackupImg.Assign(Img.Picture.Bitmap); // Mise en bitmap récupération
 Img.Pixellize(Img.Picture.Bitmap); // On pixellise l'image
end;

procedure TMainForm.BinarisationMenuBtnClick(Sender: TObject);
begin
 BinarizeForm.ShowModal;  // On affiche la fiche pour binariser
end;

procedure TMainForm.LuminosityMenuBtnClick(Sender: TObject);
begin
 LumiForm.ShowModal;  // On affiche la fiche pour la luminosité
end;

procedure TMainForm.SaturationMenuBtnClick(Sender: TObject);
begin
 SaturForm.ShowModal;  // Fiche pour la saturation
end;

procedure TMainForm.ChangeColorMenuBtnClick(Sender: TObject);
begin
 ReplaceForm.ShowModal; // Fiche pour remplacer des couleurs
end;

procedure TMainForm.ReconstructMenuBtnClick(Sender: TObject);
begin
 ReconstForm.ShowModal; // Fiche pour reconstruire une couleur
end;

procedure TMainForm.SeuilGlobal1Click(Sender: TObject);
begin
 SeuilRGBForm.ShowModal;  // Fiche seuil RGB
end;

procedure TMainForm.SeuilRouge1Click(Sender: TObject);
begin
 SeuilRForm.ShowModal; // Fiche seuil R
end;

procedure TMainForm.SeuilVert1Click(Sender: TObject);
begin
 SeuilGForm.ShowModal;  // Fiche seuil G
end;

procedure TMainForm.SeuilBleu1Click(Sender: TObject);
begin
 SeuilBForm.ShowModal; // Fiche seuil B
end;

procedure TMainForm.RotationMenuBtnClick(Sender: TObject);
begin
 RotationForm.ShowModal;// Fiche pour la rotation
end;

procedure TMainForm.FindColorMenuBtnClick(Sender: TObject);
begin
 IsColorForm.ShowModal; // Fiche pour rechercher une couleur (avec tolérance evidemment !)
end;

procedure TMainForm.OpenToolBtnClick(Sender: TObject);
begin
 OpenMenuBtnClick(self);  // Bouton pour ouvrir
end;

procedure TMainForm.SaveToolBtnClick(Sender: TObject);
begin
 if TraitementMenuBtn.Enabled then SaveMenuBtnClick(self);
end;               // Bouton pour sauvegarder

procedure TMainForm.QuitToolBtnClick(Sender: TObject);
begin
 QuitMenuBtnClick(self);  // Bouton pour quitter
end;

procedure TMainForm.ImgShowToolBtnClick(Sender: TObject);
begin
 Modifierlaffichagedelimage1Click(self); // Bouton pour modifier l'affichage
end;

procedure TMainForm.HelpToolBtnClick(Sender: TObject);
begin
AboutBox.ShowModal;  // Bouton a propos
end;

procedure TMainForm.AboutMenuBtnClick(Sender: TObject);
begin
AboutBox.ShowModal; // Menu à propos
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
 ImgScrollBox.VertScrollBar.Position := ImgScrollBox.VertScrollBar.Position - 20;
end;      // Molette en haut ? On fait monter la scrollbox

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ImgScrollBox.VertScrollBar.Position := ImgScrollBox.VertScrollBar.Position + 20;
end;     // Molette en bas, on la fait descendre.

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of  // Tu veux utiliser ton clavier ? Aucun problème !
 VK_DOWN: ImgScrollBox.VertScrollBar.Position := ImgScrollBox.VertScrollBar.Position + 20;
 VK_UP: ImgScrollBox.VertScrollBar.Position := ImgScrollBox.VertScrollBar.Position - 20;
 VK_LEFT: ImgScrollBox.HorzScrollBar.Position := ImgScrollBox.HorzScrollBar.Position - 20;
 VK_RIGHT: ImgScrollBox.HorzScrollBar.Position := ImgScrollBox.HorzScrollBar.Position + 20;
 end;
end;

procedure TMainForm.RGBThresholdMenuBtnClick(Sender: TObject);
begin
  SeuilRGBForm.ShowModal; // Fiche seuil RGB
end;

end.
