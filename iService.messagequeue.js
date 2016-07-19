
var iServiceMessageQueue = angular.module('iService.messagequeue', ['ngRoute']);
iServiceMessageQueue.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
  .when('/myqueue', { templateUrl: rootPath + 'f/messagequeue-myqueue', controller: 'ControllerMessageQueueMyQueue' })
  .when('/managemsg', { templateUrl: rootPath + 'f/messagequeue-managemessage', controller: 'ControllerMessageQueueManageMessage' })
  .when('/managechat', { templateUrl: rootPath + 'f/messagequeue-managechat', controller: 'ControllerMessageQueueManageChat' })
  .when('/search', { templateUrl: rootPath + 'f/messagequeue-search', controller: 'ControllerMessageQueueSearch' })
  .otherwise({ redirectTo: '/myqueue' })
}]);

ControllerWithID(iServiceMessageQueue, 'ControllerTab', 'Tab');
ControllerWithID(iServiceMessageQueue, 'ControllerDetailTab', 'Tab');
ControllerWithID(iServiceMessageQueue, 'ControllerInboxMessage', 'Message');
ControllerWithID(iServiceMessageQueue, 'ControllerMessageQueueMyQueueThread', 'Thread');
ControllerWithID(iServiceMessageQueue, 'ControllerResponseAttachment', 'Attachment');

(function (iservice) {
  var messagequeue = iservice.messagequeue;
  if (!messagequeue) {
    messagequeue = {};
    iservice.messagequeue = messagequeue;
  }
  var myqueue = messagequeue.myqueue;
  if (!myqueue) {
    myqueue = {};
    messagequeue.myqueue = myqueue;
  }
  messagequeue.tabs = {
    myqueue: { name: 'My Queue', right: 'Tab.Top.MessageQueue', path: rootPath + tabUrls['messagequeue-myqueue'] },
    managemessage: { name: 'Manage Msgs', right: 'Tab.MessageQueue.Supervise', path: rootPath + tabUrls['messagequeue-managemessage'] },
    managechat: { name: 'Manage Chats', right: 'Tab.MessageQueue.SuperviseChat', path: rootPath + tabUrls['messagequeue-managechat'] },
    search: { name: 'Search', right: 'Tab.MessageQueue.Search', path: rootPath + tabUrls['messagequeue-search'] }
  };
  myqueue.inboxes = {
    myinbox: { name: 'My Message Inbox', right: 'Tab.Top.MessageQueue', messages: [], noneMessage: 'There are no messages in your inbox.',
      columns:
      [ { label: 'From', member: 'customerName', _class: 'column-name', contents: 'myqueue-inbox-customername.html' },
        { label: 'Email', member: 'fromAddress', _class: 'column-email', contents: 'myqueue-inbox-fromaddress.html' },
        { label: 'Date', member: 'date', _class: 'column-date', contents: 'myqueue-inbox-date.html' },
        { label: 'Subject', member: 'subject', _class: 'column-subject', contents: 'myqueue-inbox-subject.html' }, 
        { label: 'Topic', member: 'topicName', _class: 'column-topic', contents: 'myqueue-inbox-topicname.html'} ]
    },
    waiting: { name: 'Pending', right: 'Tab.Top.MessageQueue', messages: [], noneMessage: 'There are no messages sent waiting reply in your inbox.',
      columns:
      [ { label: 'To', member: 'customerName', _class: 'column-name', contents: 'myqueue-inbox-customername.html' },
        { label: 'Email', member: 'fromAddress', _class: 'column-email', contents: 'myqueue-inbox-fromaddress.html' },
        { label: 'Date', member: 'date', _class: 'column-date', contents: 'myqueue-inbox-date.html' },
        { label: 'Subject', member: 'subject', _class: 'column-subject', contents: 'myqueue-inbox-subject.html' }, 
        { label: 'Topic', member: 'topicName', _class: 'column-topic', contents: 'myqueue-inbox-topicname.html'} ]
    },
    approve: { name: 'Approve', right: 'Tab.Top.MessageQueue', messages: [], noneMessage: 'There are no messages to approve in your inbox.',
      columns:
      [ { label: 'From', member: 'customerName', _class: 'column-name', contents: 'myqueue-inbox-customername.html' },
        { label: 'Email', member: 'fromAddress', _class: 'column-email', contents: 'myqueue-inbox-fromaddress.html' },
        { label: 'Date', member: 'date', _class: 'column-date', contents: 'myqueue-inbox-date.html' },
        { label: 'Subject', member: 'subject', _class: 'column-subject', contents: 'myqueue-inbox-subject.html' }, 
        { label: 'Topic', member: 'topicName', _class: 'column-topic', contents: 'myqueue-inbox-topicname.html'} ]
    }
  };
  myqueue.boxTabs = [ myqueue.inboxes.myinbox, myqueue.inboxes.waiting, myqueue.inboxes.approve ];
  myqueue.MakeMatchStatus = function (status) {
    return function (inboxRow) {
      return inboxRow.status == status;
    };
  };
  myqueue.MakeMatchType = function (type) {
    return function (inboxRow) {
      return inboxRow.type == type;
    };
  };
  myqueue.MakeMatchTopicID = function (topicID) {
    return function (inboxRow) {
      return inboxRow.topicID == topicID;
    };
  };
  myqueue.MakeMatchProperty = function (propertyID, propertyValue) {
    return function (inboxRow) {
      var prop = LookupTable(inboxRow.properties, propertyID, 'propertyID');
      if (!prop) return false;
      return LookupTable(prop.values, propertyValue, 'value');
    };
  };
  myqueue.plugins = [];
  var pluginNormal = {
    priority: 0,
    matchFunc: myqueue.MakeMatchStatus('Queued'),
    inboxName: 'myinbox',
    detailsUrl: rootPath + 'f/myqueue-answer'
  };
  myqueue.plugins.push(pluginNormal);
  var pluginPending = {
    priority: 100,
    matchFunc: myqueue.MakeMatchStatus('SentWaitingReply'),
    inboxName: 'waiting',
    detailsUrl: rootPath + 'f/myqueue-answer'
  };
  myqueue.plugins.push(pluginPending);
  var pluginApprove = {
    priority: 100,
    matchFunc: myqueue.MakeMatchStatus('Pending'),
    inboxName: 'approve',
    detailsUrl: rootPath + 'f/myqueue-answer'
  };
  myqueue.plugins.push(pluginApprove);
  var pluginChats = {
    priority: 100,
    matchFunc: myqueue.MakeMatchStatus('ChatInProgress'),
    inboxName: 'chats',
    detailsUrl: ''
  };
  myqueue.plugins.push(pluginChats);
  myqueue.FindPlugin = function (inboxRow) {
    var best = null;
    ForArray(myqueue.plugins, function (plugin) {
      if (best != null && best.priority > plugin.priority) return;
      if (!plugin.matchFunc(inboxRow)) return;
      best = plugin;
    });
    if (!best) best = pluginNormal;
    return best;
  }
})(iservice);

iServiceMessageQueue.controller('ControllerMessageQueue', ['$scope', '$http', function ($scope, $http) {
  SetIDPrefix($scope, 'MessageQueue');
  var messagequeue = iservice.messagequeue;
  $scope.tabList = [ messagequeue.tabs.myqueue, messagequeue.tabs.managemessage, messagequeue.tabs.managechat, messagequeue.tabs.search ];
  $scope.MainTabClass = function (tab) { return (tab == messagequeue.currentTab) ? 'active' : 'inactive'; }
}]);

