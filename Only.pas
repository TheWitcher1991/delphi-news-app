unit Only;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    _img: TImage;
    _date: TLabel;
    _user: TLabel;
    _title: TLabel;
    _text: TMemo;
    _cat: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses DB, Main, News;

{$R *.dfm}

function getCategory(id: integer): string;
begin
  try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.text:= 'SELECT * FROM category WHERE id = :id';
    DataModule1.TaQuery.Parameters.ParamByName('id').Value := id;
    DataModule1.TaQuery.Open;
    Result := DataModule1.TaQuery.FieldValues['title'];
  except
    on e:Exception do
      ShowMessage('Категория не найдена');
  end;
end;

// Получить данные пользователя по id
function getUser(id: integer) : User;
begin
  DataModule1.TaQuery.Close;
  DataModule1.TaQuery.SQL.text := 'SELECT * FROM `users` WHERE id = :id';
  DataModule1.TaQuery.Parameters.ParamByName('id').Value := id;
  DataModule1.TaQuery.Open;

  Result[0] := DataModule1.TaQuery.FieldValues['login'];
  Result[1] := DataModule1.TaQuery.FieldValues['password'];
  Result[2] := DataModule1.TaQuery.FieldValues['title'];
  Result[3] := DataModule1.TaQuery.FieldValues['file'];
end;

procedure TForm6.FormShow(Sender: TObject);
var use: User;
    ui: integer;
    catid: integer;
    cat: string;
begin
try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.Text := 'SELECT * FROM `news` WHERE `id` = :id';
    DataModule1.TaQuery.Parameters.ParamByName('id').Value := NEWS_ID;
    DataModule1.TaQuery.Open;

    Form6.Caption := DataModule1.TaQuery.FieldValues['title'];

    ui := DataModule1.TaQuery.FieldValues['user_id'];
    catid := DataModule1.TaQuery.FieldValues['cat_id'];

    _date.Caption := DataModule1.TaQuery.FieldValues['date_set'];

    _title.Caption := DataModule1.TaQuery.FieldValues['title'];

    _text.Text := DataModule1.TaQuery.FieldValues['content'];
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;

    use := getUser(ui);
    cat := getCategory(catid);

    _img.Picture.LoadFromFile('files\' + use[3]);
    _img.Picture.Assign(_img.Picture);

    _user.Caption := use[2];
    _cat.Caption := ', ' + cat;
  except
    on e:Exception do
      ShowMessage('Новость не найдена');
  end;
end;

end.
