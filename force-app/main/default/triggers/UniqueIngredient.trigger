trigger UniqueIngredient on Ingredient__c (before insert, before update) 
{
    Set<String> setIngredientName = new Set<String>(); 
    for(Ingredient__c objIngredient: [Select Name from Ingredient__c])
        setIngredientName.add(objIngredient.Name);
    for(Ingredient__c objIngredient: Trigger.new)
    {
        if(!setIngredientName.contains(objIngredient.Name))
        {
            setIngredientName.add(objIngredient.Name);
        }
        else
        {
            objIngredient.Name.addError('Ingredient with same name Exists');
        }
    }
}