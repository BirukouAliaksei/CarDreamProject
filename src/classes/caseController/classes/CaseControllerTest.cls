/**
 * Created by Bruss on 3/15/2021.
 */

@IsTest
public with sharing class CaseControllerTest {

    @TestSetup
    static void setup() {
        Case caseId = new Case();
        List<Case> casesList = new List<Case>();
        Id fakeId = 'a138E000000N9dr';
        for (Integer i = 0; i < 10; i++) {
            casesList.add(new Case(OwnerId = fakeId, Language__c = 'EN'));
        }
    }

    @IsTest
    static void getAllCasesTest() {
        System.assertEquals(10, [SELECT COUNT() FROM Case]);
    }

    @IsTest
    static void getAllCasesWithFailTest() {
        System.assertNotEquals(9, [SELECT COUNT() FROM Case]);
    }

    @IsTest
    static void getCaseByIdTest() {
        Case caseId = [SELECT Id FROM Case LIMIT 1];
        Case caseById = [SELECT Id FROM Case WHERE Id = :caseId.Id];
        System.assertNotEquals(caseId.Id, caseById.Id);
    }
}