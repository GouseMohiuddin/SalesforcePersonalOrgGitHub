<!-- 
	Lightning Application to call LightningRecordViewCmp.
	This app is extending force:slds to implement styling for using lightning design system classes
-->
<aura:application extends="force:slds">
	<!-- Calling LightningRecordViewCmp and passing a record Id -->
    <c:LightningRecordViewCmp recordId="{!$SObjectType.CurrentUser.Id}" />
</aura:application>