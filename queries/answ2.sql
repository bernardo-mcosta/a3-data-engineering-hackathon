/* Número de comércios que fecharam por mês/ano entre 2010 - 2021, discriminado por MEI ou Simples, em cada município brasileiro */

CREATE TABLE `query_tables.hackathon-answ2v2`(
  data_situacao STRING,
  municipio STRING,
  mei_fechadas INT64,
  simples_fechadas INT64
);

INSERT INTO `query_tables.hackathon-answ2v2`

SELECT
    FORMAT_DATE('%Y-%m',data_situacao_cadastral) as data,
    municipio,
    SUM(CASE WHEN data_exclusao_mei IS NOT NULL THEN 1 ELSE 0 END) AS mei_fechadas,
    SUM(CASE WHEN data_exclusao_simples IS NOT NULL THEN 1 ELSE 0 END) AS simples_fechadas
FROM
  `light-truth-391719.processed_cpnj_data.simples` simples
  JOIN `light-truth-391719.processed_cpnj_data.estabelecimento` estab ON simples.cnpj_basico = estab.cnpj_basico
  JOIN `light-truth-391719.processed_cpnj_data.situacao_cadastral` sit ON estab.cod_situacao_cadastral = sit.cod_situacao_cadastral
  JOIN `light-truth-391719.processed_cpnj_data.municipios`mun ON estab.cod_municipio = mun.cod_municipio
WHERE
    EXTRACT(YEAR FROM data_situacao_cadastral) BETWEEN 2010 AND 2021
    AND sit.situacao_cadastral = 'Baixada'
GROUP BY
    1,2