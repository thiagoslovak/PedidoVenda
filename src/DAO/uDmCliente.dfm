object DmCliente: TDmCliente
  OldCreateOrder = False
  Height = 206
  Width = 274
  object QPedidoProdutos: TFDQuery
    CachedUpdates = True
    AggregatesActive = True
    Connection = DmConexao.FDConnect
    SQL.Strings = (
      'SELECT pd.*,'
      '       p.descricao'
      '  FROM pedidoProdutos pd,'
      '       produtos p'
      ' WHERE pd.codigoproduto = p.codigo;')
    Left = 32
    Top = 16
    object QPedidoProdutosNumeroPedido: TFDAutoIncField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'NumeroPedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPedidoProdutosCodigoProduto: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'CodigoProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPedidoProdutosQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object QPedidoProdutosVlrUnitario: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'VlrUnitario'
    end
    object QPedidoProdutosVlrTotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'VlrTotal'
    end
    object QPedidoProdutosdescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object QPedidoDadosGerais: TFDQuery
    CachedUpdates = True
    AggregatesActive = True
    Connection = DmConexao.FDConnect
    SQL.Strings = (
      'SELECT *'
      '  FROM PedidoDadosGerais;')
    Left = 136
    Top = 16
    object QPedidoDadosGeraisNumeroPedido: TIntegerField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'NumeroPedido'
      Origin = 'NumeroPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPedidoDadosGeraisDataEmissao: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DataEmissao'
      Origin = 'DataEmissao'
    end
    object QPedidoDadosGeraisCodigoCliente: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CodigoCliente'
      Origin = 'CodigoCliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPedidoDadosGeraisValorTotal: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
    end
  end
  object QGenerica: TFDQuery
    CachedUpdates = True
    AggregatesActive = True
    Connection = DmConexao.FDConnect
    SQL.Strings = (
      '')
    Left = 128
    Top = 112
    object IntegerField1: TIntegerField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'NumeroPedido'
      Origin = 'NumeroPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DataEmissao'
      Origin = 'DataEmissao'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CodigoCliente'
      Origin = 'CodigoCliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FloatField1: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
    end
  end
end
