object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 274
  ClientWidth = 313
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 32
    Width = 150
    Height = 23
    Caption = #1042#1093#1086#1076' '#1074' '#1089#1080#1089#1090#1077#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label3: TLabel
    Left = 24
    Top = 152
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Edit1: TEdit
    Left = 24
    Top = 99
    Width = 265
    Height = 21
    TabOrder = 0
    Text = 'test@mail.ru'
  end
  object Edit2: TEdit
    Left = 24
    Top = 171
    Width = 265
    Height = 21
    TabOrder = 1
    Text = '123456'
  end
  object Button1: TButton
    Left = 24
    Top = 224
    Width = 75
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 2
    OnClick = Button1Click
  end
end
