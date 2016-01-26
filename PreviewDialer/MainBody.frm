$if -fieldregex'form'='^$'$
<!DOCTYPE html>
<html xmlns:ng="http://angularjs.org" id="ng-app" ng-app="iService">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

  $include -placeholder'common-head' -indent'  '$
  <link rel="stylesheet" href="$value -rootpath$f/$value -formid$?form=css" />
  <script> 
    var rootPath = '$value -rootpath$';
    var activePage = '';
    var o2o = {};
  </script>
</head>
<body ng-controller="ControllerBody">
  $include -placeholder'common-logobar' -indent'  '$
  $include -placeholder'common-loginbar' -indent'  '$
  $include -placeholder'common-agentchat' -indent'  '$

  <div id="preview-dialer" ng-controller="ControllerPreviewDialer">
    
     $include -placeholder'78'$
    <div id="contact" class="dialer-section contact-info">
      $include -placeholder'74'$
      
      $include -placeholder'75'$
    </div>
    
    $include -placeholder'77'$
    $include -placeholder'71'$
    <div style="clear: both;"></div>
    
    $include -placeholder'76'$
   <div style="clear: both;"></div>
  $include -placeholder'common-footer' -indent'  '$
  $include -placeholder'common-javascript' -indent'  '$
  <script src="$value -rootpath$f/$value -formid$?form=js"></script>
  <script src="$value -rootpath$js/iService.directive.js?v=$value -version -urlencode$"></script>
  $include -placeholder'interaction-properties' -indent'  '$
</body>
</html>

$endif$$if -fieldregex'form'='^css$'$$header -filetype(css)$
$include -placeholder'70'$


$endif$$if -fieldregex'form'='^js$'$$header -filetype(js)$
var app = angular.module('iService', ['ngSanitize', 'ngRoute', 'ui.date']);
var loggedIn = $json -loginloggedin$; iservice.ProcessLogin(loggedIn);
var canAgentLogin = $if -domainuser$true$else$false$endif$;
var tabUrls = $include -placeholder'urls'$;
var query = ParseLocation();
var contactID = query['contactID'];




