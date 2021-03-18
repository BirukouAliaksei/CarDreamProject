/**
 * Created by Bruss on 3/18/2021.
 */

public with sharing class TaskCreate {

    public static void create(List<Product2> product2s) {
        List<Task> newTasks = new List<Task>();
        Id recordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName()
                .get('Call').getRecordTypeId();

        for (Product2 o : product2s) {
            if (!o.IsActive) {
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
}