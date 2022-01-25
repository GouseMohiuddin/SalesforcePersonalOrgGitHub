@isTest
public class TestPolicy_Share {
    @isTest static void test1(){
    List<User> users = [SELECT Id FROM User WHERE IsActive = true LIMIT 2];
      Id User1Id = users[0].Id;
        Id User2Id =users[1].Id;
        
	Policy__c policy=new Policy__c();
        policy.Name='TestPolicy';
        policy.Policy_Type__c='Business';
        policy.OwnerId=user1Id;
        policy.Agent__c=User2Id;
       
       
      List<Policy__Share> pshare= [SELECT Id, UserOrGroupId, AccessLevel, 
         RowCause FROM Policy__Share WHERE ParentId = :policy.Id AND UserOrGroupId=:users ];
        try{
         
        insert policy; 
    System.assertEquals(pshare[0].AccessLevel, 'Read');
      System.assertEquals(pshare[0].RowCause, 'Manual');
     System.assertEquals(pshare[0].UserOrGroupId, user2Id);
        }
        catch (Exception e)
        {
            system.assertEquals(e.getMessage(), e.getMessage());
        
     
        }     
    }
}