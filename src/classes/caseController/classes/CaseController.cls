
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
    global static void mergeNewCases(Id caseId, Id caseToMergeId) {

        Case aCase = [
                SELECT Id, Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId, Description__c
                FROM Case
                WHERE Id = :caseId
        ];

        Case clickedCase = [
                SELECT Subject, CaseNumber, Origin, SuppliedEmail__c, Status, Reason, OwnerId, Description__c
                FROM Case
                WHERE Id = :caseToMergeId
        ];

//        if (aCase != null && clickedCase != null) {
//            if (aCase.Description__c != null) {
//                aCase.Description__c = '“----//----”' + clickedCase.Description__c;
//            }
//
//            if (clickedCase.Priority == 'High' && aCase.Priority != 'High') {
//                aCase.Priority = clickedCase.Priority;
//            }if (clickedCase.Priority == 'Medium' && aCase.Priority == 'Low') {
//                aCase.Priority = clickedCase.Priority;
//            }
//
//            if ((clickedCase.AccountId != null && clickedCase.Lead__c != null)
//                    && (aCase.AccountId == null && aCase.Lead__c == null)) {
//                aCase.AccountId = clickedCase.AccountId;
//                aCase.Lead__c = clickedCase.Lead__c;
//            }
//
//            if (aCase.Country__c == null && aCase.SuppliedEmail__c == null) {
//                aCase.Country__c = clickedCase.Country__c;
//                aCase.SuppliedEmail__c = clickedCase.SuppliedEmail__c;
//            }
//
//            update aCase;
//
//
//            System.debug(aCase);
//            System.debug(clickedCase);
//        }
        delete clickedCase;

//        return aCase;
    }
    

}