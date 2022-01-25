trigger CheckBoxCode on Producers_Data__c (after insert , after update) {
    {
        
     set<string> acc1=new set<string>();
    For (Producers_Data__c p : Trigger.New)
    {
        acc1.add(p.Account__c);
    }
List<account> acc=[Select id, type from account where id in:acc1];
    //List<account> acc2=[select id, (select id,Sweep__c from Producers_Data__c ) from account ];
    List<account> acclist=new List<account>();
    For (account a:acc)
    {
        For (Producers_Data__c p : Trigger.new)
        {
           
            if(p.Account__c==a.id)
            {
                if (p.Business_Unit__c=='One' && p.Status__c=='Active' && p.Sweep__c==true )
 
                {
                a.Producer_s_Code__c=true;	
                }
                else
                {
                   a.Producer_s_Code__c=false; 
                }
                acclist.add(a);
            }
             update acclist;
        }
    }
    }
    
    
}