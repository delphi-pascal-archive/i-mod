object BoolOpForm: TBoolOpForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Operations bool'#233'ennes'
  ClientHeight = 362
  ClientWidth = 497
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
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008777
    7777777777787FFFFFFFFFFFFFF77FFFFF888888FFF77FF88877778888F77FFF
    F7888878F8F77FFFF78FFF78FFF77FFFF78FFF7FFFF77FFFF788880FFFF77FFF
    F787880FFFF77FFFF777770FFFF77FFFF777770FFFF77FFFF877777FFFF77FFF
    FFFFFFFFFFF77FFFFFFFFFFFFFF77FFFFFFFFFFFFFF787777777777777780000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OperationBox: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 121
    Caption = 'Op'#233'ration '#224' effectuer'
    ItemIndex = 0
    Items.Strings = (
      'Fusion image - constante'
      'XOR image - constante'
      'OR image - constante'
      'AND image - constante')
    TabOrder = 0
  end
  object ConstantGrpBox: TGroupBox
    Left = 200
    Top = 8
    Width = 185
    Height = 121
    Caption = 'Constante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ColorShape: TShape
      Left = 8
      Top = 88
      Width = 169
      Height = 25
    end
    object PrevLabel: TLabel
      Left = 8
      Top = 70
      Width = 40
      Height = 13
      Caption = 'Aper'#231'u :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ChooseColorBtn: TButton
      Left = 8
      Top = 24
      Width = 169
      Height = 41
      Caption = 'S'#233'lectionner une couleur'
      TabOrder = 0
      OnClick = ChooseColorBtnClick
    end
  end
  object ApplyBtn: TButton
    Left = 392
    Top = 14
    Width = 97
    Height = 33
    Caption = 'Appliquer'
    TabOrder = 2
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 392
    Top = 94
    Width = 97
    Height = 33
    Caption = 'Annuler'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object PreviewBtn: TButton
    Left = 392
    Top = 54
    Width = 97
    Height = 33
    Caption = 'Pr'#233'visualiser'
    TabOrder = 4
    OnClick = PreviewBtnClick
  end
  object PreviewGrpBox: TGroupBox
    Left = 8
    Top = 136
    Width = 481
    Height = 217
    Caption = 'Pr'#233'visualisation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object AfterImg: TImage
      Left = 272
      Top = 29
      Width = 200
      Height = 180
      Stretch = True
    end
    object BeforeImg: TImage
      Left = 8
      Top = 29
      Width = 201
      Height = 180
      Stretch = True
    end
    object BeforeLabel: TLabel
      Left = 176
      Top = 11
      Width = 28
      Height = 13
      Caption = 'Avant'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object AfterLabel: TLabel
      Left = 272
      Top = 11
      Width = 27
      Height = 13
      Caption = 'Apr'#232's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 72
    Top = 72
  end
end
