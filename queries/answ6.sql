/* 6. Qual a média do capital social das empresas de pequeno porte por natureza jurídica no último ano? */

CREATE TABLE `query_tables.hackathon-answ6`(
  natureza_juridica STRING,
  capital_medio FLOAT64
);

INSERT INTO `query_tables.hackathon-answ6`

SELECT
  nat.natureza_juridica,
  AVG(em.capital_social) as capital_medio
FROM
  `light-truth-391719.processed_cpnj_data.empresas` em
  JOIN `light-truth-391719.processed_cpnj_data.estabelecimento` es ON es.cnpj_basico = em.cnpj_basico
  JOIN `light-truth-391719.processed_cpnj_data.situacao_cadastral` sit ON es.cod_situacao_cadastral = sit.cod_situacao_cadastral
  JOIN `light-truth-391719.processed_cpnj_data.natureza_juridica` nat ON em.cod_natureza_juridica = nat.cod_natureza_juridica
  JOIN `light-truth-391719.processed_cpnj_data.porte_empresa` por ON em.cod_porte_empresa = por.cod_porte_empresa
WHERE 
  sit.situacao_cadastral = 'Ativa'
  AND por.porte_empresa = 'Pequeno porte'
GROUP BY 1
ORDER BY capital_medio DESC