/**
 * Created by Bruss on 3/11/2021.
 */
@IsTest
public with sharing class CrateTaskTriggerTest {
    @IsTest static void TestCreateTaskWithOneProduct2(){

        Id recordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName()
                .get('Call').getRecordTypeId();
        List<Task> task = new List<Task>();
        task.add(new Task(RecordTypeId = recordTypeId, Status = 'New'));

        Product2 product2 = new Product2(Name='Test Product', IsActive=true);
        insert  product2;

        product2.IsActive = false;
        update product2;

        Test.startTest();
        insert task;
        Test.stopTest();
    }

}