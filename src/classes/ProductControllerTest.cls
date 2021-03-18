/**
 * Created by Bruss on 3/18/2021.
 */

@IsTest
public with sharing class ProductControllerTest {

    @TestSetup
    static void setup() {
        List<Product2> allProducts = new List<Product2>();
        for (Integer i = 0; i < 10; i++) {
            allProducts.add(new Product2(Name = 'Name' + i, ProductCode = 'Code'));
        }
        insert allProducts;
    }

    @IsTest
    static void getAllProductsTest() {
        System.assertEquals(10, [SELECT COUNT() FROM Product2]);
    }

    @IsTest
    static void getFailAllProductsTest() {
        System.assertNotEquals(9, [SELECT COUNT() FROM Product2]);
    }

    @IsTest
    static void getProductByKeyTest() {
        String key = 'Name2';
        Product2 product2 = [SELECT Name FROM Product2 WHERE Name LIKE :key];
        System.assertEquals(key, product2.Name);
    }

    @IsTest
    static void getProductByKeyWithFailTest() {
        String key = 'Name2';
        Product2 product2 = [SELECT Name FROM Product2 WHERE Name LIKE :key];
        System.assertNotEquals('Name1', product2.Name);
    }

    @IsTest
    static void getProductByIdTest() {
        Product2 productId = [SELECT Id FROM Product2 LIMIT 1];
        Product2 product2 = [SELECT Id, Name FROM Product2 WHERE Id = :productId.Id];
        System.assertEquals(productId.Id, product2.Id);
    }

    @IsTest
    static void getProductByIdWithFailTest() {
        Product2 productId = [SELECT Id FROM Product2 LIMIT 1];
        Product2 product2 = [SELECT Id, Name FROM Product2 WHERE Id = :productId.Id];
        System.assertNotEquals(null, product2.Id);
    }
}