({
	edit : function(component, event, helper) {
    var editRecordEvent = $A.get("e.force:createRecord");
    editRecordEvent.setParams({
        "recordId": component.get("v.recordId")
    });
    editRecordEvent.fire();
}
})