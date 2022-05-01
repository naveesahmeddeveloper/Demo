import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
export default class Accountdetail extends LightningElement {
    @api accountid;
    account;
    error;
    dataloaded;
    @api isloading;
    @wire(getRecord, {
        recordId: '$accountid',
        fields: ['Account.Id','Account.Name','Account.Industry','Account.Type','Account.Owner.Name','Account.Owner.SmallPhotoUrl']
    })wireaccount({ error, data }){
        if (data) {
            this.account = data;
            this.error = undefined;
            this.dataloaded = true;
            this.isloading = false;
        } else if (error) {
            this.error = error;
            this.account = undefined;
            this.dataloaded = false;
        }
    }   
}