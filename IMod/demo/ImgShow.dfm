object ImgShowForm: TImgShowForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Modifier l'#39'affichage de l'#39'image'
  ClientHeight = 142
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
    0000000000000666666666666600788777777777787078787777777777867868
    8888888887867868888888888886786888888888888678688888888888867868
    8888888888867868888888888886786888888888888678766666666666607888
    888888888700787777777777700078888888700000000777777700000000FFFF
    0000800300000001000000000000000000000000000000000000000000000000
    00000000000000000000000100000003000000070000007F000080FF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ShowType: TRadioGroup
    Left = 8
    Top = 8
    Width = 201
    Height = 129
    Caption = 'Affichage de l'#39'image'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Centrer l'#39'image'
      'Etirer l'#39'image'
      'Etirer l'#39'image proportionnellement'
      'Laisser telle-qu'#39'elle')
    ParentFont = False
    TabOrder = 0
  end
  object ApplyBtn: TButton
    Left = 216
    Top = 16
    Width = 89
    Height = 33
    Caption = 'Appliquer'
    TabOrder = 1
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 216
    Top = 56
    Width = 89
    Height = 33
    Caption = 'Annuler'
    TabOrder = 2
    OnClick = CancelBtnClick
  end
end
