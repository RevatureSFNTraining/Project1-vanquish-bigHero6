@isTest
public class TwitchStreamerDeletePreventionTest {
    @isTest static void testDeletionofStreamer(){

        // Positive Test
        // Creates a Twitch Streamer Manager and Twitch Streamer
        // Attempts to delete a Twitch Streamer but gets an error message
        Twitch_Streamer_Manager__c tsm = new Twitch_Streamer_Manager__c();
        tsm.Name = 'Berry Smores';
        insert tsm;

        Twitch_Streamer__c ts = new Twitch_Streamer__c();
        ts.Name = 'tdrizzle';
        ts.Twitch_Streamer_Manager__r = tsm.id;
        ts.Streamer_Status__c = 'Partner';
        insert ts;

        try {
            delete ts;
        } catch(DMLexception e) {
            System.assert(e.getMessage().contains('You cannot delete a Twitch Streamer if they are assigned a Twitch Streamer Manager. Please unassign before you delete.'),'You cannot delete a Twitch Streamer if they are assigned a Twitch Streamer Manager. Please unassign before you delete.');
        }

        // Negative Test
        // Creates Twitch Streamer
        // The Twitch Streamer is deleted due to not having an assigned Twitch Streamer Manager


        try {            
            Test.startTest();            
            Profile prof = [SELECT Id FROM Profile WHERE Name = 'Custom : Twitch Viewer']; //get a profile Id
            User testUser = new User(Alias = 'TDemo', Email = 'techdemouser@gmail.com', EmailEncodingKey = 'ISO-8859-1', FirstName = 'Demo', LanguageLocaleKey = 'en_US', LastName = 'User', LocaleSidKey = 'en_US', ProfileId = prof.Id, TimeZoneSidKey = 'America/Denver', Username = 'techdemouser123@gmail.com'); 
            insert testUser;
            System.runAs(testUser) {
                Twitch_Streamer__c ts2 = new Twitch_Streamer__c();
                ts2.Name = 'dryPancakes123';
                ts2.Streamer_Status__c = 'Partner';
                insert ts2;
                delete ts2;
            
                //Apex Trigger addError Checking
                List<Twitch_Streamer__c> streamerList = [SELECT ID FROM
                Twitch_Streamer__c WHERE Name='dryPancakes123'];
                System.assertEquals(0,streamerList.size());

            }
        Test.stopTest();
        
    } catch(Exception e) {
        System.debug('error::'+e);
    }

    }

}