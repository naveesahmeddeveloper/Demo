import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/LWCDempCmp.getAccounts';
export default class LWCDemoCmp extends LightningElement {
    accounts;
    totalaccounts = 0;
    error;
    showallaccounts;
    accountselected = false;
    selectedaccountid;
    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.totalaccounts = this.accounts.length;
            this.error = undefined;
            this.showallaccounts = true;
        } else if (error) {
            this.error = error;
            this.accounts = undefined;
            this.showallaccounts = false;
        }
    }
    handleClick(event) {
        this.selectedaccountid = event.currentTarget.dataset.id
        this.accountselected = true;
        this.showallaccounts = false;
    }
    handleBackClick(event) {
        this.accountselected = false;
        this.showallaccounts = true;
    }
}