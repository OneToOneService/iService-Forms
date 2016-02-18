$if -fieldregex'form'='^$'$
<!DOCTYPE html>
<html xmlns:ng="http://angularjs.org" id="ng-app" ng-app="iService">
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  $include -placeholder'common-head' -indent'  '$
  <link rel="stylesheet" href="$value -rootpath$f/$value -formid$?form=css" />
  <script> 
    var rootPath = '$value -rootpath$';
    var o2o = {};
  </script>

<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>  
</head>
<body ng-controller="ControllerBody">

$include -placeholder'StandardHeader'$
$include -placeholder'customerportal-treeview-innerbody'$

$include -placeholder'StandardFooter'$
  $include -placeholder'interaction-properties' -indent'  '$
  $include -placeholder'common-javascript' -indent'  '$
  $include -placeholder'customerportal-treeview-bootstrap'$ <!-- bootstrap.ui.js with customizations -->
  <script src="$value -rootpath$f/$value -formid$?form=js"></script>
  <script src="$value -rootpath$js/iService.directive.js?v=$value -version -urlencode$"></script>
</body>
</html>
$endif$$if -fieldregex'form'='^js$'$$header -filetype(js)$


var app = angular.module('iService',['angularUtils.directives.dirPagination','ngRoute','ui.bootstrap','angularMoment']);
app.config(function ($routeProvider) {
    $routeProvider
        .when('/find-answers', {
         templateUrl: 'findanswer.html',  
         controller: 'ControllerFindAnswers',
        })
        .when('/find-answers/:topicID/:articleID"', {
         templateUrl: 'findanswer.html',  
         controller: 'ControllerFindAnswers',
        })
        .when('/ask-question', {
         templateUrl: 'askquestion.html',
         controller: 'ControllerAskAQuestion',
        })
        .when('/my-inbox', {
         templateUrl: 'myinbox.html',
        })
       .when('/details', {
         templateUrl:'contact-details.html',
         controller: 'ControllerMyDetails',
        })
        .when('/subscription', {
         templateUrl: 'contact-details.html',
         controller: 'ControllerMySubscriptions',
        })
        .otherwise({
            redirectTo: '/find-answers'
        });
 })
 

var loggedIn = $json -loginloggedin$; 
iservice.ProcessLogin(loggedIn);
var articleID;
var toggle = 0;
var change = 0;

app.directive('onFinishRender', function ($timeout) {
    return {
        restrict: 'A',
        link: function (scope, element, attr) {
            if (scope.$last === true) {
                scope.$evalAsync(attr.onFinishRender);
            }
        }
    }
});

app.controller('ControllerTab', function ($scope, $location,$rootScope) {
        // Checks the links to see if the supplied path matches the
        // current path and returns true or false
        // This is used to show class on true through ng-class
        $scope.isActive = function (viewLocation) {
            return viewLocation === $location.path();
        };
      
})

function ControllerFALogin($scope,$window,$route, $http,$rootScope) {
 $scope.$window = $window;
 $scope.toggleLogin = true;
 $scope.toggleRegister = true;
 $scope.toggleUserOption = false;
 
 $scope.loginOpen = function(){
    $scope.toggleLogin = !$scope.toggleLogin;
    $scope.toggleRegister = true;
    $scope.forgetshow = false;
    $scope.loginshow = true;
 }
 $scope.registerOpen = function(){
    $scope.toggleRegister = !$scope.toggleRegister;
    $scope.toggleLogin = true;
 }
 
 $scope.reset = function(login) {
  if (login) {
    login.$pristine = true
    login.$valid = true
    $scope.toggleLogin = !$scope.toggleLogin
  }
 };
  $scope.resetregister = function(registration) {
  if (registration) {
    registration.$pristine = true
    registration.$valid = true
    $scope.toggleRegister = !$scope.toggleRegister
  }
 };
 
 
      $scope.toggleSearch = function () {
                $scope.toggleUserOption = !$scope.toggleUserOption;
    
                if ($scope.toggleUserOption) {
                    $scope.$window.onclick = function (event) {
                        closeSearchWhenClickingElsewhere(event, $scope.toggleSearch);
                    };
                } else {
                    $scope.toggleUserOption = false;
                    $scope.$window.onclick = null;
                    $scope.$apply();
                }
        };
      function closeSearchWhenClickingElsewhere(event, callbackOnClose) {

            var clickedElement = event.target;
            if (!clickedElement) return;

            var elementClasses = clickedElement.classList;
            var clickedOnSearchDrawer = elementClasses.contains('userOption') || elementClasses.contains('user-option') || (clickedElement.parentElement !== null && clickedElement.parentElement.classList.contains('userOption'));

            if (!clickedOnSearchDrawer) {
                callbackOnClose();
                return;
            }

        }
        
    
  $scope.Login = function () {
    $scope.submitted=true; 
    $scope.errors = [];
   if(!$scope.login.$invalid) {
    $scope.Loading = iservice.Login($http, $scope.emailAddress, $scope.password, function (data) {
      if(!data.loggedIn.isLoggedIn){$scope.errors = ['The information you entered doesn\u0027t match our records. Please try again.'];return;}
      if (data.errors && data.errors.length) return;
      iservice.ProcessLogin(data.loggedIn);
      $scope.toggleUserOption = false;
    });
   } 
  }
  $scope.Logout = function () {
    $scope.errors = [];
    $scope.Loading = iservice.Logout($http, function (data) {
      iservice.ProcessLogin(data.loggedIn);
    }); 
  }
  $scope.loginshow = true;
 
 $scope.showLogin= function () {
   $scope.forgetshow = false;
   $scope.loginshow = true;
  }
  
  $scope.showForget = function () {
    $scope.forgetshow = true;
    $scope.loginshow = false;
  }
  $scope.RegisterSubmit = function (selector) {
   $scope.submittedregister=true; 
    if(!$scope.registration.$invalid) {
        var inputs = {};
        $(selector + ' :input').each(function (index) {
          inputs[$(this).attr('name')] = $(this).val();
        });
        $scope.LoginRunning = iservice.LoginRegister($http, inputs, function (data) {
          if (data.errors && data.errors.length){$scope.errorregister = data.errors;}
          iservice.ProcessLogin(data.loggedIn);
          $scope.register = false;
        });
    }
  }
  $scope.RegisterCancel = function () {
    $scope.register = false;
  }
  
   $scope.ForgetSend = function () {
    $scope.submittedforget=true; 
    $scope.sent = false;
    if(!$scope.forgetPassword.$invalid) {
    var protocol = window.location.protocol;
    var host = window.location.host;
    var pathname = window.location.pathname;
    var dirname = pathname.substring(0, pathname.lastIndexOf('/') + 1);
    var resetUrl = protocol + '//' + host + dirname + rootPath + 'PasswordReset.aspx?confirm=$'+'value -passwordreset(guid)$';
    $scope.errors = [];
    $scope.ResetRunning = iservice.PasswordResetSend($http, $scope.reset.email, resetUrl, function (data) {
      $scope.errorsforget = data.errors;
      if (data.errors && data.errors.length) return;
      $scope.forgot = false;
      $scope.sent = true;
      });
    }
    }
  $scope.ForgetRefresh = function () {
     $window.location.reload();
     /*$route.reload();*/
  }

}


