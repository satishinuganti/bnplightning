({
	fetchAccountDetails : function(component, event, helper) {
        var recordId = component.get("v.recordId");
        helper.fetchAccountRecord(component,event,helper,recordId);
	}
})