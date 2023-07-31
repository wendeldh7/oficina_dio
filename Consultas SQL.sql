-- Selecionar todos os clientes
SELECT * FROM clientes;

-- Selecionar pedidos com prioridade alta
SELECT * FROM pedido WHERE prioridade = 'alta';

-- Selecionar responsáveis ordenados por matrícula em ordem crescente
SELECT * FROM responsavel ORDER BY matricula ASC;

-- Selecionar os pedidos e seus clientes associados
SELECT p.*, c.nomeCompleto AS nomeCliente FROM pedido p
JOIN clientes c ON p.idCliente = c.idCliente;

-- Contar o número de clientes do tipo Pessoa Jurídica (PJ)
SELECT COUNT(*) AS numeroClientesPJ FROM clientes WHERE tipo = 'PJ';

-- Contar o número de pedidos em cada prioridade
SELECT prioridade, COUNT(*) AS numeroPedidos FROM pedido GROUP BY prioridade;

-- Calcular o total de pedidos para cada cliente
SELECT c.nomeCompleto AS cliente, COUNT(p.idPedido) AS totalPedidos FROM clientes c
LEFT JOIN pedido p ON c.idCliente = p.idCliente
GROUP BY c.idCliente, c.nomeCompleto;

-- Selecionar os pedidos gerados por responsáveis do setor 'oficina Hardware'
SELECT pg.* FROM pedido_gerado pg
WHERE pg.idResponsavel IN (SELECT idResponsavel FROM responsavel WHERE setorResponsavel = 'oficina Hardware');




