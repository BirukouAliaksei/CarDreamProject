import { LightningElement, api } from 'lwc';
// import {products} from "c/list"
import LOGO from '@salesforce/resourceUrl/CarDreamLogo';

export default class Tile extends LightningElement {
    //TODO add product id
    @api product;

    sourceUrl = LOGO;
    
    check () {
        console.log(product);
    }

    tileClick() {
        console.log();
        const event = new CustomEvent('tileclick', {
            // detail contains only primitives
            detail: this.product.Name
        });
        console.log();
        console.log(detail);
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
}
