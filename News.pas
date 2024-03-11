﻿unit News;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    AddNews: TButton;
    ComboBox1: TComboBox;
    ScrollBox1: TScrollBox;
    Logout: TButton;
    Profile: TButton;
    procedure FormShow(Sender: TObject);
    procedure AddNewsClick(Sender: TObject);
    procedure ProfileClick(Sender: TObject);
    procedure LogoutClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CreatePopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  NEWS_ID: integer;

implementation

uses DB, AddNews, Profile, Main, Only, Auth;

{$R *.dfm}

var _bth: TButton;
    SQL_ACTIVE: integer;
    SQL_TEXT: string;

// Получить данные пользователя по id
function getUser(id: integer) : User;
begin
  DataModule1.TaQuery.Close;
  DataModule1.TaQuery.SQL.text := 'SELECT * FROM `users` WHERE `id` = :id';
  DataModule1.TaQuery.Parameters.ParamByName('id').Value := id;
  DataModule1.TaQuery.Open;

  Result[0] := DataModule1.TaQuery.FieldValues['login'];
  Result[1] := DataModule1.TaQuery.FieldValues['password'];
  Result[2] := DataModule1.TaQuery.FieldValues['title'];
  Result[3] := DataModule1.TaQuery.FieldValues['file'];
end;

procedure TForm3.AddNewsClick(Sender: TObject);
begin
  Form2.Show;
end;

// Выход из аккаунта
procedure TForm3.LogoutClick(Sender: TObject);
var f: TextFile;
begin
  try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.Text := 'DELETE FROM `sessions` WHERE `user_id` = :code';
    DataModule1.TaQuery.Parameters.ParamByName('code').Value := SESSION_ID;
    DataModule1.TaQuery.ExecSQL;

    AssignFile(f, 'session.txt');
    Rewrite(f);
    CloseFile(f);

    SESSION_ID := 0;
    SESSION_HASH := '';

    Form3.Hide;
    Form5.Show;
  except
    on e:Exception do
      ShowMessage('Возникла ошибка');
  end;
end;

procedure TForm3.ProfileClick(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'По дате' then
    SQL_ACTIVE := 1;
  if ComboBox1.Text = 'По авторам' then
    SQL_ACTIVE := 2;

  Form3.Hide;
  Form3.Show;
end;

// Модальное окно с новостью
procedure TForm3.CreatePopup(Sender: TObject);
var id: integer;
begin
  id := StrToInt((Sender as TButton).Hint);

  NEWS_ID := id;

  Form6.Show;
end;

// Вывод списка новостей
procedure TForm3.FormShow(Sender: TObject);
var _panel: TPanel;
    _title: TLabel;
    _date: TLabel;
    margin: integer;
begin

  if SQL_ACTIVE <= 1 then
    SQL_TEXT := 'SELECT * FROM `news` ORDER BY `id` DESC';
  if SQL_ACTIVE = 2 then
      SQL_TEXT := 'SELECT * FROM `news` ORDER BY `user_id` ASC';

  try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.text := 'SELECT COUNT(id) AS `fil` FROM `news`';
    DataModule1.TaQuery.Open;

    Label1.Caption := 'Новости, ' + DataModule1.TaQuery.FieldByName('fil').AsString;
  except

  end;

  {try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.text:= 'SELECT * FROM category';
    DataModule1.TaQuery.Open;
    while not DataModule1.TaQuery.Eof do
    begin
        ComboBox2.Items.Add(DataModule1.TaQuery.FieldValues['title']);
        DataModule1.TaQuery.Next;
    end;
  except

  end;}


  try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.text := SQL_TEXT;
    DataModule1.TaQuery.Open;

    margin := 0;

    while not DataModule1.TaQuery.Eof do
    begin
        _panel := TPanel.Create(ScrollBox1);
        _panel.Parent := ScrollBox1;
        _panel.AlignWithMargins := True;
        _panel.Width := 455;
        _panel.Height := 65;
        _panel.Left := 0;
        _panel.Top := margin;

        _date := TLabel.Create(_panel);
        _date.Parent := _panel;
        _date.Left := 8;
        _date.Top := 8;
        _date.Font.Color := cl3DDkShadow;
        _date.Caption := DataModule1.TaQuery.FieldValues['date_set'];

        _title := TLabel.Create(_panel);
        _title.Parent := _panel;
        _title.Left := 8;
        _title.Top := 26;
        _title.Font.Size := 10;
        _title.Caption := DataModule1.TaQuery.FieldValues['title'];

        _bth := TButton.Create(_panel);
        _bth.Parent := _panel;
        _bth.Caption := 'Подробно';
        _bth.Left := 365;
        _bth.Top := 30;
        _bth.Hint := DataModule1.TaQuery.FieldValues['id'];

        _bth.OnClick := CreatePopup;

        DataModule1.TaQuery.Next;

        margin := margin + 65;
    end;
  except
    on e:Exception do
      ShowMessage('Возникла ошибка');
  end;
end;

end.
