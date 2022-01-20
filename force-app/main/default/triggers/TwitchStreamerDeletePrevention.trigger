trigger TwitchStreamerDeletePrevention on Twitch_Streamer__c (before delete) {

    if (Trigger.isDelete()){
        TwitchStreamerDeletePreventionTriggerHelper.preventTwitchstreamerDelete(Trigger.old);
    }
   
}