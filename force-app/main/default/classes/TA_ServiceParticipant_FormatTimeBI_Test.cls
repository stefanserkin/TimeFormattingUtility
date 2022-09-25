@isTest
private class TA_ServiceParticipant_FormatTimeBI_Test {

    @isTest
    static void testFormatTime() {

        pmdm__Program__c program = TestDataFactory.createCommunityPrograms(1).get(0);
        insert program;

        pmdm__Service__c service = TestDataFactory.createServices(program, 1).get(0);
        insert service;

        pmdm__ServiceSchedule__c serviceSchedule = TestDataFactory.createServiceSchedules(service, 1).get(0);
        insert serviceSchedule;

        List<Contact> lstContacts = TestDataFactory.createContacts(1);
        insert lstContacts;

        pmdm__ServiceParticipant__c participant = TestDataFactory.createServiceParticipants(serviceSchedule, lstContacts).get(0);

        Test.startTest();
        insert participant;
        Test.stopTest();

        pmdm__ServiceSchedule__c scheduleRefreshed = [SELECT Id, pmdm__FirstSessionStart__c FROM pmdm__ServiceSchedule__c WHERE Id = :serviceSchedule.Id LIMIT 1];
        pmdm__ServiceParticipant__c participantRefreshed = [SELECT Id, Formatted_Start_Time__c FROM pmdm__ServiceParticipant__c WHERE Id = :participant.Id LIMIT 1];

        String expectedResult = CommonUtilities.getFormattedTime(scheduleRefreshed.pmdm__FirstSessionStart__c);

        System.assertEquals(
            expectedResult, 
            participantRefreshed.Formatted_Start_Time__c, 
            'Unexpected formatted time value for participant'
        );

    }
    
}
