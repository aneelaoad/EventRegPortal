/**
 * @file EventRegistrationController.cls
 * @description Apex controller for handling event registration.
 * @date 2024-06-28
 * @version 1.0
 * @developer Aneela
 */
public with sharing class EventRegistrationController {

//     /**
//      * @description Registers a new Event__c record.
//      * @param eventData Map of event field values.
//      * @throws AuraHandledException If an error occurs during the event registration.
//      */

    @AuraEnabled
    public static void registerEvent(String eventData) {
        // System.debug('eventData: ' + eventData);
    
        if (String.isBlank(eventData)) {
            throw new AuraHandledException('Error registering event: Invalid JSON format');
        }
    
        try {
            // Deserialize the JSON string into a DenormalizedEvent object
            DenormalizedEvent denormalizedEvent = (DenormalizedEvent) JSON.deserialize(eventData, DenormalizedEvent.class);
            System.debug('denormalizedEvent: ' + denormalizedEvent);
    
            // Validate that the required fields are present and not empty
            if (String.isBlank(denormalizedEvent.eventTitle) || 
                denormalizedEvent.eventStartDateTime == null || 
                denormalizedEvent.eventEndDateTime == null) {
                throw new AuraHandledException('Error registering event: Required fields missing or invalid');
            }
    
            // Create a new Event__c record and populate fields
            Event__c newEvent = new Event__c();
            newEvent.Name = denormalizedEvent.eventTitle;
            newEvent.Event_Title__c = denormalizedEvent.eventTitle;
            newEvent.Event_Start_Date_and_Time__c = denormalizedEvent.eventStartDateTime;
            newEvent.Event_End_Date_and_Time__c = denormalizedEvent.eventEndDateTime;
            newEvent.Event_Charges__c = denormalizedEvent.eventCharges;
            newEvent.Event_Description__c = denormalizedEvent.eventDescription;
            newEvent.Banner_Image__c = denormalizedEvent.companyLogo;
    
            // Insert the new Event__c record
            insert newEvent;
        } catch (Exception e) {
            throw new AuraHandledException('Error registering event: ' + e.getMessage());
        }
    }
    
}