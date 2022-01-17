import { LightningElement } from 'lwc';

export default class FaqPage extends LightningElement {
    activeSectionMessage = '';

    handleToggleSection(event) {
        this.activeSectionMessage =
            'Open section name:  ' + event.detail.openSections;
    }

}
