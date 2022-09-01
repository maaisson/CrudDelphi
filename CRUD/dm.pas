unit dm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IBX.IBCustomDataSet, Data.DB,
  Datasnap.DBClient, IBX.IBDatabase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, inifiles, iwsystem;

type
  TForm3 = class(TForm)
    DataBase: TIBDatabase;
    IBTransaction1: TIBTransaction;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    dbsMain: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  private
    procedure createconexion;
    { Private declarations }
  public
    { Public declarations }
//    conexaoClass : TConexao;
//    procedure createconexion;
    procedure LeINI(); virtual;
    procedure GravaINI(Usuario, Senha, Servidor, Banco: string; Porta: integer); virtual;
    procedure Conectar(var Conexao: TFDConnection; strUsuario, StrSenha: String); virtual;
  end;

  TFUncoes = class
    public
    class function LerIni(chave1, chave2 :string; ValorPadrao: String = ''): String;   static;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

{ TFUncoes }

class function TFUncoes.LerIni(chave1, chave2, ValorPadrao: String): String;
var
  Arquivo: string;
begin
  Arquivo := gsAppPath + gsAppName + '.ini';
end;

{ TForm3 }

procedure TForm3.Conectar(var Conexao: TFDConnection; strUsuario,
  StrSenha: String);
begin

end;

procedure TForm3.createconexion;
begin
  AssignFile(Arquivo, ExtractFilePath(paramstr(0)) + 'CAMINHO.TXT');
  Rewrite(FArquivo);
  WriteLn(FArquivo, S_Caminho);
  WriteLn(FArquivo, 'InterLitis');
  closeFile(FArquivo);
  Nome_Alias := 'InterLitis';

  dbsMain.Connected := False;
  conexaoClass := Tconexao.Create(ExtractFilePath(Application.ExeName) + 'config.ini', 'SISTEMA');
  conexaoClass.Conectar(dbsMain, 'INTEGRATIVAMASTER', 'interkey');
  dbsMain.Connected := True;

  DataBase.Connected := False;
  DataBase.DatabaseName := var_Alias;
  if (DataBase.Connected = True) then
    DataBase.Close;
  DataBase.Connected := True;
end;

procedure TForm3.GravaINI(Usuario, Senha, Servidor, Banco: string;
  Porta: integer);
begin

end;

procedure TForm3.LeINI;
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(Path);
  try
    Driver := ArqIni.ReadString(Secao, 'DriverID', '');
    Protocolo := ArqIni.ReadString(Secao, 'Protocol', '');
    Servidor := ArqIni.ReadString(Secao, 'Server', '');
    Database := ArqIni.ReadString(Secao, 'Database', '');
    RoleName := ArqIni.ReadString(Secao, 'RoleName', '');
    CharacterSet := ArqIni.ReadString(Secao, 'CharacterSet', '');
    SQLDialect := ArqIni.ReadString(Secao, 'SQLDialect', '');
    ExtendedMetaData := ArqIni.ReadString(Secao, 'ExtendedMetadata', '');
    Nome := ArqIni.ReadString(Secao, 'Name', '');
    Porta := ArqIni.ReadString(Secao, 'Porta', '');

  finally
    ArqIni.Free;
  end;
end;

end.
