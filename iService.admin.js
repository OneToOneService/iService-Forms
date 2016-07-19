

var iServiceAdmin = angular.module('iService.admin', ['ngRoute']);
iServiceAdmin.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
  .when('/form', { templateUrl: rootPath + 'f/admin-form', controller: 'ControllerAdminForms' })
  .when('/form/:formID', { templateUrl: rootPath + 'f/admin-form', controller: 'ControllerAdminForms' })
  .when('/formbuiltin', { templateUrl: rootPath + 'f/admin-form', controller: 'ControllerAdminFormsBuiltin' })
  .when('/formbuiltin/:formID', { templateUrl: rootPath + 'f/admin-form', controller: 'ControllerAdminFormsBuiltin' })
  .when('/website', { templateUrl: rootPath + 'f/admin-website', controller: 'ControllerAdminWebsites' })
  .when('/website/:websiteID', { templateUrl: rootPath + 'f/admin-website', controller: 'ControllerAdminWebsites' })
  .when('/monitor', { templateUrl: rootPath + 'f/admin-monitor', controller: 'ControllerAdminMonitor' })
} ]);


ControllerWithID(iServiceAdmin, 'ControllerTab', 'Tab');

iServiceAdmin.controller('ControllerAdmin', ['$scope', '$http', function ($scope, $http) {
  SetIDPrefix($scope, 'Admin');
  iservice.admin = {};
  iservice.admin.tabs = {
    'segment': { name: 'Segments', right: 'Tab.Admin.Segments', path: rootPath + tabUrls['admin-segment'] },
    'website': { name: 'Websites', right: 'Tab.Admin.Websites', path: rootPath + tabUrls['admin-website'] },
    'skill': { name: 'Skills', right: 'Tab.Admin.Skills', path: rootPath + tabUrls['admin-skill'] },
    'agent': { name: 'Agents', right: 'Tab.Admin.Agents', path: rootPath + tabUrls['admin-agent'] },
    'usertype': { name: 'User Types', right: 'Tab.Admin.UserTypes', path: rootPath + tabUrls['admin-usertype'] },
    'additionaldetail': { name: 'Additional Details', right: 'Tab.Admin.AdditionalDetails', path: rootPath + tabUrls['admin-additionaldetail'] },
    'department': { name: 'Departments', right: 'Tab.Admin.Departments', path: rootPath + tabUrls['admin-department'] },
    'alert': { name: 'Alerts', right: 'Tab.Admin.Alerts', path: rootPath + tabUrls['admin-alert'] },
    'contactsummary': { name: 'Contact Summary', right: 'Tab.Admin.ContactSummary', path: rootPath + tabUrls['admin-contactsummary'] },
    'mailing': { name: 'Mailing', right: 'Tab.Admin.Mailings', path: rootPath + tabUrls['admin-mailing'] },
    'form': { name: 'Forms', right: 'Tab.Admin.Forms', path: rootPath + tabUrls['admin-form'] },
    'servicelevel': { name: 'Service Level', right: 'Tab.Admin.ServiceLevels', path: rootPath + tabUrls['admin-servicelevel'] },
    'smtpout': { name: 'Smtp Out', right: 'Tab.Admin.SmtpOut', path: rootPath + tabUrls['admin-smtpout'] },
    'monitor': { name: 'Monitor', right: 'Tab.Admin.Monitor', path: rootPath + tabUrls['admin-monitor'] }
  };
  $scope.tabList = [iservice.admin.tabs['segment'], iservice.admin.tabs['website'], iservice.admin.tabs['skill'], iservice.admin.tabs['agent'], iservice.admin.tabs['usertype'], iservice.admin.tabs['additionaldetail'], iservice.admin.tabs['department'], iservice.admin.tabs['alert'], iservice.admin.tabs['contactsummary'], iservice.admin.tabs['mailing'], iservice.admin.tabs['form'], iservice.admin.tabs['servicelevel'], iservice.admin.tabs['smtpout'], iservice.admin.tabs['monitor']];
  $scope.MainTabClass = function (tab) { return (tab == iservice.admin.tab) ? 'active' : 'inactive'; }
} ])
.controller('ControllerAdminFormsBuiltin', ['$scope', '$http', '$routeParams', '$location', function ($scope, $http, $routeParams, $location) {
  $scope.showBuiltin = true;
  ControllerAdminForms($scope, $http, $routeParams, $location);
} ])
.controller('ControllerAdminForms', ['$scope', '$http', '$routeParams', '$location', function ($scope, $http, $routeParams, $location) {
  ControllerAdminForms($scope, $http, $routeParams, $location);
} ]);
function ControllerAdminForms($scope, $http, $routeParams, $location) {
  SetIDPrefix($scope, 'Forms');
  iservice.admin.tab = iservice.admin.tabs['form'];

  if(!iservice.admin.forms || !iservice.admin.forms.sort)
    iservice.admin.forms = { sort: { column: 'name', ascend: true } };

  $scope.forms = iservice.admin.forms;
  InstallControllerSort(iservice.admin.forms, iservice.admin.forms.sort);
  InstallControllerWizardAdminForm($scope, $http, $location);
  if (!$scope.showBuiltin) $scope.showBuiltin = false;
  $scope.$watch('showBuiltin', function (newValue, oldValue) {
    if (newValue === oldValue) return;
    if (!newValue) $location.path('/form');
    else $location.path('/formbuiltin');
  });
  $scope.ShowDetails = function () { return $scope.show == 'details'; }
  $scope.ShowActions = function () {
    return ($scope.form && ($scope.form.actions || !$scope.showBuiltin)) ? 'true' : 'false';
  }
  $scope.NewClick = function () {
    $scope.show = 'new';
    $scope.details = { name: '' };
  }
  $scope.NewCreateClick = function () {
    iservice.AdminFormCreate($http, $scope.details, function (data) {
      if (data.errors && data.errors.length) return;
      $scope.$emit('created-form', data);
    });
  }
  $scope.$on('created-form', function (event, data) {
    iservice.tenant.AddForm(data.formRow);
    $location.path('/form/' + data.formRow.id);
  });
  $scope.DeleteClick = function () {
    if (!$scope.form) return;
    $scope.show = 'delete';
    $scope.DeleteRunning = iservice.AdminFormDeleteEffects($http, $scope.selectedID, function (data) {
      $scope.effects = data.effects;
    });
  }
  $scope.Save = function () {
    if ($scope.show != 'details') return;
    $scope.AdminFormModifyRunning = iservice.AdminFormModify($http, $scope.selectedID, $scope.form, function (data) {
      if (data.errors && data.errors.length) return;
      TableExtendItem(iservice.admin.forms.rows, 'id', data.formRow);
      iservice.admin.forms.rows.sort(SortFunction(iservice.admin.forms.sort));
      iservice.success = ['Saved Successfully'];
    });
  }
  $scope.DeleteConfirmClick = function () {
    $scope.DeleteRunning = iservice.AdminFormDeleteConfirm($http, $scope.selectedID, function (data) {
      if (data.errors && data.errors.length) return;
      iservice.tenant.ResetForms();
      $location.path('/form');
    });
  }
  $scope.AddAction = function () {
    $scope.form.actions.push({
      checkInputID: null,
      checkValue: null,
      submitAction: {
        steps: []
      }
    });
  }
  $scope.StartDeleteAction = function (action) {
    action.deleteStep = 'confirm';
  }
  $scope.CancelDeleteAction = function (action) {
    action.deleteStep = '';
  }
  $scope.ConfirmDeleteAction = function (action) {
    for (var i = 0; i < $scope.form.actions.length; i++) {
      if (action !== $scope.form.actions[i]) continue;
      $scope.form.actions.splice(i, 1);
      break;
    }
  }
  $scope.ItemClick = function (item) {
    var textarea = $('#formBody');
    textarea.focus();
    if ($scope.selection != null) restoreSelection($scope.selection);
    insertIntoTextarea(textarea[0], item.v);
  }
  $scope.ReadyPaste = function () {
    $scope.selection = saveSelection();
  }
  var groupContact = {
    name: 'Contact',
    items: [
      { text: 'Email Address', v: "$input -email -id'enteruniquenamehere'$",
        subs: [
          { text: 'Confirm', v: "$input -email -id'enteruniquenamehere' -confirm'uniquenameofwhatthisconfirms'$" },
          { text: 'Self List', v: "$input -email(self) -id'enteruniquenamehere'$"}]
      },
      { text: 'Password', v: "$input -password -id'enteruniquenamehere'$",
        subs: [
          { text: 'Confirm', v: "$input -password -id'enteruniquenamehere' -confirm'uniquenameofwhatthisconfirms'$"}]
      }]
  };
  var groupInt = {
    name: 'Interaction',
    items: []
  };
  $scope.variableGroups = [
    { name: 'Basic',
      items: [
        { text: 'Any Field', v: "$input -id'enteruniquenamehere'$" },
        { text: 'Any Text Area', v: "$input -textarea -id'enteruniquenamehere'$" },
        { text: 'Form Login', v: "$loginname -id'enterniquenamehere'$" },
        { text: 'Form Password', v: "$loginpassword -id'enterniquenamehere'$" },
        { text: 'Error Message', v: "$errormessage$" },
        { text: 'Form ID', v: "$value -formID$" }
      ]
    },
    groupContact,
    groupInt,
    { name: 'Conditionals',
      items: [
        { text: 'Logged In', v: "$if -loggedin$\r\n$endif$\r\n",
          subs: [
            { text: 'With Else', v: "$if -loggedin$\r\n$else$\r\n$endif$\r\n"}]
        },
        { text: 'Post', v: "$if -ispostback$\r\n$endif$\r\n",
          subs: [
            { text: 'With Else', v: "$if -ispostback$\r\n$else$\r\n$endif$\r\n"}]
        },
        { text: 'Submit Success', v: "$if -submitsuccess$\r\n$endif$\r\n",
          subs: [
            { text: 'With Else', v: "$if -submitsuccess$\r\n$else$\r\n$endif$\r\n"}]
        }]
    },
    { name: 'Logged In',
      items: [
        { text: 'User Name', v: "$value -loggedin(name)$" },
        { text: 'User Contact ID', v: "$value -loggedin(contactid)$" },
        { text: 'Session ID', v: "$value -loggedin(sessionID)$"}]
    },
    { name: 'My Account',
      items: [
        { text: 'Mailing Lists', v: "$if -myaccountlists$\r\n$repeat -myaccountlists$\r\n  $value -myaccountlist(id)$\r\n  $value -myaccountlist(name)$\r\n  $value -myaccountlist(description)$\r\n  $input -id'enteruniquenamehere' -myaccount(list)$\r\n$endrepeat$\r\n$else$\r\nNo Mailing Lists\r\n$endif$\r\n" },
        { text: 'Campaigns', v: "$if -myaccountcampaigns$\r\n$repeat -myaccountcampaigns$\r\n  $value -myaccountcampaign(id)$\r\n  $value -myaccountcampaign(name)$\r\n  $value -myaccountcampaign(description)$\r\n  $input -id'enteruniquenamehere' -myaccount(campaign)$\r\n$endrepeat$\r\n$else$\r\nNo Campaigns\r\n$endif$\r\n" },
        { text: 'Articles', v: "$if -myaccountarticles$\r\n$repeat -myaccountarticles$\r\n  $value -myaccountarticle(id)$\r\n  $value -myaccountarticle(subject)$\r\n  $value -myaccountarticle(topic)$\r\n  $input -id'enteruniquenamehere' -myaccount(article)$\r\n$endrepeat$\r\n$else$\r\nNo Article Subscriptions\r\n$endif$\r\n"}]
    },
    { name: 'Ask A Question',
      items: [
        { text: 'Public Topics', v: "$input -id'enteruniquenamehere' -topics$"}]
    },
    { name: 'Find Answers',
      items: [
        { text: 'Topics - Flat', v: "$repeat -topics(findanswer)$\r\n  $value -topic(id)$\r\n  $value -topic(parentid)$\r\n  $value -topic(name)$\r\n  $value -topic(messagecount)$\r\n  $value -topic(segmentid)$\r\n  $value -topic(segmentname)$\r\n  $value -topic(visibility)$\r\n$endrepeat$\r\n" },
        { text: 'Topics - Tree', v: "$repeat -topictree(findanswer)$\r\n  $value -topic(id)$\r\n  $value -topic(parentid)$\r\n  $value -topic(name)$\r\n  $value -topic(messagecount)$\r\n  $value -topic(segmentid)$\r\n  $value -topic(segmentname)$\r\n  $value -topic(visibility)$\r\n  $if -topictree(findanswer)$\r\n    $repeat -topictree(findanswer)$\r\n      $value -topic(id)$\r\n      $value -topic(parentid)$\r\n      $value -topic(name)$\r\n      $value -topic(messagecount)$\r\n      $value -topic(segmentid)$\r\n      $value -topic(segmentname)$\r\n      $value -topic(visibility)$\r\n    $endrepeat$\r\n  $endif$\r\n$endrepeat$\r\n" },
        { text: 'Article List For Topic', v: "$if -articlelist(topic) -Ptopic'nameofinputwithtopicID' -Ppagenum'1' -Pperpage'100' -Psort'DATE_REVERSE'$\r\n$repeat -articlelist(topic) -Ptopic'nameofinputwithtopicID' -Ppagenum'1' -Pperpage'100' -Psort'DATE_REVERSE'$\r\n  $value -articlelist(id)$\r\n  $value -articlelist(subject)$\r\n  $value -articlelist(date)$\r\n  $value -articlelist(topicid)$\r\n  $value -articlelist(topicname)$\r\n  $value -articlelist(rating)$\r\n  $value -articlelist(viewcount)$\r\n  $value -articlelist(public)$\r\n$endrepeat$\r\n$else$\r\nNo Articles\r\n$endif$\r\n" },
        { text: 'Article Search Results In Topic', v: "$if -articlelist(search) -Ptopic'nameofinputwithtopicID' -Psearchid'nameofinputwithsearchterms' -Ppagenum'1' -Pperpage'100' -Psort'DATE_REVERSE'$\r\n$repeat -articlelist(search) -Ptopic'nameofinputwithtopicID' -Psearchid'nameofinputwithsearchterms' -Ppagenum'1' -Pperpage'100' -Psort'DATE_REVERSE'$\r\n  $value -articlelist(id)$\r\n  $value -articlelist(subject)$\r\n  $value -articlelist(date)$\r\n  $value -articlelist(topicid)$\r\n  $value -articlelist(topicname)$\r\n  $value -articlelist(rating)$\r\n  $value -articlelist(viewcount)$\r\n  $value -articlelist(public)$\r\n$endrepeat$\r\n$else$\r\nNo Articles\r\n$endif$\r\n" },
        { text: 'Article Data', v: "$if -article -Pid'nameofinputwitharticleID'$\r\n  $value -article(id) -Pid'nameofinputwitharticleID'$\r\n  $value -article(subject)$\r\n  $value -article(date)$\r\n  $value -article(question)$\r\n  $value -article(answer)$\r\n  $value -article(public)$\r\n  $value -article(segmentid)$\r\n  $value -article(segmentname)$\r\n  $value -article(topicid)$\r\n  $value -article(topicname)$\r\n  $value -article(viewcount)$\r\n  $value -article(rating)$\r\n  $value -article(myrating)$\r\n  $value -article(creatorname)$\r\n  $if -attachments -Pid'nameofinputwitharticleID'$\r\n    $repeat -attachments -Pid'nameofinputwitharticleID'$\r\n      $value -attachment(id)$\r\n      $value -attachment(ownerid)$\r\n      $value -attachment(name)$\r\n    $endrepeat$\r\n  $else$\r\n    No attachments.\r\n  $endif$\r\n$else$\r\nNo Article Found\r\n$endif$\r\n"}]
    }];
  $scope.WizardClick = function () {
    $scope.show = 'wizard';
  }
  $scope.WizardCancel = function () {
    $scope.show = '';
  }
  var formsListName = $scope.showBuiltin ? 'formsbuiltin' : 'forms';
  $scope.LoadFormListRunning = iservice.AdminList($http, 'ListFormBothProp', [formsListName, 'contactProperties', 'intProperties'], function (data) {
    var forms = data[formsListName];
    iservice.admin.forms.NewRows(forms);
    SelectForm($routeParams.formID);
    $scope.LoadFormListRunning = function () { return false; };
    var segmentID = '0';
    for (var c = 0; c < data.contactProperties.length; c++) {
      var prop = data.contactProperties[c];
      var item = { text: prop.name, v: "$input -id'enteruniquenamehere' -contactProperty" + prop.id + "'" + prop.name.replace(/\W/g, '') + "'$" };
      if (segmentID != prop.segmentID) {
        item.segmentName = prop.segmentName;
        segmentID = prop.segmentID;
      }
      if (prop.hasDescriptions) item.subs = [
        { text: 'Desc', v: "$input -contactProperty" + prop.id + "'" + prop.name.replace(/\W/g, '') + "' -id'enteruniquenamehere' -description'uniquenameofwhatthisdescribes'$"}];
      groupContact.items.push(item);
    }
    segmentID = '0';
    for (var i = 0; i < data.intProperties.length; i++) {
      var prop = data.intProperties[i];
      var item = {
        text: prop.name, v: "$input -id'enteruniquenamehere' -interactionProperty" + prop.id + "'" + prop.name.replace(/\W/g, '') + "'$"
      };
      if (segmentID != prop.segmentID) {
        item.segmentName = prop.segmentName;
        segmentID = prop.segmentID;
      }
      if (prop.hasDescriptions) item.subs = [
        { text: 'Desc', v: "$input -interactionProperty" + prop.id + "'" + prop.name.replace(/\W/g, '') + "' -id'enteruniquenamehere' -description'uniquenameofwhatthisdescribes'$"}];
      groupInt.items.push(item);
    }
  });
  function SelectForm(formID) {
    if (!formID) {
      $scope.selectedID = '';
      $scope.show = '';
      return;
    }
    $scope.selectedID = formID;
    $scope.show = 'details';
    $scope.AdminFormDetailsRunning = iservice.AdminFormDetails($http, formID, function (data) {
      if ((data.errors && data.errors.length > 0) || !data.id || data.id == '') {
        $scope.show = '';
        return;
      }
      $scope.form = data;
      $scope.readOnly = Number.isNaN(+formID);
    });
  }
}

