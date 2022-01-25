import { api, LightningElement } from 'lwc';


export default class AccountTest extends LightningElement {

    //fields = [LastName];
    //nameField = Department;
    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api objectApiName;
}