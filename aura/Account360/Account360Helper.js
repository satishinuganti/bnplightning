({
	fetchAccountRecord : function(component,event,helper,recordId) {
     var action = component.get("c.getAccountDetails");
        action.setParams({
            accountId : recordId
        });
        action.setCallback(this, function(response){
           var state = response.getState();
            if(state === 'success'){
                //console.log(recordId);
            }
        });
        $A.enqueueAction(action);
	}
})