unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.StdCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, DMPRINCIPAL, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, IBX.IBCustomDataSet,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm2 = class(TForm)
    edtCPF: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnSalvar: TButton;
    btnDeletar: TButton;
    btnPesquisar: TButton;
    btnAlterar: TButton;
    btnMostrarTodos: TButton;
    QryInserir: TFDQuery;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    FDTPessoa: TFDTransaction;
    Label12: TLabel;
    qryBusca: TFDQuery;
    QryUpdate: TFDQuery;
    qryDelete: TFDQuery;
    QryBuscaTodos: TFDQuery;
    dbgPessoas: TDBGrid;
    edtCodigo: TEdit;
    Edit1: TEdit;
    edtNome: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtAniv: TDateTimePicker;
    edtCep: TEdit;
    edtRua: TEdit;
    edtNumero: TEdit;
    EdtBairro: TEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnMostrarTodosClick(Sender: TObject);
  private
    procedure Deletar;
    procedure Alterar;
    procedure Buscar;
    procedure Inserir(vCpf: string);
    procedure BuscarTodos;
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos();
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnAlterarClick(Sender: TObject);
begin
  if EdtCodigo.Text = '' then
  begin
    MessageDlg('O Campo n�o pode ser vazio para realizar essa a��o, verifique!', mtInformation, [mbOk], 0);
    Exit;
  end;
  Alterar;
end;

procedure TForm2.btnDeletarClick(Sender: TObject);
begin
  if EdtCodigo.Text = '' then
  begin
    MessageDlg('O Campo n�o pode ser vazio para realizar essa a��o, verifique!', mtInformation, [mbOk], 0);
    Exit;
  end;
  Deletar;
end;

procedure TForm2.btnMostrarTodosClick(Sender: TObject);
begin
  BuscarTodos;
end;

procedure TForm2.btnPesquisarClick(Sender: TObject);
begin
  if EdtCodigo.Text <> '' then
  begin
    Buscar;
  end
  else
  begin
    MessageDlg('Campo n�o pode ser vazio para que seja iniciado a busca, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;

end;

procedure TForm2.btnSalvarClick(Sender: TObject);
var
  vCpf: String;
begin
  vCpf := EdtCpf.Text;
  if (edtCpf.Text = '') or (EdtNome.Text = '') then
  begin
    MessageDlg('Campo n�o pode ser vazio, verifique e tente novamente.', mtInformation, [mbOk], 0);
    Exit;
  end;
  Inserir(vCpf);
end;

procedure TForm2.LimpaCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin

    if Components[i] is TEdit then
      (Components[i] as TEdit).Text := '';

    if Components[i] is TDateTimePicker then
      (Components[i] as TDateTimePicker).Date := StrToDate('01/01/2022');

  end;
end;

procedure TForm2.Inserir(vCpf: string);
begin
  try
    try
      if not FDTPessoa.Active then
        FDTPessoa.StartTransaction;
      with qryInserir do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' INSERT INTO PESSOA (CPF, NOME, EMAIL, TELEFONE, DTNASCIMENTO,  ' + ' CEP, RUA, BAIRRO, NUMERO, CIDADE, UF ) ' + ' VALUES(' + vCpf +
          ', :NOME, :EMAIL, :TELEFONE, :DTNASCIMENTO, ' + ' :CEP, :RUA, :BAIRRO, :NUMERO, :CIDADE, :UF )');
        // ParamByName('cpf').AsString := edtcpf.text;
        ParamByName('nome').AsString := edtNome.Text;
        ParamByName('email').AsString := edtEmail.Text;
        ParamByName('telefone').AsString := edtTelefone.Text;
        ParamByName('dtnascimento').AsDate := edtAniv.Date;
        ParamByName('CEP').AsString := edtcep.Text;
        ParamByName('RUA').AsString := edtRua.Text;
        ParamByName('BAIRRO').AsString := edtBairro.Text;
        ParamByName('NUMERO').AsString := edtNumero.Text;
        ParamByName('CIDADE').AsString := edtCidade.Text;
        ParamByName('UF').AsString := edtEstado.Text;
        ExecSql;
      end;
      FDTPessoa.Commit;
    finally
      qryInserir.close;
      LimpaCampos;
      //FDTPessoa.Free;
    end;
  except
    on e: Exception do
    begin
      ShowMessage('Erro: ' + e.Message);
      FDTPessoa.RollBack;
    end;
  end;
end;

