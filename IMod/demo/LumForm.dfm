object LumiForm: TLumiForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Luminosit'#233
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
    00000000000000000000000000000000000BB00000000000BBBBBBBB0000000B
    BBBBBBBBB000000BBBBBBBBBB000000BBBBBBBBBB00000BBBBBBBBBBBB0000BB
    BBBBBBBBBB00000BBBBBBBBBB000000BBBBBBBBBB000000BBBBBBBBBB0000000
    BBBBBBBB00000000000BB000000000000000000000000000000000000000FFFF
    0000FC3F0000E0070000C0030000C0030000C003000080010000800100008001
    000080010000C0030000C0030000C0030000E0070000FC3F0000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LumGrpBox: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 73
    Caption = 'Modifier la luminosit'#233
    TabOrder = 0
    object MinLabel: TLabel
      Left = 17
      Top = 28
      Width = 21
      Height = 13
      Caption = '-255'
    end
    object MaxLabel: TLabel
      Left = 241
      Top = 28
      Width = 18
      Height = 13
      Caption = '255'
    end
    object LumValueInfo: TLabel
      Left = 125
      Top = 53
      Width = 32
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
    end
    object LumValue: TTrackBar
      Left = 40
      Top = 24
      Width = 201
      Height = 25
      Max = 255
      Min = -255
      Orientation = trHorizontal
      Frequency = 1
      Position = 0
      SelEnd = 0
      SelStart = 0
      TabOrder = 0
      TickMarks = tmBottomRight
      TickStyle = tsNone
      OnChange = LumValueChange
    end
  end
  object CancelBtn: TButton
    Left = 200
    Top = 88
    Width = 91
    Height = 33
    Caption = 'Annuler'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object ApplyBtn: TButton
    Left = 16
    Top = 88
    Width = 91
    Height = 33
    Caption = 'Appliquer'
    TabOrder = 2
    OnClick = ApplyBtnClick
  end
end