var topics = [ $repeat -topics(findanswer)${ "id": "$value -Pjs -topic(id)$", "name": "$value -Pjs -topic(name)$", "count": $value -Pjs -topic(messagecount)$, "countRecurse": $value -Pjs -topic(messagecount)$, "parentID": "$value -Pjs -topic(parentID)$", "segmentName": "$value -Pjs -topic(segmentname)$" }$if -more$,
               $endif$$endrepeat$ ];

function ControllerFindAnswers($scope, $http,$window, $sce, $rootScope,$location,$routeParams,$timeout,$filter,orderByFilter) {
$scope.pageSize = 8;
$scope.param = $routeParams.articleID;
$scope.param2 = $routeParams.topicID;
$scope.SelectedPage = 1;
  $scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
  }
  $scope.recursive = true;
  $scope.myClass = []; 
  $scope.myClassFaq = []; 
  $rootScope.firstTopicID = '';
  
  

  function LoadTopics() {
    $scope.Loading = iservice.FindAnswerTopics($http, function (data) {
      var topics = data.topics;
      $rootScope.topicList = topics;
      var topicByID = {};
      for (var i = 0; i < topics.length; i++) { topicByID[topics[i].id] = topics[i]; if(topics[i].id == $scope.param2){ $scope.match = 1;}}
      for (var i = topics.length - 1; i >= 0; i--) {
        var topic = topics[i];
        var parent = topicByID[topic.parentID];
        if (parent) parent.countRecurse += topic.countRecurse;
      }
      $scope.topics = topics;
      $scope.topicArrya = [];
      $scope.topicsubarray = [];
      for(var i=0; i<$scope.topics.length; i++)
      {
          $scope.newarray = [];
          $scope.objtoarray = []; 
          for(var j=0;j<$scope.topics.length;j++)
          { 
             $scope.temparray=[]; 
             if($scope.topics[i]['id'] == $scope.topics[j]['parentID'])
             {
                $scope.subarray=[];
                for(var k=0;k<$scope.topics.length;k++)
                {  
                   if($scope.topics[j]['id'] == $scope.topics[k]['parentID'])
                   {
                    $scope.subarray.push($scope.topics[k]);
                   }
                }
                $scope.topics[j]['subarray'] = $scope.subarray;
        
                $scope.newarray.push($scope.topics[j]);
                
             }
          } 
          if($scope.topics[i]['parentID'] == ''){
                $scope.objtoarray.push({
                    id: $scope.topics[i]['id'],
                    name:$scope.topics[i]['name'],
                    count:$scope.topics[i]['count'],
                    countRecurse:$scope.topics[i]['countRecurse'],
                    segmentName:$scope.topics[i]['segmentName'],
                    parentID:$scope.topics[i]['parentID'],
                    subarray:$scope.newarray
                 });
   		   } 
           if($scope.objtoarray.length > 0){
             $scope.topicArrya.push($scope.objtoarray);
             
           } 
      }
     
    });
    
    $rootScope.firstTopicID = topics[0].id;
    
  }
  topfaq();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    $scope.selectedTopic = undefined;
    $scope.selectedArticle = undefined;
    $scope.articleList = undefined;
    LoadTopics();
  });
  
  function topfaq(){
      $scope.recursive = true;
      iservice.FindAnswerArticles($http, 1, $scope.searchString, $scope.recursive, 1, 5, 'RATING_REVERSE', function (data) {
          $scope.articleListFaq = data.interactions;
      });
   }
  
  $scope.ShowTopic = function (topic) {
    $scope.selectedTopic = topic;
    $scope.Searching = iservice.FindAnswerArticles($http, topic.id, $scope.searchString, $scope.recursive, 1, 1000, null, function (data) {
      iservice.SanitizeHistoryRows(data.interactions);
      $scope.articleList = data.interactions;
      $scope.articleListval = data.interactions.length;
      if(data.interactions.length <= 0){
     
     }
      var p =1;
      for (var j=0 ; j< data.interactions.length ; j++) {
          var x = (parseInt(p))*$scope.pageSize;
          if(x <= j)  
          {
            p = parseInt(p)+1;
          }
          if($scope.param == data.interactions[j].id)
          {
             $scope.SelectedPage = p;
             break;
          }
      }
    });
    
    $scope.selected = topic; 
    $scope.isActive = function(topic) {
        return $scope.selected === topic;
    };
  }
  
 
   function FixFilePath(article, member) {
    iservice.SanitizeInlineImageAttachments(article, member, article.attachments);
    article[member] = article[member].split('src="File.aspx?interactionID=').join('src="$value -rootpath$File.aspx?interactionID=');
  }
  
  $scope.toggle = function() {
     if($scope.myClass.indexOf('nav2') == -1) {
         $scope.myClass.push('nav2');
         $scope.myClassFaq.pop('nav2')
     } else {

         $scope.myClass.pop('nav2');
     }
   };
    
   $scope.togglefaq = function() {
     if($scope.myClassFaq.indexOf('nav2') == -1) {
         $scope.myClassFaq.push('nav2');
         $scope.myClass.pop('nav2');
     } else {
         $scope.myClassFaq.pop('nav2');
     }
    };
 $scope.SeeArticle = function (article,$index) {if($scope.selectedArticle === article) {if(articleID == article.id && change ==1){return true;} if(articleID == article.id){ return !toggle;} return true;} else return false; }
  $scope.ShowArticle = function (article,$index,init) {
    $scope.sharetoggle = false;
    $scope.selectedArticle = article;
      if(init == 'init') 
      {
         articleID = article.id;change  = 1;toggle = 0;
      }else{
     if(articleID != article.id){ articleID = article.id;change  = 1;toggle = 0; }else{change = 0; toggle = !toggle; if(toggle){return false;}} 
      }
      $scope.Searching = iservice.FindAnswerDetails($http, article.id, function (data) {
      $scope.selectedArticle.data = data;
      FixFilePath(data, 'question');
      FixFilePath(data, 'answer');
      
      data.questionSafe = $sce.trustAsHtml(data.question);
      data.answerSafe = $sce.trustAsHtml(data.answer);
      data.articleIdSafe = $sce.trustAsHtml(data.id); 
      data.createdBySafe = $sce.trustAsHtml(data.creatorName);
      data.ratingSafe = $sce.trustAsHtml(data.rating); 
      data.dateSafe =  $sce.trustAsHtml(data.date);
      $scope.datet = data.date;
      data.viewSafe = $sce.trustAsHtml(data.viewCount);
    });
  }
  $scope.hosturl = $location.absUrl().split('?')[0];
   $scope.test = function() {
       if($scope.match !=1)
       { 
          if(topics[0].id != ''){
          $timeout(function() {
                $scope.ShowTopic(topics[0]);
            }, 0);
           } 
       }

    }
}
               

