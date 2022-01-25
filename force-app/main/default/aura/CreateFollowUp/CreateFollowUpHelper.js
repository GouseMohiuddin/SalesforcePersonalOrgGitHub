({
	helperMethod : function(component, event, helper) {
         var evt= $A.get("e.force:navigateToComponent");
         console.log('Event '+evt);
         debugger;
         var evtId=component.get("v.recordId");
         evt.setParams({
              componentDef : "c:newEventPage",
              componentAttributes:
             {
              evtId : evtId
             }
        });
        evt.fire();
        
       
		
	}
})