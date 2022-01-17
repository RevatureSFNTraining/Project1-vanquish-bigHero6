import { LightningElement, wire } from 'lwc';
import getProductList from '@salesforce/apex/SearchController.getProductList';

export default class DisplayProducts extends LightningElement {
    error;

    @wire(getProductList)
    products;


    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
    }
}