function ControllerAskAQuestion($scope, $http,$rootScope) {

 $scope.topicList = [];
 $rootScope.details = { topicID: '' };
  function LoadTopics() {
    $scope.Loading = iservice.FindAnswerTopics($http, function (data) {
      var topics = data.topics;
      $scope.topicsList = topics; 
      $rootScope.details = { topicID: $scope.topicsList[0].id };
    });
  }
  LoadTopics();
  $scope.$watch('details.topicID', function(newValue, oldValue) {
    $scope.Searching = iservice.FindAnswerTopicProperties($http, $rootScope.details.topicID, function (data) {
      iservice.SanitizePropertyGroups(data.properties);
      $scope.properties = data.properties;
    });
  });
   $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    $scope.selectedTopic = undefined;
    $scope.selectedArticle = undefined;
    $scope.articleList = undefined;
    LoadTopics();
    $scope.destEmail = iservice.loggedIn.logins[0].name;
  });
  
  
  $scope.Submit = function () {
    $scope.errors = [];
    $scope.askquestionsubmitted = true;
    if(!$scope.askquestionform.$invalid) { 
    $scope.details.properties = iservice.CollectProperties($scope.properties);
    $scope.Searching = iservice.FindAnswerAAQSubmit($http, $scope.destEmail, $scope.details, function (data) {
      $scope.errors = data.errors;
      if (data.errors && data.errors.length) return;
      $scope.result = data.resultID;
    });
    }
  }
}

function ControllerMyHistory($scope, $http,$rootScope) {

  SetIDPrefix($scope, 'History');
  InstallControllerSortPaged($scope, { column: 'dateObj', ascend: false }, 10);
  $scope.HistoryChildrenFunc = iservice.FindAnswerHistoryChildren;
  $scope.HistoryDetailsFunc = iservice.FindAnswerHistoryDetails;
  function LoadHistory() {
    $scope.NewRows([]);
    $scope.Getting = iservice.FindAnswerHistoryThreads($http, function (data) {
      iservice.SanitizeHistoryRows(data.history);
      for (var i = 0; i < data.history.length; i++) data.history[i].children = undefined;
      $scope.NewRows(data.history);
    });
  }
  LoadHistory();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    LoadHistory();
  });
}
function ControllerMyDetails($scope,$route, $http,$rootScope) {
  $scope.detailcontent = true;
  if($route.current.controller != 'ControllerMyDetails'){
     $scope.detailcontent = false;
   } 
    $scope.showContDetail = function () {
        $scope.detailcontent = $scope.detailcontent ? false : true;
    }
  SetIDPrefix($scope, 'Details');
  function LoadDetails() {
    $scope.Getting = iservice.FindAnswerMyDetails($http, function (data) {
      iservice.SanitizePropertyGroups(data.properties);
      $scope.segments = data.properties;
    });
  }
  LoadDetails();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    LoadDetails();
  });
  $scope.SaveClick = function () {
    var properties = {
      properties: iservice.CollectProperties($scope.segments),
      setLogins: true,
      logins: iservice.CollectLogins($scope.segments)
    };
    $scope.Saving = iservice.FindAnswerMyDetailsSet($http, properties, function (data) {
      
    });
  };
}

