/**
 * Created by Bruss on 3/2/2021.
 */

global with sharing class CaseController {
    @AuraEnabled
    global static List<Case> getCases() {

        List<Case> casesList = [SELECT Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId FROM Case LIMIT 10];
        List<Case> duplicateCases = new List<Case>();

        for (Integer i = 0; i < casesList.size(); i++) {
            Case aCase = casesList.get(i);
            if (aCase == null) continue;
            for (Integer j = 0; j < casesList.size(); j++) {
                if (aCase.CaseNumber == aCase.CaseNumber && aCase.Reason == aCase.Reason
                        && aCase.Subject == aCase.Subject ) {
                    duplicateCases.add(aCase);
                }
            }
        }
        return duplicateCases;
    }
}