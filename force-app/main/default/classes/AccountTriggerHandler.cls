public class AccountTriggerHandler {

    
    
     public void onAfterUpdateSyncContact(Map<Id,Account> accMap) {  
        
            List<Contact> lisstContact = [select id,Lastname,AccountId,Email from Contact where AccountId IN:accMap.keySet() ]; 
            for(Contact cc:lisstContact){
                if(cc.LastName != accMap.get(cc.AccountId).name) {
                    cc.LastName =accMap.get(cc.AccountId).name;
                }
                if(cc.Email != accMap.get(cc.AccountId).Email__c) {
                    cc.Email = accMap.get(cc.AccountId).Email__c;
                }
               // CompleteLog += Utility.getCompleteLogString('Record Id') + cc.Id + '::: Object Name ::: Contact ' + '<br/>';
            }
            update lisstContact;
        
      
    }
}