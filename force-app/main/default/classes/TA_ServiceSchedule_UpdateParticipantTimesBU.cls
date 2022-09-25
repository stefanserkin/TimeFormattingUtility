public with sharing class TA_ServiceSchedule_UpdateParticipantTimesBU implements TriggerAction.BeforeUpdate {

    public void beforeUpdate(
        List<pmdm__ServiceSchedule__c> newList, 
        List<pmdm__ServiceSchedule__c> oldList
    ) {
        Map<Id, pmdm__ServiceSchedule__c> mapSchedulesToUpdate = new Map<Id, pmdm__ServiceSchedule__c>();
        for (pmdm__ServiceSchedule__c sched : newList) {
            if (sched.pmdm__FirstSessionStart__c != Trigger.oldMap.get(sched.Id).pmdm__FirstSessionStart__c) {
                mapSchedulesToUpdate.put(sched.Id, sched);
            }
        }
        if (!mapSchedulesToUpdate.isEmpty()) {
            updateParticipantStartTimes(
                getSchedulesWithParticipants( mapSchedulesToUpdate.keySet() )
            );
        }
    }

    private static List<pmdm__ServiceSchedule__c> getSchedulesWithParticipants(
        Set<Id> setScheduleIds
    ) {
        return [
            SELECT Id, pmdm__FirstSessionStart__c,
                   (SELECT Id, Formatted_Start_Time__c FROM pmdm__ServiceParticipants__r)
              FROM pmdm__ServiceSchedule__c
             WHERE Id IN :setScheduleIds
             LIMIT 10000
        ];
    }

    private static void updateParticipantStartTimes(
        List<pmdm__ServiceSchedule__c> lstSchedulesWithParticipants
    ) {
        for (pmdm__ServiceSchedule__c sched : lstSchedulesWithParticipants) {
            for (pmdm__ServiceParticipant__c part : sched.pmdm__ServiceParticipants__r) {
                part.Formatted_Start_Time__c = CommonUtilities.getFormattedTime(sched.pmdm__FirstSessionStart__c);
            }
        }
    }
    
}
