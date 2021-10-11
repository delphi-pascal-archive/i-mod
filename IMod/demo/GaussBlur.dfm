object GaussForm: TGaussForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Flou Gaussien'
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
    00000000000000077777777777700078888888888887007FF8F8888888870078
    FFFF88F888870007FFFFF8FFF87007778F8FF888F8707888777FFF8777007FF8
    F888F888870078FFFF887788870007FFFFF8FFF87000078F8FF888F870000077
    7FFF87770000000088F88700000000000077000000000000000000000000FFFF
    0000E0010000C0000000C0000000C0000000E001000080010000000300000003
    0000000300008007000080070000C00F0000F03F0000FCFF0000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object InfoLabel: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Quantit'#233' de flou :'
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
  object GaussValue: TSpinEdit
    Left = 8
    Top = 27
    Width = 161
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
end
