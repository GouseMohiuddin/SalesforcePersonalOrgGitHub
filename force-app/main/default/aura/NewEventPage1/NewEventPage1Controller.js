({
handleSuccess : function(component, event, helper) {

   var createEvent= $A.get('e.force:createRecord');
    if(createEvent){
        createEvent.setParams({
            'entityApiName':'Event',
             'defaultFieldValues': {
                 'Subject':'CreateFollowUp',
              // 'Follow_Up_Created_At__c':''
                 
             }
        });
        createEvent.fire();
        
    }
    else{
        alert("Event Creation not supported");
    }
    }  
})