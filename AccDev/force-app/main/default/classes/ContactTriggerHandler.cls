public with sharing class ContactTriggerHandler {
    public static void beforeInsert(List<Contact> listContacts) {
        beforeInsertUpdate(listContacts);
    }
    public static void beforeUpdate(List<Contact> listContacts) {
        beforeInsertUpdate(listContacts);
    }
    public static void beforeInsertUpdate(List<Contact> listContacts) {
        if(listContacts!=null && listContacts.size()>0){
            Set<Id> accountIDs=new Set<Id>();
            for(Contact c:listContacts){
                if(c.AccountId!=null){
                    accountIDs.add(c.AccountId);
                }
            }
            Map<Id,Account> mapAccounts=new Map<Id,Account>([Select Id,Industry From Account Where Id=:accountIDs]);
            for(Contact c:listContacts){
                c.Account_Industry__c=mapAccounts.get(c.AccountId)?.Industry;
            }            
        }
    }
}
