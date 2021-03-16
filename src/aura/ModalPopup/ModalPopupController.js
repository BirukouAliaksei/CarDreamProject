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

        let clickedBtn = event.getSource().getLocalId();
        alert(clickedBtn);

        let action = component.get("c.mergeNewCases");
        console.log();
        action.setParams({"caseId": clickedBtn});

        action.setCallback(this, function (response) {
            let state = response.getState();
            console.log(state);
            console.log(response.getReturnValue());
            if (state === "SUCCESS") {
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);

        component.set("v.isModalOpen", false);
        alert("ok");
    },

})