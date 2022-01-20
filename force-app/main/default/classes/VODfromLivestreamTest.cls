@isTest(SeeAllData=true)
public class VODfromLivestreamTest {
@isTest static void testSameValuesfromLivestream(){

        // Positive Test
        Twitch_Streamer_Manager__c tsm = new Twitch_Streamer_Manager__c(Name='Bob Morris', Master_Id__c='Manager 1');
    	insert tsm;
        // Creates a Twitch Streamer Manager, Twitch Streamer, a livestream session to create a VOD to make sure values are the same
        Twitch_Streamer__c ts = new Twitch_Streamer__c();
        ts.Name = 'PopcornSegway';
        ts.Twitch_Streamer_Manager__r = tsm;
        ts.Streamer_Status__c = 'Partner';
        insert ts;
    
        Livestream_Session__c ls = new Livestream_Session__c(Master_Id__c='Session 1');
        //ls.RecordTypeId = Schema.SObjectType.Livestream_Session__c.getRecordTypeInfosByName().get('Twitch Partner').getRecordTypeId();
        ls.Game_Title__c = 'VALORANT';
        ls.Twitch_Streamer__c = ts.id;
        ls.Name = 'TOP ELITE GAMEPLAY FROM IRON TO RADIANT';
    	insert ls;

        List<Video_on_Demand__c> vodList = [SELECT ID, Name, VOD_Game_Title__c FROM Video_on_Demand__c WHERE Name='TOP ELITE GAMEPLAY FROM IRON TO RADIANT' AND VOD_Game_Title__c='VALORANT'];
        system.assertEquals(1,vodList.size());
    	system.assertEquals(ls.Name,vodList[0].Name);
        system.assertEquals(ls.Game_Title__c,vodList[0].VOD_Game_Title__c);
        // checks to see if the VOD has the same properties from the livestream


        // Negative Test
        // No Game Title is assigned during the livestream
        Livestream_Session__c ls2 = new Livestream_Session__c();
        //ls2.RecordTypeId = Schema.SObjectType.Livestream_Session__c.getRecordTypeInfosByName().get('Twitch Partner').getRecordTypeId();
        ls2.Twitch_Streamer__r = ts;
        ls2.Name = 'TOP ELITE GAMEPLAY FROM IRON TO RADIANT';

        vodList = [SELECT ID, Name, VOD_Game_Title__c FROM
        Video_on_Demand__c WHERE Name='TOP ELITE GAMEPLAY FROM IRON TO RADIANT'];
        System.assertNotEquals(ls2.Game_Title__c,vodList[0].VOD_Game_Title__c); // Game Titles do not match*/
    }
}