object FTelaPedidoVenda: TFTelaPedidoVenda
  Left = 439
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedido Venda'
  ClientHeight = 410
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 410
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object grdPedidoVenda: TDBGrid
      Left = 16
      Top = 210
      Width = 441
      Height = 143
      DataSource = DsPedidoProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = grdPedidoVendaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CodigoProduto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrUnitario'
          Width = 73
          Visible = True
        end>
    end
    object edtCliente: TLabeledEdit
      Left = 16
      Top = 96
      Width = 121
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente:'
      TabOrder = 1
      OnExit = edtClienteExit
      OnKeyPress = edtClienteKeyPress
    end
    object edtCodigoProduto: TLabeledEdit
      Left = 16
      Top = 152
      Width = 121
      Height = 21
      EditLabel.Width = 93
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo do Produto:'
      TabOrder = 2
      OnKeyPress = edtCodigoProdutoKeyPress
    end
    object edtQuantidade: TLabeledEdit
      Left = 176
      Top = 152
      Width = 121
      Height = 21
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = 'Quantidade:'
      TabOrder = 3
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtValorUnitario: TLabeledEdit
      Left = 336
      Top = 152
      Width = 121
      Height = 21
      EditLabel.Width = 68
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor Unit'#225'rio:'
      TabOrder = 4
      OnChange = edtValorUnitarioChange
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object edtValorTotal: TLabeledEdit
      Left = 16
      Top = 373
      Width = 121
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor Total:'
      ReadOnly = True
      TabOrder = 5
    end
    object btnInserirProduto: TButton
      Left = 336
      Top = 179
      Width = 121
      Height = 25
      Caption = 'Inserir Produto'
      TabOrder = 6
      OnClick = btnInserirProdutoClick
    end
    object btnGravarPedido: TButton
      Left = 336
      Top = 371
      Width = 121
      Height = 25
      Caption = 'Gravar Pedido'
      Enabled = False
      TabOrder = 7
      OnClick = btnGravarPedidoClick
    end
    object edtNumeroPedido: TDBEdit
      Left = 16
      Top = 12
      Width = 33
      Height = 21
      DataField = 'NumeroPedido'
      DataSource = DsPedidoProdutos
      ReadOnly = True
      TabOrder = 8
    end
    object btnCarregarPedidos: TButton
      Left = 176
      Top = 94
      Width = 121
      Height = 25
      Caption = 'Carregar Pedidos'
      TabOrder = 9
      Visible = False
      OnClick = btnCarregarPedidosClick
    end
    object gbCancelarPedido: TGroupBox
      Left = 303
      Top = 12
      Width = 154
      Height = 105
      Caption = 'Cancelar Pedido'
      TabOrder = 10
      Visible = False
      object edtNumPedido: TLabeledEdit
        Left = 20
        Top = 42
        Width = 121
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero Pedido'
        TabOrder = 0
        OnKeyPress = edtNumPedidoKeyPress
      end
      object btnCancelarPedido: TButton
        Left = 20
        Top = 69
        Width = 121
        Height = 25
        Caption = 'Cancelar Pedido'
        TabOrder = 1
        OnClick = btnCancelarPedidoClick
      end
    end
  end
  object DspPedidoDadosGerais: TDataSetProvider
    DataSet = DmCliente.QPedidoDadosGerais
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 248
  end
  object CdsPedidoProdutos: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DspPedidoProdutos'
    Left = 104
    Top = 192
    object CdsPedidoProdutosNumeroPedido: TAutoIncField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'NumeroPedido'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CdsPedidoProdutosCodigoProduto: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'CodigoProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPedidoProdutosQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object CdsPedidoProdutosVlrUnitario: TFloatField
      DisplayLabel = 'Vlr. Unitario'
      FieldName = 'VlrUnitario'
    end
    object CdsPedidoProdutosVlrTotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'VlrTotal'
    end
    object CdsPedidoProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object DspPedidoProdutos: TDataSetProvider
    DataSet = DmCliente.QPedidoProdutos
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 272
  end
  object CdsPedidoDadosGerais: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DspPedidoDadosGerais'
    Left = 240
    Top = 200
    object CdsPedidoDadosGeraisNumeroPedido: TIntegerField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'NumeroPedido'
      Origin = 'NumeroPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPedidoDadosGeraisDataEmissao: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DataEmissao'
      Origin = 'DataEmissao'
    end
    object CdsPedidoDadosGeraisCodigoCliente: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CodigoCliente'
      Origin = 'CodigoCliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPedidoDadosGeraisValorTotal: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
    end
  end
  object DsPedidoProdutos: TDataSource
    DataSet = CdsPedidoProdutos
    Left = 104
    Top = 240
  end
end