function ControllerPreviewDialer($scope, $http, $rootScope) {
  SetIDPrefix($scope, 'Dialer');
  $scope.closereason = 'Open';
  $scope.classinfocontent = [];
  $scope.classscriptcontent = [];
  $scope.classhistorytcontent = [];
  $scope.classnotecontent = [];
  $scope.classdetailcontent = [];
  
  $scope.AdminLoading = iservice.AdminList($http, 'ListTopics', ['topics', 'contactProperties'], function (data) {
    $scope.adminLoaded = true;
    
    $scope.toggleContactInfo = function() {
     if($scope.classinfocontent.indexOf('classinfocontent') == -1) {
         $scope.classinfocontent.push('classinfocontent');
     } else {
         $scope.classinfocontent.pop('classinfocontent');
     }
   };
   $scope.toggleScript= function() {
     if($scope.classscriptcontent.indexOf('classscriptcontent') == -1) {
         $scope.classscriptcontent.push('classscriptcontent');
     } else {
         $scope.classscriptcontent.pop('classscriptcontent');
     }
   };
   $scope.toggleContactHistory= function() {
     if($scope.classhistorytcontent.indexOf('classhistorytcontent') == -1) {
         $scope.classhistorytcontent.push('classhistorytcontent');
     } else {
         $scope.classhistorytcontent.pop('classhistorytcontent');
     }
   };
    $scope.toggleContactNote= function() {
     if($scope.classnotecontent.indexOf('classnotecontent') == -1) {
         $scope.classnotecontent.push('classnotecontent');
     } else {
         $scope.classnotecontent.pop('classnotecontent');
     }
   };
    $scope.toggleDetail= function() {
     if($scope.classdetailcontent.indexOf('classdetailcontent') == -1) {
         $scope.classdetailcontent.push('classdetailcontent');
     } else {
         $scope.classdetailcontent.pop('classdetailcontent');
     }
   };
  
    
    for (var i = 0; i < data.topics.length; i++) {
      var topic = data.topics[i];
      if (topic.name == 'Pipeline Counts') $scope.noteTopic = topic;
    }
    for (var i = 0; i < data.contactProperties.length; i++) {
      var property = data.contactProperties[i];
      if (property.name == 'Next Call Date') $scope.propCallDate = property;
      if (property.name == 'Close Reason') $scope.propCloseReason = property;
      if (property.name == 'Web Site') $scope.propWebSite = property;
      if (property.name == 'LinkedIn') $scope.propLinkedIn = property;
      if (property.name == 'Follow Up') $scope.propFollowUp = property;
      if (property.name == 'Time Zone') $scope.propTimeZone = property;
      if (property.name == 'NEXT ACTION*') $scope.propNextAction = property;
    }
  });
  $scope.CreateNote = function(subject, idPrefix) {
    if (!$scope.noteTopic) return;
    var properties = [];
    if ($scope.propCallDate && $scope.nextcalldate) {
      properties.push({ propertyID: $scope.propCallDate.id, values: [{ valueDate: iservice.EncodeMSJsonDate($scope.nextcalldate) }] });
    }

    if ($scope.propCloseReason && $scope.closereason) {
      properties.push({ propertyID: $scope.propCloseReason.id, values: [{ value: $scope.closereason }] });
    }
    var details = {
      contactID: contactID,
      topicID: $scope.noteTopic.id,
      segmentID: $scope.noteTopic.segmentID,
      subject: subject,
      body: $scope.body,
    };
    iservice.ContactNoteCreate($scope, idPrefix, contactID, properties, details, function (data) {
      if (data.errors && data.errors.length) return;
      iservice.SanitizeHistoryRow(data.row);
      $rootScope.$broadcast('updated-row', data);
      $scope.body = '';
      $scope.closereason = 'Open';
      $scope.nextcalldate = undefined;
    });
  }
}
function ControllerPreviewDialerCustInfo($scope, $http) {
  SetIDPrefix($scope, 'Dialer');
  function SegmentData() {
    $scope.segmentLists = [];
    if (!iservice.tenant.segments) return;
    for (var s = 0; s < iservice.tenant.segments.list.length; s++) {
      var segment = iservice.tenant.segments.list[s];
      $scope.segmentLists.push({ id: segment.id, name: segment.name, hidden: segment.hidden });
    }
  }
  iservice.AdminList($http, 'ListSeg', ['segments'], function (data) {
    SegmentData(); 
  });
  $scope.Getting = iservice.CustInfoDetails($http, contactID, function (data) {
    SegmentData();
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
    $scope.membership = data.membership;
    $scope.segments = data.properties;  
  });
  $scope.SaveClick = function () {
    var properties = {
      properties: iservice.CollectProperties($scope.segments),
      setLogins: true,
      logins: iservice.CollectLogins($scope.segments)
    };
    $scope.Saving = iservice.CustInfoSetDetails($http, contactID, properties, $scope.membership, function (data) {
      if (data.errors && data.errors.length) return;
      iservice.success = ['Saved Successfully'];
    });
  }
}
function ControllerPreviewDialerHistory($scope, $http) {
  SetIDPrefix($scope, 'History');
  InstallControllerSortPaged($scope, { column: 'dateObj', ascend: false }, 10);
  $scope.Getting = iservice.HistoryThreads($http, contactID, function (data) {
    iservice.SanitizeHistoryRows(data.history);
    for (var i = 0; i < data.history.length; i++) data.history[i].children = undefined;
    $scope.NewRows(data.history);
  });
  $scope.$on('updated-row', function (event, interaction) {
    $scope.rows.splice(0, 0, interaction.row);
    $scope.NewRows($scope.rows);
  });
}

$endif$$if -fieldregex'form'='^note$'$
  $if -lasteval$
  $header -filetype(json)$
  { "refNum": "$result -id'refNum'$",
    "contactID": "$result -id'contactID'$", 
    "errors": $errormessage$,
    "history": [
      $repeat -history(threads) -Pid'contactID'$$header -filetype(js)${ "id": "$value -interaction(id)$", "subject": "$value -interaction(subject)$", "type": "$value -interaction(type)$", "date": "$value -interaction(datetime)$" }$if -more$,
      $endif$$endrepeat$ ] }
  $else$
  $input -textarea -id'body' -required -customhtml$
  $input -contactProperty17'Birthday' -id'birthday' -customhtml$
  $endif$
$endif$
