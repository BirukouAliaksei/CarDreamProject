
trigger CreateTask on Product2 (after insert, after update) {
    if (Trigger.isUpdate && Trigger.isAfter) {
        TaskCreate.create(Trigger.new);
    }
}