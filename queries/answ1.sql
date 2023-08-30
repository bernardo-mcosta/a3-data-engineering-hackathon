/*Número de indústrias ativas por mês/ano entre 2010 - 2021, discriminado por MEI ou Simples, em cada município brasileiro*/

CREATE TABLE `query_tables.hackathon-answ1v3`(
  data_situacao STRING,
  municipio STRING,
  mei_ativas INT64,
  simples_ativas INT64
);

INSERT INTO `query_tables.hackathon-answ1v3`

SELECT
    FORMAT_DATE('%Y-%m',data_situacao_cadastral) as data,
    municipio,
    SUM(CASE WHEN opcao_mei = 'S' THEN 1 ELSE 0 END) AS mei_ativas,
    SUM(CASE WHEN opcao_simples = 'S' THEN 1 ELSE 0 END) AS simples_ativas
FROM
  `light-truth-391719.processed_cpnj_data.simples` simples
  JOIN `light-truth-391719.processed_cpnj_data.estabelecimento` estab ON simples.cnpj_basico = estab.cnpj_basico
  JOIN `light-truth-391719.processed_cpnj_data.situacao_cadastral` sit ON estab.cod_situacao_cadastral = sit.cod_situacao_cadastral
  JOIN `light-truth-391719.processed_cpnj_data.municipios`mun ON estab.cod_municipio = mun.cod_municipio
WHERE
    EXTRACT(YEAR FROM estab.data_situacao_cadastral) BETWEEN 2010 AND 2021
    AND sit.situacao_cadastral = 'Ativa'
GROUP BY
    1,2
ORDER BY
    1,2