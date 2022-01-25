public class   TestYoutube
{
    
    @AuraEnabled(cacheable=true)
    public static void MetadataTest(){
        List<URL1__mdt > temp=new List<URL1__mdt>();
        
         temp=[select MasterLabel, Link__c,Name__c from URL1__mdt ];
        system.debug('listmeta========>'+ temp );
        List<URL1__mdt> ribbon=new List<URL1__mdt>();
        ribbon.addAll(temp);
        system.debug('listmeta========>'+ ribbon);
       // return ribbon;
        
}

}