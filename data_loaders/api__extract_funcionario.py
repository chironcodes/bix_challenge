import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(id, *args, **kwargs):
    """
    Template for loading data from API
    """
    try:
        id = int(id)
        url = f'https://us-central1-bix-tecnologia-prd.cloudfunctions.net/api_challenge_junior?id={id}'
        
        print(f"Fetching employee with id = {id}")
        nome = requests.get(url).text
        
        df = pd.DataFrame({'id': [id], 'nome': [nome]}).iloc[0]
        

    except Exception as e:
        print(f"error {e.__str__()}")
        df = pd.DataFrame({'id': [id], 'name': [None]}).iloc[0]



    return df
    # return pd.read_csv(io.StringIO(response.text), sep=',')


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
