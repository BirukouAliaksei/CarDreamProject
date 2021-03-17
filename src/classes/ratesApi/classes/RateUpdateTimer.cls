/**
 * Created by Bruss on 3/10/2021.
 */

public with sharing class RateUpdateTimer implements Schedulable {

    public void execute(SchedulableContext context) {
        RateUpdate rateUpdate = new RateUpdate();
        String jobID = Database.executeBatch(rateUpdate);
    }

    public static String scheduleMe() {
        RateUpdateTimer rateUpdateTimer = new RateUpdateTimer();
        String starter = '0 0 0 1 * ?';
        return System.schedule('Update rates', starter, rateUpdateTimer);
    }
}