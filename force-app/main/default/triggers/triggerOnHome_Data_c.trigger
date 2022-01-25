trigger triggerOnHome_Data_c on Home_Data__c (after insert, after update ) {
  if(trigger.isAfter)
  {
      if(trigger.isInsert || trigger.isUpdate)
      {
          HomeDataCompltedDateHandler.HomeDataCompletedDate(trigger.new);
      }
  }
}