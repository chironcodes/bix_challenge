SELECT
  DISTINCT id_funcionario as id
FROM
  adilton.raw.venda
WHERE id_funcionario NOT IN (SELECT DISTINCT CAST(id AS INT64) FROM adilton.raw.funcionario WHERE nome is NOT NULL)