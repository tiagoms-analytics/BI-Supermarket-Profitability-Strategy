SELECT * FROM vendas_supermercado;

SELECT * FROM ft_vendas_supermercado;

-- Contagem Total de Linhas
SELECT COUNT(*) AS total_registros
FROM vendas_supermercado;

-- verificação de Duplicatas
SELECT  id_nota,
    COUNT(id_nota) AS total_notas
FROM  vendas_supermercado
GROUP BY   id_nota
HAVING  COUNT(id_nota) > 1;

-- faturamento total
SELECT  ROUND(SUM(CAST(Total_Venda AS DECIMAL(10, 4))), 2) AS Faturamento_Total
FROM   vendas_supermercado;

-- ticket medio
SELECT  ROUND( SUM(CAST(Total_Venda AS DECIMAL(10, 4))) / COUNT(ID_Nota), 2) AS Ticket_Medio
FROM  vendas_supermercado;

-- filial com maior ticket medio
SELECT filial,
	   ROUND(AVG(CAST(Total_Venda AS DECIMAL(10, 4))), 2) AS ticket_medio,
       ROUND(SUM(CAST(Total_Venda AS DECIMAL(10, 4))), 2) AS Faturamento_Total
FROM vendas_supermercado
GROUP BY filial
ORDER BY ticket_medio DESC;

-- Margem de lucro
SELECT linha_produto,
       ROUND(SUM(CAST(lucro_bruto AS DECIMAL(10, 4))), 2) AS lucro_bruto_total,
       ROUND(SUM(CAST(total_venda AS DECIMAL(10, 4))), 2) AS faturamento_total,
       ROUND(SUM(CAST(lucro_bruto AS DECIMAL(10, 4))) / SUM(CAST(total_venda AS DECIMAL(10, 4))), 2) AS margem_bruta_percentual
 FROM vendas_supermercado
 GROUP BY linha_produto
 ORDER BY margem_bruta_percentual DESC;
      
 -- limpeza de tempo     
SELECT STR_TO_DATE(data_venda, '%m/%d/%Y') AS data_convertida,
       CAST(Hora_Venda AS TIME) AS hora_convertida
FROM vendas_supermercado;

-- Limpeza realizada

-- Desafio 1: Vendas por Mês
SELECT MONTH(STR_TO_DATE(data_venda, '%m/%d/%Y')) AS mes_ano,
      ROUND(SUM(CAST(total_venda AS DECIMAL(10, 4 ))), 2) AS faturamento_total,
      ROUND(AVG(CAST(total_venda AS DECIMAL(10, 4 ))), 2) AS ticket_medio
FROM vendas_supermercado
GROUP BY mes_ano
ORDER BY mes_ano DESC, faturamento_total DESC;

-- genero
SELECT
    genero,
    metodo_pagamento,
    COUNT(ID_Nota) AS total_Transacoes,
    ROUND(AVG(CAST(total_Venda AS DECIMAL(10, 4))), 2) AS ticket_Medio
FROM vendas_supermercado
WHERE genero = 'female'
GROUP BY genero, metodo_pagamento
ORDER BY  total_transacoes DESC;
    
-- Verificação da conversão

SELECT
    data_venda,
    total_venda,
    quantidade,
    lucro_bruto
FROM
    ft_vendas_supermercado  -- OU vendas_supermercado_limpa, se você usou o nome antigo
LIMIT 5;


