({
	fetchAccountRecord : function(component,event,helper,recordId) {
     var action = component.get("c.getAccountDetails");
        action.setParams({
            accountId : recordId
        });
        action.setCallback(this, function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                var account = response.getReturnValue();
                //console.log(account);
                var accountDetails=[];
                for(var i=0;i<account.length;i++){
                    accountDetails.push({
                        "Name": account[i].Name,
                        "AccountNumber" :account[i].AccountNumber,
                        "AccountType": account[i].Type
                    })
                }
                component.set("v.accountRecord",accountDetails);
            }
        });
        $A.enqueueAction(action);
	}
})