
public with sharing class OpportunityTimer implements Schedulable {

    public void execute(SchedulableContext context) {
        OpportunityCloser opportunityCloser = new OpportunityCloser();
        String jobID = Database.executeBatch(opportunityCloser);
    }

    public static String scheduleMe() {
        OpportunityTimer opportunityTimer = new OpportunityTimer();
        String starter = '0 0 23 * * ?';
        return System.schedule('Start job', starter, opportunityTimer);
    }
}