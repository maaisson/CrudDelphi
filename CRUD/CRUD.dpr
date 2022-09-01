program CRUD;

uses
  Vcl.Forms,
  principal in 'principal.pas' {Form2},
  uConexao in 'uConexao.pas',
  DMPRINCIPAL in 'DMPRINCIPAL.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
