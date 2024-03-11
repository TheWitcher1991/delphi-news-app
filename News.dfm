object Form3: TForm3
  Left = 0
  Top = 0
  HelpType = htKeyword
  HelpKeyword = '1'
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1086#1089#1090#1080
  ClientHeight = 510
  ClientWidth = 471
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 53
    Width = 72
    Height = 23
    Caption = #1053#1086#1074#1086#1089#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object AddNews: TButton
    Left = 436
    Top = 8
    Width = 27
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = AddNewsClick
  end
  object ComboBox1: TComboBox
    Left = 341
    Top = 58
    Width = 122
    Height = 21
    TabOrder = 1
    OnChange = ComboBox1Change
    Items.Strings = (
      #1055#1086' '#1072#1074#1090#1086#1088#1072#1084
      #1055#1086' '#1076#1072#1090#1077)
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 8
    Top = 96
    Width = 455
    Height = 406
    BorderStyle = bsNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object Logout: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Logout'
    TabOrder = 3
    OnClick = LogoutClick
  end
  object Profile: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1088#1086#1092#1080#1083#1100
    TabOrder = 4
    OnClick = ProfileClick
  end
end
