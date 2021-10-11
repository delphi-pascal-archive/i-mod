unit ImageAndMore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math, StdCtrls;

const
  RED_SELECTED=1;
  GREEN_SELECTED=2; // Pour faciliter la compréhension
  BLUE_SELECTED=3;


type
  TRGBArray = ARRAY[0..10000] of TRGBTriple;
  pTRGBArray = ^TRGBArray; // Types pour le scanline

type
  TImageAndMore = class(TImage)
  private
    { Déclarations privées }
  protected
    { Déclarations protégées }
  public
    { Déclarations publiques }
    procedure SetSelectionRect(ARect: TRect); // Changer le rectangle de sélection
    procedure SetSelection(UseSelection: Boolean); // Dit à l'image si elle doit utiliser les zones de sélection !
    procedure SetPixelFormat(APixelFormat: TPixelFormat; Bitmap: TBitmap);  // Changement format pixels
    function IsColorPresent(Bitmap: TBitmap; Color: TColor; Tolerance: Byte): Boolean;  // Si une couleur est présente
    procedure AddLight(Amount: Byte; Bitmap: TBitmap); // Ajout de luminosité
    procedure AddDarkness(Amount: Byte; Bitmap: TBitmap); // Diminution de luminosité
    procedure InvertColors(Bitmap: TBitmap); // inversement des couleurs
    procedure BGR(Bitmap: TBitmap); // Inversement RGB => BGR
    procedure BRG(Bitmap: TBitmap); // Inversement RGB => BRG
    procedure RBG(Bitmap: TBitmap); // Inversement RGB => RBG
    procedure GBR(Bitmap: TBitmap); // Inversement RGB => GBR
    procedure GRB(Bitmap: TBitmap); // Inversement RGB => GRB
    procedure AddRed(Amount: Byte; Bitmap: TBitmap);  // Ajout de rouge
    procedure AddGreen(Amount: Byte; Bitmap: TBitmap); // Ajout de vert
    procedure AddBlue(Amount: Byte; Bitmap: TBitmap); // Ajout de bleu
    procedure RetreiveRed(Amount: Byte; Bitmap: TBitmap); // Otage de rouge
    procedure RetreiveGreen(Amount: Byte; Bitmap: TBitmap); // Otage de vert
    procedure RetreiveBlue(Amount: Byte; Bitmap: TBitmap); // Otage de bleu
    procedure GrayScale(Bitmap: TBitmap); // Niveaux de gris
    procedure R_Scale(Bitmap: TBitmap); // Filtrage Red
    procedure G_Scale(Bitmap: TBitmap); // Filtrage Green
    procedure B_Scale(Bitmap: TBitmap); // Filtrage Blue
    procedure RG_Scale(Bitmap: TBitmap); // Filtrage Red AND Green
    procedure RB_Scale(Bitmap: TBitmap); // Filtrage Red AND Blue
    procedure BG_Scale(Bitmap: TBitmap); // Filtrage Green AND Blue
    procedure ReplaceColors(Bitmap: TBitmap; ColorToChange, ChangeColor: TColor; Tolerance: Byte);  // Remplacement de couleurs
    procedure ToleranceFill(Bitmap: TBitmap; Color: TColor; Tolerance: Byte);  // Remplissage avec tolérance
    procedure Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap); // Blend simple Image + Constante
    procedure XOR_Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap); // Blend Xor Image + Constante
    procedure OR_Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap); // Blend Or Image + Constante
    procedure AND_Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap); // Blend And Image + Constante
    procedure RGB_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);  // Seuil RGB
    procedure R_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap); // Seuil R
    procedure G_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap); // Seuil G
    procedure B_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap); // Seuil B
    procedure RG_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap); // Seuil RG
    procedure RB_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap); // Seuil RB
    procedure BG_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap); // Seuil BG
    procedure Blur(Bitmap: TBitmap);  // Flou simple
    procedure Noise_Blur(Bitmap: TBitmap);  // Flou pixellisé
    procedure Gaussian_Blur(Amount: Integer; Bitmap: TBitmap);  // Flou gaussien
    procedure Finger_Blur(Bitmap: TBitmap);  // Flou "doigt"
    procedure Precise(Threshold: Byte; Bitmap: TBitmap); // Précision des couleurs
    procedure Rotate_90(Clockwise: Boolean; Bitmap: TBitmap);  // Rotation 90° horaire/anti-horaire
    procedure Rotate_180(Clockwise: Boolean; Bitmap: TBitmap); // Rotation 180° horaire/anti-horaire
    procedure Rotate_270(Clockwise: Boolean; Bitmap: TBitmap); // Rotation 270° horaire/anti-horaire
    procedure Add_Saturation(Amount: Integer; Bitmap: TBitmap); // Ajout de saturation
    procedure Retreive_Saturation(Amount: Integer; Bitmap: TBitmap); // Otage de saturation
    procedure Binarize(Threshold: Byte; BlackWhenEquals: Boolean; Bitmap: TBitmap); // Binarisation
    procedure Pixellize(Bitmap: TBitmap); // Pixelisation de l'image
  published
    { Déclarations publiées }
  end;

