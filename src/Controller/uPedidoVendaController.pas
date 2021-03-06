unit uPedidoVendaController;

interface

uses
  System.SysUtils, Datasnap.DBClient, Data.DB, uDmCliente, uPedidoVendaDTO;

type
  TPedidoVendaController = class
    public
      function InserirPedidoProdutos(APedidoProdutos: TClientDataSet; out sErro: String): Boolean;
      function InserirPedidoDadosGerais(APedidoDadosGerais: TClientDataSet; out sErro: String): Boolean;
      function DeletarPedidoProdutos(APedidoProdutos: String; out sErro: String): Boolean;
      function DeletarPedidoDadosGerais(APedidoDadosGerais: String; out sErro: String): Boolean;


      constructor Create;
      destructor Destroy; override;
    private
      FPedidoVendaDTO: TPedidoVendaDTO;

  end;
implementation

constructor TPedidoVendaController.Create;
begin
  FPedidoVendaDTO := TPedidoVendaDTO.Create;
end;

function TPedidoVendaController.InserirPedidoDadosGerais(APedidoDadosGerais: TClientDataSet; out sErro: String): Boolean;
begin
  with APedidoDadosGerais, FPedidoVendaDTO do
  begin
    NumeroPedido := FieldByName('NumeroPedido').AsInteger;
    DataEmissao := FieldByName('DataEmissao').AsDateTime;
    CodigoCliente := FieldByName('CodigoCliente').AsInteger;
    ValorTotal := FieldByName('ValorTotal').AsFloat;
  end;

  Result := DmCliente.InserirPedidoDadosGerais(FPedidoVendaDTO, sErro);
end;

function TPedidoVendaController.InserirPedidoProdutos(APedidoProdutos: TClientDataSet; out sErro: String): Boolean;
begin
  with APedidoProdutos, FPedidoVendaDTO do
  begin
    CodigoProduto := FieldByName('CodigoProduto').AsInteger;
    Quantidade := FieldByName('Quantidade').AsInteger;
    VlrUnitario := FieldByName('VlrUnitario').AsFloat;
    VlrTotal := FieldByName('VlrTotal').AsFloat;
  end;

  Result := DmCliente.InserirPedidoProdutos(FPedidoVendaDTO, sErro);
end;

function TPedidoVendaController.DeletarPedidoDadosGerais(APedidoDadosGerais: String; out sErro: String): Boolean;
begin
  with FPedidoVendaDTO do
  begin
    NumeroPedido := StrToInt(APedidoDadosGerais);
  end;

  Result := DmCliente.DeletarPedidoDadosGerais(FPedidoVendaDTO, sErro);
end;

function TPedidoVendaController.DeletarPedidoProdutos(APedidoProdutos: String; out sErro: String): Boolean;
begin
  with FPedidoVendaDTO do
  begin
    NumeroPedido := StrToInt(APedidoProdutos);
  end;

  Result := DmCliente.DeletarPedidoProdutos(FPedidoVendaDTO, sErro);
end;

destructor TPedidoVendaController.Destroy;
begin
  FreeAndNil(FPedidoVendaDTO);
end;

end.

