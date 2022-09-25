public with sharing class FlowTimeFormattingUtility {

    @InvocableMethod(
        label='Get Formatted Time' 
        category='Utilities' 
        description='Provide a date/time value and receive a formatted time value per the AG style guide')
    public static List<Result> getFormattedTime(
        List<Request> lstRequests
    ) {
        Datetime dtInput = lstRequests.get(0).dtInput;
        String strFormattedTime = dtInput.hour() > 12 ? String.valueOf( dtInput.hour() - 12 ) : String.valueOf( dtInput.hour() );
        if (dtInput.minute() > 0) {
            strFormattedTime += ':' + String.valueOf( dtInput.minute() );
        }
        strFormattedTime += dtInput.hour() >= 12 ? 'pm' : 'am';
        
        Result result = new Result();
        result.strFormattedTime = strFormattedTime;
        return new List<Result>{ result };
    }

    public class Request {
        @InvocableVariable(required=true label='Date/Time Input')
        public Datetime dtInput;
    }

    public class Result {
        @InvocableVariable(label='Formatted Time')
        public String strFormattedTime;
    }
    
}
