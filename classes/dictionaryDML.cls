public with sharing class dictionaryNavigator{
    public dictionary() {
    }

    public sObject searchByLanguage(String language, String inputWord){

        switch on language {
            when 'sambal' {		
                List<sObject> = [
                    SELECT  Id, 
                            Word_Form__c, 
                            English_Gloss__c, 
                            Tagalog_Gloss__c
                    FROM Dictionary_Entry__c 
                    WHERE (Word_Form__c == :inputWord)
                ];
            }	
            When 'english' {         	// when block 2
                List<sObject> = [
                    SELECT  Id, 
                            English_Gloss__c,                             
                            Word_Form__c, 
                            Tagalog_Gloss__c
                    FROM Dictionary_Entry__c 
                    WHERE (English_Gloss__c == :inputWord)
                ];
            }
            when 'tagalog' {		 
                List<sObject> = [
                    SELECT  Id, 
                            Tagalog_Gloss__c
                            Word_Form__c
                            English_Gloss__c,                             
                    FROM Dictionary_Entry__c 
                    WHERE (Tagalog_Gloss__c == :inputWord)
                ];
            }
        }

    }
}
