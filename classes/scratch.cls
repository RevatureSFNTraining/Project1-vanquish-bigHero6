public class scratch {

    public with sharing scratch(){}
    
    public List<sObject> search(String w){
        
        List<Dictionary_Entry__c> entries = new List<Dictionary_Entry__c>();
        entries = [SELECT Id, Word_Form__c FROM Dictionary_Entry__c WHERE Word_Form__c = :w];
        return entries;
    }
}