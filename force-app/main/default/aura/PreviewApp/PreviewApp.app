<aura:application extends="force:slds">
    <aura:attribute name="recordid" type="String"/>
    <aura:attribute name="fieldSetName" type="String"/>
    <aura:attribute name="sObjectTypeName" type="String"/>
    <aura:attribute name="objName" type="String"/>
    
    <div class="slds-clearfix slds-p-around_medium">
        <div class="slds-float_right">
            <lightning:button aura:id="printButton" class="" label="Print" onclick="{!c.print}"/>
        </div>
    </div>

    
   
</aura:application>