function ControllerMySubscriptions($scope,$route, $http,$rootScope) {
   $scope.subscontent = true;
   if($route.current.controller != 'ControllerMySubscriptions'){
     $scope.subscontent = false;
   }
   $scope.showSubs = function () {
        $scope.subscontent = $scope.subscontent ? false : true;
    }
  SetIDPrefix($scope, 'Subscriptions');
  function LoadSubscriptions() {
    $scope.segments = [];
    $scope.Getting = iservice.FindAnswerMySubscriptions($http, function (data) {
      $scope.lists = data.lists;
      $scope.campaigns = data.campaigns;
      $scope.articles = data.articles;
    });
  }
  LoadSubscriptions();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    LoadSubscriptions();
  });
  $scope.SaveClick = function () {
    var subscriptions = {
      listIDs: iservice.CollectItemIDs($scope.lists, 'id', 'isOnList'),
      campaignIDs: iservice.CollectItemIDs($scope.campaigns, 'id', 'isOnList'),
      articleIDs: iservice.CollectItemIDs($scope.articles, 'id', 'isOnList')
    };
    $scope.Saving = iservice.FindAnswerMySubscriptionsSet($http, subscriptions, function (data) {
      if (data.errors && data.errors.length) return;
      $scope.lists = data.lists;
      $scope.campaigns = data.campaigns;
      $scope.articles = data.articles;

    });
  };
}
var ControllerList = ControllerWithID('List');
var ControllerCampaign = ControllerWithID('Campaign');
var ControllerArticle = ControllerWithID('Article');



