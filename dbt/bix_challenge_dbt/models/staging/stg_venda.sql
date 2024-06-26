{{ config(
    materialized='view',
    partition_by={'field': 'DT_VENDA', 'data_type': 'date'}
) }}


WITH source AS (
    SELECT * FROM {{ source('raw', 'venda') }}
),

renamed AS (
    SELECT
        CAST(id_venda AS INTEGER) AS ID_VENDA,
        CAST(id_funcionario AS INTEGER) AS  ID_FUNCIONARIO,
        CAST(id_categoria AS INTEGER) AS ID_CATEGORIA,
        CAST(data_venda AS DATE) AS DT_VENDA,
        venda AS VL_VENDA
    FROM 
        source
)



SELECT * FROM renamed 