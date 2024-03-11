object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1092#1080#1083#1100
  ClientHeight = 380
  ClientWidth = 322
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
    Left = 222
    Top = 136
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label2: TLabel
    Left = 24
    Top = 256
    Width = 72
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100
  end
  object Label4: TLabel
    Left = 69
    Top = 136
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label3: TLabel
    Left = 24
    Top = 296
    Width = 108
    Height = 13
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  end
  object Image1: TImage
    Left = 39
    Top = 24
    Width = 100
    Height = 100
    Stretch = True
  end
  object Save: TButton
    Left = 24
    Top = 192
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = SaveClick
  end
  object Edit1: TEdit
    Left = 168
    Top = 155
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 152
    Top = 253
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 152
    Top = 293
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 24
    Top = 155
    Width = 129
    Height = 21
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 152
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 5
  end
  object UpdateImg: TButton
    Left = 152
    Top = 51
    Width = 129
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 6
    OnClick = UpdateImgClick
  end
  object ResetPassword: TButton
    Left = 21
    Top = 328
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = ResetPasswordClick
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 56
  end
end