(function() {

    /**
     * Config
     */
    var moduleName = 'angularUtils.directives.dirPagination';
    var DEFAULT_ID = '__default';

    /**
     * Module
     */
    var module;
    try {
        module = angular.module(moduleName);
    } catch(err) {
        // named module does not exist, so create one
        module = angular.module(moduleName, []);
    }

    module
        .directive('dirPaginate', ['$compile', '$parse', 'paginationService', dirPaginateDirective])
        .directive('dirPaginateNoCompile', noCompileDirective)
        .directive('dirPaginationControls', ['paginationService', 'paginationTemplate', dirPaginationControlsDirective])
        .filter('itemsPerPage', ['paginationService', itemsPerPageFilter])
        .service('paginationService', paginationService)
        .provider('paginationTemplate', paginationTemplateProvider)
        .run(['$templateCache',dirPaginationControlsTemplateInstaller]);
         
    function dirPaginateDirective($compile, $parse, paginationService) {

        return  {
            terminal: true,
            multiElement: true,
            compile: dirPaginationCompileFn
        };

        function dirPaginationCompileFn(tElement, tAttrs){

            var expression = tAttrs.dirPaginate;
            // regex taken directly from https://github.com/angular/angular.js/blob/master/src/ng/directive/ngRepeat.js#L211
            var match = expression.match(/^\s*([\s\S]+?)\s+in\s+([\s\S]+?)(?:\s+track\s+by\s+([\s\S]+?))?\s*$/);

            var filterPattern = /\|\s*itemsPerPage\s*:[^|]*/;
            if (match[2].match(filterPattern) === null) {
                throw 'pagination directive: the \'itemsPerPage\' filter must be set.';
            }
            var itemsPerPageFilterRemoved = match[2].replace(filterPattern, '');
            var collectionGetter = $parse(itemsPerPageFilterRemoved);

            addNoCompileAttributes(tElement);

            // If any value is specified for paginationId, we register the un-evaluated expression at this stage for the benefit of any
            // dir-pagination-controls directives that may be looking for this ID.
            var rawId = tAttrs.paginationId || DEFAULT_ID;
            paginationService.registerInstance(rawId);

            return function dirPaginationLinkFn(scope, element, attrs){

                // Now that we have access to the `scope` we can interpolate any expression given in the paginationId attribute and
                // potentially register a new ID if it evaluates to a different value than the rawId.
                var paginationId = $parse(attrs.paginationId)(scope) || attrs.paginationId || DEFAULT_ID;
                paginationService.registerInstance(paginationId);

                var repeatExpression = getRepeatExpression(expression, paginationId);
                addNgRepeatToElement(element, attrs, repeatExpression);

                removeTemporaryAttributes(element);
                var compiled =  $compile(element);

                var currentPageGetter = makeCurrentPageGetterFn(scope, attrs, paginationId);
                paginationService.setCurrentPageParser(paginationId, currentPageGetter, scope);

                if (typeof attrs.totalItems !== 'undefined') {
                    paginationService.setAsyncModeTrue(paginationId);
                    scope.$watch(function() {
                        return $parse(attrs.totalItems)(scope);
                    }, function (result) {
                        if (0 <= result) {
                            paginationService.setCollectionLength(paginationId, result);
                        }
                    });
                } else {
                    scope.$watchCollection(function() {
                        return collectionGetter(scope);
                    }, function(collection) {
                        if (collection) {
                            paginationService.setCollectionLength(paginationId, collection.length);
                        }
                    });
                }

                // Delegate to the link function returned by the new compilation of the ng-repeat
                compiled(scope);
            };
        }

        /**
         * If a pagination id has been specified, we need to check that it is present as the second argument passed to
         * the itemsPerPage filter. If it is not there, we add it and return the modified expression.
         *
         * @param expression
         * @param paginationId
         * @returns {*}
         */
        function getRepeatExpression(expression, paginationId) {
            var repeatExpression,
                idDefinedInFilter = !!expression.match(/(\|\s*itemsPerPage\s*:[^|]*:[^|]*)/);

            if (paginationId !== DEFAULT_ID && !idDefinedInFilter) {
                repeatExpression = expression.replace(/(\|\s*itemsPerPage\s*:[^|]*)/, "$1 : '" + paginationId + "'");
            } else {
                repeatExpression = expression;
            }

            return repeatExpression;
        }

        /**
         * Adds the ng-repeat directive to the element. In the case of multi-element (-start, -end) it adds the
         * appropriate multi-element ng-repeat to the first and last element in the range.
         * @param element
         * @param attrs
         * @param repeatExpression
         */
        function addNgRepeatToElement(element, attrs, repeatExpression) {
            if (element[0].hasAttribute('dir-paginate-start') || element[0].hasAttribute('data-dir-paginate-start')) {
                // using multiElement mode (dir-paginate-start, dir-paginate-end)
                attrs.$set('ngRepeatStart', repeatExpression);
                element.eq(element.length - 1).attr('ng-repeat-end', true);
            } else {
                attrs.$set('ngRepeat', repeatExpression);
            }
        }

        /**
         * Adds the dir-paginate-no-compile directive to each element in the tElement range.
         * @param tElement
         */
        function addNoCompileAttributes(tElement) {
            angular.forEach(tElement, function(el) {
                if (el.nodeType === Node.ELEMENT_NODE) {
                    angular.element(el).attr('dir-paginate-no-compile', true);
                }
            });
        }

function ControllerFindAnswers($scope, $http,$window, $sce, $rootScope,$location,$routeParams,$timeout,$filter,orderByFilter) {
$scope.pageSize = 8;
$scope.param = $routeParams.articleID;
$scope.param2 = $routeParams.topicID;
$scope.SelectedPage = 1;
  $scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
  }
  $scope.recursive = true;
  $scope.myClass = []; 
  $scope.myClassFaq = []; 
  $rootScope.firstTopicID = '';
  
  

  function LoadTopics() {
    $scope.Loading = iservice.FindAnswerTopics($http, function (data) {
      var topics = data.topics;
      $rootScope.topicList = topics;
      var topicByID = {};
      for (var i = 0; i < topics.length; i++) { topicByID[topics[i].id] = topics[i]; if(topics[i].id == $scope.param2){ $scope.match = 1;}}
      for (var i = topics.length - 1; i >= 0; i--) {
        var topic = topics[i];
        var parent = topicByID[topic.parentID];
        if (parent) parent.countRecurse += topic.countRecurse;
      }
      $scope.topics = topics;
      $scope.topicArrya = [];
      $scope.topicsubarray = [];
      for(var i=0; i<$scope.topics.length; i++)
      {
          $scope.newarray = [];
          $scope.objtoarray = []; 
          for(var j=0;j<$scope.topics.length;j++)
          { 
             $scope.temparray=[]; 
             if($scope.topics[i]['id'] == $scope.topics[j]['parentID'])
             {
                $scope.subarray=[];
                for(var k=0;k<$scope.topics.length;k++)
                {  
                   if($scope.topics[j]['id'] == $scope.topics[k]['parentID'])
                   {
                    $scope.subarray.push($scope.topics[k]);
                   }
                }
                $scope.topics[j]['subarray'] = $scope.subarray;
        
                $scope.newarray.push($scope.topics[j]);
                
             }
          } 
          if($scope.topics[i]['parentID'] == ''){
                $scope.objtoarray.push({
                    id: $scope.topics[i]['id'],
                    name:$scope.topics[i]['name'],
                    count:$scope.topics[i]['count'],
                    countRecurse:$scope.topics[i]['countRecurse'],
                    segmentName:$scope.topics[i]['segmentName'],
                    parentID:$scope.topics[i]['parentID'],
                    subarray:$scope.newarray
                 });
   		   } 
           if($scope.objtoarray.length > 0){
             $scope.topicArrya.push($scope.objtoarray);
             
           } 
      }
     
    });
    
    $rootScope.firstTopicID = topics[0].id;
    
  }
  topfaq();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    $scope.selectedTopic = undefined;
    $scope.selectedArticle = undefined;
    $scope.articleList = undefined;
    LoadTopics();
  });
  
  function topfaq(){
      $scope.recursive = true;
      iservice.FindAnswerArticles($http, 1, $scope.searchString, $scope.recursive, 1, 5, 'RATING', function (data) {
          $scope.articleListFaq = data.interactions;
      });
   }
  
  $scope.ShowTopic = function (topic) {
    $scope.selectedTopic = topic;
    $scope.Searching = iservice.FindAnswerArticles($http, topic.id, $scope.searchString, $scope.recursive, 1, 1000, null, function (data) {
      iservice.SanitizeHistoryRows(data.interactions);
      $scope.articleList = data.interactions;
      $scope.articleListval = data.interactions.length;
      if(data.interactions.length <= 0){
     
     }
      var p =1;
      for (var j=0 ; j< data.interactions.length ; j++) {
          var x = (parseInt(p))*$scope.pageSize;
          if(x <= j)  
          {
            p = parseInt(p)+1;
          }
          if($scope.param == data.interactions[j].id)
          {
             $scope.SelectedPage = p;
             break;
          }
      }
    });
    
    $scope.selected = topic; 
    $scope.isActive = function(topic) {
        return $scope.selected === topic;
    };
  }
  
 
   function FixFilePath(article, member) {
    iservice.SanitizeInlineImageAttachments(article, member, article.attachments);
    article[member] = article[member].split('src="File.aspx?interactionID=').join('src="$value -rootpath$File.aspx?interactionID=');
  }
  
  $scope.toggle = function() {
     if($scope.myClass.indexOf('nav2') == -1) {
         $scope.myClass.push('nav2');
         $scope.myClassFaq.pop('nav2')
     } else {

         $scope.myClass.pop('nav2');
     }
   };
    
   $scope.togglefaq = function() {
     if($scope.myClassFaq.indexOf('nav2') == -1) {
         $scope.myClassFaq.push('nav2');
         $scope.myClass.pop('nav2');
     } else {
         $scope.myClassFaq.pop('nav2');
     }
    };
 $scope.SeeArticle = function (article,$index) {if($scope.selectedArticle === article) {if(articleID == article.id && change ==1){return true;} if(articleID == article.id){ return !toggle;} return true;} else return false; }
  $scope.ShowArticle = function (article,$index,init) {
    $scope.sharetoggle = false;
    $scope.selectedArticle = article;
      if(init == 'init') 
      {
         articleID = article.id;change  = 1;toggle = 0;
      }else{
     if(articleID != article.id){ articleID = article.id;change  = 1;toggle = 0; }else{change = 0; toggle = !toggle; if(toggle){return false;}} 
      }
      $scope.Searching = iservice.FindAnswerDetails($http, article.id, function (data) {
      $scope.selectedArticle.data = data;
      FixFilePath(data, 'question');
      FixFilePath(data, 'answer');
      
      data.questionSafe = $sce.trustAsHtml(data.question);
      data.answerSafe = $sce.trustAsHtml(data.answer);
      data.articleIdSafe = $sce.trustAsHtml(data.id); 
      data.createdBySafe = $sce.trustAsHtml(data.creatorName);
      data.ratingSafe = $sce.trustAsHtml(data.rating); 
      data.dateSafe =  $sce.trustAsHtml(data.date);
      data.viewSafe = $sce.trustAsHtml(data.viewCount);
    });
  }
  $scope.hosturl = $location.absUrl().split('?')[0];
   $scope.test = function() {
       if($scope.match !=1)
       { 
          if(topics[0].id != ''){
          $timeout(function() {
                $scope.ShowTopic(topics[0]);
            }, 0);
           } 
       }

    }
}
               

