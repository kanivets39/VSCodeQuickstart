trigger ContactInit on Contact (before insert) {
    
    for(Contact c : Trigger.New) {
        if(c.Email!= null){
        if(c.Email.contains('@mail.ru')){
        c.addError('Inappropriate email');
        }
        Task t = new Task(Subject = 'Call to customer' , OwnerId= c.OwnerId);
        insert t;
        }
    } 
    
}