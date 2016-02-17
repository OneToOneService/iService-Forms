<div id="contact-details" class="dialer-section contact-detail-section">
    
      <div class="header">
      <h2>Contact Details</h2>
      <span class="contact-info-show-box" ng-click="toggleDetail()"></span>
      
      </div>
      <div ng-cloak class="customer-details contact-detail-content" ng-class="classdetailcontent" ng-controller="ControllerPreviewDialerCustInfo">
        <div class="interaction-property-list">
        <div class="properties">
          <div ng-repeat="segment in segments" ng-controller="ControllerPropertyGroup" class="segment" ng-class="{ 'not-first': $index }">
            <h3 class="h3">{{ segment.name }}</h3>
            <div class="clear"></div>
            <div class="properties-left" ng-conroller="ControllerPropertiesLeft">
              <div ng-repeat="property in segment.leftProperties" class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
            </div>
            <div class="properties-right" ng-conroller="ControllerPropertiesRight">
              <div ng-repeat="property in segment.rightProperties" class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
            </div>
            <div class="end-properties"></div>
            <div class="logins" ng-show="segment.logins.length">
              <h3 class="h3">Logins:</h3>
               <div class="clear"></div>
              <div ng-repeat="login in segment.logins" ng-controller="ControllerPropertyLogin" class="login">
                <input id="{{idPrefix}}name" type="text" value="" ng-model="login.name" class="text-no-desc">
                <label><input id="{{idPrefix}}isEmail" type="checkbox" ng-model="login.isEmail" class="w30">Is Email</label>
                <label><input id="{{idPrefix}}isBounced" type="checkbox" ng-model="login.isBounced" class="w30">Is Bounced</label> 
                
              </div>
              <button class="add-login-" id="{{idPrefix}}addValue" type="button" ng-click="AddLoginClick(segment)">+</button>
            </div>
          </div>
        </div>
        <div class="membership">
          <h3 class="h3">Segment Membership</h3>
           <div class="clear"></div>
          <div class="segment-list checkbox-list">
            <label ng-repeat="segment in segmentLists | filter: { hidden: false }" ng-controller="ControllerStepSelectAgentItem">
              <input type="checkbox" id="{{idPrefix}}Selected" checklist-model="membership" checklist-value="segment.id">{{ segment.name }}<br>
            </label>
          </div>
        </div>
        <div class="clear"></div>
        <button class="save" id="{{idPrefix}}save" type="button" ng-click="SaveClick()">Save</button>
        <div class="errors">
          <div ng-cloak ng-repeat="error in iservice.errors" class="error-messages">{{ error }}</div>
          <div ng-cloak ng-repeat="message in iservice.success" class="success-messages">{{ message }}</div>
        </div>
        <div ng-cloak ng-show="Getting()">Loading</div>
        <div grey-out ng-show="Getting()"></div>
        <div grey-out ng-show="Saving()"></div>
      </div>
    </div>
      <div ng-cloak class="errors" ng-show="adminLoaded">
      <span class="error-messages" ng-show="!noteTopic">This form can't be used without a topic named 'Pipeline Counts'</span>
      <span class="warning-messages" ng-show="!propCallDate">Optional contact property 'Next Call Date' does not exist.</span>
      <span class="warning-messages" ng-show="!propCloseReason">Optional contact property 'Close Reason' does not exist.</span>
      <span class="warning-messages" ng-show="!propWebSite">Optional contact property 'Web Site' does not exist.</span>
      <span class="warning-messages" ng-show="!propLinkedIn">Optional contact property 'LinkedIn' does not exist.</span>
      <span class="warning-messages" ng-show="!propFollowUp">Optional contact property 'Follow Up' does not exist.</span>
      <span class="warning-messages" ng-show="!propTimeZone">Optional contact property 'Time Zone' does not exist.</span>
      <span class="warning-messages" ng-show="!propNextAction">Optional contact property 'NEXT ACTION*' does not exist.</span>
    </div>
   </div>
