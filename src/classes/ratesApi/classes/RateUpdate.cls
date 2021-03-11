/**
 * Created by Bruss on 3/10/2021.
 */

public with sharing class RateUpdate implements Database.Batchable<sObject> {

    public void execute(Database.BatchableContext bc, List<Rate__c> rates) {
        List<Rate__c> ratesToUpdate = Rate.getListRate();
        for (Rate__c rate : rates) {
            ratesToUpdate.add(rate);
        }
        update ratesToUpdate;
    }

    public Iterable<sObject> start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Cur_ID__c, Cur_Abbreviation__c, ' +
                'Cur_Scale__c, Cur_Name__c, Cur_OfficialRate__c\n' +
                'FROM Rate__c');
    }

    public void finish(Database.BatchableContext bc) {
    }
}