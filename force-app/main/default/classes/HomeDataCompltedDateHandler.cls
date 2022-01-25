public class HomeDataCompltedDateHandler {
    
    public static void HomeDataCompletedDate(List<Home_Data__c>   newHomeData)
    {
         List<string> s1=new List<string>();
    For (Home_Data__c h:newHomeData)
    {
        s1.add(h.Contact__c);
        
    }
    List<contact> con=[Select id from contact where id in:s1];
    List<contact> conlist=new List<contact>();
    
    for(contact c:con)
    {
        for (Home_Data__c h:newHomeData)
        {
            if(h.Contact__c==c.id )
            {
                {
                    if(h.Home_Data__c=='Jan Home' && h.Status__c=='Completed' && h.Registered_Date__c!= null)
                    {
                        c.Jan_Home__c=h.Completed_Date__c;               
                    }
                    else 
                    {
                        c.Jan_Home__c=null;
                    }
                    
                } 
                
                {
                    if(h.Home_Data__c=='Feb Home' && h.Status__c=='Completed'&& h.Registered_Date__c!= null)
                    {
                        c.Feb_Home__c=h.Completed_Date__c;
                        
                    }  else
                    {
                        c.Feb_Home__c=null;
                    }
                    
                }
                { 
                    if(h.Home_Data__c=='Mar Home' &&  h.Status__c=='Completed'&& h.Registered_Date__c!= null)
                    {
                        c.Mar_Home__c=h.Completed_Date__c;
                        
                        
                    }else
                    {
                        c.Mar_Home__c=null;
                        
                    }
                    
                }
                {
                    if(h.Home_Data__c=='Apr Home' &&  h.Status__c=='Completed'&& h.Registered_Date__c!= null)
                    {
                        c.Apr_Home__c=h.Completed_Date__c;                   
                    }else
                    {
                        c.Apr_Home__c=null;
                    }
                }
                conlist.add(c);
                
            }
            
            update conlist;
            
        }
    }
    }

}