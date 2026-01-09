
-- Realizado o código para o Faturamento de Membros femininos - Filial C

SELECT filial,
       ROUND(SUM(total_venda) / COUNT(id_nota), 2) AS ticket_medio_por_filial
FROM ft_vendas_supermercado
GROUP BY filial
ORDER BY  ticket_medio_por_filial DESC;
 