procedure TForm2.Buscar;
begin
  with qryBusca do
  begin
    Close;
    Sql.Clear;
    Sql.Add('Select cpf, nome, email, telefone, dtnascimento, cep, rua, bairro, numero, cidade, uf ' + ' From Pessoa where id = :codigo');
    ParamByName('Codigo').AsInteger := StrToInt(EdtCodigo.Text);
    Open;
    edtcpf.text := FieldByName('cpf').AsString;
    edtNome.Text := FieldByName('nome').AsString;
    edtEmail.Text := FieldByName('email').AsString;
    EdtTelefone.Text := FieldByName('telefone').AsString;
    EdtAniv.Date := StrToDate(FieldByName('dtnascimento').AsString);
    EdtCep.Text := FieldByName('CEP').AsString;
    EdtRua.Text := FieldByName('RUA').AsString;
    EdtBairro.Text := FieldByName('BAIRRO').AsString;
    EdtNumero.Text := FieldByName('NUMERO').AsString;
    EdtCidade.Text := FieldByName('CIDADE').AsString;
    EdtEstado.Text := FieldByName('UF').AsString;
  end;
end;

procedure TForm2.BuscarTodos;
var
  vcont: Integer;
  campos, titulo: Array Of String;
begin
  with qryBuscaTodos do begin
    Close;
    Sql.Clear;
    Sql.Add('Select id, cpf, nome, email, telefone, dtnascimento, cep, rua, bairro, numero, cidade, uf ' +
    ' From Pessoa');
    Open;
  end;
  dbgpessoas.Columns[0].Title.Caption := 'Codigo';
  dbgpessoas.Columns[1].Title.Caption := 'Cpf';
  dbgpessoas.Columns[2].Title.Caption := 'Nome';
  dbgpessoas.Columns[3].Title.Caption := 'Email';
  dbgpessoas.Columns[4].Title.Caption := 'Telefone';
  dbgpessoas.Columns[5].Title.Caption := 'Dt Nascimento';
  dbgpessoas.Columns[6].Title.Caption := 'Cep';
  dbgpessoas.Columns[7].Title.Caption := 'Rua';
  dbgpessoas.Columns[8].Title.Caption := 'Bairro';
  dbgpessoas.Columns[9].Title.Caption := 'Numero';
  dbgpessoas.Columns[10].Title.Caption := 'Cidade';
  dbgpessoas.Columns[11].Title.Caption := 'UF';

  dbgpessoas.Columns[0].Width := 50;
  dbgpessoas.Columns[1].Width := 70;
  dbgpessoas.Columns[2].Width := 100;
  dbgpessoas.Columns[3].Width := 100;
  dbgpessoas.Columns[4].Width := 75;
  dbgpessoas.Columns[5].Width := 100;
  dbgpessoas.Columns[6].Width := 70;
  dbgpessoas.Columns[7].Width := 100;
  dbgpessoas.Columns[8].Width := 80;
  dbgpessoas.Columns[9].Width := 65;
  dbgpessoas.Columns[10].Width := 100;
  dbgpessoas.Columns[11].Width := 50;

end;

procedure TForm2.Alterar;
begin
  try
    try
      if not FDTPessoa.Active then
        FDTPessoa.StartTransaction;
      with QryUpdate do
      begin
        Close;
        Sql.Clear;
        Sql.Add('Update Pessoa set CPF = :cpf, NOME = :NOME, EMAIL = :EMAIL, TELEFONE = :TELEFONE, DTNASCIMENTO = :DTNASCIMENTO,  ' +
          ' CEP = :CEP, RUA = :RUA, BAIRRO = :BAIRRO, NUMERO = :NUMERO, CIDADE = :CIDADE, UF = :UF  ' + ' where id = :codigo');
        ParamByName('codigo').AsInteger := StrToInt(edtCodigo.Text);
        ParamByName('cpf').AsString := edtcpf.text;
        ParamByName('nome').AsString := edtNome.Text;
        ParamByName('email').AsString := edtEmail.Text;
        ParamByName('telefone').AsString := edtTelefone.Text;
        ParamByName('dtnascimento').AsDate := edtAniv.Date;
        ParamByName('CEP').AsString := edtcep.Text;
        ParamByName('RUA').AsString := edtRua.Text;
        ParamByName('BAIRRO').AsString := edtBairro.Text;
        ParamByName('NUMERO').AsString := edtNumero.Text;
        ParamByName('CIDADE').AsString := edtCidade.Text;
        ParamByName('UF').AsString := edtEstado.Text;
        ExecSql;
      end;
      FDTPessoa.Commit;
    finally
      qryUpdate.Close;
      LimpaCampos;
    end;
  except
    on e: Exception do
    begin
      ShowMessage('Erro: ' + e.Message);
      FDTPessoa.RollBack;
    end;
  end;
end;

procedure TForm2.Deletar;
begin
  try
    try
      if not FDTPessoa.Active then
        FDTPessoa.StartTransaction;
      with qryDelete do
      begin
        Close;
        Sql.Clear;
        Sql.Add('delete from Pessoa where id = :codigo');
        ParamByName('codigo').AsInteger := StrToInt(edtCodigo.Text);
        ExecSql;
      end;
      FDTPessoa.Commit;
    finally
      qryDelete.Close;
      LimpaCampos;
    end;
  except
    on e: Exception do
    begin
      ShowMessage('Erro: ' + e.Message);
      FDTPessoa.RollBack;
    end;
  end;
end;

end.
