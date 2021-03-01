
public with sharing class OpportunityCloser implements Database.Batchable<sObject>, Database.Stateful {

    public Integer recordsProcessed = 0;

    public void execute(Database.BatchableContext bc, List<Opportunity> opportunities) {

        List<Opportunity> closeOpportunities = new List<Opportunity>();
        for (Opportunity o : opportunities) {
            o.StageName = 'Closed Lost';
            if (o.CloseDate != Date.today()) {
                o.CloseDate = Date.today();
            }
            closeOpportunities.add(o);
            recordsProcessed = +1;
        }
        update closeOpportunities;
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select id, CloseDate, StageName from Opportunity\n' +
                'WHERE CloseDate = THIS_MONTH AND (StageName = \'Closed Won\' OR StageName = \'Closed Lost\')');
    }

    public void finish(Database.BatchableContext param1) {
        System.debug(recordsProcessed + 'record processed');
    }
}