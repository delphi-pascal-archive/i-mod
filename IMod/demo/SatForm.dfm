object SaturForm: TSaturForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Saturation'
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
    077777777770000078888888888700007FF888F888870000788F888888870000
    3888F88888780003B787888877700003BBBB877B3000033BBBBBBBBBB330033B
    BBBBBBBBB3300003BBBBBBBB30000003BBBBBBBB300000003BBBBBB300000000
    033BB3300000000000033000000000000003300000000000000000000000F801
    0000F0000000F0000000F0000000F0000000E0010000E0070000800100008001
    0000E0070000E0070000F00F0000F81F0000FE7F0000FE7F0000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SaturGrpBox: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 73
    Caption = 'Modifier la saturation'
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
    object SaturValueLabel: TLabel
      Left = 125
      Top = 53
      Width = 32
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
    end
    object SaturValue: TTrackBar
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
      OnChange = SaturValueChange
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
