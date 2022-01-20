// Trigger with TwitchAccountTriggerHelper Class
trigger TwitchAccountDupe on Twitch_Account__c (before insert, before update) {
    TwitchAccountDupeTriggerHelper.preventDupeRecords(Trigger.new);

}