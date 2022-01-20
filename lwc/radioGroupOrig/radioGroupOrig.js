import {LightningElement, track} from 'lwc';
export default class RadioButtonGroup extends LightningElement{
   radioName;
    
    handleButtonChoice(event){
        this.radioName = event.target.value;        
    }

}