var
  SelectionRect: TRect;
  UseSelectionRect: Boolean=False;

procedure Register;

implementation

procedure TImageAndMore.SetSelectionRect(ARect: TRect);
begin
// On fixe le rectangle de sélection
SelectionRect := ARect;
end;

procedure TImageAndMore.SetSelection(UseSelection: Boolean);
begin
 UseSelectionRect := UseSelection; // On dit à l'image si on prend en charge la sélection
end;

procedure TImageAndMore.SetPixelFormat(APixelFormat: TPixelFormat; Bitmap: TBitmap);
begin
 Bitmap.PixelFormat := APixelFormat; // On fixe le format de pixels d'une image
end;



////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///////////////////  PRECISION : JE NE VAIS PAS COMMENTER  /////////////////////
///////////////////  CHAQUE ROUTINE DE TRAITEMENT D'IMAGE  /////////////////////
///////////////////  JE NE COMMENTERAI QUE LES PLUS INTER- /////////////////////
///////////////////  -ESSANTES, CAR 1650 LIGNES A COMMENTER ////////////////////
/////////////////// C'EST LONG. MERCI DE VOTRE COMPREHENSION. //////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////



function TImageAndMore.IsColorPresent(Bitmap: TBitmap; Color: TColor; Tolerance: Byte): Boolean;
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Byte;
begin
 Result := False;
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 R := GetRValue(Color);
 G := GetGValue(Color);
 B := GetBValue(Color);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if (InRange(P[Y].rgbtRed,R - Tolerance,R + Tolerance))
     and (InRange(P[Y].rgbtGreen,G - Tolerance,G + Tolerance))
     and (InRange(P[Y].rgbtBlue,B - Tolerance,B + Tolerance))
     then
      begin
       Result := True;
       break;
       break;
      end;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.AddLight(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X]; // On scanne la ligne
   for Y := 0 to Bmp.Width - 1 do
    begin                         // Si on a pris en charge la sélection, on voit si il est dans le rectangle
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P[Y].rgbtRed + Amount;
     G := P[Y].rgbtGreen + Amount; // On ajout à chaque composante la valeur de luminosité
     B := P[Y].rgbtBlue + Amount;
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;  // Si il dépasse les limites de sous-entendue, on remet dans les limites
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G; // On remet sur le scanline
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.AddDarkness(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P[Y].rgbtRed - Amount;
     G := P[Y].rgbtGreen - Amount;
     B := P[Y].rgbtBlue - Amount;
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.InvertColors(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := 255 - P[Y].rgbtRed;
     G := 255 - P[Y].rgbtGreen;
     B := 255 - P[Y].rgbtBlue;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.BGR(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     B := P[Y].rgbtRed;
     G := P[Y].rgbtGreen; // On se contente de permuter
     R := P[Y].rgbtBlue;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.BRG(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     B := P[Y].rgbtRed;
     R := P[Y].rgbtGreen;
     G := P[Y].rgbtBlue;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RBG(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P[Y].rgbtRed;
     B := P[Y].rgbtGreen;
     G := P[Y].rgbtBlue;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.GBR(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     G := P[Y].rgbtRed;
     B := P[Y].rgbtGreen;
     R := P[Y].rgbtBlue;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.GRB(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     G := P[Y].rgbtRed;
     R := P[Y].rgbtGreen;
     B := P[Y].rgbtBlue;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.GrayScale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 GrayScaleValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     GrayScaleValue := (P[Y].rgbtRed + P[Y].rgbtGreen + P[Y].rgbtBlue) div 3; // On fait la moyenne GrayScale
     if GrayScaleValue < 0 then GrayScaleValue := 0;
     if GrayScaleValue > 255 then GrayScaleValue := 255; // Si on dépasse les limites, on remet

     P[Y].rgbtRed := GrayScaleValue;
     P[Y].rgbtGreen := GrayScaleValue;  // On met chaque composante à GrayScale
     P[Y].rgbtBlue := GrayScaleValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.AddRed(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 RValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     RValue := P[Y].rgbtRed + Amount;
     if RValue < 0 then RValue := 0;
     if RValue > 255 then RValue := 255;

     P[Y].rgbtRed := RValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.AddGreen(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 GValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     GValue := P[Y].rgbtGreen + Amount;
     if GValue < 0 then GValue := 0;
     if GValue > 255 then GValue := 255;

     P[Y].rgbtGreen := GValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.AddBlue(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 BValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     BValue := P[Y].rgbtBlue + Amount;
     if BValue < 0 then BValue := 0;
     if BValue > 255 then BValue := 255;

     P[Y].rgbtBlue := BValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RetreiveRed(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 RValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     RValue := P[Y].rgbtRed - Amount;
     if RValue < 0 then RValue := 0;
     if RValue > 255 then RValue := 255;

     P[Y].rgbtRed := RValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RetreiveGreen(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 GValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     GValue := P[Y].rgbtGreen - Amount;
     if GValue < 0 then GValue := 0;
     if GValue > 255 then GValue := 255;

     P[Y].rgbtGreen := GValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RetreiveBlue(Amount: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 BValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     BValue := P[Y].rgbtBlue - Amount;
     if BValue < 0 then BValue := 0;
     if BValue > 255 then BValue := 255;

     P[Y].rgbtBlue := BValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.R_Scale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     P[Y].rgbtGreen := 0;   // On enlève toutes les composants sauf le rouge !
     P[Y].rgbtBlue := 0;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.G_Scale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     P[Y].rgbtRed := 0;
     P[Y].rgbtBlue := 0;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.B_Scale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     P[Y].rgbtGreen := 0;
     P[Y].rgbtRed := 0;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RG_Scale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     P[Y].rgbtBlue := 0;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RB_Scale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     P[Y].rgbtGreen := 0;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.BG_Scale(Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf24Bit, Bitmap);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     P[Y].rgbtRed := 0;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.ReplaceColors(Bitmap: TBitmap; ColorToChange, ChangeColor: TColor; Tolerance: Byte);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Byte;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 R := GetRValue(ColorToChange);
 G := GetGValue(ColorToChange);
 B := GetBValue(ColorToChange);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if (InRange(P[Y].rgbtRed, R - Tolerance, R + Tolerance))
     and (InRange(P[Y].rgbtGreen, G - Tolerance, G + Tolerance))
     and (InRange(P[Y].rgbtBlue, B - Tolerance, B + Tolerance))
     then         // Si chaque composante est dans l'etendue de la tolérance
      begin
       P[Y].rgbtRed := GetRValue(ChangeColor);
       P[Y].rgbtGreen := GetGValue(ChangeColor); // On remplace la couleur !
       P[Y].rgbtBlue := GetBValue(ChangeColor);
      end;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.ToleranceFill(Bitmap: TBitmap; Color: TColor; Tolerance: Byte);
Var                 // Malgré son nom bizarre, cette routine reconstruit une couleur
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Byte;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 R := GetRValue(Color);
 G := GetGValue(Color);
 B := GetBValue(Color);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if (InRange(P[Y].rgbtRed, R - Tolerance, R + Tolerance))
     and (InRange(P[Y].rgbtGreen, G - Tolerance, G + Tolerance))
     and (InRange(P[Y].rgbtBlue, B - Tolerance, B + Tolerance))
     then    // Si la couleur actuelle se trouve dans les limites de tolérance ...
      begin
       P[Y].rgbtRed := R;
       P[Y].rgbtGreen := G; // On remet la couleur
       P[Y].rgbtBlue := B;
      end;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap);
Var
 P1, D: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(DestBitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to BlendBitmap1.Height - 1 do
  begin
   P1 := BlendBitmap1.ScanLine[X];
   D := Bmp.ScanLine[X];
   for Y := 0 to BlendBitmap1.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := (P1[Y].rgbtRed + GetRValue(BlendConstant)) div 2;
     G := (P1[Y].rgbtGreen + GetGValue(BlendConstant)) div 2; // On fait une moyenne des composantes
     B := (P1[Y].rgbtBlue + GetBValue(BlendConstant)) div 2;
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     D[Y].rgbtRed := R;
     D[Y].rgbtGreen := G;
     D[Y].rgbtBlue := B;
    end;
  end;
 DestBitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.XOR_Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap);
Var
 P1, D: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(DestBitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P1 := BlendBitmap1.ScanLine[X];
   D := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P1[Y].rgbtRed xor GetRValue(BlendConstant);
     G := P1[Y].rgbtGreen xor GetGValue(BlendConstant);
     B := P1[Y].rgbtBlue xor GetBValue(BlendConstant);
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     D[Y].rgbtRed := R;
     D[Y].rgbtGreen := G;
     D[Y].rgbtBlue := B;
    end;
  end;
 DestBitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.OR_Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap);
Var
 P1, D: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(DestBitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P1 := BlendBitmap1.ScanLine[X];
   D := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P1[Y].rgbtRed or GetRValue(BlendConstant);
     G := P1[Y].rgbtGreen or GetGValue(BlendConstant);
     B := P1[Y].rgbtBlue or GetBValue(BlendConstant);
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     D[Y].rgbtRed := R;
     D[Y].rgbtGreen := G;
     D[Y].rgbtBlue := B;
    end;
  end;
 DestBitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.AND_Blend_Const(BlendBitmap1: TBitmap; BlendConstant: TColor; DestBitmap: TBitmap);
Var
 P1, D: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(DestBitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P1 := BlendBitmap1.ScanLine[X];
   D := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P1[Y].rgbtRed and GetRValue(BlendConstant);
     G := P1[Y].rgbtGreen and GetGValue(BlendConstant);
     B := P1[Y].rgbtBlue and GetBValue(BlendConstant);
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     D[Y].rgbtRed := R;
     D[Y].rgbtGreen := G;
     D[Y].rgbtBlue := B;
    end;
  end;
 DestBitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RGB_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var                     // Seuil RGB (Global)
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtRed < MinValue then P[Y].rgbtRed := MinValue;
     if P[Y].rgbtRed > MaxValue then P[Y].rgbtRed := MaxValue;
                  // On met les composantes dans les etendues du seuil ...
     if P[Y].rgbtGreen < MinValue then P[Y].rgbtGreen := MinValue;
     if P[Y].rgbtGreen > MaxValue then P[Y].rgbtGreen := MaxValue;

     if P[Y].rgbtBlue < MinValue then P[Y].rgbtBlue := MinValue;
     if P[Y].rgbtBlue > MaxValue then P[Y].rgbtBlue := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.R_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtRed < MinValue then P[Y].rgbtRed := MinValue;
     if P[Y].rgbtRed > MaxValue then P[Y].rgbtRed := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.G_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtGreen < MinValue then P[Y].rgbtGreen := MinValue;
     if P[Y].rgbtGreen > MaxValue then P[Y].rgbtGreen := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.B_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtBlue < MinValue then P[Y].rgbtBlue := MinValue;
     if P[Y].rgbtBlue > MaxValue then P[Y].rgbtBlue := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RG_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtRed < MinValue then P[Y].rgbtRed := MinValue;
     if P[Y].rgbtRed > MaxValue then P[Y].rgbtRed := MaxValue;

     if P[Y].rgbtGreen < MinValue then P[Y].rgbtGreen := MinValue;
     if P[Y].rgbtGreen > MaxValue then P[Y].rgbtGreen := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.RB_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtRed < MinValue then P[Y].rgbtRed := MinValue;
     if P[Y].rgbtRed > MaxValue then P[Y].rgbtRed := MaxValue;

     if P[Y].rgbtBlue < MinValue then P[Y].rgbtBlue := MinValue;
     if P[Y].rgbtBlue > MaxValue then P[Y].rgbtBlue := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.BG_Threshold(MinValue, MaxValue: Byte; Bitmap: TBitmap);
Var
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if P[Y].rgbtGreen < MinValue then P[Y].rgbtGreen := MinValue;
     if P[Y].rgbtGreen > MaxValue then P[Y].rgbtGreen := MaxValue;

     if P[Y].rgbtBlue < MinValue then P[Y].rgbtBlue := MinValue;
     if P[Y].rgbtBlue > MaxValue then P[Y].rgbtBlue := MaxValue;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Blur(Bitmap: TBitmap);   // Ah ah le flou !
Var
 P1, P2: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 2 do
  begin
   P1 := Bmp.ScanLine[X]; // On scanne la ligne
   P2 := Bmp.ScanLine[X + 1]; // On scanne la ligne juste après
   for Y := 0 to Bmp.Width - 2 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := (P1[Y].rgbtRed + P2[Y].rgbtRed + P1[Y + 1].rgbtRed + P2[Y + 1].rgbtRed) div 4;
     G := (P1[Y].rgbtGreen + P2[Y].rgbtGreen + P1[Y + 1].rgbtGreen + P2[Y + 1].rgbtGreen) div 4;
     B := (P1[Y].rgbtBlue + P2[Y].rgbtBlue + P1[Y + 1].rgbtBlue + P2[Y + 1].rgbtBlue) div 4;
           // On fait une moyenne du carré (Ligne 1 Y, Ligne 2 Y, Ligne 1 Y + 1, Ligne 2 Y + 1)
           // et on obtient un gros pixel de la couleur dominante dans ces 4 pixels
           // c'est le principe de la pixellisation également
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P1[Y].rgbtRed := R;
     P1[Y].rgbtGreen := G;
     P1[Y].rgbtBlue := B;
     P2[Y].rgbtRed := R;
     P2[Y].rgbtGreen := G;
     P2[Y].rgbtBlue := B;
     P1[Y + 1].rgbtRed := R;
     P1[Y + 1].rgbtGreen := G;
     P1[Y + 1].rgbtBlue := B;
     P2[Y + 1].rgbtRed := R;
     P2[Y + 1].rgbtGreen := G;
     P2[Y + 1].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Noise_Blur(Bitmap: TBitmap);  // Flou de pixellisation (voir plus haut)
Var
 P1, P2: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 2 do
  begin
   if Odd(X) then Continue;
   P1 := Bmp.ScanLine[X];
   P2 := Bmp.ScanLine[X + 1];
   for Y := 0 to Bmp.Width - 2 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := (P1[Y].rgbtRed + P2[Y].rgbtRed + P1[Y + 1].rgbtRed + P2[Y + 1].rgbtRed) div 4;
     G := (P1[Y].rgbtGreen + P2[Y].rgbtGreen + P1[Y + 1].rgbtGreen + P2[Y + 1].rgbtGreen) div 4;
     B := (P1[Y].rgbtBlue + P2[Y].rgbtBlue + P1[Y + 1].rgbtBlue + P2[Y + 1].rgbtBlue) div 4;

     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P1[Y].rgbtRed := R;
     P1[Y].rgbtGreen := G;
     P1[Y].rgbtBlue := B;
     P2[Y].rgbtRed := R;
     P2[Y].rgbtGreen := G;
     P2[Y].rgbtBlue := B;
     P1[Y + 1].rgbtRed := R;
     P1[Y + 1].rgbtGreen := G;
     P1[Y + 1].rgbtBlue := B;
     P2[Y + 1].rgbtRed := R;
     P2[Y + 1].rgbtGreen := G;
     P2[Y + 1].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Gaussian_Blur(Amount: Integer; Bitmap: TBitmap);
Var
  I: Integer;
begin
  for I := 1 to Amount do Blur(Bitmap); // Un flou gaussien consiste à répéter un flou un certain nombre de fois
end;

procedure TImageAndMore.Finger_Blur(Bitmap: TBitmap); // Flou "doigt"
Var
 P1, P2, P3: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 1 to Bmp.Height - 2 do
  begin
   P1 := Bmp.ScanLine[X - 1];
   P2 := Bmp.ScanLine[X];
   P3 := Bmp.ScanLine[X + 1];
   for Y := 0 to Bmp.Width - 2 do
    begin
       if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
       R := (P1[Y].rgbtRed + P1[Y + 1].rgbtRed + P2[Y].rgbtRed + P2[Y + 1].rgbtRed + P3[Y].rgbtRed + P3[Y + 1].rgbtRed) div 6;
       G := (P1[Y].rgbtGreen + P1[Y + 1].rgbtGreen + P2[Y].rgbtGreen + P2[Y + 1].rgbtGreen + P3[Y].rgbtGreen + P3[Y + 1].rgbtGreen) div 6;
       B := (P1[Y].rgbtBlue + P1[Y + 1].rgbtBlue + P2[Y].rgbtBlue + P2[Y + 1].rgbtBlue + P3[Y].rgbtBlue + P3[Y + 1].rgbtBlue) div 6;
            // Encore pire que le flou simple : il prend un rectangle de 6 pixels et fait la moyenne
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P1[Y].rgbtRed := R;
     P1[Y].rgbtGreen := G;
     P1[Y].rgbtBlue := B;
     P2[Y].rgbtRed := R;
     P2[Y].rgbtGreen := G;
     P2[Y].rgbtBlue := B;
     P3[Y].rgbtRed := R;
     P3[Y].rgbtGreen := G;
     P3[Y].rgbtBlue := B;
     P1[Y + 1].rgbtRed := R;
     P1[Y + 1].rgbtGreen := G;
     P1[Y + 1].rgbtBlue := B;
     P2[Y + 1].rgbtRed := R;
     P2[Y + 1].rgbtGreen := G;
     P2[Y + 1].rgbtBlue := B;
     P3[Y + 1].rgbtRed := R;
     P3[Y + 1].rgbtGreen := G;
     P3[Y + 1].rgbtBlue := B;
    end;
   end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Precise(Threshold: Byte; Bitmap: TBitmap);
Var
 P1, P2: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 2 do
  begin
   if Odd(X) then Continue;
   P1 := Bmp.ScanLine[X];
   P2 := Bmp.ScanLine[X + 1];
   for Y := 0 to Bmp.Width - 2 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := (P1[Y].rgbtRed + P2[Y].rgbtRed + P1[Y + 1].rgbtRed + P2[Y + 1].rgbtRed) div 4;
     G := (P1[Y].rgbtGreen + P2[Y].rgbtGreen + P1[Y + 1].rgbtGreen + P2[Y + 1].rgbtGreen) div 4;
     B := (P1[Y].rgbtBlue + P2[Y].rgbtBlue + P1[Y + 1].rgbtBlue + P2[Y + 1].rgbtBlue) div 4;

     if R > Threshold then
      begin
       R := R + 10;
       G := G - 5;
       B := B - 5;
      end;

     if G > Threshold then
      begin
       R := R - 5;
       G := G + 10;
       B := B - 5;
      end;

     if B > Threshold then
      begin
       R := R - 5;
       G := G - 5;
       B := B + 10;
      end;

     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P1[Y].rgbtRed := R;
     P1[Y].rgbtGreen := G;
     P1[Y].rgbtBlue := B;
     P2[Y].rgbtRed := R;
     P2[Y].rgbtGreen := G;
     P2[Y].rgbtBlue := B;
     P1[Y + 1].rgbtRed := R;
     P1[Y + 1].rgbtGreen := G;
     P1[Y + 1].rgbtBlue := B;
     P2[Y + 1].rgbtRed := R;
     P2[Y + 1].rgbtGreen := G;
     P2[Y + 1].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Rotate_90(Clockwise: Boolean; Bitmap: TBitmap);
Var                     // Rotation de 90°
 P1, P2: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 Bmp2: TBitmap;
begin
 Bmp := TBitmap.Create;
 Bmp2 := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 Bmp2.Width := Bmp.Height;
 Bmp2.Height := Bmp.Width;
 SetPixelFormat(pf24Bit, Bmp2);
 for Y := 0 to Bmp.Height - 1 do
  begin
   P1 := Bmp.ScanLine[Y];
   for X := 0 to Bmp.Width - 1 do
    begin
    case ClockWise of
     False:
      begin
       P2 := Bmp2.ScanLine[Bmp.Width - x - 1];
       P2[y] := P1[x];
      end;
     True:
      begin
       P2 := Bmp2.ScanLine[x];
       P2[Bmp.Height - 1 - y] := P1[x];
      end;
     end;
    end;
  end;
 Bitmap.Assign(Bmp2);
 Bmp.Free;
 Bmp2.Free;
end;

procedure TImageAndMore.Rotate_180(Clockwise: Boolean; Bitmap: TBitmap);
begin
 Rotate_90(Clockwise, Bitmap);   // On ne va pas se casser la tête
 Rotate_90(Clockwise, Bitmap);
end;

procedure TImageAndMore.Rotate_270(Clockwise: Boolean; Bitmap: TBitmap);
begin
 Rotate_90(Clockwise, Bitmap); // Idem
 Rotate_90(Clockwise, Bitmap);
 Rotate_90(Clockwise, Bitmap);
end;

procedure TImageAndMore.Add_Saturation(Amount: Integer; Bitmap: TBitmap);
Var                  // ATTENTION : ROUTINE INTERESSANTE
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
 S: Byte;
begin
 S := 0;
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P[Y].rgbtRed;
     G := P[Y].rgbtGreen;
     B := P[Y].rgbtBlue;

     if (R > G) and (R > B) then S := RED_SELECTED;
     if (G > B) and (G > R) then S := GREEN_SELECTED; // On regarde quelle est la composante dominante
     if (B > G) and (B > R) then S := BLUE_SELECTED;

     case S of
     RED_SELECTED:
      begin
       R := R + Amount;
      end;
     GREEN_SELECTED:
      begin
       G := G + Amount; // On ajoute (Amount) à la composante dominante
      end;
     BLUE_SELECTED:
      begin
       B := B + Amount;
      end;
     end;

     // C'est le principe de la saturation

     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Retreive_Saturation(Amount: Integer; Bitmap: TBitmap);
Var                     // Voir en haut pour détails
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
 S: Byte;
begin
 S := 0;
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     R := P[Y].rgbtRed;
     G := P[Y].rgbtGreen;
     B := P[Y].rgbtBlue;

     if (R > G) and (R > B) then S := RED_SELECTED;
     if (G > B) and (G > R) then S := GREEN_SELECTED;
     if (B > G) and (B > R) then S := BLUE_SELECTED;

     case S of
     RED_SELECTED:
      begin
       R := R - Amount;
      end;
     GREEN_SELECTED:
      begin
       G := G - Amount;
      end;
     BLUE_SELECTED:
      begin
       B := B - Amount;
      end;
     end;

     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P[Y].rgbtRed := R;
     P[Y].rgbtGreen := G;
     P[Y].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Binarize(Threshold: Byte; BlackWhenEquals: Boolean; Bitmap: TBitmap);
Var                // Binarisation
 P: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 BinarizationValue: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf24Bit, Bitmap);
 for X := 0 to Bmp.Height - 1 do
  begin
   P := Bmp.ScanLine[X];
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     BinarizationValue := (P[Y].rgbtRed + P[Y].rgbtGreen + P[Y].rgbtBlue) div 3;
     if BinarizationValue < 0 then BinarizationValue := 0;
     if BinarizationValue > 255 then BinarizationValue := 255;
                  // On fait la moyenne (niveaux de gris)
     if BinarizationValue < Threshold then
      begin              // Si ce niveau de gris est en dessous du seuil
       P[Y].rgbtRed := 0;
       P[Y].rgbtGreen := 0;  // Pixel noir
       P[Y].rgbtBlue := 0;
      end
     else
      begin
       P[Y].rgbtRed := 255;
       P[Y].rgbtGreen := 255; // Sinon pixel blanc
       P[Y].rgbtBlue := 255;
      end;

     if BinarizationValue = Threshold then   // Si il y a égalité avec le seuil
      case BlackWhenEquals of
     False:    // Si on a précisé à l'image de mettre en noir
      begin
       P[Y].rgbtRed := 255;
       P[Y].rgbtGreen := 255; // Pixel noir
       P[Y].rgbtBlue := 255;
      end;
     True:
      begin
       P[Y].rgbtRed := 0;
       P[Y].rgbtGreen := 0; // Sinon pixel blanc
       P[Y].rgbtBlue := 0;
      end;
     end;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;

procedure TImageAndMore.Pixellize(Bitmap: TBitmap);
Var                      // Pixellisation
 P1, P2: PTRGBARRAY;
 X, Y: Integer;
 Bmp: TBitmap;
 R, G, B: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Assign(Bitmap);
 SetPixelFormat(pf32Bit, Bmp);
 for X := 0 to Bmp.Height - 2 do
  begin
   if Odd(X) then Continue; // Une ligne sur 2 (ce qui le différencie du flou)
   P1 := Bmp.ScanLine[X];
   P2 := Bmp.ScanLine[X + 1];  // La ligne actuelle + la ligne suivante
   for Y := 0 to Bmp.Width - 1 do
    begin
     if UseSelectionRect then if not (PtInRect(SelectionRect, Point(X, Y))) then Continue;
     if Odd(Y) then Continue;
     R := (P1[Y].rgbtRed + P2[Y].rgbtRed + P1[Y + 1].rgbtRed + P2[Y + 1].rgbtRed) div 4;
     G := (P1[Y].rgbtGreen + P2[Y].rgbtGreen + P1[Y + 1].rgbtGreen + P2[Y + 1].rgbtGreen) div 4;
     B := (P1[Y].rgbtBlue + P2[Y].rgbtBlue + P1[Y + 1].rgbtBlue + P2[Y + 1].rgbtBlue) div 4;
                              // On fait la moyenne du carré de 4 pixels ...
     if R < 0 then R := 0;
     if R > 255 then R := 255;
     if G < 0 then G := 0;
     if G > 255 then G := 255;
     if B < 0 then B := 0;
     if B > 255 then B := 255;

     P1[Y].rgbtRed := R;
     P1[Y].rgbtGreen := G;
     P1[Y].rgbtBlue := B;
     P2[Y].rgbtRed := R;
     P2[Y].rgbtGreen := G;
     P2[Y].rgbtBlue := B;    // et on obtient un gros pixel de la même couleur ^^
     P1[Y + 1].rgbtRed := R;
     P1[Y + 1].rgbtGreen := G;
     P1[Y + 1].rgbtBlue := B;
     P2[Y + 1].rgbtRed := R;
     P2[Y + 1].rgbtGreen := G;
     P2[Y + 1].rgbtBlue := B;
    end;
  end;
 Bitmap.Assign(Bmp);
 Bmp.Free;
end;













procedure Register;
begin
  RegisterComponents('Supplément', [TImageAndMore]);
end;       // On enregistre le composant


end.
