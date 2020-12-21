trigger UniqueDish on Dish__c (before insert, before update) 
{
    Set<String> setDishName = new Set<String>(); 
    for(Dish__c objDish: [Select Name from Dish__c])
        setDishName.add(objDish.Name);
    for(Dish__c objDish: Trigger.new)
    {
        if(!setDishName.contains(objDish.Name))
        {
            setDishName.add(objDish.Name);
        }
        else
        {
            objDish.Name.addError('Dish with same name Exists');
        }
    }
}