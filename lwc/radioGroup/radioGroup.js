import { LightningElement } from 'lwc';
export default class MyComponentName extends LightningElement {
    options = [
        { label: 'Sambal', value: 'sambal' },
        { label: 'English', value: 'english' },
        { label: 'Filipino', value: 'filipino' },
    ];

    // Select option1 by default
    value = 'sambal';  // default value

    handleChange(event) {
        this.value = event.detail.value;
    }
}