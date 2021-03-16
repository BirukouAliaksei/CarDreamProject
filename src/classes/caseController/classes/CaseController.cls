/**
 * Created by Bruss on 3/2/2021.
 */

global with sharing class CaseController {

    @AuraEnabled
    global static List<Case> getCases(Id caseId) {
        List<Case> duplicateCases = new List<Case>();

        List<Case> casesList = [
                SELECT Id, Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Status != 'Closed (Resolved)' AND Status != 'Closed'
        ];

        Case aCase = [
                SELECT Id, Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Id = :caseId
        ];

        if (aCase != null) {
            for (Integer i = 0; i < casesList.size(); i++) {
                if (aCase.Reason == casesList.get(i).Reason
                        && aCase.Subject == casesList.get(i).Subject
                        && aCase.SuppliedEmail__c == casesList.get(i).SuppliedEmail__c
                        && aCase != casesList.get(i)) {
                    duplicateCases.add(casesList.get(i));
                }
            }
        }
        CustomNotificationFromApex.sentNotification(caseId, aCase.CaseNumber);
        return duplicateCases;
    }

    @AuraEnabled
    global static void mergeNewCases(Id caseId) {
        for (Case c : getCaseById(caseId)) {
            if (c.Status == 'New') {
                Database.merge(c, getCaseById(caseId));
            }
        }
    }

    @AuraEnabled
    global static List<Case> getCaseById(Id caseId) {
        List<Case> duplicateCases = new List<Case>();
        List<Case> casesList = [
                SELECT Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Status != 'Closed (Resolved)' AND Status != 'Closed'
        ];

        Case clickedCase = [
                SELECT Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId
                FROM Case
                WHERE Id = :caseId
        ];

        for (Integer i = 0; i < casesList.size(); i++) {
            if (clickedCase.SuppliedEmail == casesList.get(i).SuppliedEmail
                    && clickedCase.Reason == casesList.get(i).Reason
                    && clickedCase.Subject == casesList.get(i).Subject) {
                duplicateCases.add(casesList.get(i));
            } else {
                duplicateCases.add(clickedCase);
            }
        }
        return duplicateCases;
    }


}