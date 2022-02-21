unit uDmCliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Dialogs, uDmConexao, uPedidoVendaDTO;

type
  TDmCliente = class(TDataModule)
    QPedidoProdutos: TFDQuery;
    QPedidoProdutosNumeroPedido: TFDAutoIncField;
    QPedidoProdutosCodigoProduto: TIntegerField;
    QPedidoProdutosQuantidade: TIntegerField;
    QPedidoProdutosVlrUnitario: TFloatField;
    QPedidoProdutosVlrTotal: TFloatField;
    QPedidoDadosGerais: TFDQuery;
    QPedidoDadosGeraisNumeroPedido: TIntegerField;
    QPedidoDadosGeraisDataEmissao: TDateField;
    QPedidoDadosGeraisCodigoCliente: TIntegerField;
    QPedidoDadosGeraisValorTotal: TFloatField;
    QPedidoProdutosdescricao: TStringField;
    QGenerica: TFDQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
  public
    function InserirPedidoProdutos(APedidoProdutos: TPedidoVendaDTO; out sErro: String): Boolean;
    function InserirPedidoDadosGerais(APedidoDadosGerais: TPedidoVendaDTO; out sErro: String): Boolean;
    function DeletarPedidoProdutos(APedidoProdutos: TPedidoVendaDTO; out sErro: String): Boolean;
    function DeletarPedidoDadosGerais(APedidoDadosGerais: TPedidoVendaDTO; out sErro: String): Boolean;
  end;

var
  DmCliente: TDmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmCliente }

function TDmCliente.DeletarPedidoDadosGerais(APedidoDadosGerais: TPedidoVendaDTO; out sErro: String): Boolean;
begin
  QGenerica.SQL.Clear;
  QGenerica.SQL.Add('DELETE FROM PedidoDadosGerais WHERE (NumeroPedido = '
                            + IntToStr(APedidoDadosGerais.NumeroPedido) + ')');
  try
    QGenerica.ExecSQL;
    Result := True;
  except on E: Exception do
    begin
      sErro := 'Ocorreu um erro ao excluir' + sLineBreak + E.Message;
      Result := False;
    end;
  end;
end;

function TDmCliente.DeletarPedidoProdutos(APedidoProdutos: TPedidoVendaDTO; out sErro: String): Boolean;
begin
  QGenerica.SQL.Clear;
  QGenerica.SQL.Add('DELETE FROM PedidoProdutos WHERE (NumeroPedido = '
                         + IntToStr(APedidoProdutos.NumeroPedido) + ')');
  try
    QGenerica.ExecSQL;
    ShowMessage('Pedido cancelado.');
    Result := True;
  except on E: Exception do
    begin
      sErro := 'Ocorreu um erro ao excluir' + sLineBreak + E.Message;
      Result := False;
    end;
  end;
end;

function TDmCliente.InserirPedidoDadosGerais(APedidoDadosGerais: TPedidoVendaDTO; out sErro: String): Boolean;
begin
  with QPedidoDadosGerais, APedidoDadosGerais do
  begin
    Open;
    Append;
    QPedidoDadosGeraisNumeroPedido.AsInteger := NumeroPedido;
    QPedidoDadosGeraisDataEmissao.AsDateTime := DataEmissao;
    QPedidoDadosGeraisCodigoCliente.AsInteger := CodigoCliente;
    QPedidoDadosGeraisValorTotal.AsFloat := ValorTotal;
    Post;
    try
      ApplyUpdates(1);
      Result := True;
      Close;
    except on E: Exception do
      begin
        sErro := 'Ocorreu algum erro ao tentar inserir um produto: ' + sLineBreak + E.Message;
          Result := False;
      end;
    end;
  end;
end;

function TDmCliente.InserirPedidoProdutos(APedidoProdutos: TPedidoVendaDTO; out sErro: String): Boolean;
begin
  with QPedidoProdutos, APedidoProdutos do
  begin
    Open;
    Append;
    QPedidoProdutosCodigoProduto.AsInteger := CodigoProduto;
    QPedidoProdutosQuantidade.AsInteger := Quantidade;
    QPedidoProdutosVlrUnitario.AsFloat := VlrUnitario;
    QPedidoProdutosVlrTotal.AsFloat := VlrTotal;
    Post;
    try
      ApplyUpdates(1);
      ShowMessage('Pedido gravado com sucesso!, para gravar um novo pedido altere o cliente');
      Result := True;
      Close;
    except on E: Exception do
      begin
        sErro := 'Ocorreu algum erro ao tentar inserir um produto: ' + sLineBreak + E.Message;
          Result := False;
      end;
    end;
  end;
end;

end.
