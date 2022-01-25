trigger Policy_Share on Policy__c (after insert) {
    if(trigger.isInsert ){
    List<Policy__Share> policyShares=new  List<Policy__Share>();
        
   
        for (Policy__c p:trigger.new)
        {
            if (p.Policy_Type__c=='Business'){
            Policy__Share policyRecord=NEW Policy__Share();
            policyRecord.ParentId=p.Id;
            policyRecord.UserOrGroupId=p.Agent__c;    
        	policyRecord.AccessLevel='read';
            policyRecord.RowCause=Schema.Policy__Share.RowCause.Manual;
            policyShares.add(policyRecord);
                system.debug('@policyShares '+policyShares);
            }
        }
        Database.SaveResult[] policyShareInsertResult=Database.insert(policyShares,true);
    }

}