ControllerWithID(iServiceAdmin, 'ControllerWizard', 'Wizard');
ControllerWithID(iServiceAdmin, 'ControllerWizardAAQ', 'AAQ');
ControllerWithID(iServiceAdmin, 'ControllerWizardAAQContact', 'Contact');
ControllerWithID(iServiceAdmin, 'ControllerWizardAAQInteraction', 'Interaction');
ControllerWithID(iServiceAdmin, 'ControllerWizardImport', 'Import');

function InstallControllerWizardAdminForm($scope, $http, $location) {
  var names = {};
  var MakeName = function (name) {
    var base = name.replace(/\W/g, '');
    var end = 0;
    name = base;
    while (names[name]) {
      end++;
      name = base + end;
    }
    names[name] = true;
    return name;
  }
  $scope.maxStep = { 'aaq-topic': 4, 'aaq-contact': 4, 'aaq-int': 4, 'contactimp': 2 };
  var wiz = $scope.wiz = { step: 'type', stepNum: 1, type: '', details: { name: '', description: '', isFullPage: true, body: ''} };
  function MakePropertyRow(prop, FlagProperty) {
    var id = MakeName(prop.name),
        idConfirm = MakeName(id + 'confirm');
    var flagTextarea = (prop.isMultiLine) ? ' -textarea' : '';
    function FlagID(id) {
      return " -id'" + id + "'";
    };
    function FlagConfirm(id) {
      return " -confirm'" + id + "'";
    };
    var row = {
      name: htmlEscape(prop.name),
      optional: true,
      multiline: prop.isMultiLine,
      input: '$input{req}' + FlagProperty(prop, id) + FlagID(id) + flagTextarea + '$',
      inputConfirm: '$input' + FlagProperty(prop, id) + FlagID(idConfirm) + FlagConfirm(id) + flagTextarea + '$'
    }; if (prop.hasDescriptions) {
      var idDescribe = MakeName(id + 'describe'), idDescribeConfirm = MakeName(id + 'describeconfirm'); function FlagDescribe(id) { return " -description'" + id + "'"; }; row.describe = true; row.inputDescribe = '$input' + FlagProperty(prop, id) + FlagID(idDescribe) + FlagDescribe(id) + '$'; row.inputDescribeConfirm = '$input' + FlagProperty(prop, id) + FlagID(idDescribeConfirm) + FlagConfirm(idDescribe) + FlagDescribe(idConfirm) + '$';
    } return row;
  }
  function MakeContactProperties(contactProperties, rows) {
    rows.push({
      name: 'Email Address',
      selected: true,
      required: true,
      optional: false,
      describe: false,
      input: "$input -email -id'email'{req}$",
      inputConfirm: "$input -email -id'emailconfirm' -confirm'email'$"
    });
    rows.push({
      name: 'Password',
      optional: true,
      describe: false,
      input: "$input -password -id'password'{req}$",
      inputConfirm: "$input -password -id'passwordconfirm' -confirm'password'$"
    });
    function FlagProperty(prop, id) {
      return ' -contactProperty' + prop.id + "'" + id + "'";
    }
    for (var p = 0; p < contactProperties.length; p++) {
      var prop = contactProperties[p];
      var row = MakePropertyRow(prop, FlagProperty);
      rows.push(row);
    }
  }
  function MakeInteractionProperties(intProperties, rows) {
    rows.push({
      name: 'Subject',
      selected: true,
      required: true,
      optional: false,
      describe: false,
      unconfirm: true,
      input: "$input -id'subject'{req}$"
    });
    rows.push({
      name: 'Body',
      selected: true,
      required: true,
      optional: false,
      describe: false,
      unconfirm: true,
      input: "$input -id'body'{req} -textarea$"
    });
    function FlagProperty(prop, id) {
      return ' -interactionProperty' + prop.id + "'" + id + "'";
    }
    for (var p = 0; p < intProperties.length; p++) {
      var prop = intProperties[p];
      var row = MakePropertyRow(prop, FlagProperty);
      rows.push(row);
    }
  }
  $scope.WizardNextClick = function () {
    if (wiz.step == 'type') {
      if (!wiz.details.name || wiz.details.name.length < 1) return;
      if (wiz.type == 'Ask A Question') {
        wiz.step = 'aaq-topic'; wiz.stepNum = 2; wiz.aaq = { topics: [] };
        $scope.WizardLoadRunning = iservice.AdminList($http, 'ListTopic', ['topics'], function (data) {
          wiz.aaq.topics = data.topics;
        });
      }
      if (wiz.type == 'Contact Import/Update') {
        names = { email: true, emailconfirm: true, password: true, passwordconfirm: true };
        wiz.step = 'contactimp';
        wiz.stepNum = 2;
        wiz.contactimp = { rows: [] };
        $scope.WizardLoadRunning = iservice.AdminList($http, 'ListContact', ['contactProperties'], function (data) {
          MakeContactProperties(data.contactProperties, wiz.contactimp.rows);
        });
      }
    }
    else if (wiz.step == 'aaq-topic') {
      if (!wiz.aaq.topic) return;
      names = { subject: true, body: true, email: true, emailconfirm: true, password: true, passwordconfirm: true };
      wiz.step = 'aaq-contact';
      wiz.stepNum = 3;
      wiz.aaq.contact = { rows: [] };
      $scope.WizardLoadRunning = iservice.AdminList($http, 'ListContact', ['contactProperties'], function (data) {
        MakeContactProperties(data.contactProperties, wiz.aaq.contact.rows);
      });
    }
    else if (wiz.step == 'aaq-contact') {
      wiz.step = 'aaq-int';
      wiz.stepNum = 4;
      wiz.aaq.int = { rows: [] };
      $scope.WizardLoadRunning = iservice.AdminList($http, 'ListIntProp', ['intProperties'], function (data) {
        MakeInteractionProperties(data.intProperties, wiz.aaq.int.rows);
      });
    }
  }
  $scope.WizardBackClick = function () {
    if (wiz.step == 'aaq-topic') {
      wiz.step = 'type';
      wiz.stepNum = 1;
    }
    if (wiz.step == 'aaq-contact') {
      wiz.step = 'aaq-topic';
      wiz.stepNum = 2;
    }
    if (wiz.step == 'aaq-int') {
      wiz.step = 'aaq-contact';
      wiz.stepNum = 3;
    }
    if (wiz.step == 'contactimp') {
      wiz.step = 'type';
      wiz.stepNum = 1;
    }
  }
  function WritePropertyHtml(prop) {
    var body = '      ' + prop.name + ': ';
    if (prop.describe) body += prop.inputDescribe;
    if (prop.multiline) body += '<br>\r\n      ';
    body += prop.input.replace('{req}', (prop.required ? ' -required' : '')) + '<br>\r\n';
    if (!prop.unconfirm && prop.confirm) {
      body += '      Confirm ' + prop.name + ': ';
      if (prop.describe) body += prop.inputDescribeConfirm;
      if (prop.multiline) body += '<br>\r\n      ';
      body += prop.inputConfirm + '<br>\r\n';
    } return body;
  }
  $scope.WizardFinishClick = function () {
    if (wiz.step == 'contactimp') {
      var body = '<html>\r\n  <body>\r\n    <form method="POST">\r\n';
      for (var i = 0; i < wiz.contactimp.rows.length; i++) {
        var prop = wiz.contactimp.rows[i];
        if (!prop.selected) continue;
        body += WritePropertyHtml(prop);
      }
      body += '      <input type="submit" id="ok" name="ok" value="Create/Update Contact" /><br>\r\n';
      body += '      <div style="background-color:yellow;">$errormessage$</div>\r\n';
      body += '    </form>\r\n  </body>\r\n</html>';
      wiz.details.body = body;
      wiz.details.actions = [{
        submitAction: {
          steps: [{
            contactFindCreate: {
              emailSearch: "$form -id'email'$",
              ignoreBlankFields: true,
              resultName: 'contactID'
            }
          }]
        }
      }];
      $scope.WizardLoadRunning = iservice.AdminFormCreate($http, wiz.details, function (data) {
        if (data.errors && data.errors.length) return;
        $scope.$emit('created-form', data);
      });
    }
    else if (wiz.step == 'aaq-int') {
      var body = '<html>\r\n  <body>\r\n    <form method="POST">\r\n';
      for (var i = 0; i < wiz.aaq.contact.rows.length; i++) {
        var prop = wiz.aaq.contact.rows[i];
        if (!prop.selected) continue;
        body += WritePropertyHtml(prop);
      }
      for (var i = 0; i < wiz.aaq.int.rows.length; i++) {
        var prop = wiz.aaq.int.rows[i];
        if (!prop.selected) continue;
        body += WritePropertyHtml(prop);
      }
      body += '      <input type="submit" id="ok" name="ok" value="Submit Question" /><br>\r\n';
      body += '      <div style="background-color:yellow;">$errormessage$</div>\r\n';
      body += '    </form>\r\n  </body>\r\n</html>';
      wiz.details.body = body;
      wiz.details.actions = [{
        submitAction: {
          steps: [{
            contactFindCreate: {
              emailSearch: "$form -id'email'$",
              ignoreBlankFields: true,
              resultName: 'contactID'
            }
          }, {
            ticket: {
              isTicketNotAskAQuestion: false,
              contactID: "$result -id'contactID'$",
              emailAddress: "$form -id'email'$",
              topicID: '' + wiz.aaq.topic,
              subject: "$form -id'subject'$",
              bodyHtml: "$form -id'body'$",
              resultName: 'interactionID'
            }
          }]
        }
      }];
      $scope.WizardLoadRunning = iservice.AdminFormCreate($http, wiz.details, function (data) {
        if (data.errors && data.errors.length) return;
        $scope.$emit('created-form', data);
      });
    }
  }
}

