/**
 * Created by Bruss on 3/2/2021.
 */

global with sharing class CaseController {
    @AuraEnabled
    global static List<Case> getCases() {
        List<Case> casesList = [
                SELECT Id, Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Status != 'Closed (Resolved)' AND Status != 'Closed'
        ];
        List<Case> duplicateCases = new List<Case>();

        for (Integer i = 0; i < casesList.size(); i++) {
            Case aCase = casesList.get(i);
            if (aCase == null) continue;
            for (Integer j = 0; j < casesList.size(); j++) {
                if (aCase.CaseNumber == casesList.get(j).CaseNumber
                        && aCase.Reason == casesList.get(j).Reason
                        && aCase.Subject == casesList.get(j).Subject) {
                    duplicateCases.add(aCase);
                }
            }
        }
        return duplicateCases;
    }

    @AuraEnabled
    global static List<Case> mergeNewCases(Id caseId) {
        for (Case c : getCaseById(caseId)) {
            if (c.Status == 'New') {
                Database.merge(c, getCaseById(caseId));
            }
        }return getCaseById(caseId);
    }

    @AuraEnabled
    global static List<Case> getCaseById(Id caseId) {
        List<Case> duplicateCases = new List<Case>();
        List<Case> casesList = [
                SELECT Id, Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Status != 'Closed (Resolved)' AND Status != 'Closed'
        ];

        Case clickedCase = [
                SELECT Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Id = :caseId
        ];

        for (Integer i = 0; i < casesList.size(); i++) {
            if (clickedCase.CaseNumber == casesList.get(i).CaseNumber
                    && clickedCase.Reason == casesList.get(i).Reason
                    && clickedCase.Subject == casesList.get(i).Subject) {
                duplicateCases.add(clickedCase);
            }
        }
        return duplicateCases;
    }
}