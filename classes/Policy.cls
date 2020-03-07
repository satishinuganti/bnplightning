public class Policy {
    public Policy__c policy{get; set;}
    public static String premiumduedate{get; set;}
    public static String commencementdate{get; set;}
    public static String maturitydate{get; set;}
    public static Integer installementpremium{get; set;}
    public static Id policyid{get;set;}
    public Policy(ApexPages.StandardController stdcontroller){
        this.policy = (Policy__c) stdController.getRecord();
        policyid = this.policy.id;
        //premiumduedate = String.valueOf(this.policy.Premium_Due_From__c);
        //System.debug('###premiumduedate' +premiumduedate);
        System.debug('###policy Id is' +this.policy.id);
        getLoadRates();       
    }
    public static void getLoadRates(){
        List<Policy__c> policylist = [SELECT Premium_Due_From__c,Installment_Premium__c,Commencement_Date__c,Policy_Maturity_Date__c FROM Policy__c WHERE Id = :policyid];
        System.debug('####policyinfo '+policylist);
        for(Policy__c p:policylist){
           premiumduedate = String.valueOf(p.Premium_Due_From__c);
            commencementdate = String.valueOf(p.Commencement_Date__c);
            maturitydate = String.valueOf(p.Policy_Maturity_Date__c);
            installementpremium = Integer.valueOf(p.Installment_Premium__c);
            //System.debug('###premiumduedate is '+premiumduedate);
        }
    }
}