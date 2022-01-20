trigger VODfromLivestream on Livestream_Session__c (before insert, before update) {
    VODfromLivestreamTriggerHelper.updateSessionValue(Trigger.new);
 }