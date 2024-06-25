WITH source AS (
    SELECT * FROM {{ source('raw', 'categoria') }}
),

renamed AS (
    SELECT
        id AS ID_CATEGORIA,
        nome_categoria AS NME_CATEGORIA
    FROM 
        source
)

SELECT * FROM renamed