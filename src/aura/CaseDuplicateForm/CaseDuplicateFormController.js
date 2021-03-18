/**
 * Created by Bruss on 3/14/2021.
 */

({
        getCasesList: function (component, event) {
            let action = component.get("c.getCases");
            let recordId = component.get("v.recordId");
            console.log(recordId);
            action.setParams({"caseId": recordId});

            action.setCallback(this, function (response) {
                let state = response.getState();
                console.log(state);
                console.log(response.getReturnValue());
                if (state === "SUCCESS") {
                    component.set("v.cases", response.getReturnValue());

                } else {
                    console.log("Failed with state: " + state);
                }
            });
            $A.enqueueAction(action);
        },

        mergeCasesList: function (component, event) {
            let recordId = component.get("v.recordId");
            let clickedCase = event.getSource().get("v.name");
            console.log("Show clicked case: " + JSON.stringify(clickedCase));

            let action = component.get("c.mergeNewCases");
            console.log(action);
            action.setParams({caseId:recordId,caseToMergeId:clickedCase});

            action.setCallback(this, function (response) {
                let state = response.getState();
                if (state === "SUCCESS") {
                    console.log(response.getReturnValue());
                    component.set("v.caseRecord", response.getReturnValue());
                } else {
                    console.log("Failed with state: " + state);
                }
            });
            $A.enqueueAction(action);

            // let openModal = component.getEvent("openModal");
            // openModal.setParams({"openPopup": true});
            // let button = event.getSource().getLocalId();
            // console.log(button + " button");
            // openModal.fire();
        },
    }

)