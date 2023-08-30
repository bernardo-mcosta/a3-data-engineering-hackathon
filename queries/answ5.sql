/* 5. Qual a classe de CNAE com o maior capital social médio no Brasil no último ano? */

CREATE TABLE `query_tables.hackathon-answ5`(
  atividade STRING,
  capital_medio FLOAT64
);

INSERT INTO `query_tables.hackathon-answ5`

SELECT
  cn.atividade as atividade,
  AVG(em.capital_social) as capital_medio,
FROM
  `light-truth-391719.processed_cpnj_data.empresas` em
  JOIN `light-truth-391719.processed_cpnj_data.estabelecimento` es ON es.cnpj_basico = em.cnpj_basico
  JOIN `light-truth-391719.processed_cpnj_data.cnae` cn ON es.cnae_principal = CAST(cn.cod_cnae AS STRING)
  JOIN `light-truth-391719.processed_cpnj_data.situacao_cadastral` sit ON es.cod_situacao_cadastral = sit.cod_situacao_cadastral
WHERE 
  sit.situacao_cadastral = 'Ativa'
GROUP BY cn.atividade
ORDER BY capital_medio DESC