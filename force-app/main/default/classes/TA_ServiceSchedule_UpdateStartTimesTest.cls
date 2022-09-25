@isTest
private class TA_ServiceSchedule_UpdateStartTimesTest {

    @testSetup
    static void makeData() {

        pmdm__Program__c program = TestDataFactory.createCommunityPrograms(1).get(0);
        insert program;

        pmdm__Service__c service = TestDataFactory.createServices(program, 1).get(0);
        insert service;

        pmdm__ServiceSchedule__c serviceSchedule = TestDataFactory.createServiceSchedules(service, 1).get(0);
        insert serviceSchedule;

        List<Contact> lstContacts = TestDataFactory.createContacts(5);
        insert lstContacts;

        List<pmdm__ServiceParticipant__c> lstParticipants = TestDataFactory.createServiceParticipants(serviceSchedule, lstContacts);
        insert lstParticipants;

    }

    @isTest
    static void testUpdateParticipantStartTimes() {

        pmdm__ServiceSchedule__c schedule = [SELECT Id, pmdm__FirstSessionStart__c FROM pmdm__ServiceSchedule__c LIMIT 1];
        schedule.pmdm__FirstSessionStart__c = Datetime.newInstance(
            schedule.pmdm__FirstSessionStart__c.year(), 
            schedule.pmdm__FirstSessionStart__c.month(), 
            schedule.pmdm__FirstSessionStart__c.day(), 
            4, 
            44, 
            0
        );

        Test.startTest();
        update schedule;
        Test.stopTest();

        List<pmdm__ServiceParticipant__c> lstParticipants = [
            SELECT Id, Formatted_Start_Time__c FROM pmdm__ServiceParticipant__c WHERE pmdm__ServiceSchedule__c = :schedule.Id
        ];

        String expectedResult = '4:44am';

        System.assertEquals(
            expectedResult, 
            lstParticipants[0].Formatted_Start_Time__c, 
            'Did not receive expected formatted start time'
        );

    }

    @isTest
    static void testUpdateParticipantStartTimesOnTheHour() {

        pmdm__ServiceSchedule__c schedule = [SELECT Id, pmdm__FirstSessionStart__c FROM pmdm__ServiceSchedule__c LIMIT 1];
        schedule.pmdm__FirstSessionStart__c = Datetime.newInstance(
            schedule.pmdm__FirstSessionStart__c.year(), 
            schedule.pmdm__FirstSessionStart__c.month(), 
            schedule.pmdm__FirstSessionStart__c.day(), 
            4, 
            0, 
            0
        );

        Test.startTest();
        update schedule;
        Test.stopTest();

        List<pmdm__ServiceParticipant__c> lstParticipants = [
            SELECT Id, Formatted_Start_Time__c FROM pmdm__ServiceParticipant__c WHERE pmdm__ServiceSchedule__c = :schedule.Id
        ];

        String expectedResult = '4am';

        System.assertEquals(
            expectedResult, 
            lstParticipants[0].Formatted_Start_Time__c, 
            'Did not receive expected formatted start time'
        );

    }
    
}
