
@IsTest
public with sharing class OpportunityCloserTest {

    @TestSetup
    static void setup() {
        List<Opportunity> opportunities = new List<Opportunity>();
        for (Integer i = 0; i < 200; i++) {
            opportunities.add(new Opportunity(Name = 'Name' + i, StageName = 'Closed Won', CloseDate = Date.today()));
        }
        insert opportunities;
    }

    @IsTest
    static void test() {
        Test.startTest();
        OpportunityCloser opportunityCloser = new OpportunityCloser();
        Id batchId = Database.executeBatch(opportunityCloser);
        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Opportunity WHERE StageName = 'Closed Lost']);
    }

    @IsTest
    static void testFailed() {
        Test.startTest();
        OpportunityCloser opportunityCloser = new OpportunityCloser();
        Id batchId = Database.executeBatch(opportunityCloser);
        Test.stopTest();

        System.assertNotEquals(199, [SELECT COUNT() FROM Opportunity WHERE StageName = 'Closed Lost']);

    }
}