
-- Realizado o código para o Faturamento de Membros femininos - Filial C

SELECT genero,
       filial,
       SUM(total_venda) AS Faturamento_Total_Membros
FROM ft_vendas_supermercado
WHERE genero = "Female" AND filial = "C" AND tipo_cliente = "Member"
GROUP BY genero, filial;
