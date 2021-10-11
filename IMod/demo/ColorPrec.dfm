object PrecForm: TPrecForm
  Left = 198
  Top = 114
  BorderStyle = bsSingle
  Caption = 'Pr'#233'cision des couleurs'
  ClientHeight = 71
  ClientWidth = 218
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
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF007777
    7777777777777FFFFFFFFFFFFFF77F6666FFFF6666F77F666FFFFFF666F77F66
    67FFFF7666F77F6F778FF877F6F77FFFF888F88FFFF77FFFFF8FFFFFFFF77FFF
    FF8FF8FFFFF77FFFF888888FFFF77F6F788FF877F6F77F6677FFFF7666F77F66
    6FFFFFF666F77F6666FFFF6666F77FFFFFFFFFFFFFF777777777777777770000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object InfoLabel: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Caption = 'Seuil de pr'#233'cision :'
  end
  object ApplyBtn: TButton
    Left = 112
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Appliquer'
    TabOrder = 0
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 112
    Top = 40
    Width = 97
    Height = 25
    Caption = 'Annuler'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object PrecisionThreshold: TSpinEdit
    Left = 8
    Top = 25
    Width = 97
    Height = 22
    MaxValue = 255
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
end
