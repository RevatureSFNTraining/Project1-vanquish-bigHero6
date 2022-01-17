public with sharing class SearchController {

    @AuraEnabled(cacheable=true)
    public static List<Product2> getProductList() {
        /*return [SELECT p.Id, 
        p.Description, 
        p.IsActive, 
        p.Name, 
        p.ProductCode, 
        (SELECT Product2Id, 
                UnitPrice 
         FROM   PricebookEntries) 
 FROM   Product2 p WHERE Product2.Name LIKE 'TWITCH%' ];*/
        return [SELECT Name, Price__c, Description, ProductCode FROM Product2 WHERE Name LIKE 'TWITCH%' ORDER BY ProductCode ];
    }
}