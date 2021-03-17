public with sharing class ProductController {
    @AuraEnabled(Cacheable=true)
    public static List<Product2> getAllProducts() {
        return [SELECT Id, Name, ProductCode, Price__c, Year__c FROM Product2 WHERE IsActive=TRUE];
    }

    @AuraEnabled(Cacheable=true)
    public static List<Product2> findProductsByKey(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
                SELECT Id, Name, ProductCode, Price__c, Year__c
                FROM Product2
                WHERE Name LIKE :key AND IsActive=TRUE
        ];
    }

    @AuraEnabled(Cacheable=true)
    public static Product2 getProductById(Id productId) {
        String key = '%' + productId + '%';
        return [
                SELECT Id, Name, ProductCode, Price__c, Year__c
                FROM Product2
                WHERE Id =:productId
        ];
    }
}