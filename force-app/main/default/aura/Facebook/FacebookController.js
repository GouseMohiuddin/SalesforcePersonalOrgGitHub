({
	handleClick: function(component, event, helper) {
   
        
		 var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
        "url":'https://www.facebook.com/'
    });
    urlEvent.fire();
	}
})