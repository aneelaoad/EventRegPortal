import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import registerEvent from '@salesforce/apex/EventRegistrationController.registerEvent';

/**
 * @file regEventRegister.js
 * @description LWC component for registering an event.
 * @date 2024-06-28
 * @version 1.0
 * @developer Aneela
 */
export default class RegEventRegister extends LightningElement {
   eventTitle = '';
   eventOrganizer = '';
   eventOrganizerCompany = '';
   eventStartDateTime = '';
   eventEndDateTime = '';
   eventType = '';
   eventCharges = '';
   eventDescription = '';
   bannerImage = '';
   eventStreet = '';
   eventCity = '';
   eventState = '';
   eventPostalCode = '';
   eventCountry = '';

    handleInputChange(event) {
        const field = event.currentTarget.dataset.id;
        this[field] = event.currentTarget.value;
   
        console.log('field: ', field);
        console.log('value: ', event.currentTarget.value);
    }

    handleSubmit() {
        const eventData = {
            eventTitle: this.eventTitle,
            eventOrganizer: this.eventOrganizer,
            eventOrganizerCompany: this.eventOrganizerCompany,
            eventStartDateTime: this.eventStartDateTime,
            eventEndDateTime: this.eventEndDateTime,
            eventType: this.eventType,
            eventCharges: this.eventCharges,
            eventDescription: this.eventDescription,
            bannerImage: this.bannerImage,
            eventStreet: this.eventStreet,
            eventCity: this.eventCity,
            eventState: this.eventState,
            eventPostalCode: this.eventPostalCode,
            eventCountry: this.eventCountry,
        };
        console.log('eventData: ', JSON.stringify(eventData));

        registerEvent({ eventData: eventData })
        // registerEvent({ eventData: JSON.stringify(eventData) })
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Event registered successfully',
                        variant: 'success',
                    })
                );
                this.resetForm();
            })
            .catch(error => {
                console.log(error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error registering event',
                        message: error.body.message,
                        variant: 'error',
                    })
                );
            });
    }

    resetForm() {
        this.eventTitle = '';
        this.eventOrganizer = '';
        this.eventOrganizerCompany = '';
        this.eventStartDateTime = '';
        this.eventEndDateTime = '';
        this.eventType = '';
        this.eventCharges = '';
        this.eventDescription = '';
        this.bannerImage = '';
        this.eventStreet = '';
        this.eventCity = '';
        this.eventState = '';
        this.eventPostalCode = '';
        this.eventCountry = '';
    }
}
