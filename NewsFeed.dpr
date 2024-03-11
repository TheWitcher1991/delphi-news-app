program NewsFeed;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  DB in 'DB.pas' {DataModule1: TDataModule},
  AddNews in 'AddNews.pas' {Form2},
  News in 'News.pas' {Form3},
  Profile in 'Profile.pas' {Form4},
  Auth in 'Auth.pas' {Form5},
  Only in 'Only.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
