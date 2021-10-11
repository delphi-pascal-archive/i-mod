object RotationForm: TRotationForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rotation'
  ClientHeight = 120
  ClientWidth = 313
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
    0000000000000000000000000000022200000000000002A200000200000002A2
    00000220000002A2200002A2000002AA222222AA200002AAAAAAAAAAA20002AA
    AAAAAAAAAA20002AAAAAAAAAAAA20002AAAAAAAAAA200000222AAAAAA2000000
    002222AA20000000000002A2000000000000022000000000000002000000FFFF
    0000FFFF00008FFF00008FBF00008F9F0000878F000080070000800300008001
    0000C0000000E0010000F0030000FC070000FF8F0000FF9F0000FFBF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DegreeGrpBox: TRadioGroup
    Left = 8
    Top = 8
    Width = 97
    Height = 105
    Caption = 'Rotation de'
    ItemIndex = 0
    Items.Strings = (
      '90'#176
      '180'#176
      '270'#176)
    TabOrder = 0
  end
  object DirectionGrpBox: TRadioGroup
    Left = 112
    Top = 8
    Width = 97
    Height = 105
    Caption = 'Sens'
    ItemIndex = 0
    Items.Strings = (
      'Horaire'
      'Anti-horaire')
    TabOrder = 1
  end
  object ApplyBtn: TButton
    Left = 216
    Top = 16
    Width = 89
    Height = 33
    Caption = 'Appliquer'
    TabOrder = 2
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 216
    Top = 76
    Width = 89
    Height = 33
    Caption = 'Annuler'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
end
