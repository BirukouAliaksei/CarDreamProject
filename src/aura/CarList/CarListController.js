/**
 * Created by Bruss on 3/16/2021.
 */

({
    doInit: function (component, event, helper) {
        let action = component.get("c.getAllProducts");
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.products", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },

    searchKeyChange: function (component, event) {
        let searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::' + searchKey);
        let action = component.get("c.findProductsByKey");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function (a) {
            component.set("v.products", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },

    showCar: function (component, event, helper) {
        let car = event.getSource().get("v.name");
        console.log("Show productNew: " + JSON.stringify(car));

        let action = component.get("c.getProductById");
        action.setParams({"productId": car});
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.productNew", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);

    }
});