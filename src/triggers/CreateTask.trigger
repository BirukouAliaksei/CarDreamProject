/**
 * Created by Bruss on 3/2/2021.
 */

trigger CreateTask on Product2 (after insert ,after update) {
    List<Task> newTasks = new List<Task>();
    List<OpportunityLineItem> opportunities = [SELECT Id, Product2.IsActive
    FROM OpportunityLineItem WHERE Product2.Id IN :Trigger.new];
    Id recordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName()
            .get('Call').getRecordTypeId();
    for (OpportunityLineItem o : opportunities) {
        if (o.Product2.IsActive == false) {
            newTasks.add(new Task(RecordTypeId = recordTypeId,
                    Subject = 'Old model deal!!!',
                    Status = 'New',
                    Auto_Created__c = true,
                    ActivityDate = Date.today(),
                    Priority = 'High'));
        }
    }
    if (newTasks.size() > 0) {
        insert newTasks;
    }
}