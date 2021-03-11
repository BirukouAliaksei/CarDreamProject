import { LightningElement, api } from 'lwc';
// import {products} from "c/list"

export default class Tile extends LightningElement {
    //TODO add product id
    @api product;

    tileClick() {
        console.log();
        const event = new CustomEvent('tileclick', {
            // detail contains only primitives
            detail: this.product.Id
        });
        console.log();
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
}
