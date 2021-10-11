object RGBOpForm: TRGBOpForm
  Left = 198
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Modifier les valeurs RGB'
  ClientHeight = 429
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
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000700000000000000089999AAAACCCC00089999AAAACCCC000899
    99AAAACCCC00089999AAAACCCC00089999AAAACCCC00089999AAAACCCC000899
    99AAAACCCC00089999AAAACCCC00089999AAAACCCC00089999AAAACCCC000899
    99AAAACCCC00089999AAAACCCC0008888888888888700000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000800100008001000080010000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AddRGBGrpBox: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 145
    Caption = 'Ajouter du RGB'
    TabOrder = 0
    object AddRPanel: TPanel
      Left = 8
      Top = 24
      Width = 217
      Height = 33
      Alignment = taLeftJustify
      Caption = '   Rouge : '
      TabOrder = 0
      object AddRLabel: TLabel
        Left = 188
        Top = 10
        Width = 18
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object AddRBar: TTrackBar
        Tag = 1
        Left = 55
        Top = 9
        Width = 130
        Height = 17
        Max = 255
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = ChangeInfoLabels
      end
    end
    object AddGPanel: TPanel
      Left = 8
      Top = 64
      Width = 217
      Height = 33
      Alignment = taLeftJustify
      Caption = '   Vert : '
      TabOrder = 1
      object AddGLabel: TLabel
        Left = 188
        Top = 10
        Width = 18
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object AddGBar: TTrackBar
        Tag = 2
        Left = 55
        Top = 9
        Width = 130
        Height = 17
        Max = 255
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = ChangeInfoLabels
      end
    end
    object AddBPanel: TPanel
      Left = 8
      Top = 104
      Width = 217
      Height = 33
      Alignment = taLeftJustify
      Caption = '   Bleu : '
      TabOrder = 2
      object AddBLabel: TLabel
        Left = 188
        Top = 10
        Width = 18
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object AddBBar: TTrackBar
        Tag = 3
        Left = 55
        Top = 9
        Width = 130
        Height = 17
        Max = 255
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = ChangeInfoLabels
      end
    end
  end
  object RetreiveRGBGrpBox: TGroupBox
    Left = 256
    Top = 8
    Width = 233
    Height = 145
    Caption = 'Enlever du RGB'
    TabOrder = 1
    object RetRPanel: TPanel
      Left = 8
      Top = 24
      Width = 217
      Height = 33
      Alignment = taLeftJustify
      Caption = '   Rouge : '
      TabOrder = 0
      object RetRLabel: TLabel
        Left = 188
        Top = 10
        Width = 18
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object RetRBar: TTrackBar
        Tag = 4
        Left = 55
        Top = 9
        Width = 130
        Height = 17
        Max = 255
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = ChangeInfoLabels
      end
    end
    object RetGPanel: TPanel
      Left = 8
      Top = 64
      Width = 217
      Height = 33
      Alignment = taLeftJustify
      Caption = '   Vert : '
      TabOrder = 1
      object RetGLabel: TLabel
        Left = 188
        Top = 10
        Width = 18
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object RetGBar: TTrackBar
        Tag = 5
        Left = 55
        Top = 9
        Width = 130
        Height = 17
        Max = 255
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = ChangeInfoLabels
      end
    end
    object RetBPanel: TPanel
      Left = 8
      Top = 104
      Width = 217
      Height = 33
      Alignment = taLeftJustify
      Caption = '   Bleu : '
      TabOrder = 2
      object RetBLabel: TLabel
        Left = 188
        Top = 10
        Width = 18
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object RetBBar: TTrackBar
        Tag = 6
        Left = 55
        Top = 9
        Width = 130
        Height = 17
        Max = 255
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = ChangeInfoLabels
      end
    end
  end
  object PrevGrpBox: TGroupBox
    Left = 8
    Top = 165
    Width = 481
    Height = 217
    Caption = 'Pr'#233'visualisation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
  object ApplyBtn: TButton
    Left = 16
    Top = 389
    Width = 153
    Height = 33
    Caption = 'Appliquer'
    TabOrder = 3
    OnClick = ApplyBtnClick
  end
  object PreviewBtn: TButton
    Left = 176
    Top = 389
    Width = 161
    Height = 33
    Caption = 'Pr'#233'visualisation'
    TabOrder = 4
    OnClick = PreviewBtnClick
  end
  object CloseBtn: TButton
    Left = 344
    Top = 389
    Width = 137
    Height = 33
    Caption = 'Annuler'
    TabOrder = 5
    OnClick = CloseBtnClick
  end
end
