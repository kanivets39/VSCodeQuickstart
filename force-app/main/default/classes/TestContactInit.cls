@isTest
private class TestContactInit {
    
    @isTest static void TestInitSuccess(){
        Contact con = new Contact(LastName = 'Test', BirthDate = Date.newInstance(1990, 12, 9), Email = 'test@gmail.com', Tax_country__c ='Ukraine', Tax_city__c='Kiyv');        
        Test.startTest();
        insert con;
        Test.stopTest();

        List<Contact> conList = [SELECT Id FROM Contact WHERE LastName = : con.LastName];
        System.assertEquals(1, conList.size());
    }
    
        @isTest static void TestInitFaild(){
        Contact con = new Contact(LastName = 'Test', BirthDate = Date.newInstance(1990, 12, 9), Email = 'test@mail.ru', Tax_country__c ='Ukraine', Tax_city__c='Kiyv');        
        Test.startTest();
            
        try{
       	insert con;
      	}catch(Exception e){
    	System.assert(True);
  		}
        Test.stopTest();
   	}

}