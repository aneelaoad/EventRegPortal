import { LightningElement, wire } from 'lwc';
import getNavbarItems from '@salesforce/apex/RegNavbarSelector.getNavbarItems';
import registerEvent from '@salesforce/apex/EventRegistrationController.registerEvent';
import { NavigationMixin } from 'lightning/navigation';
/**
 * @file RegNavbar.js
 * @description LWC component for handling navigation bar items, including event registration.
 * @date 2024-06-28
 * @version 1.0
 * @author Aneela Meer
 */
export default class RegNavbar extends NavigationMixin(LightningElement) {
    /**
     * @description Array to hold navigation bar items fetched from Apex.
     */
    navbarItems;

    /**
     * @description Boolean to track the state of the menu (open/closed).
     */
    menuOpen = false;

    /**
     * @description Getter to determine the CSS class for the menu based on its state.
     * @returns {string} CSS class name
     */
    get menuClass() {
        return this.menuOpen ? 'menu-open' : '';
    }

    /**
     * @description Toggles the state of the menu between open and closed.
     */
    toggleMenu() {
        this.menuOpen = !this.menuOpen;
    }

    /**
     * @description Wire adapter to fetch navigation bar items from Apex.
     * @param {Object} param - Contains error and data properties from Apex call.
     */
    @wire(getNavbarItems)
    wiredData({ error, data }) {
        if (data) {
            this.navbarItems = data;
        } else if (error) {
            console.error('Error:', error);
        }
    }

    /**
     * @description Handles click events on navigation bar items.
     * @param {Event} event - The click event.
     */
    handleNavItemClick(event) {
        const itemId = event.target.dataset.id;
        if (itemId === 'Register Event') {
            this.registerEvent();
        }
    }

    /**
     * @description Calls Apex method to register an event.
     */
    registerEvent() {
      this[NavigationMixin.Navigate]({
        type: 'standard__webPage',
        attributes: {
            url: '/register-event'
        }
    });

    //     registerEvent()
    //         .then(() => {
    //             console.log('Event registered successfully');
    //             // Additional logic such as displaying a success message or redirecting the user can be added here
    //         })
    //         .catch(error => {
    //             console.error('Error registering event:', error);
    //         });
    
  
  }
}
