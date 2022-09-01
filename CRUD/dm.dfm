object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataBase: TIBDatabase
    DatabaseName = 'C:\Bancos\Estudo\DADOS.FDB'
    ServerType = 'IBServer'
    Left = 24
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Left = 480
    Top = 48
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 24
  end
  object DataSource1: TDataSource
    Left = 560
    Top = 112
  end
  object IBDataSet1: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    Left = 464
  end
  object dbsMain: TFDConnection
    Params.Strings = (
      'Database=C:\Bancos\Estudo\DADOS.FDB'
      'User_Name=INTEGRATIVAMASTER'
      'Password=interkey'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=FB')
    Left = 96
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 160
    Top = 16
  end
end
