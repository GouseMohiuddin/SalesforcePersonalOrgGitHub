public class FieldSet {
    
    @AuraEnabled
    public static List<String> getFieldSet(String fieldSetName, String sObjectName) {
        List<String> fsmList = new List<String>();
        Schema.FieldSet fieldSet;
        
        Schema.SObjectType myObjectType = Schema.getGlobalDescribe().get(sObjectName);
        Schema.DescribeSObjectResult describe = myObjectType.getDescribe();
        
        //Contains all fieldSets in that object
        Map<String, Schema.FieldSet> FsMap = describe.fieldSets.getMap();
        
        if(FsMap.containsKey(fieldSetName)) {

            fieldSet = describe.fieldSets.getMap().get(fieldSetName);
            
            for(Schema.FieldSetMember fsm : fieldSet.getFields()) {
                fsmList.add(String.valueOf(fsm.getSObjectField()));
            }
        }
        
        if(fsmList != null && fsmList.size() > 0)
            return fsmList;
        else
            return null;
    }
    
    @auraEnabled
    public static List<sObject> getRelatedRecords(String childObjectName, String referenceFieldName, String referenceFieldValue) {
        List<sObject> objList = new List<sObject>();
        
        try {
            
            String query = 'Select Id, Name from ' +childObjectName+ ' where ' +referenceFieldName+ ' =: referenceFieldValue';
            objList = database.query(query);
            return objList;
        }
        catch(exception e) {
            system.debug('e'+e);
            return null;
        }
    }
}