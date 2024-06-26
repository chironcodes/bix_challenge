WITH source AS (
    SELECT * FROM {{ source('raw', 'categoria') }}
),

renamed AS (
    SELECT
        CAST(id AS INTEGER) AS ID_CATEGORIA,
        nome_categoria AS NME_CATEGORIA
    FROM 
        source
)

SELECT * FROM renamed