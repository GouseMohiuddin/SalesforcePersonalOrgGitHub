trigger triggerOnContact on Contact (after insert, after update , after undelete , after delete) 
{
    {
        if(trigger.isAfter)
            if(trigger.isInsert || trigger.isUpdate)
        {
        //   Home_Data_Handler.HomeDataCheckBox(trigger.new); 
        }
    }
    
    {
        if(trigger.isAfter){
            if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete || trigger.isDelete)
            {
                ConatctRelatedListHandler.ContactRelatedListToAccount(trigger.new);
            }
    }
}
}