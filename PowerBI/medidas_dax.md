# 📐 Medidas DAX — Supermarket Profitability Strategy

Este documento descreve as principais medidas DAX utilizadas no projeto, organizadas por finalidade analítica.

---

## 📊 Métricas Base

```DAX
Faturamento =
SUM(ft_vendas_supermercado[total_venda])

total_transacoes =
DISTINCTCOUNT(ft_vendas_supermercado[id_nota])

ticket_medio =
DIVIDE([Faturamento], [total_transacoes])

👥 Clientes e Fidelidade
total_de_clientes =
COUNT(ft_vendas_supermercado[tipo_cliente])

total_de_membros =
CALCULATE([total_de_clientes],
ft_vendas_supermercado[tipo_cliente] = "Member")

%_Clientes_Membros =
DIVIDE([total_de_membros], [total_de_clientes])

💰 Receita por Perfil
Receita_Total_De_Membros =
CALCULATE([Faturamento],
ft_vendas_supermercado[tipo_cliente] = "Member")

Pct_Receita_Total_De_Membros =
DIVIDE([Receita_Total_De_Membros], [Faturamento])

🏪 Análise da Filial C
Receita_Total_C =
CALCULATE([Faturamento],
ft_vendas_supermercado[filial] = "C")

Filial_C_Membros_Faturamento =
CALCULATE([Faturamento],
ft_vendas_supermercado[tipo_cliente] = "Member",
ft_vendas_supermercado[filial] = "C")

Pct_Receita_Filial_C_Membros =
DIVIDE([Filial_C_Membros_Faturamento], [Receita_Total_C])

👩 Público Feminino — Filial C
Feminino_Filial_C_Membros_Faturamento =
CALCULATE([Faturamento],
ft_vendas_supermercado[tipo_cliente] = "Member",
ft_vendas_supermercado[filial] = "C",
ft_vendas_supermercado[genero] = "Female")

Pct_Feminino_Filial_C =
DIVIDE([Feminino_Filial_C_Membros_Faturamento], [Receita_Total_C])

🔍 Observações Técnicas

As medidas utilizam CALCULATE para criação de filtros contextuais

DIVIDE é utilizado para evitar erros de divisão por zero

O modelo possui apenas uma tabela fato e uma tabela calendário


