public with sharing class LWCDempCmp {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccounts() {
	    return [SELECT Id, Name FROM Account LIMIT 5];        
    }
}
