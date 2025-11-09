-- 1. Crie o Banco de Dados
CREATE DATABASE IF NOT EXISTS supermercado;

-- 2. Use o Banco de Dados
USE supermercado;

CREATE TABLE IF NOT EXISTS vendas_supermercado (
    ID_Nota VARCHAR(20) NOT NULL PRIMARY KEY,
    Filial CHAR(1),
    Cidade VARCHAR(50),
    Tipo_Cliente VARCHAR(20),
    Genero VARCHAR(10),
    Linha_Produto VARCHAR(50),
    Preco_Unitario VARCHAR(20), -- MUDOU: de DECIMAL para VARCHAR
    Quantidade VARCHAR(10),     -- MUDOU: de INT para VARCHAR
    Imposto VARCHAR(20),        -- MUDOU: de DECIMAL para VARCHAR
    Total_Venda VARCHAR(20),    -- MUDOU: de DECIMAL para VARCHAR
    COGS VARCHAR(20),           -- MUDOU: de DECIMAL para VARCHAR
    Lucro_Bruto VARCHAR(20),    -- MUDOU: de DECIMAL para VARCHAR
    Data_Venda VARCHAR(20),     -- MUDOU: de DATE para VARCHAR
    Hora_Venda VARCHAR(20),     -- MUDOU: de TIME para VARCHAR
    Metodo_Pagamento VARCHAR(20),
    Avaliacao VARCHAR(5)        -- MUDOU: de DECIMAL para VARCHAR
);

CREATE TABLE ft_vendas_supermercado AS
SELECT
    id_nota,  
    filial,
    cidade,
    tipo_cliente,
    genero,
    linha_produto,
    CAST(preco_unitario AS DECIMAL(10,2)) AS preco_unitario,
    CAST(quantidade AS SIGNED) AS quantidade, -- CORREÇÃO PRINCIPAL
    CAST(imposto AS DECIMAL(10,2)) AS imposto,
    CAST(total_venda AS DECIMAL(10,2)) AS total_venda,
    CAST(cogs AS DECIMAL(10,2)) AS cogs,
    CAST(lucro_bruto AS DECIMAL(10,2)) AS lucro_bruto,
    STR_TO_DATE(data_venda, '%m/%d/%Y') AS data_venda,
    CAST(hora_venda AS TIME) AS hora_venda,
    metodo_pagamento,
    CAST(avaliacao AS DECIMAL(3,1)) AS avaliacao
FROM vendas_supermercado;
