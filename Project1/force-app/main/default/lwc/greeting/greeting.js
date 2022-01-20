import { LightningElement } from 'lwc';

export default class Greeting extends LightningElement {
    greeting = 'Customer';
    changeHandler(event){
        this.greeting = event.target.value;
    }
}