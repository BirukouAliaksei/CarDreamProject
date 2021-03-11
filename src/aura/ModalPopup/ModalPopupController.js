/**
 * Created by Bruss on 3/3/2021.
 */

({
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        let openPopup = event.getParam("openPopup");
        console.info(openPopup);
        component.set("v.isModalOpen", openPopup);
        // component.set("v.isModalOpen", true);
    },

    closeModel: function(component, event, helper) {
        // Set isModalOpen attribute to false
        component.set("v.isModalOpen", false);
    },

    submitDetails: function(component, event, helper) {
        let action = component.get("c.mergeNewCases");
        console.log();

        let openModal = component.getEvent("openModal");
        openModal.setParams({"openPopup" : true});
        console.info();
        openModal.fire();
        // component.set("c.mergeNewCases", action);
        // action.setCallback(this, function (response) {
        //     console.log();
        //     let state = response.getState();
        //     if (state === "SUCCESS") {
        //         component.set("c.getCaseById", response.getReturnValue());
        //
        //     } else {
        //         console.log("Failed with state: " + state);
        //     }
        // });
        // $A.enqueueAction(action);
        console.log();
        component.set("v.isModalOpen", false);
    },

})