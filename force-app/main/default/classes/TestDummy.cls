global class TestDummy implements Database.Batchable<Contact> {
    global TestDummy(){} 
      
     global List<Contact> start(Database.BatchableContext BC) {
            return [Select Id , AccountId , Name, CurrencyIsoCode from Contact Where CreatedDate >= LAST_N_DAYS:2  ];
       }
    
     global void execute(Database.BatchableContext BC, List<Contact> scope) {
     list<Contact_Dummy__c> newObject=new list<Contact_Dummy__c>();
         for (Contact s:scope ){
            
             newObject.add(new Contact_Dummy__c( 
               //  Id = obj.Id,
                 Account__c= s.AccountId,
                 	Name= s.Name,
                 CurrencyIsoCode=s.CurrencyIsoCode
                 
             
             
             ));
         }
    
         insert newObject;
       
     
         }
     
     
    global void finish(Database.BatchableContext bc) {
     
       }
}