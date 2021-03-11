import { LightningElement, api, wire } from 'lwc';
// import { bikes } from 'c/data';
import findProducts from '@salesforce/apex/ProductController.findProducts';

export default class Detail extends LightningElement {
    products;

    @wire(findProducts, { searchKey: '$searchKey' })
    products;

    handleKeyChange(event) {
        console.log();
        this.searchKey = event.target.value;
    }

    // Ensure changes are reactive when product is updated
    product;

    // Private var to track @api productId
    _productId = undefined;

    // Use set and get to process the value every time it's
    // requested while switching between products
    // set productId(value) {
    //     this._productId = value;
    //     this.product = products.find(product => this.products.Id === value);
    // }
    
    // getter for productId
    @api get productId(){
        return this._productId;
    }
}