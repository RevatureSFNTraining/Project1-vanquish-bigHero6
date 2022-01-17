import { api,LightningElement } from 'lwc';

export default class LoginAlert extends LightningElement {

    @api buttonText;

    handleclick(){
        alert("Hello");
    }
}