iServiceMessageQueue.controller('ControllerMessageQueueMyQueue', ['$scope', '$http', function ($scope, $http) {
  SetIDPrefix($scope, 'MyQueue');
  iservice.pageName = '#/myqueue';
  var messagequeue = iservice.messagequeue;
  messagequeue.currentTab = messagequeue.tabs.myqueue;
  var myqueue = messagequeue.myqueue;
  $scope.myqueue = myqueue;
  $scope.boxTabs = myqueue.boxTabs;
  $scope.currentBox = $scope.boxTabs[0];
  $scope.boxWithSelection = null;
  $scope.BoxTabClass = function (tab) { return (tab === $scope.currentBox) ? 'active' : 'inactive'; }
  $scope.ClickInboxTab = function (box) { $scope.currentBox = box; }
  $scope.detailTabs = [
    { name: 'Message Details', right: 'Tab.Top.MessageQueue' },
    { name: 'History', right: 'Tab.Top.MessageQueue', url: rootPath + 'f/myqueue-history' },
    { name: 'Contact Details', right: 'Tab.Top.MessageQueue', url: rootPath + 'f/myqueue-custinfo' }
  ];
  $scope.currentDetailTab = $scope.detailTabs[0];
  $scope.sort = [{ column: 'date', ascend: true}];
  iservice.SanitizeHistoryRows(myqueue.inbox);
  ForArray(myqueue.inbox, function (row) {
    var plugin = myqueue.FindPlugin(row);
    row.plugin = plugin;
    var inbox = myqueue.inboxes[plugin.inboxName];
    if (inbox) inbox.messages.push(row);
  });
  myqueue.inbox = [];
  function Resort() {
    ForArray(myqueue.boxTabs, function (tab) {
      tab.messages.sort(SortFunction($scope.sort));
    });
  }
  Resort();
  $scope.DetailTabClass = function (tab) {
    return (tab === $scope.currentDetailTab) ? 'active' : 'inactive';
  }
  $scope.ClickDetailTab = function (tab) {
    $scope.currentDetailTab = tab;
  }
  $scope.DetailsUrl = function () {
    if (!$scope.selectedMessage) return null;
    if ($scope.currentDetailTab !== $scope.detailTabs[0]) return $scope.currentDetailTab.url;
    return $scope.selectedMessage.plugin.detailsUrl;
  }
  $scope.NoInboxMessages = function () {
    var box = $scope.currentBox;
    return !box || !box.messages || box.messages.length < 1;
  }
  $scope.GetInboxRunning = iservice.MyQueueInboxes($http, function (data) {
    $scope.numCanGet = data.numCanGet;
    $scope.numCanApprove = data.numCanApprove;
  });
  function GetNextAction(func, runningName, boxNum) {
    return function () {
      $scope[runningName] = func($http, function (data) {
        $scope.numCanGet = data.numCanGet;
        $scope.numCanApprove = data.numCanApprove;
        WantSelectMessage(data.id);
      }, $scope.idPrefix);
    }
  }
  $scope.GetNext = GetNextAction(iservice.MyQueueGetNext, 'GetNextRunning', 0);
  $scope.GetApprove = GetNextAction(iservice.MyQueueGetApprove, 'GetApproveRunning', 2);
  $scope.SortDirectionClass = function (column) { return (!$scope.sort || $scope.sort[0].column != column) ? 'none' : ($scope.sort[0].ascend ? 'sort-direction-ascend' : 'sort-direction-descend'); }
  $scope.SortClick = function (column) { if ($scope.sort[0].column == column) { $scope.sort[0].ascend = !$scope.sort[0].ascend; } else { for (var i = 0, len = $scope.sort.length; i < len; i++) { if ($scope.sort[i].column == column) { $scope.sort.splice(i, 1); break; } } $scope.sort.splice(0, 0, { column: column, ascend: true }); } Resort(); }
  $scope.InboxRowClass = function (row) {
    return (row === $scope.selectedMessage) ? 'row-selected' : 'not-selected';
  }
  $scope.GetCountMessage = function () {
    if ($scope.numCanGet == undefined) return '';
    return ($scope.numCanGet != 1) ? 'There are ' + $scope.numCanGet + ' messages available.' : 'There is 1 message available';
  }
  $scope.ApproveCountMessage = function () {
    if ($scope.numCanApprove == undefined) return '';
    return ($scope.numCanApprove != 1) ? 'There are ' + $scope.numCanApprove + ' messages to approve.' : 'There is 1 message to approve';
  }
  $scope.responsesSegment = [];
  $scope.responsesAgent = [];
  function WantSelectMessage(id) {
    var row = null;
    var inbox = null;
    ForArray(myqueue.boxTabs, function (tab) {
      if (!row) {
        row = LookupTable(tab.messages, id, 'id');
        if (row) inbox = tab;
      }
    });
    if (row) {
      $scope.currentBox = inbox;
      $scope.SelectMessage(row);
      return;
    }
    $scope.searchMessageID = id;
  }
  $scope.SelectMessage = function (message) {
    $scope.selectedMessage = message;
    $scope.searchMessageID = null;
    if (message == null || (myqueue.message && myqueue.message.customerID != message.customerID)) {
      myqueue.custInfo = undefined;
      myqueue.history = undefined;
      $scope.boxWithSelection = null;
    }
    myqueue.message = message;
    myqueue.detailData = undefined;
    $scope.boxWithSelection = $scope.currentBox;
    $scope.$broadcast('selected-message', message);
  }
  $scope.$on('select-no-message', function (event) {
    $scope.SelectMessage(null);
  });
  $scope.$on('updated-row', function (event, interaction) {
    if (interaction) {
      var row = interaction.row;
      ForArray($scope.boxTabs, function (tab) {
        TableExtendItem(tab.messages, 'id', row);
      });
    }
  });
  $scope.$on('updated-counts', function (event, numCanGet, numCanApprove) {
    if (numCanGet !== undefined) $scope.numCanGet = numCanGet;
    if (numCanApprove !== undefined) $scope.numCanApprove = numCanApprove;
  });
  $scope.websyncInbox = websync.FeedbackObject($scope);
  if (iservice.loggedIn.contactID) {
    $scope.Unsubscribe = websync.subscribe('/agent/' + iservice.loggedIn.tenantID + '/' + iservice.loggedIn.contactID, AgentMessageReceive, $scope.websyncInbox);
  }
  function AgentMessageReceive(msg) {
    var message = msg.getData();
    if (message.inboxUpdate != null) {
      AgentInboxMessage(message.inboxUpdate);
    }
  }
  function AgentInboxMessage(inboxUpdate) {
    if (inboxUpdate.assignedToID == iservice.loggedIn.contactID) {
      var row = null;
      ForArray(myqueue.boxTabs, function (tab) {
        if (!row) row = TableRemoveItem(tab.messages, 'id', inboxUpdate.id);
      });
      if (row) {
        angular.extend(row, inboxUpdate);
      }
      else {
        row = inboxUpdate;
      }
      var plugin = myqueue.FindPlugin(row);
      row.plugin = plugin;
      var inbox = myqueue.inboxes[plugin.inboxName];
      if (inbox) {
        inbox.messages.push(row);
        inbox.messages.sort(SortFunction($scope.sort));
        if ($scope.searchMessageID == row.id) {
          $scope.currentBox = inbox;
          $scope.SelectMessage(row);
        }
      }
    }
    else {
      ForArray($scope.boxTabs, function (tab) {
        TableRemoveItem(tab.messages, 'id', inboxUpdate.id);
      });
    }
  }
  $scope.$on("$destroy", function () {
    if ($scope.Unsubscribe) {
      $scope.Unsubscribe();
      $scope.Unsubscribe = null;
    }
  });
}])
.controller('ControllerMessageQueueMyQueueDetails', ['$scope', '$http', '$rootScope', '$timeout', function ($scope, $http, $rootScope, $timeout) {
  SetIDPrefix($scope, 'Details');
  $scope.answerIdPrefix = $scope.idPrefix;
  InstallControllerSort($scope, { column: 'dateObj', ascend: false });
  InstallControllerPicker($scope, $http, function () { return $scope.draftTab == 'draft'; });
  var myqueue = iservice.messagequeue.myqueue;
  $scope.autoSave = SetupAutoSave();
  if (myqueue.detailData) DetailData(myqueue.detailData);
  else SelectedMessage(myqueue.message);
  $scope.$on('selected-message', function (event, message) {
    SelectedMessage(message);
  });
  $scope.draftTab = 'draft';
  $scope.DraftTabClass = function (tab) {
    if (tab == $scope.draftTab) return '';
    else return 'nglink';
  }
  function SelectedMessage(message) {
    myqueue.answer = { isMassUpdate: false };
    myqueue.answerData = {};
    myqueue.answerDetails = {};
    myqueue.stockSections = [];
    $scope.uploads = [];
    $scope.draftTab = 'draft';
    if (!message) return;
    myqueue.DetailsRunning = iservice.MyQueueDetails($http, message.id, message.customerID, message.segmentID, function (data) {
      myqueue.detailData = data;
      myqueue.answerDetails = data.details;
      iservice.SanitizeHistoryRows(data.history);
      myqueue.removedAttachments = [];
      iservice.SanitizeAnswerData(data.details, myqueue.answer, myqueue.answerData, myqueue.removedAttachments);
      data.mailboxes.splice(0, 0, { id: '', name: '-- Default Mailbox --' });
      myqueue.answer.mailboxID = '';
      myqueue.answer.destEmail = data.details.fromAddress;
      data.history[0].children = undefined;
      DetailData(data);
    });
  }
  function DetailData(data) {
    $scope.answer = myqueue.answer;
    $scope.answerDetails = myqueue.answerDetails;
    $scope.answerData = myqueue.answerData;
    myqueue.answerData.finalHtml = null;
    myqueue.answerData.finalPlain = null;
    $scope.NewRows(data.history);
    $scope.stockSections = [{ name: 'Segment Responses', responses: data.responsesSegment }, { name: 'Agent Responses', responses: data.responsesAgent}];
    $scope.mailboxes = data.mailboxes;
    $scope.addresses = data.details.customerAddresses;
    $scope.uploads = [];
    $scope.autoSave.Watch();
  }
  $scope.ClearAutoSave = function () {
    $scope.autoSaveMessage = null;
  }
  $scope.FilterChild = function (child) {
    if (child.type == 'Agent Notification' || child.type == 'Auto Response' || child.type == 'Alert' || child.type == 'External Agent Notification' || child.type == 'Contact Creation') {
      return null;
    }
    return child;
  }
  $scope.ApplyReCC = function () {
    $scope.answer.destCC = $scope.answerDetails.reCC;
  }
  $scope.AddFile = function () {
    $scope.uploads.push({});
  }
  function InteractionUpdate(interaction) {
    if (!interaction || !interaction.row || !interaction.details) return;
    iservice.SanitizeHistoryRow(interaction.row);
    iservice.SanitizeHistoryDetails(interaction.details);
    $rootScope.$broadcast('updated-row', interaction);
  }
  function RemovingAnswerSuccess(data) {
    $scope.$emit('select-no-message');
    InteractionUpdate(data.thread);
    InteractionUpdate(data.question);
    InteractionUpdate(data.response);
    $scope.$emit('updated-counts', data.numCanGet, data.numCanApprove);
  }
  function UpdatingAnswerSuccess(data)
  {
    $timeout(function ()
    {
      myqueue.removedAttachments = [];
      iservice.SanitizeHistoryRow(data.row);
      iservice.SanitizeAnswerData(data.details, myqueue.answer, myqueue.answerData, myqueue.removedAttachments);
      angular.extend(myqueue.answerDetails, data.details);
      $scope.$emit('updated-counts', data.numCanGet, data.numCanApprove);
      InteractionUpdate(data.response);
      $scope.answer = myqueue.answer;
      $scope.answerDetails = myqueue.answerDetails;
      $scope.answerData = myqueue.answerData;
      $scope.uploads = [];
    }, 100);
  }
  function FinalizeSuccess(data) {
    UpdatingAnswerSuccess(data);
    $scope.draftTab = $scope.finalizeTab;
    myqueue.answerData.finalHtml = data.details.responseFinalHtml;
    myqueue.answerData.finalPlain = data.details.responseFinalPlain;
  }
  function MyQueueAction(func, successMessageArray, successFunc) {
    return function (idPrefix, answerDetails, answer, answerData) {
      $scope.autoSave.Cancel();
      $scope.$broadcast('close-menu', null);
      $scope.answerErrors = [];
      $scope.answerSuccess = [];
      for (var i = 0; i < answerData.propertySections.length; i++) {
        var section = answerData.propertySections[i];
        answer[section.memberName] = iservice.CollectProperties(section.groups);
      }
      var displayedBodyHtml = answer.bodyHtml;
      iservice.ReplaceInlineImageRefrences(answer, 'bodyHtml', myqueue.removedAttachments);
      myqueue.DetailsRunning = func($scope, idPrefix, [answerDetails.id], answer, answerDetails.id, function (data) {
        if (data && data.errors && data.errors.length) {
          $scope.answerErrors = data.errors;
          answer.bodyHtml = displayedBodyHtml;
          return;
        }
        $scope.answerSuccess = successMessageArray;
        successFunc(data);
      });
    }
  }
  $scope.SaveResolve = MyQueueAction(iservice.SaveResolve, ['Question Resolved.'], RemovingAnswerSuccess);
  $scope.Unqueue = MyQueueAction(iservice.Unqueue, ['Question Unassigned.'], RemovingAnswerSuccess);
  var ChangeTopic = MyQueueAction(iservice.ChangeTopic, ['Topic Changed.'], UpdatingAnswerSuccess);
  $scope.ChangeTopic = function (idPrefix, answerDetails, answer, answerData, topicID) {
    answer.changeTopicID = topicID;
    ChangeTopic(idPrefix, answerDetails, answer, answerData);
  }
  $scope.MarkSpam = MyQueueAction(iservice.MarkSpam, ['Question marked as Spam.'], RemovingAnswerSuccess);
  $scope.QAReject = MyQueueAction(iservice.QAReject, ['Answer reassigned to agent.'], RemovingAnswerSuccess);
  $scope.SaveDraft = MyQueueAction(iservice.SaveDraft, ['Draft Saved.'], UpdatingAnswerSuccess);
  $scope.Assign = MyQueueAction(iservice.Assign, ['Question Assigned to Agent.'], RemovingAnswerSuccess);
  $scope.ChangeSegment = MyQueueAction(iservice.ChangeSegment, ['Segment Changed.'], RemovingAnswerSuccess);
  var ForwardExternal = MyQueueAction(iservice.ForwardExternal, ['Forwared to External Agent.'], RemovingAnswerSuccess);
  $scope.ForwardExternal = function (idPrefix, answerDetails, answer, answerData) {
    var protocol = window.location.protocol;
    var host = window.location.host;
    var pathname = window.location.pathname;
    var dirname = pathname.substring(0, pathname.lastIndexOf('/') + 1);
    answer.forwardExternalURL = protocol + '//' + host + dirname + rootPath + 'Forward.aspx?id=$value -forwardexternal(guid)$';
    ForwardExternal(idPrefix, answerDetails, answer, answerData);
  }
  var SaveNote = MyQueueAction(iservice.SaveNote, ['Note Saved.'], UpdatingAnswerSuccess);
  $scope.SaveNote = function (idPrefix, answerDetails, answer, answerData, isPublic) {
    answer.isPublic = isPublic;
    SaveNote(idPrefix, answerDetails, answer, answerData);
  }
  var SendLeaveOpen = MyQueueAction(iservice.SendLeaveOpen, ['Answer Sent.'], UpdatingAnswerSuccess);
  var Send = MyQueueAction(iservice.Send, ['Answer Sent.'], RemovingAnswerSuccess);
  $scope.Send = function (idPrefix, answerDetails, answer, answerData) {
    answer.notificationID = '';
    if (answer.leaveOpen) {
      SendLeaveOpen(idPrefix, answerDetails, answer, answerData);
    }
    else {
      Send(idPrefix, answerDetails, answer, answerData);
    }
  }
  var SendSecureLeaveOpen = MyQueueAction(iservice.SendLeaveOpen, ['Secure Answer Sent.'], UpdatingAnswerSuccess);
  var SendSecure = MyQueueAction(iservice.Send, ['Secure Answer Sent.'], RemovingAnswerSuccess);
  $scope.SendSecure = function (idPrefix, answerDetails, answer, answerData) {
    if (answer.leaveOpen) {
      SendSecureLeaveOpen(idPrefix, answerDetails, answer, answerData);
    }
    else {
      SendSecure(idPrefix, answerDetails, answer, answerData);
    }
  }
  var ShowFinalize = MyQueueAction(iservice.SaveDraft, [], FinalizeSuccess);
  $scope.ShowFinalHtml = function (idPrefix, answerDetails, answer, answerData) {
    $scope.finalizeTab = 'html';
    if (myqueue.answerData.finalHtml) {
      $scope.draftTab = $scope.finalizeTab;
      return;
    }
    ShowFinalize(idPrefix, answerDetails, answer, answerData);
  }
  $scope.ShowFinalPlain = function (idPrefix, answerDetails, answer, answerData) {
    $scope.finalizeTab = 'plain';
    if (myqueue.answerData.finalPlain) {
      $scope.draftTab = $scope.finalizeTab;
      return;
    }
    ShowFinalize(idPrefix, answerDetails, answer, answerData);
  }
  $scope.ShowDraft = function (idPrefix, answerDetails, answer, answerData) {
    $scope.draftTab = 'draft';
    myqueue.answerData.finalHtml = null;
    myqueue.answerData.finalPlain = null;
  }
  function SetupAutoSave() {
    var autoSave = {};
    autoSave.Cancel = function () {
      autoSave.message = null;
      if (autoSave.timeout) {
        $timeout.cancel(autoSave.timeout);
        autoSave.timeout = null;
      }
    };
    autoSave.Watch = function () {
      autoSave.Cancel();
      if (autoSave.cancelWatch) {
        autoSave.cancelWatch[0](); autoSave.cancelWatch[1](); autoSave.cancelWatch[2]();
        autoSave.cancelWatch = null;
      }
      autoSave.cancelWatch =
      [ $scope.$watch('answer.bodyHtml', autoSave.UserChange, true),
        $scope.$watch('answer.note', autoSave.UserChange, true), 
        $scope.$watch('answerData.propertySections', autoSave.UserChange, true) ];
    };
    autoSave.UserChange = function (newValue, oldValue) {
      if (angular.equals(newValue, oldValue)) return;
      if (newValue === oldValue) return;
      autoSave.Cancel();
      autoSave.id = myqueue.answerDetails.id;
      autoSave.timeout = $timeout(autoSave.Save, 10000);
    };
    autoSave.Save = function () {
      if (!autoSave.timeout) return;
      if (!myqueue.answerDetails || !myqueue.answerDetails.id || autoSave.id != myqueue.answerDetails.id) return;
      var answer = {};
      answer.isMassUpdate = false;
      for (var i = 0; i < $scope.answerData.propertySections.length; i++) {
        var section = $scope.answerData.propertySections[i];
        answer[section.memberName] = iservice.CollectProperties(section.groups);
      }
      answer.subject = $scope.answer.subject;
      answer.bodyHtml = $scope.answer.bodyHtml;
      iservice.ReplaceInlineImageRefrences(answer, 'bodyHtml', myqueue.removedAttachments);
      answer.note = $scope.answer.note;
      answer.attachments = angular.copy($scope.answer.attachments);
      autoSave.Saving = iservice.AutoSave($http, answer, $scope.answerDetails.id, function (data) {
        if (data.errors && data.errors.length) {
          autoSave.message = 'Auto Save failed.';
        }
        else autoSave.message = 'Draft Saved';
        autoSave.timeout = $timeout(function () {
          autoSave.message = null;
        }, 5000);
      });
    };
    return autoSave;
  }
} ]);

