/**
 * Created by Bruss on 3/17/2021.
 */

({
    createProduct: function (component, product) {
        let theProduct = component.get("v.products");
        let productNew = JSON.parse(JSON.stringify(product));
        theProduct.push(productNew);
        component.set("v.products", theProduct);
    }

});