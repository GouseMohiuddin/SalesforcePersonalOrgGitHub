trigger contact_relatedlist_delete on Contact ( before delete) {
    if (trigger.isDelete){
        {
            
     Map<Id, Contact> contactObjRel=new Map<Id, Contact>();
     List<Contact> contactListObj=new List<Contact>();
            contactObjRel=trigger.oldMap;
            contactListObj=trigger.old;
     Set<Id> contactSetId=contactObjRel.keySet();
     List<Account> childObj=[SELECT ID , Name,	Contact__c FROM Account WHERE Contact__c IN:contactSetId];
     Map<Id, Account> chidMapList=new Map<Id, Account>();
     for (Account ch1:childObj){
         if(ch1.Contact__c!=null)
         {
             chidMapList.put(ch1.Contact__c,ch1);
         }
     }
     system.debug('childMapList# ' + chidMapList);
     for (Contact s1:contactListObj){
         if(chidMapList.containsKey(s1.Id))
         {
             s1.addError('This contact record can not be deleted because this record has related account list'  );
         }
     }
 }

    }
}