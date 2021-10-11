object IsColorForm: TIsColorForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rechercher une couleur'
  ClientHeight = 113
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000770000007777007788700077788778787870077
    F887887877700788778777877700078778888878770078878888887887007888
    888888878700787888888887F7007878FFFF87788700088788FF887880000788
    788F87887000007887777887000000078888887000000000077770000000FFFF
    0000FFF90000F8600000E0000000C00100008003000080030000000300000003
    000000030000000300008007000080070000C00F0000E01F0000F87F0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FindColor
  PixelsPerInch = 96
  TextHeight = 13
  object ToleranceLabel: TLabel
    Left = 205
    Top = 20
    Width = 57
    Height = 13
    Caption = 'Tol'#233'rance : '
  end
  object FindColorGrpBox: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 97
    Caption = 'Couleur '#224' chercher'
    TabOrder = 0
    object ColorShape: TShape
      Left = 8
      Top = 56
      Width = 169
      Height = 33
    end
    object ResultLabel: TLabel
      Left = 32
      Top = 58
      Width = 121
      Height = 28
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object ChooseColorBtn: TButton
      Left = 8
      Top = 24
      Width = 169
      Height = 25
      Caption = 'S'#233'lectionner la couleur'
      TabOrder = 0
      OnClick = ChooseColorBtnClick
    end
  end
  object ToleranceValue: TSpinEdit
    Left = 264
    Top = 17
    Width = 57
    Height = 22
    EditorEnabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 1
    Value = 30
    OnChange = FindColor
    OnEnter = FindColor
    OnExit = FindColor
  end
  object CloseBtn: TButton
    Left = 200
    Top = 48
    Width = 121
    Height = 25
    Caption = 'Fermer'
    TabOrder = 2
    OnClick = CloseBtnClick
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 144
    Top = 8
  end
end
