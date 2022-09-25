public with sharing class TA_ServiceParticipant_FormatTimeBI implements TriggerAction.BeforeInsert {

    public void beforeInsert(List<pmdm__ServiceParticipant__c> newList) {
        for (pmdm__ServiceParticipant__c part : newList) {
            part.Formatted_Start_Time__c = CommonUtilities.getFormattedTime(part.First_Session_Start__c);
        }
    }
    
}
