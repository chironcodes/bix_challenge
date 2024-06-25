WITH source AS (
    SELECT * FROM {{ source('raw', 'venda') }}
),

renamed AS (
    SELECT
        id_venda AS ID_VENDA,
        id_funcionario AS  ID_FUNCIONARIO,
        id_categoria AS ID_CATEGORIA,
        data_venda AS DT_VENDA,
        venda AS VL_VENDA
    FROM 
        source
)

SELECT * FROM renamed