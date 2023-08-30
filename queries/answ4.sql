/* 4. Qual o número de CNPJ que surgiram do grupo de educação superior, entre 2015 e 2021, discriminado por ano, em cada estado brasileiro? */

CREATE TABLE `query_tables.hackathon-answ4`(
  estado STRING,
  data_inicio STRING,
  total INT64
);

INSERT INTO `query_tables.hackathon-answ4`


SELECT
  est.uf as estado,
  FORMAT_DATE('%Y',est.data_inicio) as data_inicio,
  COUNT(*) as total
FROM 
  `light-truth-391719.processed_cpnj_data.estabelecimento` est
  JOIN `light-truth-391719.processed_cpnj_data.cnae` cn ON CAST(cn.cod_cnae AS STRING) = est.cnae_principal 
WHERE 
  UPPER(atividade) LIKE UPPER('%educação superior%')
  AND est.data_inicio BETWEEN '2015-01-01' AND '2021-12-31'
GROUP BY 1,2