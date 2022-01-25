({
	handleClick: function(component, event, helper) {
       var buttonLabel = event.getSource().get("v.tittle");
        
		 var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
        "url":'https://www.youtube.com/'
    });
    urlEvent.fire();
	}
})