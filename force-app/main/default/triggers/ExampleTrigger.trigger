
trigger ExampleTrigger on Twitch_Account__c (before insert, before update) {
    // New versions of Twitch Accounts will become active and have their bio changed
    
    for (Twitch_Account__c twitch_account : Trigger.New){
        twitch_account.Active__c = true;
        twitch_account.Bio__c = 'We do not know much about them, but we are sure' + twitch_account.Name + 'is great';
    }
}