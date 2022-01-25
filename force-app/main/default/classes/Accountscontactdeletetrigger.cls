public class Accountscontactdeletetrigger {
    public static void delRelAcc(List<Contact> contactListObj,Map<Id, Contact> contactObjRel)
    {
 
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
             s1.addError('Can not delete Related Records ');
         }
     }
 }


}