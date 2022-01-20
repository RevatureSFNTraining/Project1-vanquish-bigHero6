trigger StreamerDeletePrevention on Twitch_Streamer__c (before delete) {

    if (Trigger.isDelete()){
        StreamerDeletePreventionTriggerHelper.preventTwitchstreamerDelete(Trigger.old);
    }
   
}