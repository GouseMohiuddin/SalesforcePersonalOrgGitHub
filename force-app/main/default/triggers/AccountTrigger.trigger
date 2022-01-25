trigger AccountTrigger on Account (before insert, after insert, before update, after update) {

      AccountTriggerHandler handler = new AccountTriggerHandler();
    
     if( Trigger.isAfter && Trigger.isUpdate ){
    Map<Id ,Account> mapAcc = new Map<Id ,Account>();
         for(Account acc: Trigger.New){
     if (Trigger.oldMap.get(acc.Id).Name != Trigger.newMap.get(acc.Id).Name || 
             	 Trigger.oldMap.get(acc.Id).Email__c != Trigger.newMap.get(acc.Id).Email__c){                  
                mapAcc.put(acc.Id, acc);
            }
         }
     
      if(!mapAcc.isEmpty()&& mapAcc.size()>0){
            handler.onAfterUpdatesynccontact(mapAcc);
        }
     }
}