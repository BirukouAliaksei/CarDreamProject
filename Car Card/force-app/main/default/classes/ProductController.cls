public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getAllProducts() {
        return [SELECT Id, Name, ProductCode, Price__c, Year__c FROM Product2 Where IsActive=true];
    }

    @AuraEnabled(cacheable=true)
    public static List<Product2> findProducts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name, ProductCode, Price__c, Year__c
            FROM Product2
            WHERE Name LIKE :key AND IsActive=true
        ];
    }
}