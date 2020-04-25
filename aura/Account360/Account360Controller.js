({
	fetchAccountDetails : function(component, event, helper) {
        var recordId = component.get("v.recordId");
        helper.fetchAccountRecord(component,event,helper,recordId);
        component.set("v.togglehover", true);
	},
    reset : function(component, event, helper){
        component.set("v.togglehover", false);
    }
})