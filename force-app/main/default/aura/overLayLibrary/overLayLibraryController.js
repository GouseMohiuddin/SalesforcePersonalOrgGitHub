({
edit : function(component, event, helper) {
     var modalBody;
    var modalFooter;
    $A.createComponents([
        ["c:newEventPage",{}]
    ],
                        function(components, status){
                            if (status === "SUCCESS") {
                                modalBody = components[0];
                                component.find('overlayLib').showCustomModal({
                                    header: "New Event",
                                    body: modalBody,
                                    showCloseButton: true,
                                    cssClass: "my-modal,my-custom-class,my-other-class",
                                    closeCallback: function() {

                                    }
                                });
                            }
                        }
                       );


    }
})