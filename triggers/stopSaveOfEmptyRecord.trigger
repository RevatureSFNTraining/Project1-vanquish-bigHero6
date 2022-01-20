// Trigger: Prevent saving a Proposed Edit record that has field
// checkbox: incomplete set to true
trigger StopSaveEmptyRec on Proposed_Edit__c (before insert) {
    if (Trigger.isInsert){
        for (Proposed_Edit__c rec:Trigger.new)
            if (Proposed_Edit__c.incomplete)) 
                rec.addError('Empty record - cannot be saved');
    } 
}