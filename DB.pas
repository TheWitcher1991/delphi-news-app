unit DB;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    TaCat: TADOTable;
    dsCat: TDataSource;
    TaNews: TADOTable;
    dsNews: TDataSource;
    dsQuery: TDataSource;
    TaQuery: TADOQuery;
    TaCatId: TAutoIncField;
    TaCattitle: TWideStringField;
    dsUsers: TDataSource;
    dsSessions: TDataSource;
    TaUsers: TADOTable;
    TaSessions: TADOTable;
    TaSessionsid: TAutoIncField;
    TaSessionssession_code: TWideStringField;
    TaSessionsuser_id: TIntegerField;
    TaUsersid: TAutoIncField;
    TaUserslogin: TWideStringField;
    TaUserspassword: TWideStringField;
    TaUserstitle: TWideStringField;
    TaUsersfile: TWideStringField;
    TaNewsId: TAutoIncField;
    TaNewscat_id: TIntegerField;
    TaNewstitle: TWideStringField;
    TaNewscontent: TWideMemoField;
    TaNewsuser_id: TIntegerField;
    TaNewsdate_set: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
