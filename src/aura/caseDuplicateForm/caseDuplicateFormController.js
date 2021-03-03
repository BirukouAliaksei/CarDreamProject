/**
 * Created by Bruss on 3/2/2021.
 */

({
    getCasesList: function (component, event) {
        let action = component.get("c.getCases");

        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === "SUCCESS") {
               component.set("v.Cases", response.getReturnValue());

            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }

})
