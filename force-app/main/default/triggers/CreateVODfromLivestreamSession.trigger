trigger CreateVODfromLivestreamSession on Livestream_Session__c (before insert) {

    if (Trigger.isInsert()){
        CreateVODfromLivestreamSessionTriggerHelper.createVODRecord(Trigger.new);
    }
    
}