public class TwitchAccountTriggerHelper {

    // Whenever a user creates a twitch account, the account is not made if there is already the same name
    public static void preventDupeRecords(List<Twitch_Account__c> twitchAccountList)
    {
        for (Twitch_Account__c objAccount: twitchAccountList){
                List<Twitch_Account__c> t = [Select ID from Twitch_Account__c WHERE Name=:objAccount.Name]
                if (t.size() > 0){
                    t.addError(t[0].Name+'Twitch Username Already Exists.')
                }
            }
        }
    } 
}
