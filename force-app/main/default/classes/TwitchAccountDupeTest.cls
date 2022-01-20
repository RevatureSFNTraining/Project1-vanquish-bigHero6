@isTest
public class TwitchAccountDupeTest {
    @isTest static void testDupeTwitchName(){

        // Positive Test

        Account a = new Account();
        a.Name = 'Bobby Rogers';
        insert a;

        Twitch_Account__c tA = new Twitch_Account__c();
        tA.Name='bobRoger';
        tA.Email_Address__c='testemail@gmail.com';
        tA.Account__c = a.id;

        insert tA;

        Twitch_Account__c dupeAccount = new Twitch_Account__c();
        dupeAccount.Name='bobRoger';
        dupeAccount.Email_Address__c='testemail@gmail.com';
        dupeAccount.Account__c = a.id;

        try {
            insert dupeAccount;
        } catch (Exception e) {
            System.debug('An error happened, as predicted!');
        }
        
        List<Twitch_Account__c> accList = [SELECT ID,Email_Address__c FROM
        Twitch_Account__c WHERE Email_Address__c='testemail@gmail.com'];
        System.assertEquals(1,accList.size());
        // ensures there is no account with testemail.com, making sure there are no dupes
        // there is only one twitch account made, not 2


        // Negative Test
        // Creating a legit account and inserting into org
        Twitch_Account__c legitTwitchAccount = new Twitch_Account__c();
        legitTwitchAccount.Name='roosterteeth';
        legitTwitchAccount.Email_Address__c='test3mail@gmail.com';
        legitTwitchAccount.Account__c = a.id;

        insert legitTwitchAccount;
        
        // Creating a 2nd legit account and inserting into org
        Twitch_Account__c legitTwitchAccount2 = new Twitch_Account__c();
        legitTwitchAccount2.Name='roosterteeth2';
        legitTwitchAccount2.Email_Address__c='test3mail@gmail.com';
        legitTwitchAccount2.Account__c = a.id;

        insert legitTwitchAccount2;
        List<Twitch_Account__c> accList2 = [SELECT ID FROM
        Twitch_Account__c WHERE Email_Address__c='test3mail@gmail.com'];
        system.assertEquals(2,accList2.size());
        // ensure there is a legit twitch account that isnt the same as above
        // and there are 2 items in the list
  
    }

}