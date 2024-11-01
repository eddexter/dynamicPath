import { LightningElement, api, wire, track } from 'lwc';
import getValue from '@salesforce/apex/DynamicPathController.getValueFieldByObjectId';

export default class DynamicPath extends LightningElement {
    @api recordId;
    @api stages;
    @api fieldname;
    @api typename;

    @track resultvalue;
    @track error;
    @track stageList;

    @wire(getValue, { idObj: '$recordId', field: '$fieldname' })
    fieldValue({ error, data }) {
        if (data) {
            console.log(data);
            console.log(data.fieldValue);
            this.resultvalue = data.fieldValue;
            this.stageList = this.stages.split(',');
        } else if (error) {
            console.log(error);
            this.error = error;
        }
    }
}