public class ConatctRelatedListHandler {
    public static void ContactRelatedListToAccount(List<Contact> relatedcontact)
    {
        
            List<Contact> contactList=new  List<Contact>();
            Set<Id> accountIdsSet=new Set<Id>();
            if(Trigger.isDelete){
                contactList=Trigger.Old;
            }else
            {
                contactList=Trigger.New;
            }
            for(contact con:contactList)
            {
                if(con.AccountId!=null){
                    accountIdsSet.add(con.AccountId);
                } 
            }
            // For Contact Related List where Jan Home is not null
            // 
        {
            List<Account> accountList=[Select Id ,Name ,Jan_Related_Count_Trigger__c , (Select id, Name from Contacts where Jan_Home__c!=null  )
                                      From Account where id in:accountIdsSet];
            for (Account acc:accountList){
                List<Contact> relatedContacts=acc.Contacts;
                if(relatedContacts!=null)
                {
                    acc.Jan_Related_Count_Trigger__c=relatedContacts.size();
                    
                }else
                {
                    acc.Jan_Related_Count_Trigger__c=0;
                }
                
            }
            update accountList;

        } 
        
        {
           List<Account> accountList1=[Select Id ,Name ,Feb__c , (Select id, Name from Contacts where 	Feb_Home__c!=null  )
                                      From Account where id in:accountIdsSet];
            for (Account acc:accountList1){
                List<Contact> relatedContacts=acc.Contacts;
                if(relatedContacts!=null)
                {
                    acc.Feb__c=relatedContacts.size();
                    
                }else
                {
                    acc.Feb__c=0;
                }
                
            }
            update accountList1;  
        }
        
         {
           List<Account> accountList2=[Select Id ,Name ,Mar_Related_Count_Trigger__c , (Select id, Name from Contacts where 	Mar_Home__c!=null  )
                                      From Account where id in:accountIdsSet];
            for (Account acc:accountList2){
                List<Contact> relatedContacts=acc.Contacts;
                if(relatedContacts!=null)
                {
                    acc.Mar_Related_Count_Trigger__c=relatedContacts.size();
                    
                }else
                {
                    acc.Mar_Related_Count_Trigger__c=0;
                }
                
            }
            update accountList2;  
        }
            {
           List<Account> accountList2=[Select Id ,Name ,	Apr_Related_Count_Trigger__c , (Select id, Name from Contacts where 	Apr_Home__c!=null  )
                                      From Account where id in:accountIdsSet];
            for (Account acc:accountList2){
                List<Contact> relatedContacts=acc.Contacts;
                if(relatedContacts!=null)
                {
                    acc.Apr_Related_Count_Trigger__c=relatedContacts.size();
                    
                }else
                {
                    acc.Apr_Related_Count_Trigger__c=0;
                }
                
            }
            update accountList2;  
        }
        
        }
        
    }