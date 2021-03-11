import { LightningElement, api, wire, track } from 'lwc';

export default class Detail extends LightningElement {
    @api productId;

    product;
    _productId = undefined;

    set productId(value) {
        this._productId = value;
        this.product = products.find(product => this.products.Id);
    }
    
    // // getter for productId
    // @api get productId(){
    //     return this._productId;
    // }
}