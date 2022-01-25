trigger INRtrigger on Contact (before insert) {


for(Contact c:trigger.New)
    {
       
     String Curreny= c.CurrencyIsoCode ;
 
      if (Curreny == 'INR' &&  c.OtherPhone==null)
      {
          c.OtherPhone.addError('Other Phone is mandatory  Error Msg from trigger ');
         
      }

}  

}