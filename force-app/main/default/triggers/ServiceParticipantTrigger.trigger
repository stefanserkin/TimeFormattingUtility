trigger ServiceParticipantTrigger on pmdm__ServiceParticipant__c (
    before insert, after insert, 
    before update, after update, 
    before delete, after delete, 
    after undelete
) {
    new MetadataTriggerHandler().run();
}