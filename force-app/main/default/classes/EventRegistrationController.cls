/**
 * @file EventRegistrationController.cls
 * @description Apex controller for handling event registration.
 * @date 2024-06-28
 * @version 1.0
 * @developer Aneela
 */
public with sharing class EventRegistrationController {

    /**
     * @description Registers a new Event__c record.
     * @param eventData Map of event field values.
     * @throws AuraHandledException If an error occurs during the event registration.
     */

     @AuraEnabled
     public static void registerEvent(Map<String, Object> eventData) {

        System.debug('eventData ' +eventData);
        System.debug('title ' +(String) eventData.get('eventTitle'));
         try {
             Event__c newEvent = new Event__c();
             newEvent.Name = (String) eventData.get('eventTitle');
             newEvent.Event_Start_Date_and_Time__c = (Datetime) eventData.get('eventStartDateTime');
             newEvent.Event_End_Date_and_Time__c = (Datetime) eventData.get('eventEndDateTime');
             newEvent.Banner_Image__c = (String) eventData.get('bannerImage');
             newEvent.Event_Title__c = (String) eventData.get('eventTitle');
            //  newEvent.Event_Organizer__c = (String) eventData.get('Event_Organizer__c');
            //  newEvent.Event_Organizer_Company__c = (String) eventData.get('Event_Organizer_Company__c');
            //  newEvent.Event_Address__Street__s = (String) eventData.get('Event_Address__Street__s');
            //  newEvent.Event_Address__City__s = (String) eventData.get('Event_Address__City__s');
            //  newEvent.Event_Address__StateCode__s = (String) eventData.get('Event_Address__StateCode__s');
            //  newEvent.Event_Address__PostalCode__s = (String) eventData.get('Event_Address__PostalCode__s');
            //  newEvent.Event_Address__CountryCode__s = (String) eventData.get('Event_Address__CountryCode__s');
             //  newEvent.Event_Type__c = (String) eventData.get('Event_Type__c');
             //  newEvent.Event_Charges__c = (Decimal) eventData.get('Event_Charges__c');
             //  newEvent.Event_Description__c = (String) eventData.get('Event_Description__c');
             
             insert newEvent;
         } catch (Exception e) {
             throw new AuraHandledException('Error registering event: ' + e.getMessage());
         }
     }
    // @AuraEnabled
    // public static void registerEvent(String eventData) {
    //     System.debug('eventData: ' + eventData);
    
    //     if (String.isBlank(eventData)) {
    //         throw new AuraHandledException('Error registering event: Invalid JSON format');
    //     }
    
    //     try {
    //         // Deserialize the JSON string into a DenormalizedEvent object
    //         DenormalizedEvent denormalizedEvent = (DenormalizedEvent) JSON.deserialize(eventData, DenormalizedEvent.class);
    //         System.debug('denormalizedEvent: ' + denormalizedEvent);
    
    //         // Validate that the required fields are present and not empty
    //         if (String.isBlank(denormalizedEvent.eventTitle) || 
    //             denormalizedEvent.eventStartDateTime == null || 
    //             denormalizedEvent.eventEndDateTime == null) {
    //             throw new AuraHandledException('Error registering event: Required fields missing or invalid');
    //         }
    
    //         // Create a new Event__c record and populate fields
    //         Event__c newEvent = new Event__c();
    //         newEvent.Name = denormalizedEvent.eventTitle;
    //         newEvent.Event_Title__c = denormalizedEvent.eventTitle;
    //         // newEvent.Event_Start_Date_and_Time__c = denormalizedEvent.eventStartDateTime;
    //         // newEvent.Event_End_Date_and_Time__c = denormalizedEvent.eventEndDateTime;
    //         // newEvent.Event_Charges__c = denormalizedEvent.eventCharges;
    //         // newEvent.Event_Description__c = denormalizedEvent.eventDescription;
    //         // newEvent.Banner_Image__c = denormalizedEvent.companyLogo;
    
    //         // Insert the new Event__c record
    //         insert newEvent;
    //     } catch (Exception e) {
    //         throw new AuraHandledException('Error registering event: ' + e.getMessage());
    //     }
    // }
    
}