iServiceAdmin.controller('ControllerAdminWebsites', ['$scope', '$http', '$location', '$routeParams', function ($scope, $http, $location, $routeParams) {
  SetIDPrefix($scope, 'Websites');
  iservice.admin.tab = iservice.admin.tabs['website'];
  iservice.admin.websites = { sort: { column: 'name', ascend: true} };
  $scope.websites = iservice.admin.websites;
  InstallControllerSort(iservice.admin.websites, iservice.admin.websites.sort);
  $scope.LoadWebsiteListRunning = iservice.AdminList($http, 'ListWebsitesSegments', ['websites', 'segments', 'autoresponses', 'mailboxes'], function (data) {
    iservice.admin.websites.NewRows(data.websites);
    SelectWebsite($routeParams.websiteID);
    $scope.LoadWebsiteListRunning = function () { return false; };
  });
  $scope.ShowDetails = function () { return $scope.show == 'details'; }
  function SelectWebsite(websiteID) {
    if (!websiteID || !websiteID.length) {
      $scope.selectedID = '';
      $scope.show = '';
      return;
    }
    $scope.selectedID = websiteID;
    $scope.show = 'details';
    $scope.AdminWebsiteDetailsRunning = iservice.AdminWebsiteDetails($http, websiteID, function (data) {
      if ((data.errors && data.errors.length > 0) || !data.id || data.id == '') {
        $scope.show = '';
        return;
      }
      $scope.website = data;
    });
  }
  $scope.NewClick = function () {
    $scope.show = 'new';
    $scope.details = { name: '' };
  }
  $scope.NewCreateClick = function () {
    iservice.AdminWebsiteCreate($http, $scope.details, function (data) {
      if (data.errors && data.errors.length) return;
      $scope.$emit('created-website', data);
    });
  }
  $scope.$on('created-website', function (event, data) {
    iservice.tenant.AddWebsite(data.websiteRow);
    $location.path('/website/' + data.websiteRow.id);
  });
  $scope.DeleteClick = function () {
    if (!$scope.website) return;
    $scope.show = 'delete';
  }
  $scope.Save = function () {
    if ($scope.show != 'details') return;
    $scope.AdminWebsiteModifyRunning = iservice.AdminWebsiteModify($http, $scope.selectedID, $scope.website, function (data) {
      if (data.errors && data.errors.length) return;
      UpdateTable(iservice.admin.websites.rows, data.websiteRow, 'id');
      iservice.admin.websites.rows.sort(SortFunction(iservice.admin.websites.sort));
      iservice.success = ['Saved Successfully'];
    });
  }
  $scope.DeleteConfirmClick = function () {
    $scope.DeleteRunning = iservice.AdminWebsiteDeleteConfirm($http, $scope.selectedID, function (data) {
      if (data.errors && data.errors.length) return;
      iservice.tenant.ResetWebsites();
      $location.path('/website');
    });
  }
  var query = ParseLocation();
  $scope.$on('selected-website', function (event, websiteID) {
    $scope.SelectForm(websiteID);
  });
  $scope.$on('created-website', function (event, data) {
    UpdateTable($scope.rows, data.websiteRow, 'id');
    $scope.rows.sort(SortFunction($scope.sort));
    $scope.SelectForm(data.websiteID);
  });
  $scope.DefaultPlaceholder = function (placeholder) {
    placeholder.value = placeholder.defaultValue;
  }
  $scope.AddDomain = function (domain) {
    if (domain.length < 1) return;
    $scope.website.domains.push(domain);
  }
  $scope.RemoveDomains = function (domains) {
    for (var j = 0; j < domains.length; j++) {
      for (var i = 0; i < $scope.website.domains.length; i++) {
        if ($scope.website.domains[i] == domains[j]) {
          $scope.website.domains.splice(i, 1);
          break;
        }
      }
    }
  }
  $scope.ShowMakeDefault = function (placeholder) {
    return placeholder.defaultValue != null && placeholder.value != placeholder.defaultValue;
  }
  $scope.NewPlaceholder = function () {
    $scope.website.placeholders.splice(0, 0, { name: "", value: "" });
  }
  $scope.PlaceholderWizardUrl = function (placeholder) {
    if (placeholder.name.startsWith('url-') ||
        placeholder.name == 'myqueue-answer-actions' ||
        placeholder.name == 'common-javascript') {
      return 'admin-website-site-form-choice-wizard.html';
    }
    return null;
  }
  $scope.OpenWizard = function (placeholder) {
    placeholder.wizardOpen = !placeholder.wizardOpen;
  }
}]);

