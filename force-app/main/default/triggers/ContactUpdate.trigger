trigger ContactUpdate on Contact (before update) {

    for(Contact newContact : Trigger.New) {
     Contact oldContact = Trigger.oldMap.get(newContact.Id);
        if(newContact.Email!=null && oldContact.Email!=null){
      if(newContact.Email.contains('@mail.ru')){
           newContact.addError('Inappropriate new email - no mail.ru in emails');
      }
       if(!newContact.Email.equals(oldContact.Email)){
       Old_email__c oldEmail = new Old_email__c(OldEmailValue__c = oldContact.Email, Contact__c = oldContact.Id);
       newContact.Email_change_counter__c = newContact.Email_change_counter__c+1;   
       insert oldEmail;
    } 
    }
 }
}