if 'condition' not in globals():
    from mage_ai.data_preparation.decorators import condition


@condition
def evaluate_condition(ids, *args, **kwargs) -> bool:
    if ids != []:
        return [1,2,3]
    else:
        return [1,2,3]
