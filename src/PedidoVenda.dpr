program PedidoVenda;

uses
  Vcl.Forms,
  uTelaPedidoVenda in 'View\uTelaPedidoVenda.pas' {FTelaPedidoVenda},
  uPedidoVendaDTO in 'DTO\uPedidoVendaDTO.pas',
  uPedidoVendaController in 'Controller\uPedidoVendaController.pas',
  uDmConexao in 'DAO\uDmConexao.pas' {DmConexao: TDataModule},
  uDmCliente in 'DAO\uDmCliente.pas' {DmCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmCliente, DmCliente);
  Application.CreateForm(TFTelaPedidoVenda, FTelaPedidoVenda);
  Application.Run;
end.
