unit DMPRINCIPAL;

interface

uses
  System.SysUtils, System.Classes, inifiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, Data.DB, Vcl.Controls, vcl.Forms, vcl.dialogs,
  IBX.IBDatabase, FireDAC.Moni.Base, FireDAC.Moni.FlatFile, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    Salvar: TFDTransaction;
    ibtPessoa: TIBTransaction;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCharacterSet: string;
    FPath: string;
    FServidor: string;
    FDriver: string;
    FSQLDialect: string;
    FProtocolo: string;
    FExtendedMetaData: string;
    FRoleName: string;
    FSenha: string;
    FDatabase: string;
    FNome: string;
    FUsuario: string;
    FPorta: string;
    FSecao: string;
    { Private declarations }
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
    procedure GravaINI(Usuario, Senha, Servidor, Banco: string; Porta: integer); virtual;
    procedure LerIni();
    procedure Conectar;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.Conectar;
begin
  LerINI();

  try
    Conexao.Connected := false;
    Conexao.LoginPrompt := false;

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
    Conexao.Params.UserName := 'INTEGRATIVAMASTER';
    Conexao.Params.Password := 'interkey';

    Conexao.Connected := True;
  Except
    on E: Exception do
      ShowMessage('Erro ao carregar parâmetros de conexão!'#13#10 + E.Message);
  end;
end;

constructor TDM.Create(Path, Secao: string);
begin
  if FileExists(Path) then
  begin
    Self.Path := Path;
    Self.Secao := Secao;
  end
  else
    raise Exception.Create('Arquivo INI para configuração não encontrado.'#13#10' Aplicação será finalizada.');
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  ArqIni : TIniFile;
begin
  Conectar;
end;

procedure TDM.GravaINI(Usuario, Senha, Servidor, Banco: string; Porta: integer);
var
  ArqIni: TIniFile;
begin
  Path := ExtractFilePath(Application.exename) + 'config.ini';
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

procedure TDM.LerIni;
var
  ArqIni: TIniFile;
begin
  Path := ExtractFilePath(Application.exename) + 'config.ini';
  Secao := 'SISTEMA';
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
