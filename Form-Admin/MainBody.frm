
<div ng-cloak class="admin-forms" ng-class="{ 'read-only': readOnly }">
  <div class="help"><a class="img-link" href="http://www.iservice.info/guides/forms/index.html" target="_blank"><img class="button-help" src="$value -rootpath$images/blank.gif" alt="Help" title="Help"></a></div>
  <div class="form-list">
    <table class="plain-object-list">
      <tr class="item-table-header">
        <th class="sorting-column-header name border"><span class="nglink" ng-click="forms.SortClick('name')">Name</span><div class="sort-direction-indicator" ng-class="forms.SortDirectionClass('name')"></div></th>
        <th ng-show="!showBuiltin" class="sorting-column-header id border"><span class="nglink" ng-click="forms.SortClick('idNum')">ID</span><div class="sort-direction-indicator" ng-class="forms.SortDirectionClass('idNum')"></div></th>
        <th class="sorting-column-header description border"><span class="nglink" ng-click="forms.SortClick('description')">Description</span><div class="sort-direction-indicator" ng-class="forms.SortDirectionClass('description')"></div></th>
      </tr>
      <tr ng-repeat="form in forms.rows" ng-class-even="'row-even'" ng-class-odd="'row-odd'" class="row" ng-class="{ 'row-selected': form.id == selectedID }">
        <td class="border"><div class="name result-text"><a ng-href="#/form{{ showBuiltin ? 'builtin' : '' }}/{{ form.id }}">{{ form.name }}</a></div></td>
        <td ng-show="!showBuiltin" class="id border"><div>{{ form.id }}</div></td>
        <td class="border"><div class="description result-text">{{ form.description }}</div></td>
      </tr>
      <tr ng-show="!LoadFormListRunning()">
        <td colspan="3" class="name" ng-show="rows.length < 1">No Forms</td>
      </tr>
      <tr ng-show="LoadFormListRunning()">
        <td colspan="3" class="name" ng-show="rows.length < 1">Loading...</td>
      </tr>
    </table>
    <div ng-show="LoadFormListRunning()" grey-out></div>
    <div class="show-builtin"><label><input type="checkbox" name="{{labelPrefix}}ShowBuiltin" ng-model="showBuiltin" ng-change="ToggleBuiltin()">Built-In Forms</label></div>
  </div>
  <div class="new-button">
    <button ng-attr-id="{{idPrefix}}StartNew" type="button" ng-click="NewClick()">New Form</button>
    <img class="button-wizard button" src="$value -rootpath$images/blank.gif" ng-click="WizardClick()" alt="Wizard..." title="Wizard...">
    <button class="modifies" ng-show="form" ng-attr-id="{{idPrefix}}Delete" type="button" ng-click="DeleteClick()">Delete Form...</button>
  </div>
  <div class="property-block admin-new-object" ng-show="show == 'new'">
    <h2>New Form</h2>
    Form Name:<br>
    <input ng-attr-id="{{idPrefix}}NewName" type="text" value="" ng-model="details.name" class="text"><br>
    <button ng-attr-id="{{idPrefix}}Create" type="button" ng-click="NewCreateClick()">Create</button>
    <button ng-attr-id="{{idPrefix}}Cancel" type="button" ng-click="show = ''">Cancel</button>
  </div>
  <div class="delete-effects" ng-show="show == 'delete'">
    <p ng-show="effects.websites.length" class="header">Deleting this will affect the following:</p>
    <div ng-show="effects.websites.length" class="item-list">Websites that use this as the new contact registration form.  These websites will have new contact registration disabled:<br><ul>
      <li ng-repeat="website in effects.websites"><a href="admin#/website/{{ website.websiteID }}" target="_blank">{{ website.name }}</a></li>
    </ul></div>
    <p class="warning">Deletion is immediate and irrevocable upon confirmation.</p>
    <p class="confirm"><button ng-attr-id="{{idPrefix}}DeleteConfirm" type="button" ng-click="DeleteConfirmClick()">Confirm Delete</button></p>
    <div ng-show="DeleteRunning()" grey-out></div>
  </div>
  <div class="admin-details property-block" ng-show="ShowDetails()">
    <div class="preview-button"><a class="preview-button img-link" href="Form.aspx?formID={{ selectedID }}" target="_blank"><img class="preview-button" src="$value -rootpath$images/blank.gif" alt="Preview" title="Preview"></a></div>
    Form Name: <br>
    <input ng-attr-id="{{idPrefix}}Name" type="text" value="" ng-model="form.name" class="text"><br>
    Description: <br>
    <input ng-attr-id="{{idPrefix}}Description" type="text" value="" ng-model="form.description" class="text long"><br>
    Submission Success Redirect URL: <input ng-attr-id="{{idPrefix}}Description" type="text" value="" ng-model="form.successRedirectUrl" class="text long"><br>
    <span><label><input type="checkbox" name="{{labelPrefix}}IsRegistration" ng-model="form.isRegistration">Is Registration</label></span><br>
    <table class="form-details-columns"><tr><td class="form-details-left">
      Form Body:<br>
      <textarea id="formBody" type="text" class="wide high form-body" ng-model="form.body" paste-target="ReadyPaste()" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"></textarea><br>
    </td><td class="form-details-right modifies">
      <div class="tab-label">Form Variables</div>
      <div class="variables">
        Add -required to any &#36;input&#36; to make the field required.<br>
        <div class="group" ng-repeat="group in variableGroups">
          <div class="group-name">{{ group.name }}</div>
          <div class="item" ng-repeat="item in group.items">
            <div ng-show="item.segmentName" class="segment-name">{{ item.segmentName }}</div>
            <span class="nglink" ng-click="ItemClick(item)">{{ item.text }}</span>
            <span ng-repeat="sub in item.subs"> (<span class="nglink" ng-click="ItemClick(sub)">{{ sub.text }}</span>) </span>
          </div>
        </div>
      </div>
    </td></tr></table>
    <div class="submit-action" ng-show="ShowActions()">
      Actions:<br>
      <div class="admin-form-actions" ng-repeat="action in form.actions">
        Run action if field <input type="text" value="" class="text small" ng-model="action.checkInputID">
        matches regex <input type="text" value="" class="text small" ng-model="action.checkValue"><br>
        <div ng-repeat="steps in [action.submitAction.steps]" ng-include="'action.html'"></div>
        <div class="remove-action modifies">
          <div ng-show="!action.deleteStep"><button ng-attr-id="{{idPrefix}}StartDeleteAction" type="button" ng-click="StartDeleteAction(action)">Delete Action</button></div>
          <div ng-show="action.deleteStep=='confirm'">
            <span class="delete-effects"><span class="warning">Delete this action?</span></span>
            <button ng-attr-id="{{idPrefix}}ConfirmDeleteAction" type="button" ng-click="ConfirmDeleteAction(action)">Yes, Delete Action</button>
            <button ng-attr-id="{{idPrefix}}CancelDeleteAction" type="button" ng-click="CancelDeleteAction(action)">Don't Delete</button>
          </div>
        </div>
      </div>
      <button class="add-action modifies" ng-attr-id="{{idPrefix}}AddAction" type="button" ng-click="AddAction()">Add Action</button>
    </div>
    <button class="save modifies" ng-attr-id="{{idPrefix}}Save" type="button" ng-click="Save()">Save</button>
    <div ng-cloak ng-repeat="error in iservice.errors" class="error-messages">{{ error }}</div>
    <div ng-cloak ng-repeat="message in iservice.success" class="success-messages">{{ message }}</div>
    $include -formid'ngappbuiltin-admin-formsteps'$
    <div ng-show="AdminFormDetailsRunning() || AdminFormModifyRunning()" grey-out></div>
  </div>
  <div class="wizard property-block" ng-show="show == 'wizard'" ng-controller="ControllerWizard">
    <div ng-show="wiz.step == 'type'">
      <h3>Set a name and description.</h3>
      Name:<br /><input ng-class="{ invalid: !wiz.details.name }" ng-attr-id="{{idPrefix}}WizName" type="text" value="" ng-model="wiz.details.name" class="text"><br/>
      Description:<br /><input ng-attr-id="{{idPrefix}}WizDesc" type="text" value="" ng-model="wiz.details.description" class="text long"><br/>
      <select ng-class="{ invalid: !wiz.type }" ng-attr-id="{{idPrefix}}WizType" ng-model="wiz.type">
        <option value="Ask A Question">Ask A Question</option>
        <option value="Contact Import/Update">Contact Import/Update</option>
      </select> Form Type
    </div>
    <div ng-controller="ControllerWizardAAQ">
      <div ng-show="wiz.step == 'aaq-topic'">
        <h3>Ask A Question - Choose a topic.</h3>
        <select ng-options="topic.id as topic.option for topic in wiz.aaq.topics" ng-class="{ invalid: !wiz.aaq.topic }" ng-attr-id="{{idPrefix}}Topic" ng-model="wiz.aaq.topic">
        </select>
      </div>
      <div ng-show="wiz.step == 'aaq-contact'" ng-controller="ControllerWizardAAQContact">
        <h3>Ask A Question - Choose contact properties.</h3>
        <table class="choose-properties">
          <tr><th><span>Property (Check to include)</span></th><th><span>Confirm?</span></th><th><span>Required?</span></th></tr>
          <tr ng-repeat="prop in wiz.aaq.contact.rows">
            <td><label><input ng-attr-id="{{idPrefix}}Include_{{prop.id}}" type="checkbox" ng-model="prop.selected" ng-disabled="!prop.optional">{{prop.name}}</label></span></td>
            <td class="toggle"><input ng-attr-id="{{idPrefix}}Confirm_{{prop.id}}" type="checkbox" ng-model="prop.confirm"></td>
            <td class="toggle"><input ng-attr-id="{{idPrefix}}Require_{{prop.id}}" type="checkbox" ng-model="prop.required" ng-disabled="!prop.optional"></td>
          </tr>
        </table>
      </div>
      <div ng-show="wiz.step == 'aaq-int'" ng-controller="ControllerWizardAAQInteraction">
        <h3>Ask A Question - Choose interaction properties.</h3>
        <table class="choose-properties">
          <tr><th><span>Property (Check to include)</span></th><th><span>Confirm?</span></th><th><span>Required?</span></th></tr>
          <tr ng-repeat="prop in wiz.aaq.int.rows">
            <td><label><input ng-attr-id="{{idPrefix}}Include_{{prop.id}}" type="checkbox" ng-model="prop.selected" ng-disabled="!prop.optional">{{prop.name}}</label></span></td>
            <td class="toggle"><input ng-show="!prop.unconfirm" ng-attr-id="{{idPrefix}}Confirm_{{prop.id}}" type="checkbox" ng-model="prop.confirm"></td>
            <td class="toggle"><input ng-attr-id="{{idPrefix}}Require_{{prop.id}}" type="checkbox" ng-model="prop.required" ng-disabled="!prop.optional"></td>
          </tr>
        </table>
      </div>
    </div>
    <div ng-controller="ControllerWizardImport">
      <div ng-show="wiz.step == 'contactimp'">
        <h3>Contact Import/Update - Choose contact properties.</h3>
        <table class="choose-properties">
          <tr><th><span>Property (Check to include)</span></th><th><span>Confirm?</span></th><th><span>Required?</span></th></tr>
          <tr ng-repeat="prop in wiz.contactimp.rows">
            <td><label><input ng-attr-id="{{idPrefix}}Include_{{prop.id}}" type="checkbox" ng-model="prop.selected" ng-disabled="!prop.optional">{{prop.name}}</label></span></td>
            <td class="toggle"><input ng-attr-id="{{idPrefix}}Confirm_{{prop.id}}" type="checkbox" ng-model="prop.confirm"></td>
            <td class="toggle"><input ng-attr-id="{{idPrefix}}Require_{{prop.id}}" type="checkbox" ng-model="prop.required" ng-disabled="!prop.optional"></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="cancel">
      Step {{ wiz.stepNum }} <span ng-show="maxStep[wiz.step]">of {{maxStep[wiz.step]}}</span>
      <img class="button-cancel button" ng-attr-id="{{idPrefix}}WizCancel" src="$value -rootpath$images/blank.gif" ng-click="WizardCancel()" alt="Cancel" title="Cancel">
    </div>
    <div class="next-buttons">
      <img class="button-back button" ng-show="wiz.stepNum > 1" ng-attr-id="{{idPrefix}}WizBack" src="$value -rootpath$images/blank.gif" ng-click="WizardBackClick()" alt="Back" title="Back">
      <img class="button-next button" ng-show="!maxStep[wiz.step] || wiz.stepNum < maxStep[wiz.step]" ng-attr-id="{{idPrefix}}WizNext" src="$value -rootpath$images/blank.gif" ng-click="WizardNextClick()" alt="Next" title="Next">
      <button ng-show="wiz.stepNum == maxStep[wiz.step]" ng-attr-id="{{idPrefix}}WizFinish" type="button" ng-click="WizardFinishClick()">Finish &gt;&gt;</button>
    </div>
    <div ng-show="WizardLoadRunning()" grey-out></div>
  </div>
</div>
