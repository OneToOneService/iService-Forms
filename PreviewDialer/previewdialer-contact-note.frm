<div id="notes" class="dialer-section contact-note-section">
      <div class="header"><h2>Notes</h2>
      <span class="contact-info-show-box" ng-click="toggleContactNote('classnotecontent')"></span>
      </div>
      <div class="contact-note-content" ng-class="classnotecontent">
      <textarea placeholder="Enter call notes here (optional) and Click a disposition button" id="{{idPrefix}}Body" name="body" type="text" ng-model="body"></textarea>
     <!-- <input type="text" placeholder="Follow Up Date" class="followupdate" ui-date="dateOptions" id="{{idPrefix}}CallDate" ng-model="nextcalldate">
      <select type="text" class="pic_list" id="{{idPrefix}}CloseReason" ng-model="closereason">
        <option value="">-- Pick Sales Close Reason --</option>
        <option value="Being Acquired">Being Acquired</option>
        <option value="Business Closing">Business Closing</option>
        <option value="Competitor - eGain">Competitor - eGain</option>
        <option value="Competitor - Emailtopia">Competitor - Emailtopia</option>
        <option value="Competitor - In House">Competitor - In House</option>
        <option value="Competitor - Instant Service">Competitor - Instant Service</option>
        <option value="Competitor - Kana">Competitor - Kana</option>
        <option value="Competitor - LivePerson">Competitor - LivePerson</option>
        <option value="Competitor - Other">Competitor - Other</option>
        <option value="Competitor - RNW">Competitor - RNW</option>
        <option value="Competitor - Salesforce">Competitor - Salesforce</option>
        <option value="Competitor - Talisma">Competitor - Talisma</option>
        <option value="Competitor - Zendesk">Competitor - Zendesk</option>
        <option value="Competitor-local">Competitor-local</option>
        <option value="Contacted coworker already">Contacted coworker already</option>
        <option value="Duplicate">Duplicate</option>
        <option value="Follow Up 2009">Follow Up 2009</option>
        <option value="IsBounced">IsBounced</option>
        <option value="Left VM-No Response">Left VM-No Response</option>
        <option value="Low email volume">Low email volume</option>
        <option value="No Budget">No Budget</option>
        <option value="No Contact Center">No Contact Center</option>
        <option value="No response">No response</option>
        <option value="Not at this time">Not at this time</option>
        <option value="Not correct person, no referral">Not correct person, no referral</option>
        <option value="Not employee">Not employee</option>
        <option value="Not Good Prospect">Not Good Prospect</option>
        <option value="Not interested">Not interested</option>
        <option value="Open">Open</option>
        <option value="Opted Out of Email">Opted Out of Email</option>
        <option value="Price">Price</option>
        <option value="Referred">Referred</option>
        <option value="Referred to other department">Referred to other department</option>
        <option value="wrong number">wrong number</option>
        <option value=""></option>
      </select> -->    
      <div class="btnSection">
        <a ng-click="CreateNote('Call Notes', idPrefix)" class="btn">Call Notes</a>          
        <a ng-click="CreateNote('leftVM', idPrefix)" class="btn">Left VM</a>
        <a ng-click="CreateNote('BadNumber', idPrefix)" class="btn">Bad Number</a>
        <a ng-click="CreateNote('No Answer', idPrefix)" class="btn">No Answer</a>
        <a ng-click="CreateNote('Interested', idPrefix)" class="btn">Interested</a>
        <a ng-click="CreateNote('Not Interested', idPrefix)" class="btn">Not Interested</a>
        <a ng-click="CreateNote('Wrong Person', idPrefix)" class="btn">Wrong Person</a>
        <a ng-click="CreateNote('Call Later', idPrefix)" class="btn">Call Later</a>
        <a ng-click="CreateNote('Not Employee', idPrefix)" class="btn">Not Employee</a>
        <a ng-click="CreateNote('Call Attempt', idPrefix)" class="btn">Call Attempt</a>
      </div>
      </div>
    </div>
