// Trigger with TwitchAccountTriggerHelper Class
trigger TwitchAccountDupe on Twitch_Account__c (before insert, before update) {

    if (Trigger.isInsert() || Trigger.isUpdate()){
        TwitchAccountDupeTriggerHelper.preventDupeRecords(Trigger.new);
    }
}