ControllerWithID(iServiceMessageQueue, 'ControllerMyQueueActionTopic', 'Topic');

iServiceMessageQueue.controller('ControllerMessageQueueMyQueueCustInfo', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
  SetIDPrefix($scope, 'CustInfo');
  var myqueue = iservice.messagequeue.myqueue;
  if (myqueue.custInfo) CustInfoData(myqueue.custInfo);
  else SelectedMessage(myqueue.message);
  $scope.$on('selected-message', function (event, message) {
    SelectedMessage(message);
  });
  function SelectedMessage(message) {
    SegmentData();
    myqueue.DetailsRunning = iservice.CustInfoDetails($http, message.customerID, function (data) {
      data.customerID = message.customerID;
      myqueue.custInfo = data;
      iservice.SanitizePropertyGroups(data.properties);
      for (var s = 0; s < data.properties.length; s++) {
        var segment = data.properties[s];
        segment.leftProperties = [];
        segment.rightProperties = [];
        var totalHeight = 0;
        for (var p = 0; p < segment.properties.length; p++) {
          var prop = segment.properties[p];
          var height = prop.values.length * (prop.isMultiLine ? 2 : 1);
          totalHeight += height;
        }
        var leftHeight = 0;
        for (var p = 0; p < segment.properties.length; p++) {
          var prop = segment.properties[p];
          if (leftHeight <= totalHeight / 2) segment.leftProperties.push(prop);
          else segment.rightProperties.push(prop);
          var height = prop.values.length * (prop.isMultiLine ? 2 : 1);
          leftHeight += height;
        }
      }
      CustInfoData(data);
    });
  }
  function CustInfoData(data) {
    $scope.membership = data.membership;
    $scope.segments = data.properties;
  }
  function SegmentData() {
    $scope.segmentLists = [];
    for (var s = 0; s < iservice.tenant.segments.list.length; s++) {
      var segment = iservice.tenant.segments.list[s];
      $scope.segmentLists.push({ id: segment.id, name: segment.name, hidden: segment.hidden });
    }
  }
  $scope.SaveClick = function () {
    var properties = {
      properties: iservice.CollectProperties($scope.segments),
      setLogins: true,
      logins: iservice.CollectLogins($scope.segments)
    };
    myqueue.DetailsRunning = iservice.CustInfoSetDetails($http, myqueue.custInfo.customerID, properties, $scope.membership, function (data) {
      if (data.errors && data.errors.length) return;
      iservice.success = ['Saved Successfully'];
    }, $scope.idPrefix);
  }
  iservice.AdminList($http, 'ListSeg', ['segments'], function (data) {
    SegmentData();
  });
}])
.controller('ControllerMessageQueueMyQueueHistory', ['$scope', '$http', function ($scope, $http) {
  SetIDPrefix($scope, 'History');
  InstallControllerSortPaged($scope, { column: 'date', ascend: false }, 100);
  var myqueue = iservice.messagequeue.myqueue;
  if (myqueue.history) HistoryData(myqueue.history);
  else SelectedMessage(myqueue.message);
  $scope.$on('selected-message', function (event, message) {
    SelectedMessage(message);
  });
  function SelectedMessage(message) {
    myqueue.DetailsRunning = iservice.HistoryThreads($http, message.customerID, function (data) {
      myqueue.history = data;
      iservice.SanitizeHistoryRows(data.history);
      for (var i = 0; i < data.history.length; i++) data.history[i].children = undefined;
      HistoryData(data);
    });
  }
  function HistoryData(data) {
    $scope.NewRows(data.history);
  }
}])
.controller('ControllerMyQueueHistory', ['$scope', '$http', function ($scope, $http) {
  SetIDPrefix($scope, 'History');
  InstallControllerSortPaged($scope, { column: 'date', ascend: false }, 100);
  $scope.HistoryThreadsRunning = iservice.HistoryThreads($http, historyParams.contactID, function (data) {
    iservice.SanitizeHistoryRows(data.history);
    for (var i = 0; i < data.history.length; i++) data.history[i].children = undefined;
    $scope.NewRows(data.history);
  });
}])
.controller('ControllerMessageQueueManageChat', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
  SetIDPrefix($scope, 'ManageChat');
  iservice.pageName = '#/managechat';
  var messagequeue = iservice.messagequeue;
  messagequeue.currentTab = messagequeue.tabs.managechat;
  $scope.sort = [{ column: 'refNum', ascend: true }];
  $scope.chatList = [];
  var updateTimer = $timeout(UpdateWait, 1000);
  $scope.channels = [];
  $scope.GetListRunning = iservice.ManageChatList($http, function (data) {
    $scope.chatList = data;
    for (var i = 0, len = data.length; i < len; i++) {
      InitChat(data[i]);
    }
    Resort(); 
  });
  function InitChat(chat) {
    chat.startMs = (new Date()).valueOf();
    chat.timeWait = HourMinSec(chat.elapsedWaitMs / 1000);
    chat.timeChat = HourMinSec(chat.elapsedChatMs / 1000); 
  }
  $scope.NoChats = function () { return ($scope.GetListRunning && !$scope.GetListRunning()) && $scope.chatList && $scope.chatList.length < 1; }
  $scope.SortDirectionClass = function (column) {
    return (!$scope.sort || $scope.sort[0].column != column) ? 'none' : ($scope.sort[0].ascend ? 'sort-direction-ascend' : 'sort-direction-descend'); }
  $scope.SortClick = function (column) { if ($scope.sort[0].column == column) { $scope.sort[0].ascend = !$scope.sort[0].ascend; } else { for (var i = 0, len = $scope.sort.length; i < len; i++) { if ($scope.sort[i].column == column) { $scope.sort.splice(i, 1); break; } } $scope.sort.splice(0, 0, { column: column, ascend: true }); } Resort(); $scope.SelectPage($scope.curPage); }
  function Resort() { $scope.chatList.sort(SortFunction($scope.sort)); }
  function SuperviseUpdate(chat) {
    InitChat(chat);
    var existing = LookupTable($scope.chatList, chat.refNum, "refNum");
    if (existing) { chat.details = existing.details; }
    UpdateTable($scope.chatList, chat, 'refNum');
    if (chat.isDeleted && chat.details && chat.details.Unsubscribe) {
      chat.details.Unsubscribe();
    }
    Resort();
  }
  for (var i = 0, len = iservice.loggedIn.accessibleSegments.length; i < len; i++) {
    var segmentID = iservice.loggedIn.accessibleSegments[i];
    var feedback = websync.FeedbackObject($scope);
    $scope.channels.push(feedback);
    feedback.Unsubscribe = websync.subscribe('/supervisechats/' + iservice.loggedIn.tenantID + '/' + segmentID, function (e) {
      var chat = e.getData();
      SuperviseUpdate(chat); 
    }, feedback); 
  }
  $scope.RowExpandClass = function (chat) { return (chat.details) ? 'list-contract' : 'list-expand'; }
  function AgentChatMessage(e) {
    details.chatData.chatLines.push(e.getData());
  }
  $scope.RowExpand = function (chat) {
    if (Running($scope.RowExpandRunning)) return;
    if (chat.details) {
      chat.details.Unsubscribe();
      chat.details = undefined;
      return;
    }
    $scope.RowExpandRunning = iservice.ManageChatDetails($http, chat.refNum, chat.contactID, function (data) {
      var details = {};
      chat.details = details;
      details.custDetails = data.custDetails;
      details.chatData = data.chatData;
      details.feedback = websync.FeedbackObject($scope);
      details.Unsubscribe = websync.subscribe('/agentchat/' + iservice.loggedIn.tenantID + '/' + chat.refNum, function (e) {
        AgentChatMessage(e);
      }, details.feedback, $scope);
    }); 
  }
  $scope.EndChat = function (chat) {
    $scope.ChatEndRunning = iservice.ChatEnd($http, chat.refNum, function (data) {
    }, $scope.idPrefix); 
  }
  $scope.EndChatTitle = function () { return 'End Chat'; }
  $scope.ShowForward = function (chat) { return chat.details && chat.details.openMenu == 'forward'; }
  $scope.OpenForward = function (chat) {
    if (chat.details.openMenu) {
      chat.details.openMenu = null;
      return;
    }
    chat.details.openMenu = 'forward';
    chat.details.reassignAgents = null; 
  }
  $scope.Unqueue = function (chat) {
    chat.details.UnqueueRunning = iservice.ChatUnqueue($http, chat.refNum, function (data) {
      chat.details.openMenu = null;
    }, $scope.idPrefix); 
  }
  $scope.AssignItemHeader = function (chat) { return chat.details && chat.details.reassignAgents ? 'menu-item-opened' : ''; }
  $scope.AssignLinkClass = function (chat) { return chat.details && (chat.details.reassignAgents || Running(chat.details.GetAgentsRunning)) ? '' : 'nglink'; }
  $scope.AssignGetAgents = function (chat) {
    chat.details.GetAgentsRunning = iservice.ManageChatAgentList($http, chat.refNum, function (data) {
      chat.details.reassignAgents = data;
      chat.details.GetAgentsRunning = undefined;
    }); 
  }
  $scope.AgentLinkClass = function (agent) { return agent.isAvailable ? 'nglink' : ''; }
  $scope.AssignTo = function (chat, agent) {
    chat.details.AssignToRunning = iservice.ChatAssignTo($http, chat.refNum, agent.contactID, function (data) {
      chat.details.openMenu = null;
    }, $scope.idPrefix);
  }
  $scope.ShowTopic = function (chat) { return chat.details && chat.details.openMenu == 'topic' && chat.details.topicsList && chat.details.topicsList.length; }
  $scope.OpenTopic = function (chat) {
    if (chat.details.openMenu == 'topic') {
      chat.details.openMenu = null;
      return;
    }
    chat.details.openMenu = 'topic';
    chat.details.topicsList = null;
    chat.details.OpenTopicRunning = iservice.ChatTopicList($http, function (data) {
      chat.details.topicsList = data;
      var indents = { '': '' };
      for (var i = 0, len = data.length; i < len; i++) {
        var indent = (data[i].parentid == '') ? '' : (indents[data[i].parentid] + '    ');
        indents[data[i].topicID] = indent;
        data[i].indent = indent;
      }
    }); 
  }
  $scope.TopicLinkClass = function (topic) { return topic.isAvailable ? 'nglink' : ''; }
  $scope.ChangeTopic = function (chat, topic) {
    if (!topic.isAvailable) return;
    chat.details.ChangeTopicRunning = iservice.ChatChangeTopic($http, chat.refNum, topic.topicID, function (data) {
      chat.details.openMenu = null;
    }, $scope.idPrefix);
  }
  function UpdateWait() {
    var now = (new Date()).valueOf();
    for (var i = 0, len = $scope.chatList.length; i < len; i++) {
      var chat = $scope.chatList[i];
      var sinceMs = now - chat.startMs;
      if (chat.isWaiting) {
        chat.timeWait = HourMinSec((chat.elapsedWaitMs + sinceMs) / 1000);
      }
      else {
        chat.timeChat = HourMinSec((chat.elapsedChatMs + sinceMs) / 1000);
      }
    }
    updateTimer = $timeout(UpdateWait, 1000); 
  }
  $scope.$on("$destroy", function () {
    for (var i = 0; i < $scope.channels.length; i++) {
      $scope.channels[i].Unsubscribe(); 
    }
    if (updateTimer) {
      $timeout.cancel(updateTimer); 
    }
    for (var i = 0; i < $scope.chatList.length; i++) {
      var chat = $scope.chatList[i];
      if (chat.details) {
        chat.details.Unsubscribe();
        chat.details = undefined;
      } 
    }
  });
}])
.controller('ControllerMessageQueueSearch', ['$scope', '$http', '$timeout', '$route', function ($scope, $http, $timeout, $route) {
  SetIDPrefix($scope, 'Search');
  iservice.pageName = '#/search';
  var messagequeue = iservice.messagequeue;
  messagequeue.currentTab = messagequeue.tabs.search;
  var maxFields = 5;
  var rowCount = 50;
  $scope.results = undefined;
  $scope.searchGroups = [[{ where: 'anywhere', field: 'subject', text: ''}]];
  $scope.sort = [{ column: 'date', ascend: true}];
  var currentSearch = {};
  if ($route.current.params.f1 !== undefined) {
    $scope.searchGroups = [[]];
    if ($route.current.params.before) {
      currentSearch.before = $route.current.params.before;
      $scope.limitDateBefore = $route.current.params.before;
    }
    if ($route.current.params.after) {
      currentSearch.after = $route.current.params.after;
      $scope.limitDateAfter = $route.current.params.after;
    }
    var group = $scope.searchGroups[0];
    for (var i = 1; i <= maxFields; i++) {
      var w = $route.current.params['w' + i], f = $route.current.params['f' + i], t = $route.current.params['t' + i];
      var field = { where: w !== undefined ? w : 'anywhere', field: f !== undefined ? f : 'subject', text: t !== undefined ? t : '' };
      field.where = (field.where.startsWith('ent') ? 'entire' : (field.where.startsWith('s') ? 'start' : (field.where.startsWith('end') ? 'end' : 'anywhere')));
      group.push(field);
      var op = $route.current.params['op' + i];
      if (op === undefined || i == maxFields) {
        break;
      }
      if (op.startsWith('a')) {
        group = []; $scope.searchGroups.push(group);
      }
      currentSearch['w' + i] = w;
      currentSearch['f' + i] = f;
      currentSearch['t' + i] = t;
      currentSearch['op' + i] = op;
    }
    DoSearch();
  }
  $scope.CanRemove = function (field) { return ($scope.searchGroups.length === 1 && $scope.searchGroups[0].length === 1) ? false : true; }
  $scope.RemoveField = function (field) { var groups = []; for (var g = 0; g < $scope.searchGroups.length; g++) { var group = null; for (var f = 0, len = $scope.searchGroups[g].length; f < len; f++) { var cur = $scope.searchGroups[g][f]; if (cur !== field) { if (!group) { group = []; } group.push(cur); } } if (group) { groups.push(group); } } $scope.searchGroups = groups; }
  $scope.CanAdd = function () { var count = 0; for (var i = 0, len = $scope.searchGroups.length; i < len; i++) { count += $scope.searchGroups[i].length; } return count < maxFields; }
  $scope.MergeGroup = function (group) { var groups = []; for (var i = 0, len = $scope.searchGroups.length; i < len; i++) { var cur = $scope.searchGroups[i]; groups.push(cur); if (cur == group) { var next = $scope.searchGroups[i + 1]; for (var f = 0; f < next.length; f++) { cur.push(next[f]); } i++; } } $scope.searchGroups = groups; }
  $scope.SplitGroup = function (group, field) { var groups = []; for (var i = 0, len = $scope.searchGroups.length; i < len; i++) { var cur = $scope.searchGroups[i]; if (cur !== group) { groups.push(cur); } else { var partial = []; groups.push(partial); for (var f = 0; f < group.length; f++) { partial.push(group[f]); if (group[f] === field) { partial = []; groups.push(partial); } } } } $scope.searchGroups = groups; }
  $scope.AddGroup = function () { if (!$scope.CanAdd()) return; $scope.searchGroups.push([{ where: 'anywhere', field: 'subject', text: ''}]); }
  $scope.ShowSearchString = function (field) { return !$scope.ShowSearchTopic(field) && !$scope.ShowSearchNone(field) && !$scope.ShowSearchStatus(field) && !$scope.ShowSearchType(field) && !$scope.ShowSearchAgent(field); }
  $scope.ShowSearchTopic = function (field) { return field.field == 'topic'; }
  $scope.ShowSearchNone = function (field) { return field.field == '->threads'; }
  $scope.ShowSearchStatus = function (field) { return field.field == 'status'; }
  $scope.ShowSearchType = function (field) { return field.field == 'type'; }
  $scope.ShowSearchAgent = function (field) { return field.field == 'resolve' || field.field == 'assign'; }
  $scope.Search = function () {
    var query = {}, fieldNum = 1, lastOp;
    if ($scope.limitDateBefore) query.before = moment.utc($scope.limitDateBefore).format('YYYY-MM-DD');
    if ($scope.limitDateAfter) query.after = moment.utc($scope.limitDateAfter).format('YYYY-MM-DD');
    for (var i = 0, groups = $scope.searchGroups.length; i < groups; i++) {
      var group = $scope.searchGroups[i];
      for (var j = 0, fields = group.length; j < fields; j++) {
        var field = group[j];
        if (lastOp) {
          query['op' + (fieldNum - 1)] = lastOp;
        }
        query['w' + fieldNum] = field.where;
        query['f' + fieldNum] = field.field;
        query['t' + fieldNum] = field.text;
        lastOp = 'or';
        fieldNum++;
      }
      lastOp = 'and';
    }
    if (angular.equals(currentSearch, query)) { DoSearch(); }
    else { ChangeLocation(query); }
  }
  function DoSearch() {
    var param = { groups: [], timeStart: null, timeEnd: null };
    if ($scope.limitDateAfter) {
      param.timeStart = '/Date(' + moment.utc($scope.limitDateAfter).valueOf() + ')/';
    }
    if ($scope.limitDateBefore) {
      param.timeEnd = '/Date(' + (moment.utc($scope.limitDateBefore).valueOf() + 86399999) + ')/';
    }
    for (var g = 0, numGroup = $scope.searchGroups.length; g < numGroup; g++) {
      var group = { fields: [] };
      param.groups.push(group);
      for (var f = 0, numField = $scope.searchGroups[g].length; f < numField; f++) {
        var field = $scope.searchGroups[g][f];
        group.fields.push({ where: field.where, fieldID: field.field, searchString: field.text });
      }
    }
    param.groups.push({ fields: [{ where: "entire", fieldID: "not-findanswers", searchString: ""}] });
    $scope.errors = null;
    $scope.searched = true;
    $scope.SearchRunning = iservice.MessageSearch($http, param, 0, 1000, null, function (data) {
      $scope.errors = data.errors;
      $scope.results = data.interactions;
      $scope.count = data.resultCount;
      $scope.pageNums = [1];
      for (var page = 2, total = rowCount; total < data.resultCount; page++, total += rowCount) {
        $scope.pageNums.push(page);
      }
      iservice.SanitizeHistoryRows($scope.results);
      $scope.sort = [{ column: 'date', ascend: true}];
      Resort();
      $scope.SelectPage(1);
    });
  }
  $scope.SelectPage = function (num) { $scope.curPage = num; $scope.pageRows = []; for (var i = 0, src = (num - 1) * rowCount; i < rowCount && src < $scope.results.length; i++, src++) { $scope.pageRows.push($scope.results[src]); } }
  $scope.PageLinkClass = function (num) { return (num == $scope.curPage) ? '' : 'nglink'; }
  $scope.SearchTitle = function () { return "Search"; }
  $scope.ShowResults = function () { return $scope.results; }
  $scope.NoResults = function () { return $scope.searched && $scope.results && $scope.results.length < 1; }
  $scope.RowExpandClass = function (row) { return (row.details) ? 'list-contract' : 'list-expand'; }
  $scope.RowExpand = function (row) {
    if (Running($scope.RowExpandRunning)) return;
    if (row.details) {
      row.details = undefined; return;
    }
    $scope.RowExpandRunning = iservice.HistoryDetails($http, row.id, function (data) {
      row.details = data;
      iservice.SanitizeHistoryDetails(data);
    });
  }
  $scope.RowShowDetails = function (row) { 
    return row.details;
  }
  $scope.MessageDetailsUrl = function (row) {
    if (row.details) return 'interaction-details.html';
    else return '';
  }
  $scope.ShowFieldSelect = function (property) { return property.valueChoices && property.valueChoices.length > 0; }
  $scope.ShowFieldText = function (property) { return (!property.valueChoices || property.valueChoices.length < 1) && !property.isDate && !property.isMultiLine; }
  $scope.SortDirectionClass = function (column) { return (!$scope.sort || $scope.sort[0].column != column) ? 'none' : ($scope.sort[0].ascend ? 'sort-direction-ascend' : 'sort-direction-descend'); }
  $scope.SortClick = function (column) { if ($scope.sort[0].column == column) { $scope.sort[0].ascend = !$scope.sort[0].ascend; } else { for (var i = 0, len = $scope.sort.length; i < len; i++) { if ($scope.sort[i].column == column) { $scope.sort.splice(i, 1); break; } } $scope.sort.splice(0, 0, { column: column, ascend: true }); } Resort(); $scope.SelectPage($scope.curPage); }
  function Resort() { $scope.results.sort(SortFunction($scope.sort)); }
  $scope.$on('updated-row', function (event, interaction) {
    var results = $scope.results;
    if (results && results.length) for (var t = 0; t < results.length; t++) {
      var result = results[t];
      if (result.id == interaction.row.id) {
        angular.extend(result, interaction.row);
        if (!result.assignedToID) {
          result.agentName = 'unassigned';
        }
      }
    }
  });
}]);

