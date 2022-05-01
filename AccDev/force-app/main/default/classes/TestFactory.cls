@IsTest
public with sharing class TestFactory {
    public static List<Account> createAccounts(Boolean doInsert,Integer total){
        List<Account> listAccounts=new List<Account>();  
        for(Integer i=0;i<total;i++){   
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            acc.Industry='Agriculture';
            listAccounts.add(acc);
        }
        if(doInsert){
            insert listAccounts;
        }
        return listAccounts;
    }
    public static List<Contact> createContacts(Boolean doInsert, Id accId,Integer total){
        List<Contact> listContacts=new List<Contact>();     
        for(Integer i=0;i<total;i++){   
            Contact con = new Contact();
            con.AccountId = accId;
            con.FirstName = 'FirstName'+i;
            con.LastName = 'LastName'+i;
            con.Email = 'FirstName'+i+'@example.com';
            listContacts.add(con);
        }
        if(doInsert)
        {
            insert listContacts;
        }
        return listContacts;
    }    
}
