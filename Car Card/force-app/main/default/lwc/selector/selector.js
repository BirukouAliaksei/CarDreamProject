import { LightningElement, wire } from 'lwc';
import findProducts from '@salesforce/apex/ProductController.findProducts';

export default class Selector extends LightningElement {

    searchKey = '';
    products;

    @wire(findProducts, { searchKey: '$searchKey' })
    products;

    handleKeyChange(event) {
        console.log();
        this.searchKey = event.target.value;
    }

    selectedProductId;

    handleProductSelected(evt) {
        console.log();
        this.selectedProductId = evt.detail;
    }
}
