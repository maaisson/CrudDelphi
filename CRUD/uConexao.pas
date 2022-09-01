unit uConexao;

interface

uses
IniFiles, SysUtils, Forms, FireDAC.Comp.Client, Dialogs;

type
  TConexao = class
  private
    FPath: string;
    FServidor: string;
    FPorta: string;
    FDatabase: string;
    FSenha: string;
    FUsuario: string;
    FDriver: string;
    FSecao: string;
    FProtocolo: String;
    FCharacterSet: String;
    FExtendedMetaData: String;
    FRoleName: String;
    FNome: String;
    FSQLDialect: String;

  public
    property Path: string read FPath write FPath;
    property Servidor: string read FServidor write FServidor;
    property Porta: string read FPorta write FPorta;
    property Database: string read FDatabase write FDatabase;
    property Senha: string read FSenha write FSenha;
    property Usuario: string read FUsuario write FUsuario;
    property Driver: string read FDriver write FDriver;
    property Secao: string read FSecao write FSecao;
    property Protocolo: string read FProtocolo write FProtocolo;
    property CharacterSet: string read FCharacterSet write FCharacterSet;
    property ExtendedMetaData: string read FExtendedMetaData write FExtendedMetaData;
    property RoleName: string read FRoleName write FRoleName;
    property Nome: string read FNome write FNome;
    property SQLDialect: string read FSQLDialect write FSQLDialect;

    constructor Create(Path: string; Secao: string);

    procedure LeINI(); virtual;
    procedure GravaINI(Usuario, Senha, Servidor, Banco: string; Porta: integer); virtual;
    procedure Conectar(var Conexao: TFDConnection; strUsuario, StrSenha: String); virtual;
  end;

implementation

{ TConexao }

procedure TConexao.Conectar(var Conexao: TFDConnection; strUsuario,
  StrSenha: String);
begin
  LeIni();

  try
    Conexao.Connected := False;
    Conexao.LoginPrompt := False;

    Conexao.Params.Clear;
    Conexao.Params.Add('RoleName=' + RoleName);
    Conexao.Params.Add('Server=' + Servidor);
    Conexao.Params.Add('CharacterSet=' + CharacterSet);
    Conexao.Params.Add('SQLDialect=' + SQLDialect);
    Conexao.Params.Add('Protocol=' + Protocolo);
    Conexao.Params.Add('ExtendedMetadata=' + ExtendedMetaData);
    Conexao.Params.Add('ConnectionName=' + Nome);
    Conexao.Params.Add('Port=' + Porta);
    Conexao.Params.Add('MonitorBy=FlatFile');

    Conexao.Params.DriverID := Driver;
    Conexao.Params.Database := Database;
    Conexao.Params.UserName := strUsuario;
    Conexao.Params.Password := StrSenha;
  Except
    on E: Exception do
      ShowMessage('Erro ao carregar parâmetros de conexão!'#13#10 + E.Message);
  end;
end;

constructor TConexao.Create(Path, Secao: string);
begin
  if FileExists(Path) then
  begin
    Self.Path := Path;
    Self.Secao := Secao;
  end
  else
    raise Exception.Create('Arquivo INI para configuração não encontrado.'#13#10' Aplicação será finalizada.');
end;

procedure TConexao.GravaINI(Usuario, Senha, Servidor, Banco: string; Porta: integer);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(Path);
  try
    ArqIni.WriteString(Secao, 'Usuario', Usuario);
    ArqIni.WriteString(Secao, 'Senha', Senha);
    ArqIni.WriteString(Secao, 'Database', Banco);
    ArqIni.WriteString(Secao, 'Servidor', Servidor);
    ArqIni.WriteInteger(Secao, 'Porta', Porta);
  finally
    ArqIni.Free;
  end;
end;

procedure TConexao.LeINI;
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
