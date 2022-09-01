object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 741
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 10
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 104
    Top = 10
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel
    Left = 32
    Top = 69
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label4: TLabel
    Left = 344
    Top = 69
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 504
    Top = 69
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label6: TLabel
    Left = 640
    Top = 69
    Width = 71
    Height = 13
    Caption = 'DT Nascimento'
  end
  object Label7: TLabel
    Left = 32
    Top = 141
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label8: TLabel
    Left = 667
    Top = 141
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label9: TLabel
    Left = 159
    Top = 141
    Width = 19
    Height = 13
    Caption = 'Rua'
  end
  object Label10: TLabel
    Left = 896
    Top = 141
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label11: TLabel
    Left = 1086
    Top = 141
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label12: TLabel
    Left = 504
    Top = 141
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object edtCPF: TcxTextEdit
    Left = 424
    Top = 29
    TabOrder = 0
    Width = 185
  end
  object btnSalvar: TButton
    Left = 8
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnDeletar: TButton
    Left = 251
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Deletar'
    TabOrder = 4
    OnClick = btnDeletarClick
  end
  object btnPesquisar: TButton
    Left = 89
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object btnAlterar: TButton
    Left = 170
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object btnMostrarTodos: TButton
    Left = 8
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = btnMostrarTodosClick
  end
  object dbgPessoas: TDBGrid
    Left = 8
    Top = 408
    Width = 1113
    Height = 177
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtCodigo: TEdit
    Left = 32
    Top = 29
    Width = 51
    Height = 21
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 104
    Top = 29
    Width = 185
    Height = 21
    TabOrder = 8
  end
  object edtNome: TEdit
    Left = 32
    Top = 88
    Width = 294
    Height = 21
    TabOrder = 9
  end
  object edtTelefone: TEdit
    Left = 343
    Top = 88
    Width = 146
    Height = 21
    TabOrder = 10
  end
  object edtEmail: TEdit
    Left = 504
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object edtAniv: TDateTimePicker
    Left = 640
    Top = 88
    Width = 89
    Height = 21
    Date = 44802.863890277770000000
    Time = 44802.863890277770000000
    TabOrder = 12
  end
  object edtCep: TEdit
    Left = 32
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object edtRua: TEdit
    Left = 159
    Top = 160
    Width = 339
    Height = 21
    TabOrder = 14
  end
  object edtNumero: TEdit
    Left = 504
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 15
  end
  object EdtBairro: TEdit
    Left = 656
    Top = 160
    Width = 217
    Height = 21
    TabOrder = 16
  end
  object edtCidade: TEdit
    Left = 896
    Top = 160
    Width = 177
    Height = 21
    TabOrder = 17
  end
  object edtEstado: TEdit
    Left = 1086
    Top = 160
    Width = 35
    Height = 21
    TabOrder = 18
  end
  object QryInserir: TFDQuery
    Connection = DM.Conexao
    Transaction = FDTPessoa
    Left = 32
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = QryBuscaTodos
    Left = 208
    Top = 328
  end
  object IBDataSet1: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    DataSource = DataSource1
    Left = 528
    Top = 192
  end
  object FDTPessoa: TFDTransaction
    Connection = DM.Conexao
    Left = 616
    Top = 192
  end
  object qryBusca: TFDQuery
    Connection = DM.Conexao
    Transaction = FDTPessoa
    Left = 112
    Top = 230
  end
  object QryUpdate: TFDQuery
    Connection = DM.Conexao
    Transaction = FDTPessoa
    Left = 192
    Top = 232
  end
  object qryDelete: TFDQuery
    Connection = DM.Conexao
    Transaction = FDTPessoa
    Left = 264
    Top = 232
  end
  object QryBuscaTodos: TFDQuery
    Connection = DM.Conexao
    Transaction = FDTPessoa
    Left = 120
    Top = 320
  end
end