function ControllerAskAQuestion($scope, $http,$rootScope) {

 $scope.topicList = [];
 $rootScope.details = { topicID: '' };
  function LoadTopics() {
    $scope.Loading = iservice.FindAnswerTopics($http, function (data) {
      var topics = data.topics;
      $scope.topicsList = topics; 
      $rootScope.details = { topicID: $scope.topicsList[0].id };
    });
  }
  LoadTopics();
  $scope.$watch('details.topicID', function(newValue, oldValue) {
    $scope.Searching = iservice.FindAnswerTopicProperties($http, $rootScope.details.topicID, function (data) {
      iservice.SanitizePropertyGroups(data.properties);
      $scope.properties = data.properties;
    });
  });
   $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    $scope.selectedTopic = undefined;
    $scope.selectedArticle = undefined;
    $scope.articleList = undefined;
    LoadTopics();
    $scope.destEmail = iservice.loggedIn.logins[0].name;
  });
  
  
  $scope.Submit = function () {
    $scope.errors = [];
    $scope.askquestionsubmitted = true;
    if(!$scope.askquestionform.$invalid) { 
    $scope.details.properties = iservice.CollectProperties($scope.properties);
    $scope.Searching = iservice.FindAnswerAAQSubmit($http, $scope.destEmail, $scope.details, function (data) {
      $scope.errors = data.errors;
      if (data.errors && data.errors.length) return;
      $scope.result = data.resultID;
    });
    }
  }
}

function ControllerMyHistory($scope, $http,$rootScope) {

  SetIDPrefix($scope, 'History');
  InstallControllerSortPaged($scope, { column: 'dateObj', ascend: false }, 10);
  $scope.HistoryChildrenFunc = iservice.FindAnswerHistoryChildren;
  $scope.HistoryDetailsFunc = iservice.FindAnswerHistoryDetails;
  function LoadHistory() {
    $scope.NewRows([]);
    $scope.Getting = iservice.FindAnswerHistoryThreads($http, function (data) {
      iservice.SanitizeHistoryRows(data.history);
      for (var i = 0; i < data.history.length; i++) data.history[i].children = undefined;
      $scope.NewRows(data.history);
    });
  }
  LoadHistory();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    LoadHistory();
  });
}
function ControllerMyDetails($scope,$route, $http,$rootScope) {
  $scope.detailcontent = true;
  if($route.current.controller != 'ControllerMyDetails'){
     $scope.detailcontent = false;
   } 
    $scope.showContDetail = function () {
        $scope.detailcontent = $scope.detailcontent ? false : true;
    }
  SetIDPrefix($scope, 'Details');
  function LoadDetails() {
    $scope.Getting = iservice.FindAnswerMyDetails($http, function (data) {
      iservice.SanitizePropertyGroups(data.properties);
      $scope.segments = data.properties;
    });
  }
  LoadDetails();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    LoadDetails();
  });
  $scope.SaveClick = function () {
    var properties = {
      properties: iservice.CollectProperties($scope.segments),
      setLogins: true,
      logins: iservice.CollectLogins($scope.segments)
    };
    $scope.Saving = iservice.FindAnswerMyDetailsSet($http, properties, function (data) {
      
    });
  };
}

