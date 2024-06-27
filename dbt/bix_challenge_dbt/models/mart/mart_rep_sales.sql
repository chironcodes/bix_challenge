{{ 
  config(
    materialized='incremental',
    incremental_strategy='insert_overwrite',
    on_schema_change='append_new_columns',
    partition_by={
        "field": "DT_VENDA",
        "data_type": "date",
        "granularity": "day"
        }
)}}
WITH categorias AS (
    SELECT
       ID_CATEGORIA,
       NME_CATEGORIA
    FROM
        {{ ref("stg_categoria") }}
),
funcionario AS (
    SELECT
       ID_FUNCIONARIO,
       NME_FUNCIONARIO
    FROM
        {{ ref("stg_funcionario") }}
)

SELECT
    a.ID_VENDA,
    a.ID_FUNCIONARIO,
    f.NME_FUNCIONARIO,
    c.NME_CATEGORIA,
    c.ID_CATEGORIA,
    a.VL_VENDA,
    a.DT_VENDA


FROM
    {{ ref("stg_venda") }} a
LEFT JOIN categorias AS c
    ON a.ID_CATEGORIA = c.ID_CATEGORIA
LEFT JOIN funcionario AS f
    ON a.ID_FUNCIONARIO = f.ID_FUNCIONARIO
WHERE
    a.DT_VENDA >= date_add(current_date(), interval -3650 day)