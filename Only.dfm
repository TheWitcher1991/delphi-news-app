object Form6: TForm6
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form6'
  ClientHeight = 307
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _img: TImage
    Left = 8
    Top = 8
    Width = 50
    Height = 50
    Stretch = True
  end
  object _date: TLabel
    Left = 72
    Top = 16
    Width = 28
    Height = 13
    Caption = '_date'
    Color = clBtnShadow
    ParentColor = False
  end
  object _user: TLabel
    Left = 72
    Top = 35
    Width = 27
    Height = 13
    Caption = '_user'
    Color = clBtnShadow
    ParentColor = False
  end
  object _title: TLabel
    Left = 8
    Top = 72
    Width = 30
    Height = 13
    Caption = '_title'
    Color = clWindowText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object _cat: TLabel
    Left = 128
    Top = 16
    Width = 21
    Height = 13
    Caption = '_cat'
  end
  object _text: TMemo
    Left = 8
    Top = 91
    Width = 428
    Height = 208
    Lines.Strings = (
      '_text')
    ReadOnly = True
    TabOrder = 0
  end
end
