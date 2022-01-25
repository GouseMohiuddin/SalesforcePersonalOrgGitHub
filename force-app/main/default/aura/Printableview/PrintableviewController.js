({doInit :function (component, event, helper)
  {
      
  },
	handleClick : function(component, event, helper) {
        
        var rID=component.get("v.recordId");
        var use =$A.get("e.force:navigateToURL");
        use.setParams({
            "url":"/"+rID+"/p"
        });
        use.fire();
        }
		
	}
)