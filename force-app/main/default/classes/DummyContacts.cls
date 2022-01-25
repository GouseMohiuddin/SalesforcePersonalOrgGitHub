global class DummyContacts implements Database.Batchable<SObject> , Schedulable {
public String query;
    public DummyContacts(){
        query= 'Select FIELDS(STANDARD), Add_Email__c,Languages__c, Level__c from Contact where CreatedDate >= LAST_N_DAYS:1' ;
}
    
     public void execute(SchedulableContext sc) {
            Database.executeBatch(this, 1);
       }

    
     public Database.QueryLocator start(Database.BatchableContext bc) {
            return Database.getQueryLocator(query);
       }
    
     public void execute(Database.BatchableContext bc, List<sObject> scope) {
     list<Contact_Dummy__c> newObject=new list<Contact_Dummy__c>();
         for (Sobject s:scope ){
             system.debug('JOB IS Executing11');
            Contact obj=(Contact) s;
              system.debug('JOB IS Executing');
             Contact_Dummy__c partContact=new Contact_Dummy__c();
       partContact.Account__c=obj.AccountId;
             partContact.Name=obj.Name;
             partContact.Department__c=obj.Department;
             partContact.Birthdate__c=obj.Birthdate;
             //partContact.ReportsTo__c=obj.ReportsToId;
             partContact.Lead_Source__c=obj.LeadSource;
             
             
             partContact.Add_Email__c=obj.Add_Email__c;
             
             //partContact.MailingAddress__c=obj.MailingAddress;
            // partContact.OtherAddress__c=obj.OtherAddress;
             partContact.Languages__c=obj.Languages__c;
             partContact.Description__c=obj.Description;
             partContact.CurrencyIsoCode =obj.CurrencyIsoCode;
             partContact.Title__c=obj.Title;
             partContact.Phone__c=obj.Phone; 
             partContact.HomePhone__c=obj.HomePhone;
             partContact.MobilePhone__c=obj.MobilePhone;
             partContact.Email__c=obj.Email;
             partContact.AssistantName__c=obj.AssistantName;
             partContact.AssistantPhone__c=obj.AssistantPhone;
             partContact.OtherPhone__c=obj.OtherPhone;
             partContact.Level__c=obj.Level__c;
             partContact.Fax__c=obj.Fax;
			             
             
             
             newObject.add(partContact);
         }
         system.debug('JOB IS trying to insert');
         insert newObject;
         delete scope;
        
         system.debug('JOB IS inserted');
         }
     
     
    public void finish(Database.BatchableContext bc) {
          system.debug('JOB IS FINISHED');
        
        AsyncApexJob a = [Select Id, Status,   
                          CreatedBy.Email  from AsyncApexJob where Id=:bc.getJobId()];
        
        
         List<Contact_Dummy__c> userList = new List<Contact_Dummy__c>();
        //String  userList;
        userList = [SELECT Id,	Email__c FROM Contact_Dummy__c WHERE Add_Email__c='gm@gmail.com' ] ;
        List<String> toAddresses=new List<String>();
        for (Contact_Dummy__c c:userList)
        {
            toAddresses.add(c.Email__c);
        }
        Messaging.SingleEmailMessage mail=new  Messaging.SingleEmailMessage();
        //String[] toAddresses=new String[] {	c.Id};
           
           // mail.setTargetObjectId(c.Id);
            system.debug('JOB IS FINISHED1');
             mail.setToAddresses(toAddresses);
            system.debug('JOB IS FINISHED2');
        mail.setSubject('Batch Job for Transfer of Contacts to Dummy Contacts have completed ' + a.Status);
      

        mail.setPlainTextBody('Records Created in Contacts have successfully transferred to Dummy Contacts.  '  );
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
       }