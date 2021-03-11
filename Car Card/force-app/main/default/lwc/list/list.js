import { LightningElement, wire } from 'lwc';
// import { products } from 'c/selector';
import findProducts from '@salesforce/apex/ProductController.findProducts';
// export const products = products;

export default class List extends LightningElement {
    searchKey = '';
    products;

    @wire(findProducts, { searchKey: '$searchKey' })
    products;

    handleKeyChange(event) {
        console.log();
        this.searchKey = event.target.value;
    }

    handleTileClick(evt) {
        console.log();
        // This component wants to emit a productselected event to its parent
        const event = new CustomEvent('productselected', {
            detail: evt.detail
        });
        console.log();
        // Fire the event from c-list
        this.dispatchEvent(event);
    }

}