function ControllerMySubscriptions($scope,$route, $http,$rootScope) {
   $scope.subscontent = true;
   if($route.current.controller != 'ControllerMySubscriptions'){
     $scope.subscontent = false;
   }
   $scope.showSubs = function () {
        $scope.subscontent = $scope.subscontent ? false : true;
    }
  SetIDPrefix($scope, 'Subscriptions');
  function LoadSubscriptions() {
    $scope.segments = [];
    $scope.Getting = iservice.FindAnswerMySubscriptions($http, function (data) {
      $scope.lists = data.lists;
      $scope.campaigns = data.campaigns;
      $scope.articles = data.articles;
    });
  }
  LoadSubscriptions();
  $scope.$watch('iservice.loggedIn.contactID', function(newValue, oldValue) {
    LoadSubscriptions();
  });
  $scope.SaveClick = function () {
    var subscriptions = {
      listIDs: iservice.CollectItemIDs($scope.lists, 'id', 'isOnList'),
      campaignIDs: iservice.CollectItemIDs($scope.campaigns, 'id', 'isOnList'),
      articleIDs: iservice.CollectItemIDs($scope.articles, 'id', 'isOnList')
    };
    $scope.Saving = iservice.FindAnswerMySubscriptionsSet($http, subscriptions, function (data) {
      if (data.errors && data.errors.length) return;
      $scope.lists = data.lists;
      $scope.campaigns = data.campaigns;
      $scope.articles = data.articles;

    });
  };
}
var ControllerList = ControllerWithID('List');
var ControllerCampaign = ControllerWithID('Campaign');
var ControllerArticle = ControllerWithID('Article');