ControllerWithID(iServiceMessageQueue, 'ControllerInteractionSearchField', 'Field');
ControllerWithID(iServiceMessageQueue, 'ControllerManageChatRow', 'Row');
ControllerWithID(iServiceMessageQueue, 'ControllerManageMessageRow', 'Row');
ControllerWithID(iServiceMessageQueue, 'ControllerManageMessageTopic', 'Topic');

iServiceMessageQueue.controller('ControllerMassUpdateAnswer', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
  SetIDPrefix($scope, 'MassUpdate');
  $scope.answerIdPrefix = $scope.idPrefix;
}]);

iServiceMessageQueue.controller('ControllerMessageQueueManageMessage', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
  SetIDPrefix($scope, 'ManageMessage');
  iservice.pageName = '#/managemsg';
  var messagequeue = iservice.messagequeue;
  messagequeue.currentTab = messagequeue.tabs.managemessage;
  var managemessage = { recursive: false };
  messagequeue.managemessage = managemessage;
  $scope.managemessage = managemessage;
  var topicList = {};
  managemessage.topicList = topicList;
  $scope.topicList = topicList;
  var messageList = {};
  managemessage.messageList = messageList;
  $scope.messageList = messageList;
  InstallControllerSortTree(topicList, { column: 'name', ascend: true }, 'id', 'parentID');
  InstallControllerSortPaged(messageList, { column: 'date', ascend: false }, 100);
  $scope.countCol = 'count';
  var search = { groups: [{ fields: [{ fieldID: 'status', searchString: 'Unassigned', where: 'anywhere' },
                                       { fieldID: 'status', searchString: 'Queued', where: 'anywhere'}]
  },
                           { fields: [{ fieldID: 'not-findanswers', searchString: '', where: 'entire'}]}]
  };
  var stockResponsesSegments = {};
  var stockResponsesAgent = [];
  var mailboxes = {};
  var topicByID = {};
  var messageByID = {};
  $scope.Loading = iservice.ManageMessageTopics($http, search, function (data) {
    stockResponsesSegments = data.responsesAll;
    stockResponsesAgent = data.responsesAgent;
    mailboxes = data.mailboxes;
    var topics = data.topics;
    topicList.NewRows(topics);
    for (var i = 0; i < topics.length; i++) {
      var topic = topics[i];
      iservice.SanitizePropertyGroups(topic.properties);
      topic.messages = [];
      topicByID[topic.id] = topic;
      if (topic.parentID == '') {
        topic.name = topic.prefix + topic.name;
      }
      else {
        topic.indent = topic.prefix.replace(/\./g, '&nbsp;');
      }
    }
    var messages = data.interactions;
    iservice.SanitizeHistoryRows(messages);
    for (var i = 0; i < messages.length; i++) {
      var message = messages[i];
      messageByID[message.id] = message;
      if (!message.assignedToID) {
        message.agentName = 'unassigned';
      }
      var topic = topicByID[message.topicID];
      if (topic) {
        topic.messages.push(message);
      }
    }
    GetCounts();
    $scope.SelectTopic(topicList.rows[0], true);
  });
  function GetCounts(topic) {
    if (!topic) {
      ForArray(topicList.rows, function (topic) {
        if (topic.parentID) return;
        GetCounts(topic);
        return;
      });
      return;
    }
    topic.count = topic.messages.length;
    topic.countRecursive = topic.count;
    for (var i = 0; i < topic.children.length; i++) {
      topic.countRecursive += GetCounts(topic.children[i]);
    }
    return topic.countRecursive;
  }
  $scope.channels = [];
  $scope.Recursive = function () {
    var topic = $scope.selectedTopic;
    $scope.selectedTopic = null;
    $scope.countCol = (managemessage.recursive) ? 'countRecursive' : 'count';
    for (var i = 0; i < topicList.sort.length; i++) {
      var field = topicList.sort[i];
      if (field.column == 'count' || field.column == 'countRecursive') {
        field.column = $scope.countCol;
      }
    }
    $scope.SelectTopic(topic, true);
    topicList.Resort();
  };
  for (var i = 0, len = iservice.loggedIn.accessibleSegments.length; i < len; i++) {
    var segmentID = iservice.loggedIn.accessibleSegments[i];
    var feedback = websync.FeedbackObject($scope);
    $scope.channels.push(feedback);
    feedback.Unsubscribe = websync.subscribe('/managemsg/' + iservice.loggedIn.tenantID + '/' + segmentID, ManageMessagesReceive, feedback);
  }
  function ManageMessagesReceive(msg) {
    var message = msg.getData();
    if (message.inboxUpdate != null) {
      MessageStatusUpdate(message.inboxUpdate);
    }
  }
  function MessageStatusUpdate(update) {
    var keep = (update.status == 'Open' || update.status == 'Queued' || update.status == 'Unassigned');
    if (!update.assignedToID) {
      update.agentName = 'unassigned';
    }
    var message = messageByID[update.id];
    if (message && keep) {
      UpdateMessage(message, update);
    }
    else if (message && !keep) {
      RemoveMessage(message);
    }
    else if (keep) {
      InsertMessage(update);
    }
  }
  function UpdateMessage(message, update) {
    var oldTopic = topicByID[message.topicID];
    var newTopic = topicByID[update.topicID];
    var selected = message.selected;
    angular.extend(message, update);
    message.selected = selected;
    if (oldTopic !== newTopic) {
      TableRemoveItem(oldTopic.messages, 'id', message.id);
      newTopic.messages.push(message);
    }
    ResortMessages();
  }
  function RemoveMessage(message) {
    var topic = topicByID[message.topicID];
    TableRemoveItem(topic.messages, 'id', message.id);
    ResortMessages();
  }
  function InsertMessage(message) {
    var topic = topicByID[message.topicID];
    topic.messages.push(message);
    ResortMessages();
  }
  function ResortMessages() {
    if ($scope.resortTimeout) {
      $timeout.cancel($scope.resortTimeout);
    }
    $scope.resortTimeout = $timeout(function () {
      var page = messageList.curPage;
      $scope.SelectTopic($scope.selectedTopic, false);
      messageList.SelectPage(page);
      GetCounts();
    }, 200);
  }
  $scope.$on("$destroy", function () {
    ForArray($scope.channels, function (channel) {
      channel.Unsubscribe();
    });
  });
  $scope.RowExpandClass = function (message) {
    return (message.details) ? 'list-contract' : 'list-expand';
  }
  $scope.RowExpand = function (message) {
    if (Running($scope.RowExpandRunning)) return;
    if (message.details) {
      message.details = undefined; return;
    }
    $scope.RowExpandRunning = iservice.HistoryDetails($http, message.id, function (data) {
      message.details = data;
      iservice.SanitizeHistoryDetails(data);
    });
  }
  $scope.TopicRowClass = function (topic) {
    return (topic === $scope.selectedTopic) ? 'row-selected' : '';
  };
  $scope.DraftTabClass = function (tab) {
    if (tab == $scope.draftTab) return '';
    else return 'nglink';
  }
  $scope.SelectTopic = function (topic, reset) {
    $scope.selectedTopic = topic;
    var messages = GetMessages(topic);
    messageList.NewRows(messages);
    var segmentID = topic.segmentID;
    $scope.stockSections = [{ name: 'Segment Responses', responses: stockResponsesSegments[segmentID] }, { name: 'Agent Responses', responses: stockResponsesAgent}];
    $scope.mailboxes = [];
    angular.extend($scope.mailboxes, mailboxes[segmentID]);
    $scope.mailboxes.splice(0, 0, { id: '', name: '-- Default Mailbox --' });
    if (reset) {
      ResetAnswer(topic);
    }
  }
  function GetMessages(topic) {
    var messages = [].concat(topic.messages);
    if (managemessage.recursive) {
      for (var i = 0; i < topic.children.length; i++) {
        messages = messages.concat(GetMessages(topic.children[i]));
      }
    }
    return messages;
  }
  $scope.SelectAll = function () {
    ForArray(messageList.Rows(), function (row) {
      row.selected = messageList.selectAll;
    });
  }
  function GetSelectedIDs() {
    var ids = [];
    ForArray(messageList.Rows(), function (row) {
      if (row.selected) ids.push(row.id);
    });
    return ids;
  }
  $scope.RowShowDetails = function (message) {
    return message.details;
  };
  $scope.MessageDetailsUrl = function (message) {
    if (message.details) return 'interaction-details.html';
    else return '';
  }
  $scope.$on('updated-row', function (event, interaction) {
    ForArray(topicList.rows, function (topic) {
      ForArray(topic.messages, function (message) {
        if (message.id == interaction.row.id) {
          angular.extend(message, interaction.row);
          if (!message.assignedToID) {
            message.agentName = 'unassigned';
          }
        }
      });
    });
  });
  function ResetAnswer(topic) {
    $scope.answerDetails = { segmentID: topic.segmentID };
    $scope.answer = { isMassUpdate: true, mailboxID: '', bodyHtml: '' };
    $scope.answerData = { propertySections: [{ label: 'Answer Properties', groups: topic.properties, memberName: 'answerProperties'}] };
    $scope.uploads = [];
    ForArray(messageList.rows, function (row) {
      row.selected = false;
    });
  }
  function TopicList(messageIDs, topicIDs, idMap) {
    var topicMap = {};
    ForArray(messageIDs, function (messageID) {
      var message = messageByID[messageID];
      idMap[messageID] = message;
      var topic = topicByID[message.topicID];
      if (topicMap[topic.id]) return;
      topicMap[topic.id] = topic;
      topicIDs.push(topic.id);
    });
  }
  function RemovingAnswerSuccess(data, messageIDs) {
    var topicIDs = [];
    var idMap = {};
    TopicList(messageIDs, topicIDs, idMap);
    ForArray(topicIDs, function (topicID) {
      var topic = topicByID[topicID];
      var messages = [];
      ForArray(topic.messages, function (message) {
        if (idMap[message.id]) return;
        messages.push(message);
      });
      topic.messages = messages;
    });
    GetCounts();
    messageList.Remove(function (row) {
      return row.selected;
    });
    ResetAnswer($scope.selectedTopic);
  }
  function UpdatingAnswerSuccess(data, messageIDs) {
    $scope.uploads = [];
  }
  function AnswerAction(func, successMessageArray, successFunc) {
    return function (idPrefix, answerDetails, answer, answerData) {
      $scope.localErrors = [];
      $scope.localSuccess = [];
      var ids = GetSelectedIDs();
      if (ids.length < 1) {
        $scope.localErrors = ['Must select at least one interaction.'];
        return;
      }
      $scope.$broadcast('close-menu', null);
      for (var i = 0; i < answerData.propertySections.length; i++) {
        var section = answerData.propertySections[i];
        answer[section.memberName] = iservice.CollectProperties(section.groups);
      }
      $scope.ActionRunning = func($scope, idPrefix, ids, answer, ids[0], function (data) {
        if (data && data.errors && data.errors.length) {
          $scope.localErrors = data.errors;
          return;
        }
        $scope.localSuccess = successMessageArray;
        successFunc(data, ids);
      });
    }
  }
  $scope.SaveResolve = AnswerAction(iservice.SaveResolve, ['Question Resolved.'], RemovingAnswerSuccess);
  $scope.Unqueue = AnswerAction(iservice.Unqueue, ['Question Unassigned.'], UpdatingAnswerSuccess);
  var ChangeTopic = AnswerAction(iservice.ChangeTopic, ['Topic Changed.'], RemovingAnswerSuccess);
  $scope.ChangeTopic = function (idPrefix, answerDetails, answer, answerData, topicID) {
    answer.changeTopicID = topicID;
    ChangeTopic(idPrefix, answerDetails, answer, answerData);
  }
  $scope.MarkSpam = AnswerAction(iservice.MarkSpam, ['Question marked as Spam.'], RemovingAnswerSuccess);
  $scope.QAReject = AnswerAction(iservice.QAReject, ['Answer reassigned to agent.'], UpdatingAnswerSuccess);
  $scope.SaveDraft = AnswerAction(iservice.SaveDraft, ['Draft Saved.'], UpdatingAnswerSuccess);
  $scope.Assign = AnswerAction(iservice.Assign, ['Question Assigned to Agent.'], UpdatingAnswerSuccess);
  $scope.ChangeSegment = AnswerAction(iservice.ChangeSegment, ['Segment Changed.'], RemovingAnswerSuccess);
  var ForwardExternal = AnswerAction(iservice.ForwardExternal, ['Forwared to External Agent.'], UpdatingAnswerSuccess);
  $scope.ForwardExternal = function (idPrefix, answerDetails, answer, answerData) {
    var protocol = window.location.protocol;
    var host = window.location.host;
    var pathname = window.location.pathname;
    var dirname = pathname.substring(0, pathname.lastIndexOf('/') + 1);
    answer.forwardExternalURL = protocol + '//' + host + dirname + rootPath + 'Forward.aspx?id=$value -forwardexternal(guid)$';
    ForwardExternal(idPrefix, answerDetails, answer, answerData);
  }
  var SaveNote = AnswerAction(iservice.SaveNote, ['Note Saved.'], UpdatingAnswerSuccess);
  $scope.SaveNote = function (idPrefix, answerDetails, answer, answerData, isPublic) {
    answer.isPublic = isPublic;
    SaveNote(idPrefix, answerDetails, answer, answerData);
  }
  var SendLeaveOpen = AnswerAction(iservice.SendLeaveOpen, ['Answer Sent.'], UpdatingAnswerSuccess);
  var Send = AnswerAction(iservice.Send, ['Answer Sent.'], RemovingAnswerSuccess);
  $scope.Send = function (idPrefix, answerDetails, answer, answerData) {
    answer.notificationID = '';
    if (answer.leaveOpen) {
      SendLeaveOpen(idPrefix, answerDetails, answer, answerData);
    }
    else {
      Send(idPrefix, answerDetails, answer, answerData);
    }
  }
  var SendSecureLeaveOpen = AnswerAction(iservice.SendLeaveOpen, ['Secure Answer Sent.'], UpdatingAnswerSuccess);
  var SendSecure = AnswerAction(iservice.Send, ['Secure Answer Sent.'], RemovingAnswerSuccess);
  $scope.SendSecure = function (idPrefix, answerDetails, answer, answerData) {
    if (answer.leaveOpen) {
      SendSecureLeaveOpen(idPrefix, answerDetails, answer, answerData);
    }
    else {
      SendSecure(idPrefix, answerDetails, answer, answerData);
    }
  }
} ]);

