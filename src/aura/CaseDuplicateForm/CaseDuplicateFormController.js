/**
 * Created by Bruss on 3/2/2021.
 */

({
        getCasesList: function (component, event) {
            let action = component.get("c.getCases");

            action.setCallback(this, function (response) {
                let state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.cases", response.getReturnValue());

                } else {
                    console.log("Failed with state: " + state);
                }
            });
            $A.enqueueAction(action);
        },

        mergeCasesList: function (component, event) {
            console.info(component);
            let openModal = component.getEvent("openModal");
            openModal.setParams({"openPopup" : true});
            console.info();
            openModal.fire();
            // component.set("v.isModalOpen", true);
        },
    }

)
