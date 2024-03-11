unit AddNews;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Memo: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses DB, Main, News;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form2.Close;
end;

// ��������� combox � �����������
procedure TForm2.FormCreate(Sender: TObject);
begin
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.text:= 'SELECT * FROM `category`';
    DataModule1.TaQuery.Open;
    while not DataModule1.TaQuery.Eof do
    begin
        ComboBox1.Items.Add(DataModule1.TaQuery.FieldValues['title']);
        DataModule1.TaQuery.Next;
    end;
end;

// �������� id ��������� �� ��������
function getCategory(title: string): integer;
begin
  try
    DataModule1.TaQuery.Close;
    DataModule1.TaQuery.SQL.Clear;
    DataModule1.TaQuery.SQL.text:= 'SELECT * FROM `category` WHERE `title` = :title';
    DataModule1.TaQuery.Parameters.ParamByName('title').Value := title;
    DataModule1.TaQuery.Open;
    Result := DataModule1.TaQuery.FieldValues['id'];
  except
  end;
end;

// �������� �������
procedure TForm2.Button1Click(Sender: TObject);
var cat: integer;
begin

  if (Trim(Edit1.Text) = '') OR (Trim(Memo.Text) = '') OR (Trim(ComboBox1.Text) = '') then
    ShowMessage('��������� ��� ����')
  else
    begin
      cat := getCategory(ComboBox1.Text);

      try
        DataModule1.TaQuery.Close;
        DataModule1.TaQuery.SQL.Clear;
        DataModule1.TaQuery.SQL.Text := 'INSERT INTO `news` (`cat_id`, `title`, `content`, `user_id`, `date_set`) VALUES (:cat, :title, :content, :ui, :date)';
        DataModule1.TaQuery.Parameters.ParamByName('cat').Value := cat;
        DataModule1.TaQuery.Parameters.ParamByName('title').Value := Edit1.Text;
        DataModule1.TaQuery.Parameters.ParamByName('content').Value := Memo.Text;
        DataModule1.TaQuery.Parameters.ParamByName('ui').Value := SESSION_ID;
        DataModule1.TaQuery.Parameters.ParamByName('date').Value := FormatDateTime('dd.mm.yyyy', Now);
        DataModule1.TaQuery.ExecSQL;
        ShowMessage('������� ���������');

        Form3.Hide;
        Form3.Show;
      except
        on e:Exception do
          ShowMessage('�������� ������');
      end;
    end;

end;

end.
