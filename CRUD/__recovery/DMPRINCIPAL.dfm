object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 413
  Width = 612
  object Conexao: TFDConnection
    Params.Strings = (
      'CharacterSet=iso8859_1'
      'Protocol='
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = Salvar
    Left = 32
    Top = 24
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 120
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 24
  end
  object Salvar: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = Conexao
    Left = 40
    Top = 80
  end
  object ibtPessoa: TIBTransaction
    AllowAutoStart = False
    Left = 416
    Top = 24
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    Left = 336
    Top = 24
  end
end
