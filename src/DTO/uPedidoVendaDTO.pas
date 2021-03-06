unit uPedidoVendaDTO;

interface

uses
  System.SysUtils;

type
  TPedidoVendaDTO = class
  private
    FNumeroPedido: Integer;
    FDataEmissao: TDate;
    FCodigoCliente: Integer;
    FValorTotal: Double;
    FCodigoProduto: Integer;
    FQuantidade: Integer;
    FVlrUnitario: Double;
    FVlrTotal: Double;
  public
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property DataEmissao: TDate read FDataEmissao write FDataEmissao;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property VlrUnitario: Double read FVlrUnitario write FVlrUnitario;
    property VlrTotal: Double read FVlrTotal write FVlrTotal;
  end;
implementation

end.

