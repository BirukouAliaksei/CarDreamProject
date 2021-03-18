
@IsTest
public with sharing class OpportunityTimerTest {

    public static String CRON_EXP = '0 0 0 15 4 ? 2021';

    @IsTest
    static void testScheduleJob() {
        Test.startTest();
        OpportunityTimer opportunityTimer = new OpportunityTimer();
        String jobID = System.schedule('Start test job', CRON_EXP, opportunityTimer);
        CronTrigger cronTrigger = [SELECT Id,CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id =: jobID];
        opportunityTimer.execute(null);
        System.assertEquals('2021-04-15 00:00:00', String.valueOf(cronTrigger.NextFireTime));
        System.assertEquals(CRON_EXP, cronTrigger.CronExpression);
        System.assertEquals(0, cronTrigger.TimesTriggered);
        Test.stopTest();
    }

}