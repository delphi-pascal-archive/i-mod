object ReplaceForm: TReplaceForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Remplacer une couleur'
  ClientHeight = 144
  ClientWidth = 393
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
    077777770000000078FFFFF870000007888FFF8887000007F888F88887000007
    F8788888F7000007F8788888F7000007FFFFFFF8F7000007F8777778F7000007
    F7777778F7000007777877878700007777877373870007777877F78337000777
    887777783700077787000007F30007877000000077000777000000000300F80F
    0000F0070000E0030000E0030000E0030000E0030000E0030000E0030000E003
    0000E0030000C0030000800300008003000083E3000087F300008FFB0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToleranceLabel: TLabel
    Left = 13
    Top = 116
    Width = 57
    Height = 13
    Caption = 'Tol'#233'rance : '
  end
  object ColorToChangeGrpBox: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 97
    Caption = 'Couleur '#224' remplacer'
    TabOrder = 0
    object ColorShape1: TShape
      Left = 8
      Top = 56
      Width = 169
      Height = 33
    end
    object ChooseColor1Btn: TButton
      Left = 8
      Top = 24
      Width = 169
      Height = 25
      Caption = 'S'#233'lectionner la couleur'
      TabOrder = 0
      OnClick = ChooseColor1BtnClick
    end
  end
  object ChangeColorGrpBox: TGroupBox
    Left = 200
    Top = 8
    Width = 185
    Height = 97
    Caption = 'Couleur de remplacement'
    TabOrder = 1
    object ColorShape2: TShape
      Left = 8
      Top = 56
      Width = 169
      Height = 33
    end
    object ChooseColor2Btn: TButton
      Left = 8
      Top = 24
      Width = 169
      Height = 25
      Caption = 'S'#233'lectionner la couleur'
      TabOrder = 0
      OnClick = ChooseColor2BtnClick
    end
  end
  object ToleranceValue: TSpinEdit
    Left = 72
    Top = 113
    Width = 121
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 2
    Value = 30
  end
  object ApplyBtn: TButton
    Left = 208
    Top = 112
    Width = 81
    Height = 25
    Caption = 'Appliquer'
    TabOrder = 3
    OnClick = ApplyBtnClick
  end
  object CloseBtn: TButton
    Left = 296
    Top = 112
    Width = 83
    Height = 25
    Caption = 'Annuler'
    TabOrder = 4
    OnClick = CloseBtnClick
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 184
    Top = 8
  end
end
