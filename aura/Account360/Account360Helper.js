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
	},
    fetchContactDetails : function(component,event,helper,recordId){
        var action = component.get("c.getContactDetails");
        action.setParams({
            accountId : recordId
        });
        action.setCallback(this, function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                var contact = response.getReturnValue();
                var contactDetails=[];
                for(var i=0;i<contact.length;i++){
                    contactDetails.push({
                        "FirstName": contact[i].FirstName,
                        "LastName" :contact[i].LastName,
                        "Phone": contact[i].Phone,
                        "Email": contact[i].Email,
                        "MobilePhone": contact[i].MobilePhone,
                        "OtherPhone": contact[i].OtherPhone
                    })
                }
                component.set("v.primaryContact",contactDetails);
            }
        });
        $A.enqueueAction(action);
    }
})