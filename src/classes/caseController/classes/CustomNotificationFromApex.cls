/**
 * Created by Bruss on 3/15/2021.
 */

global with sharing class CustomNotificationFromApex {

    @AuraEnabled
    global static void sentNotification(String targetId, String objectNumber) {

        CustomNotificationType notificationType = [
                SELECT Id, DeveloperName
                FROM CustomNotificationType
                WHERE DeveloperName = 'MyCustomNotification'
        ];
        Messaging.CustomNotification notification = new Messaging.CustomNotification();
        notification.setTitle('Warning');
        notification.setBody('Case number ' + objectNumber +' was closed');
        notification.setSenderId(UserInfo.getUserId());
        notification.setNotificationTypeId(notificationType.Id);
        notification.setTargetId(targetId);
        try {
            notification.send(new Set<String> {UserInfo.getUserId()});
        } catch (Exception e) {
            System.debug('Problem sending notification: ' + e.getMessage());
        }

    }

}