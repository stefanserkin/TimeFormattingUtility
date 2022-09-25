public without sharing class CommonUtilities {

    public static String getFormattedTime(DateTime dtInput) {
        String strFormattedTime = dtInput.hour() > 12 ? String.valueOf( dtInput.hour() - 12 ) : String.valueOf( dtInput.hour() );
        if (dtInput.minute() > 0) {
            strFormattedTime += ':' + String.valueOf( dtInput.minute() );
        }
        strFormattedTime += dtInput.hour() >= 12 ? 'pm' : 'am';
        return strFormattedTime;
    }

    public static String getFormattedDatetime(DateTime dtInput) {
        String strFormattedDatetime = String.valueOf(dtInput.month()) + '/' + String.valueOf(dtInput.day()) + '/' + String.valueOf(dtInput.year());
        strFormattedDatetime += ' at ';
        strFormattedDatetime += dtInput.hour() > 12 ? String.valueOf( dtInput.hour() - 12 ) : String.valueOf( dtInput.hour() );
        if (dtInput.minute() > 0) {
            strFormattedDatetime += ':' + String.valueOf( dtInput.minute() );
        }
        strFormattedDatetime += dtInput.hour() >= 12 ? 'pm' : 'am';
        return strFormattedDatetime;
    }
    
}
