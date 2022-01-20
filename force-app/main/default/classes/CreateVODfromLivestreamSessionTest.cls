@isTest
public class CreateVODfromLivestreamSessionTest {
    @isTest static void testSameValuesfromLivestream(){

        // Positive Test
        // Creates a Twitch Streamer Manager, Twitch Streamer, a livestream session to create a VOD to make sure values are the same
        Twitch_Streamer_Manager__c tsm = new Twitch_Streamer_Manager__c();
        tsm.Name = 'Holly Bernes';
        insert tsm;

        Twitch_Streamer__c ts = new Twitch_Streamer__c();
        ts.Name = 'PopcornSegway';
        ts.Twitch_Streamer_Manager__r = tsm.id;
        ts.Stream_Status__c = 'Partner';
        insert ts;

        Livestream ls = new Livestream_Session__c();
        ls.RecordTypeId = Schema.SObjectType.OBJECT_NAME.getRecordTypeInfosByName();
        .get('Twitch Partner').getRecordTypeId();
        ls.Game_Title__c = 'VALORANT';
        ls.Twitch_Streamer__r = ts.id;
        ls.Name = 'TOP ELITE GAMEPLAY FROM IRON TO RADIANT';
        ls.Concurrent_Viewers = 10420;

        insert ls;

        List<Video_on_Demand__c> vodList = [SELECT ID FROM
        Video_on_Demand__c WHERE Name='TOP ELITE GAMEPLAY FROM IRON TO RADIANT' AND Game_Title__c='VALORANT'];
        system.assertEquals(1,accList.size());
        system.assertEquals(ls.Name,vodList[0].Name);
        system.assertEquals(ls.Game_Title__c,vodList[0].Game_Title__c);
        // checks to see if the VOD has the same properties from the livestream


        // Negative Test
        // No Game Title is assigned during the livestream
        Livestream ls = new Livestream_Session__c();
        ls.RecordTypeId = Schema.SObjectType.OBJECT_NAME.getRecordTypeInfosByName();
        .get('Twitch Partner').getRecordTypeId();
        ls.Twitch_Streamer__r = ts.id;
        ls.Name = 'TOP ELITE GAMEPLAY FROM IRON TO RADIANT';

        vodList = [SELECT ID FROM
        Video_on_Demand__c WHERE Name='TOP ELITE GAMEPLAY FROM IRON TO RADIANT'];
        System.assertEquals(0,accList.size()); // There is no record since game title is not stated
        System.assertEquals(ls.Name,vodList[0].Name);
        System.assertNotEquals(ls.Game_Title__c,vodList[0].Game_Title__c); // Game Titles do not match
    }

}