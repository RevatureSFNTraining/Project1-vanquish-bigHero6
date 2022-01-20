@isTest
public class TwitchAccountDupeTest {
    @isTest static void testDupeTwitchName(){

        // Positive Test

        Account a = new Account();
        a.Name = 'Bobby Rogers';
        insert a;

        Twitch_Account__c tA = new Twitch_Account__c();
        tA.Name='bobRoger';
        tA.Email_Address__c=testemail@.com
        tA.Account__r = a.id;

        insert tA;

        Twitch_Account__c dupeAccount = new Twitch_Account__c();
        dupeAccount.Name='bobRoger';
        dupeAccount.Email_Address__c=testemail@.com
        dupeAccount.Account__r = a.id;

        try {
            insert dupeAccount;
        } catch (Exception e) {
            System.debug('An error happened, as predicted!');
        }
        
        List<Twitch_Account__c> accList = [SELECT ID FROM
        Twitch_Account__c WHERE Email_Address__c='testemail@.com'];
        System.assertEquals(0,accList.size());
        // ensures there is no account with testemail.com, making sure there are no dupes


        // Negative Test
        Twitch_Account__c legitTwitchAccount = new Twitch_Account__c();
        legitTwitchAccount.Name='roosterteeth';
        legitTwitchAccount.Email_Address__c=test3email@.com
        legitTwitchAccount.Account__r = a.id;

        insert legitTwitchAccount;
        List<Twitch_Account__c> accList = [SELECT ID FROM
        Twitch_Account__c WHERE Email_Address__c='test3email@.com'];
        system.assertEquals(1,accList.size());
        // ensure there is a legit twitch account that isnt the same as above
   
    }

}