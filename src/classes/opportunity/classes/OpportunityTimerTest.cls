
@IsTest
public with sharing class OpportunityTimerTest {

    public static String CRON_EXP = '0 0 23 0 0 ?';

    @IsTest
    static void testScheduleJob() {
        Test.startTest();
        String jobID = System.schedule('Start job', CRON_EXP, new OpportunityTimer());
        Test.stopTest();
    }

}