/* Número de CNPJ novos por mês/ano entre 2010 - 2021, discriminado por MEI ou Simples, em cada município brasileiro */

CREATE TABLE `query_tables.hackathon-answ3`(
  data_situacao STRING,
  municipio STRING,
  mei_abertas INT64,
  simples_abertas INT64
);

INSERT INTO `query_tables.hackathon-answ3`

SELECT
    FORMAT_DATE('%Y-%m',estab.data_inicio) as data,
    municipio,
    SUM(CASE WHEN opcao_mei = 'S' THEN 1 ELSE 0 END) AS mei_ativas,
    SUM(CASE WHEN opcao_simples = 'S' THEN 1 ELSE 0 END) AS simples_ativas
FROM
  `light-truth-391719.processed_cpnj_data.simples` simples
  JOIN `light-truth-391719.processed_cpnj_data.estabelecimento` estab ON simples.cnpj_basico = estab.cnpj_basico
  JOIN `light-truth-391719.processed_cpnj_data.situacao_cadastral` sit ON estab.cod_situacao_cadastral = sit.cod_situacao_cadastral
  JOIN `light-truth-391719.processed_cpnj_data.municipios`mun ON estab.cod_municipio = mun.cod_municipio
WHERE
  estab.data_inicio BETWEEN '2010-01-01' AND '2021-12-31'
GROUP BY
    1,2
ORDER BY
    1,2