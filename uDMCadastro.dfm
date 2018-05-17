object DMCadastro: TDMCadastro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 299
  Width = 647
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=usuario' +
      ';Initial Catalog=Avaliacao;Data Source=localhost;Initial File Na' +
      'me="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 16
  end
  object sqlProdutos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produtos')
    Left = 152
    Top = 16
    object sqlProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object sqlProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 150
    end
    object sqlProdutosUnidMedida: TStringField
      FieldName = 'UnidMedida'
      Size = 2
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = sqlProdutos
    ResolveToDataSet = True
    Left = 152
    Top = 64
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 152
    Top = 112
    object cdsProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 150
    end
    object cdsProdutosUnidMedida: TStringField
      FieldName = 'UnidMedida'
      Size = 2
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 152
    Top = 160
  end
  object sqlAux: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produtos')
    Left = 248
    Top = 16
  end
end