(function() {

    /**
     * Config
     */
    var moduleName = 'angularUtils.directives.dirPagination';
    var DEFAULT_ID = '__default';

    /**
     * Module
     */
    var module;
    try {
        module = angular.module(moduleName);
    } catch(err) {
        // named module does not exist, so create one
        module = angular.module(moduleName, []);
    }

    module
        .directive('dirPaginate', ['$compile', '$parse', 'paginationService', dirPaginateDirective])
        .directive('dirPaginateNoCompile', noCompileDirective)
        .directive('dirPaginationControls', ['paginationService', 'paginationTemplate', dirPaginationControlsDirective])
        .filter('itemsPerPage', ['paginationService', itemsPerPageFilter])
        .service('paginationService', paginationService)
        .provider('paginationTemplate', paginationTemplateProvider)
        .run(['$templateCache',dirPaginationControlsTemplateInstaller]);
         
    function dirPaginateDirective($compile, $parse, paginationService) {

        return  {
            terminal: true,
            multiElement: true,
            compile: dirPaginationCompileFn
        };

        function dirPaginationCompileFn(tElement, tAttrs){

            var expression = tAttrs.dirPaginate;
            // regex taken directly from https://github.com/angular/angular.js/blob/master/src/ng/directive/ngRepeat.js#L211
            var match = expression.match(/^\s*([\s\S]+?)\s+in\s+([\s\S]+?)(?:\s+track\s+by\s+([\s\S]+?))?\s*$/);

            var filterPattern = /\|\s*itemsPerPage\s*:[^|]*/;
            if (match[2].match(filterPattern) === null) {
                throw 'pagination directive: the \'itemsPerPage\' filter must be set.';
            }
            var itemsPerPageFilterRemoved = match[2].replace(filterPattern, '');
            var collectionGetter = $parse(itemsPerPageFilterRemoved);

            addNoCompileAttributes(tElement);

            // If any value is specified for paginationId, we register the un-evaluated expression at this stage for the benefit of any
            // dir-pagination-controls directives that may be looking for this ID.
            var rawId = tAttrs.paginationId || DEFAULT_ID;
            paginationService.registerInstance(rawId);

            return function dirPaginationLinkFn(scope, element, attrs){

                // Now that we have access to the `scope` we can interpolate any expression given in the paginationId attribute and
                // potentially register a new ID if it evaluates to a different value than the rawId.
                var paginationId = $parse(attrs.paginationId)(scope) || attrs.paginationId || DEFAULT_ID;
                paginationService.registerInstance(paginationId);

                var repeatExpression = getRepeatExpression(expression, paginationId);
                addNgRepeatToElement(element, attrs, repeatExpression);

                removeTemporaryAttributes(element);
                var compiled =  $compile(element);

                var currentPageGetter = makeCurrentPageGetterFn(scope, attrs, paginationId);
                paginationService.setCurrentPageParser(paginationId, currentPageGetter, scope);

                if (typeof attrs.totalItems !== 'undefined') {
                    paginationService.setAsyncModeTrue(paginationId);
                    scope.$watch(function() {
                        return $parse(attrs.totalItems)(scope);
                    }, function (result) {
                        if (0 <= result) {
                            paginationService.setCollectionLength(paginationId, result);
                        }
                    });
                } else {
                    scope.$watchCollection(function() {
                        return collectionGetter(scope);
                    }, function(collection) {
                        if (collection) {
                            paginationService.setCollectionLength(paginationId, collection.length);
                        }
                    });
                }

                // Delegate to the link function returned by the new compilation of the ng-repeat
                compiled(scope);
            };
        }

        /**
         * Generate an array of page numbers (or the '...' string) which is used in an ng-repeat to generate the
         * links used in pagination
         *
         * @param currentPage
         * @param rowsPerPage
         * @param paginationRange
         * @param collectionLength
         * @returns {Array}
         */
        function generatePagesArray(currentPage, collectionLength, rowsPerPage, paginationRange) {
            var pages = [];
            var totalPages = Math.ceil(collectionLength / rowsPerPage);
            var halfWay = Math.ceil(paginationRange / 2);
            var position;

            if (currentPage <= halfWay) {
                position = 'start';
            } else if (totalPages - halfWay < currentPage) {
                position = 'end';
            } else {
                position = 'middle';
            }

            var ellipsesNeeded = paginationRange < totalPages;
            var i = 1;
            while (i <= totalPages && i <= paginationRange) {
                var pageNumber = calculatePageNumber(i, currentPage, paginationRange, totalPages);

                var openingEllipsesNeeded = (i === 2 && (position === 'middle' || position === 'end'));
                var closingEllipsesNeeded = (i === paginationRange - 1 && (position === 'middle' || position === 'start'));
                if (ellipsesNeeded && (openingEllipsesNeeded || closingEllipsesNeeded)) {
                    pages.push('...');
                } else {
                    pages.push(pageNumber);
                }
                i ++;
            }
            return pages;
        }

        /**
         * Given the position in the sequence of pagination links [i], figure out what page number corresponds to that position.
         *
         * @param i
         * @param currentPage
         * @param paginationRange
         * @param totalPages
         * @returns {*}
         */
        function calculatePageNumber(i, currentPage, paginationRange, totalPages) {
            var halfWay = Math.ceil(paginationRange/2);
            if (i === paginationRange) {
                return totalPages;
            } else if (i === 1) {
                return i;
            } else if (paginationRange < totalPages) {
                if (totalPages - halfWay < currentPage) {
                    return totalPages - paginationRange + i;
                } else if (halfWay < currentPage) {
                    return currentPage - halfWay + i;
                } else {
                    return i;
                }
            } else {
                return i;
            }
        }
    }

    /**
     * This filter slices the collection into pages based on the current page number and number of items per page.
     * @param paginationService
     * @returns {Function}
     */
    function itemsPerPageFilter(paginationService) {

        return function(collection, itemsPerPage, paginationId) {
            if (typeof (paginationId) === 'undefined') {
                paginationId = DEFAULT_ID;
            }
            if (!paginationService.isRegistered(paginationId)) {

                throw 'pagination directive: the itemsPerPage id argument (id: ' + paginationId + ') does not match a registered pagination-id.';
            }
            var end;
            var start;
            if (collection instanceof Array) {
                itemsPerPage = parseInt(itemsPerPage) || 9999999999;
                if (paginationService.isAsyncMode(paginationId)) {
                    start = 0;
                } else {
                    start = (paginationService.getCurrentPage(paginationId) - 1) * itemsPerPage;
                }
                end = start + itemsPerPage;
                paginationService.setItemsPerPage(paginationId, itemsPerPage);

                return collection.slice(start, end);
            } else {
                return collection;
            }
        };
    }

    /**
     * This service allows the various parts of the module to communicate and stay in sync.
     */
    function paginationService() {

        var instances = {};
        var lastRegisteredInstance;

        this.registerInstance = function(instanceId) {
            if (typeof instances[instanceId] === 'undefined') {
                instances[instanceId] = {
                    asyncMode: false
                };
                lastRegisteredInstance = instanceId;
            }
        };

        this.isRegistered = function(instanceId) {
            return (typeof instances[instanceId] !== 'undefined');
        };

        this.getLastInstanceId = function() {
            return lastRegisteredInstance;
        };

        this.setCurrentPageParser = function(instanceId, val, scope) {
            instances[instanceId].currentPageParser = val;
            instances[instanceId].context = scope;
        };
        this.setCurrentPage = function(instanceId, val) {
            instances[instanceId].currentPageParser.assign(instances[instanceId].context, val);
        };
        this.getCurrentPage = function(instanceId) {
            var parser = instances[instanceId].currentPageParser;
            return parser ? parser(instances[instanceId].context) : 1;
        };

        this.setItemsPerPage = function(instanceId, val) {
            instances[instanceId].itemsPerPage = val;
        };
        this.getItemsPerPage = function(instanceId) {
            return instances[instanceId].itemsPerPage;
        };

        this.setCollectionLength = function(instanceId, val) {
            instances[instanceId].collectionLength = val;
        };
        this.getCollectionLength = function(instanceId) {
            return instances[instanceId].collectionLength;

        };

        this.setAsyncModeTrue = function(instanceId) {
            instances[instanceId].asyncMode = true;
        };

        this.isAsyncMode = function(instanceId) {
            return instances[instanceId].asyncMode;
        };
    }

    /**
     * This provider allows global configuration of the template path used by the dir-pagination-controls directive.
     */
    function paginationTemplateProvider() {

        var templatePath = 'angularUtils.directives.dirPagination.template';

        this.setPath = function(path) {
            templatePath = path;
        };

        this.$get = function() {
            return {
                getPath: function() {
                    return templatePath;
                }
            };
        };
    }
})();


$endif$$if -fieldregex'form'='^css$'$$header -filetype(css)$
$include -placeholder'customerportal-treeview-css1'$
$include -placeholder'customerportal-treeview-css2'$
$include -placeholder'customerportal-treeview-css3'$

$endif$
