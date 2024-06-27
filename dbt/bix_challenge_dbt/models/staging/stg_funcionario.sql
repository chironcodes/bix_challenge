WITH source AS (
    SELECT * FROM {{ source('raw', 'funcionario') }}
),

renamed AS (
    SELECT
        CAST(id AS INTEGER) AS ID_FUNCIONARIO,
        nome AS NME_FUNCIONARIO
    FROM 
        source
)

SELECT * FROM renamed