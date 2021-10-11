object SeuilRForm: TSeuilRForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Seuil Rouge'
  ClientHeight = 85
  ClientWidth = 177
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
    0000000000000700000000000000089999999999990008999999999999000899
    9999999999000899999999999900089999999999990008999999999999000899
    9999999999000899999999999900089999999999990008999999999999000899
    999999999900089999999999990008888888888888700000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000800100008001000080010000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MinLabel: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Minimum :'
  end
  object MaxLabel: TLabel
    Left = 96
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Maximum'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Appliquer'
    TabOrder = 0
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 96
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Annuler'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object MinValue: TSpinEdit
    Left = 8
    Top = 27
    Width = 73
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 2
    Value = 1
  end
  object MaxValue: TSpinEdit
    Left = 96
    Top = 27
    Width = 73
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 3
    Value = 1
  end
end
