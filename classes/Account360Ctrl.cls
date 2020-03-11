/**
 * Controller to Handle Account360VFP on Account Detail Page
 * Intial Version - Satish Inuganti
 * Last Updated Date : 01-01-2020.
 **/
public class Account360Ctrl {
    public Account account{get; set;}
    public String accountName{get; set;}
    public Policy__c policy{get; set;}
    public List<Policy__c> policyList{get; set;}
    public String JSONString{get; set;}
    public Set<Id> policyid{get; set;}
    public static Id accountId{get; set;}
    Public Account360Ctrl(Apexpages.StandardController stdcontroller){
        this.account = (Account) stdcontroller.getRecord();
        accountId = this.account.Id;
        System.debug('###accountrecord is '+this.account);
        List<Account> currentAccount = [SELECT Name
                                       FROM
                                       Account WHERE
									id= :accountId];
        accountName = currentAccount[0].Name;
        this.loadPolicies();
        
    }
    public List<Policy__c> loadPolicies(){
        /** NEW LOGIC FOR POLICY RELATED LIST BASED ON ACCOUNT ID **/
        List<Policy__c> policyList = new List<Policy__c>();
        for(Policy__c policy : [SELECT Name,
                                	Plan_Name__c,
                                	Installment_Premium__c 
                                	FROM Policy__c 
                                	WHERE 
                                	Policy_Owner__c = :accountId 
                                	AND Status__c IN ('IF', 'PR', 'RJCT')]){
                                            try{
                                                policyList.add(policy);
                                            }
                                            catch(Exception e){
                                                e.getLineNumber();
                                            }
        }
        System.debug('###policyList is '+policyList);
        return policyList;
            }
	@AuraEnabled
	public static void getAccountDetails(Id accountId){
		system.debug('Id is '+accountId);    
	}
	}



	/*** IN CASE OF NEW LOGIC FAILS WILL GO WITH OLD LOGIC **/
        /**
        List<Policy__c> policyList = [SELECT Name, Plan_Name__c, Installment_Premium__c
                   FROM Policy__c
                   WHERE 
                   Policy_Owner__c = :accountId
                   AND Status__c IN ('IF', 'PR', 'RJCT')];
        for(integer i=0;i<policyList.size();i++){
            for(Policy__c policy : policyList){
                ownerName[i] = policy.Name;
                system.debug('###ownername list '+ownerName[i]);
            }
        }
	**/