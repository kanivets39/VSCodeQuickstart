@isTest
private class TestContactUpdate {
    
    @isTest static void TestUpdateSuccess(){
        Contact con = new Contact(LastName = 'Test', BirthDate = Date.newInstance(1990, 12, 9), Email = 'test@gmail.com', Tax_country__c ='Ukraine', Tax_city__c='Kiyv');    
       insert con;
		con.Email = 'teeest@gmail.com';
        
        Test.startTest();
        update con;
        Test.stopTest();

        List<Contact> conList = [SELECT Id FROM Contact WHERE Email = 'teeest@gmail.com'];
        System.assertEquals(1, conList.size());
        

    }
    
        @isTest static void TestUpdateFalse(){
        Contact con = new Contact(LastName = 'Test', BirthDate = Date.newInstance(1990, 12, 9), Email = 'test@gmail.com', Tax_country__c ='Ukraine', Tax_city__c='Kiyv');    
       insert con;
		con.Email = 'teeest@mail.ru';
        
       Test.startTest();
         try{
       	update con;
      	}catch(Exception e){
    	System.assert(True);
  		}
        Test.stopTest();
        }
    
    }