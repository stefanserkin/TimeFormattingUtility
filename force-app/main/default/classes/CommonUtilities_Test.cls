@isTest
private class CommonUtilities_Test {
    
    @isTest
    static void testGetFormattedTime() {
        Datetime dtInput = Datetime.newInstance(2022, 1, 1, 10, 0, 0);
        String expectedResult = '10am';
        String strFormattedTime = CommonUtilities.getFormattedTime(dtInput);
        System.assertEquals(
            expectedResult, 
            strFormattedTime, 
            'Returned string did not match expected formatted time'
        );
    }

    @isTest
    static void testGetFormattedTimeWithMinutes() {
        Datetime dtInput = Datetime.newInstance(2022, 1, 1, 10, 30, 0);
        String expectedResult = '10:30am';
        String strFormattedTime = CommonUtilities.getFormattedTime(dtInput);
        System.assertEquals(
            expectedResult, 
            strFormattedTime, 
            'Returned string did not match expected formatted time'
        );
    }

    @isTest
    static void testGetFormattedTimeInAfternoon() {
        Datetime dtInput = Datetime.newInstance(2022, 1, 1, 20, 30, 0);
        String expectedResult = '8:30pm';
        String strFormattedTime = CommonUtilities.getFormattedTime(dtInput);
        System.assertEquals(
            expectedResult, 
            strFormattedTime, 
            'Returned string did not match expected formatted time'
        );
    }

    @isTest
    static void testGetFormattedDatetime() {
        Datetime dtInput = Datetime.newInstance(2022, 1, 1, 10, 0, 0);
        String expectedResult = '1/1/2022 at 10am';
        String strFormattedTime = CommonUtilities.getFormattedDatetime(dtInput);
        System.assertEquals(
            expectedResult, 
            strFormattedTime, 
            'Returned string did not match expected formatted time'
        );
    }

    @isTest
    static void testGetFormattedDatetimeWithMinutes() {
        Datetime dtInput = Datetime.newInstance(2022, 1, 1, 10, 30, 0);
        String expectedResult = '1/1/2022 at 10:30am';
        String strFormattedTime = CommonUtilities.getFormattedDatetime(dtInput);
        System.assertEquals(
            expectedResult, 
            strFormattedTime, 
            'Returned string did not match expected formatted time'
        );
    }

    @isTest
    static void testGetFormattedDatetimeInAfternoon() {
        Datetime dtInput = Datetime.newInstance(2022, 1, 1, 20, 30, 0);
        String expectedResult = '1/1/2022 at 8:30pm';
        String strFormattedTime = CommonUtilities.getFormattedDatetime(dtInput);
        System.assertEquals(
            expectedResult, 
            strFormattedTime, 
            'Returned string did not match expected formatted time'
        );
    }

}
