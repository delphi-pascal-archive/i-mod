object ReconstForm: TReconstForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Reconstruire une couleur'
  ClientHeight = 144
  ClientWidth = 291
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
    00000003333778787878788373838FFFFFF888F383837FFFFFF888F373838FF7
    777788F383837FF7777778F333838FF7777778F38B837FF78F8888F37B838FF7
    777778838B837FFFFFF888837B838FF8888888838B837FFFFFF888837B838FF8
    888888838B837FFFFFF8888373838FFFFFFF888388837878787878733337FFE0
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
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
  object ColorGrpBox: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 97
    Caption = 'Couleur '#224' reconstruire'
    TabOrder = 0
    object ColorShape: TShape
      Left = 8
      Top = 56
      Width = 169
      Height = 33
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
    Left = 72
    Top = 113
    Width = 121
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 1
    Value = 30
  end
  object ApplyBtn: TButton
    Left = 200
    Top = 16
    Width = 83
    Height = 25
    Caption = 'Appliquer'
    TabOrder = 2
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 200
    Top = 48
    Width = 83
    Height = 25
    Caption = 'Annuler'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 152
  end
end
