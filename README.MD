#	REQUISITO DO SISTEMA

Tela de Pedido Venda, onde é possível inserir produtos, deletar produtos e gravar os Pedidos.

## Requisitos para usar o sistema

Adicionar o arquivo libmysql.dll no componente FDPhysMySQLDriverLink, properties VendorLib
![libmysql](https://github.com/thiagoslovak/PedidoVenda/blob/master/3dparth/CaminhoLibMySql.png)

## Campos 

- Campo vazio no inicio: 
  - Campo de apenas leitura, usado para informar o valor do Número Pedido que estiver selecionado na grid.
- Campo Cliente:
  - Usado para informar o cliente. Se ao sair do campo cliente sem informar nada, aparecerá um botão para carregar pedidos na grid, e um groupbox com CAMPO: 
    - Número Pedido, usado para informar o número do pedido que deseja cancelar, (Só aceita valores inteiros).
    -  Botão Cancelar Pedido: Usado para cancelar um dos pedidos digitados no campo Número Pedido. 
- Campo Código Produto:
  - Usado para informar o código do produto, usar código de 1 a 22 (Códigos de produtos já cadastrados na tabela de produtos). (Só aceita valores inteiros).
- Campo Quantidade:
  - Usado para informa a quantidade. (Só aceita valores inteiros).
- Campo Valor Unitário:
  - Usado para informar um valor unitário qualquer para inserir o produto na grid.
- Grid:
  - Informa os produtos inseridos.
    - Na grid é possível navegar com  as setas, e usando a tecla DEL pode-se excluir algum item da grid. Campos Quantidade e Vlr. Unitário também é possível alterar estando na grid.
- Campo Valor Total:
  - Campo de apenas leitura, onde é multiplicado a quantidade informada pelo valor unitário informado.
- Botão Gravar Pedido:
  - Botão vem bloqueado, só é liberado quando for inserido algum item na grid.
  - Para gravar pedidos é necessário informar algum cliente entre 2 e 22, (clientes já cadastrados na tabela).
  - Ao Gravar um pedido, para gravar ou pedido diferente é necessário informar um cliente diferente.
