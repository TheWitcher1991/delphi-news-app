unit Auth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses DB, Main, News;

{$R *.dfm}

// Случайная строка
function RandomStr: string;
const N = 30;
var i: integer;
    s: string;
begin
  Randomize;
  s := '';
  for i := 1 to N do
    s := s + chr (random( ord('Z') - ord('A') + 1) + ord('A'));
  Result := s;
end;

// Авторизация
procedure TForm5.Button1Click(Sender: TObject);
var login: string;
    password: string;
    hash: string;
    f: TextFile;
begin
  if (Trim(SESSION_HASH) = EmptyStr) AND (SESSION_ID <= 0) then
    begin
      login := Edit1.Text;
      password := Edit2.Text;
      hash := RandomStr();

      try
        // Получение пользователя из базы
        DataModule1.TaQuery.Close;
        DataModule1.TaQuery.SQL.text := 'SELECT * FROM `users` WHERE `login` = :login AND `password` = :pass';
        DataModule1.TaQuery.Parameters.ParamByName('login').Value := login;
        DataModule1.TaQuery.Parameters.ParamByName('pass').Value := password;
        DataModule1.TaQuery.Open;

        // Сохранение данных
        SESSION_ID := DataModule1.TaQuery.FieldValues['id'];
        SESSION_HASH := hash;

        // Запись кода сессии в файл
        AssignFile(f, 'session.txt');
        Rewrite(f);
        Writeln(f, hash);
        CloseFile(f);

        // Добавление сессии в базу
        DataModule1.TaQuery.Close;
        DataModule1.TaQuery.SQL.Clear;
        DataModule1.TaQuery.SQL.Text := 'INSERT INTO `sessions` (`session_code`, `user_id`) VALUES (:hash, :id)';
        DataModule1.TaQuery.Parameters.ParamByName('hash').Value := hash;
        DataModule1.TaQuery.Parameters.ParamByName('id').Value := SESSION_ID;
        DataModule1.TaQuery.ExecSQL;

        Form5.Hide;
        Form3.Show;
      except
        on e:Exception do
          ShowMessage('Неверный логин или пароль');
      end;
    end;
end;

end.
