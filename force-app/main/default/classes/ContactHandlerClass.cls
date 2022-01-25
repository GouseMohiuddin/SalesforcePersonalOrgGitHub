public class ContactHandlerClass {
    
    public  void executeAfterInsert(Integer n)
    {
      
     		for (Integer i= 0; i <=n ;i++)
     		{
                Account acc=new Account();
            	system.debug('account values 1--'+acc);
        		acc.Name= 'GOuseMohiuddin'+i;
        		acc.Active__c= 'Yes';
        		system.debug('account values 2--'+acc);
     			insert acc; 
                system.debug('account values 3--'+acc);
            }
     	
    
    }
}