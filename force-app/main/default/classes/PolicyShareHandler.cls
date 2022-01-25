public class PolicyShareHandler {
    @InvocableMethod(label = 'Share Policy' description = 'Share Policy')
    
    public static void sharePolicyRecord(List<PolicyShare> policyShareList)
    {
        PolicyShare shareInformation = policyShareList.get(0);
        
        Policy__Share newShare =new Policy__Share();
        newShare.ParentId =shareInformation.policyId;
        newShare.UserOrGroupId=shareInformation.userId;
        newShare.AccessLevel=shareInformation.AccessLevel;
        newShare.RowCause='Manual';
        
        insert newShare;
        
    }  
    public class PolicyShare
    {
        @InvocableVariable(required=true)
 		public String policyId;
        @InvocableVariable(required=true)
 		public String userId;
        @InvocableVariable
        public String AccessLevel;
	}
}