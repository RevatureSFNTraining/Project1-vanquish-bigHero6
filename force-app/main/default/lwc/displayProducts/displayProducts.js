import { LightningElement, wire,track } from 'lwc';
import getProductList from '@salesforce/apex/SearchController.getProductList';

export default class DisplayProducts extends LightningElement {
    error;
    @track clickedButtonLabel = 'Purchase a Product';
    @track boolVisible = false; 
    @wire(getProductList)
    products;

/*
    handleClick(event) {
        const label = event.target.label;  
  
        if ( label === 'Purchase a Product' ) {  
  
            this.clickedButtonLabel = 'Hide';  
            this.boolVisible = true;  
  
        } else if  ( label === 'Hide' ) {  
              
            this.clickedButtonLabel = 'Purchase a Product';  
            this.boolVisible = false;  
  
        }  

    }
    */
}