/*****************************************************
 * Utilities for the Rental_Rate__c sObject
 ******************************************************/

public with sharing class RentalRateUtilities {

    // Static variables
    @TestVisible
    private static final String TIME_FORMAT = 'h:mm a';

    private static Map<String, Schema.RecordTypeInfo> mapRecordTypeInfoByDeveloperName;

    public static final String INCREMENTAL_RECORD_TYPE_NAME = 'Incremental_Rate';
    public static final String STANDARD_RECORD_TYPE_NAME = 'Standard_Rate';

    /*****************************************************
     * Get the preferred format for Time values when output as a String
     * @param Time: Time value to convert
     ******************************************************/

    public static String getFormattedTime(
        Time input
    ) {
        String formattedTime = '';
        Datetime dt = Datetime.newInstance(Date.today(), input);
        formattedTime = dt.format(TIME_FORMAT);
        return formattedTime;
    }

    /*****************************************************
     * Get the record type id from record type developer name
     * @param String: Record type developer name
     ******************************************************/

    public static Id getRecordTypeIdByDeveloperName(
        String recordTypeDeveloperName
    ) {
        if (mapRecordTypeInfoByDeveloperName == null) {
            mapRecordTypeInfoByDeveloperName = Schema.SObjectType.Rental_Rate__c.getRecordTypeInfosByDeveloperName();
        }
        return mapRecordTypeInfoByDeveloperName.get(recordTypeDeveloperName).getRecordTypeId();
    }

}