ControllerWithID(iServiceAdmin, 'ControllerAdminWebsitesDetails', 'Details');
ControllerWithID(iServiceAdmin, 'ControllerWebsiteSegment', 'Segment');
ControllerWithID(iServiceAdmin, 'ControllerAdminWebsitePlaceholder', 'Placeholder');
ControllerWithID(iServiceAdmin, 'ControllerAdminWebsitePlaceholderWizardChoice', 'Choice');

var placeholders = {
  'url-default': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-default' },
               { label: 'New html/js', value: 'ngappbuiltin-url-default'}]
  },
  'url-customerinfo': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo'}]
  },
  'url-customerinfo-summary': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-summary'}]
  },
  'url-customerinfo-details': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-details'}]
  },
  'url-customerinfo-subscriptions': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-subscriptions'}]
  },
  'url-customerinfo-history': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-history'}]
  },
  'url-customerinfo-agentemail': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-agentemail'}]
  },
  'url-customerinfo-createnote': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-createnote'}]
  },
  'url-customerinfo-ticket': {
    instructions: 'Pick version of page to use:',
    choices: [ { label: 'Old .aspx', value: 'aspxappbuiltin-url-customerinfo-ticket'}]
  },
  'url-messagequeue-myqueue': {
    instructions: 'Pick version of page to use:',
    choices: [ { label: 'Old .aspx', value: 'aspxappbuiltin-url-messagequeue-myqueue' },
               { label: 'New html/js', value: 'ngappbuiltin-url-messagequeue-myqueue'}]
  },
  'url-messagequeue-managemessage': {
    instructions: 'Pick version of page to use:',
    choices: [ { label: 'Old .aspx', value: 'aspxappbuiltin-url-messagequeue-managemessage' },
               { label: 'New html/js', value: 'ngappbuiltin-url-messagequeue-managemessage' }]
  },
  'url-messagequeue-managechat': {
    instructions: 'Pick version of page to use:',
    choices: [ { label: 'New html/js', value: 'ngappbuiltin-url-messagequeue-managechat' }]
  },
  'url-messagequeue-search': {
    instructions: 'Pick version of page to use:',
    choices: [ { label: 'New html/js', value: 'ngappbuiltin-url-messagequeue-search' }]
  },
  'url-findanswers': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-findanswers'}]
  },
  'url-askaquestion': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-askaquestion'}]
  },
  'url-myaccount': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-myaccount'}]
  },
  'url-admin': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin'}]
  },
  'url-admin-segment': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-segment'}]
  },
  'url-admin-website': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'New html/js', value: 'ngappbuiltin-url-admin-website'}]
  },
  'url-admin-skill': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-skill'}]
  },
  'url-admin-agent': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-agent'}]
  },
  'url-admin-usertype': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-usertype'}]
  },
  'url-admin-detail': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-detail'}]
  },
  'url-admin-department': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-department'}]
  },
  'url-admin-alert': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-alert'}]
  },
  'url-admin-summary': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-summary'}]
  },
  'url-admin-mailing': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-mailing'}]
  },
  'url-admin-form': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'New html/js', value: 'ngappbuiltin-url-admin-form'}]
  },
  'url-admin-servicelevel': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-servicelevel'}]
  },
  'url-admin-smtpout': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'Old .aspx', value: 'aspxappbuiltin-url-admin-smtpout'}]
  },
  'url-admin-monitor': {
    instructions: 'Pick version of page to use:',
    choices: [{ label: 'New html/js', value: 'ngappbuiltin-url-admin-monitor'}]
  },
  'myqueue-answer-actions': {
    instructions: 'Pick version of myqueue actions to use:',
    choices: [{ label: 'Full (With Send)', value: 'ngappbuiltin-myqueue-answer-actions' },
               { label: 'Portal (No Email)', value: 'ngappbuiltin-myqueue-answer-actions-portal'}]
  },
  'common-javascript': {
    instructions: 'Pick version of javascript to use:',
    choices: [{ label: 'Release (minimized)', value: 'ngappbuiltin-common-javascript' },
               { label: 'Debug', value: 'ngappbuiltin-common-javascript-dev'}]
  }
};

iServiceAdmin.controller('ControllerAdminWebsitePlaceholderWizard', ['$scope', function ($scope) {
  $scope.PickChoices = function (placeholderName) {
    $scope.us = placeholders[placeholderName];
  }
  $scope.WizardPick = function (placeholder, choice) {
    placeholder.wizardOpen = false;
    placeholder.value = choice.value;
  }
}]);

iServiceAdmin.controller('ControllerAdminMonitor', ['$scope', '$http', '$location', '$routeParams', function ($scope, $http, $location, $routeParams) {
  SetIDPrefix($scope, 'Websites');
  InstallControllerSort($scope, { column: 'name', ascend: true });
  iservice.admin.tab = iservice.admin.tabs['monitor'];
  $scope.unsubscribe = websync.subscribe('/mailmonitor', MailMonitorReceive);
  function MailMonitorReceive(data) {
    var message = data.getData();
    $scope.$apply(function () {
      $scope.mailmonitor = message;
    });
  }
  $scope.$on("$destroy", function () {
    if ($scope.unsubscribe) $scope.unsubscribe();
  });
}]);

