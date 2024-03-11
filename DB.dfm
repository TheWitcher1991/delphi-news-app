object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 369
  Width = 433
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=admin;Data Source='#1053#1086#1074#1086#1089 +
      #1090#1080'.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLED' +
      'B:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Databa' +
      'se Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Lockin' +
      'g Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bu' +
      'lk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:C' +
      'reate System Database=False;Jet OLEDB:Encrypt Database=False;Jet' +
      ' OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact With' +
      'out Replica Repair=False;Jet OLEDB:SFP=False'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 192
    Top = 24
  end
  object TaCat: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'category'
    Left = 72
    Top = 104
    object TaCatId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object TaCattitle: TWideStringField
      FieldName = 'title'
      Size = 255
    end
  end
  object dsCat: TDataSource
    DataSet = TaCat
    Left = 160
    Top = 104
  end
  object TaNews: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = 'cat_id'
    MasterFields = 'Id'
    MasterSource = dsCat
    TableName = 'news'
    Left = 72
    Top = 176
    object TaNewsId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object TaNewscat_id: TIntegerField
      FieldName = 'cat_id'
    end
    object TaNewstitle: TWideStringField
      FieldName = 'title'
      Size = 255
    end
    object TaNewscontent: TWideMemoField
      FieldName = 'content'
      BlobType = ftWideMemo
    end
    object TaNewsuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object TaNewsdate_set: TDateTimeField
      FieldName = 'date_set'
    end
  end
  object dsNews: TDataSource
    DataSet = TaNews
    Left = 160
    Top = 176
  end
  object dsQuery: TDataSource
    DataSet = TaQuery
    Left = 264
    Top = 272
  end
  object TaQuery: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 272
  end
  object dsUsers: TDataSource
    DataSet = TaUsers
    Left = 336
    Top = 104
  end
  object dsSessions: TDataSource
    DataSet = TaSessions
    Left = 336
    Top = 176
  end
  object TaUsers: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'users'
    Left = 248
    Top = 104
    object TaUsersid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TaUserslogin: TWideStringField
      FieldName = 'login'
      Size = 255
    end
    object TaUserspassword: TWideStringField
      FieldName = 'password'
      Size = 255
    end
    object TaUserstitle: TWideStringField
      FieldName = 'title'
      Size = 255
    end
    object TaUsersfile: TWideStringField
      FieldName = 'file'
      Size = 255
    end
  end
  object TaSessions: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'sessions'
    Left = 248
    Top = 176
    object TaSessionsid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TaSessionssession_code: TWideStringField
      FieldName = 'session_code'
      Size = 255
    end
    object TaSessionsuser_id: TIntegerField
      FieldName = 'user_id'
    end
  end
end
