WITH source AS (
    SELECT * FROM {{ source('raw', 'funcionario') }}
),

renamed AS (
    SELECT
        id AS ID_FUNCIONARIO,
        nome AS NME_FUNCIONARIO
    FROM 
        source
)

SELECT * FROM renamed