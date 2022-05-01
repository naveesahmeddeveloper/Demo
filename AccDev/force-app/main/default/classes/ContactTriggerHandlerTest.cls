@isTest
public with sharing class ContactTriggerHandlerTest {
    @TestSetup
    static void setupTestData(){
        List<Account> accList=TestFactory.createAccounts(true,1);
        TestFactory.createContacts(true,accList[0].id,201);   
    }
    @isTest
    public static void testAccountIndustry() {
        Test.startTest();
        List<Contact> listContacts=[Select Id,Account_Industry__c From Contact];
        for(Contact c:listContacts){
            System.assertEquals('Agriculture', c.Account_Industry__c);
            c.Account_Industry__c='';
        }
        update listContacts;
        listContacts=[Select Id,Account_Industry__c From Contact];
        for(Contact c:listContacts){
            System.assertEquals('Agriculture', c.Account_Industry__c);
        }        
        Test.stopTest();
    }
}
