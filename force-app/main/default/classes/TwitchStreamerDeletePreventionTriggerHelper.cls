public class TwitchStreamerDeletePreventionTriggerHelper {
    // a livestreamer cannot be deleted if they are assigned a streamer manager
    public static void preventTwitchstreamerDelete(List<Twitch_Streamer__c> twitchStreamerList)
    {
        for (Twitch_Streamer__c objStreamer: twitchStreamerList){
            
                if ( objStreamer.Twitch_Streamer_Manager__r != null) {

                    objStreamer.addError('You cannot delete a Twitch Streamer if they are assigned a Twitch Streamer Manager. Please unassign before you delete.');
                }
            }
        }
    } 
}
