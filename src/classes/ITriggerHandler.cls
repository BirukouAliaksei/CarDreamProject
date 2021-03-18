/**
 * Created by Bruss on 3/18/2021.
 */

public interface ITriggerHandler {

    void afterInsert(List<sObject> newList);

    void afterUpdate(List<sObject> newList);

}