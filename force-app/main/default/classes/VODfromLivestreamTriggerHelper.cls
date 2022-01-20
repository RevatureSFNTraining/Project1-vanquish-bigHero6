public class VODfromLivestreamTriggerHelper {
    // Whenever a livestreamer starts a livestream session, a video on demand object is created with its properities
    public static void createVODRecords(List<Livestream_Session__c> livestreamSessionList)
    {
        for (Livestream_Session__c objLivestream: livestreamSessionList){
                // Create a new VOD and assign it to the livestream
                Video_on_Demand__c v = new Video_on_Demand__c();

                // Assign values to the VOD v
                v.Name = objLivestream.Name;
                v.VOD_Game_Title__c = objLivestream.Game_Title__c;
                v.VOD_Date__c = objLivestream.Livestream_Date__c;
                v.VOD_Length__c = objLivestream.Livestream_Uptime__c;
                v.Livestream_Session__r = objLivestream;
                insert v;
            }
        }
}