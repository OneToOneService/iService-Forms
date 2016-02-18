<div id="notes" class="dialer-section contact-note-section">
      <div class="header"><h2>Notes</h2>
      <span class="contact-info-show-box" ng-click="toggleContactNote('classnotecontent')"></span>
      </div>
      <div class="contact-note-content" ng-class="classnotecontent">
      <textarea placeholder="Enter call notes here (optional) and Click a disposition button" id="{{idPrefix}}Body" name="body" type="text" ng-model="body"></textarea>
     
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
