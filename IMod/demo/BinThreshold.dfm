object BinarizeForm: TBinarizeForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Binarisation'
  ClientHeight = 129
  ClientWidth = 305
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
    00000000000007000000000000000800000088888800080000008FFFF8000800
    00008FFFF800080000008FFFF800080000008FFFF800080000008FFFF8000800
    00008FFFF800080000008FFFF800080000008FFFF800080000008FFFF8000800
    00008FFFF800080000008FFFF80008888888888888700000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000800100008001000080010000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object InfoLabel: TLabel
    Left = 8
    Top = 8
    Width = 100
    Height = 13
    Caption = 'Seuil de binarisation :'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 56
    Width = 97
    Height = 25
    Caption = 'Appliquer'
    TabOrder = 0
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 8
    Top = 88
    Width = 97
    Height = 25
    Caption = 'Annuler'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object BinThresholdValue: TSpinEdit
    Left = 8
    Top = 25
    Width = 97
    Height = 22
    MaxValue = 255
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object BinChoiceBox: TRadioGroup
    Left = 112
    Top = 8
    Width = 185
    Height = 113
    Caption = 'En cas d'#39#233'galit'#233', la couleur est'
    ItemIndex = 0
    Items.Strings = (
      'Binarisation blanche'
      'Binarisation noire')
    TabOrder = 3
  end
end
