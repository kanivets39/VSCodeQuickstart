public class CreateContactController {

    public List<Contact> getContacts() {
    List<Contact> results = Database.query(
        'SELECT Id, FirstName, LastName, Title, Email, Tax_country__c ' +
        'FROM Contact ' +
        'ORDER BY LastName ASC ' 
    );
    return results;
}
    
  public Contact con {get;set;}
    
    public CreateContactController() {     
        con = new Contact();
    }
    
    public PageReference save(){
        try{
        	INSERT con;
        }
        catch (exception e){
            
        }
        con = new Contact();
        return null;
    }
    
}