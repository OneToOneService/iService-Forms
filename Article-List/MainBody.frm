$if -fieldregex'form'='^$'$
<!DOCTYPE html>
<html xmlns:ng="http://angularjs.org" id="ng-app" ng-app="iService">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Article list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    $include -placeholder'common-head' -indent'  '$
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/6.1.1/foundation.min.css" />
    <link href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300" rel="stylesheet" type="text/css">
    <script>
        var rootPath = "$value -rootpath$";
    </script>
</head>
<body>
    <section ng-cloak ng-controller="ControllerFALogin">
        <div ng-show="isLoggedIn">
            <button type="button" ng-click="logout()">Logout</button> Welcome <strong>{{ contactName }}</strong>
        </div>
        <div ng-hide="isLoggedIn || loginVisible || forgotPasswordVisible">
            <button type="button" ng-click="showLogin()">Login</button> Welcome <strong>Guest</strong>
        </div>
        <form name="login" ng-hide="isLoggedIn || !loginVisible" ng-submit="loginSend()">
            <input type="email" placeholder="Email address" ng-model="email" />
            <input type="password" placeholder="Password" ng-model="password" />
            <button type="submit">Submit</button>
            <a ng-click="showForgotPassword()">Forgot password</a>
            <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }} </div>
        </form>
        <form name="forgotPassword" ng-hide="isLoggedIn || !forgotPasswordVisible" ng-submit="forgotPasswordSend()">
            <input type="email" placeholder="Email address" ng-model="email" />
            <button type="submit">Submit</button>
            <button type="button" ng-click="showLogin()">Cancel</button>
            <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }} </div>
        </form>
        <div ng-hide="isLoggedIn || !sent">
            Password reset confirmation email has been sent to the address:
            <div>{{email}}</div>
            Please follow the included instructions.
        </div>
        <div grey-out ng-show="loading()"></div>
    </section>
    <section ng-cloak ng-controller="ControllerFindAnswers">
        <header>Topic search</header>
        <form ng-submit="loadArticles()" class="row">
            <div class="column small-7">
                <input type="search" placeholder="Search terms" ng-model="searchText" />
            </div>
            <select placeholder="Select topic" class="column small-4" ng-model="topicId">
                <option ng-repeat="topic in topics" value="{{ topic.id }}">{{ topic.name }} ({{ topic.countRecurse }})</option>
            </select>
            <button type="submit" class="column small-1">Search</button>
        </form>
        <div>
            <header class="row">
                <strong class="column small-12 medium-9">Support</strong>
                <strong class="column medium-1 show-for-medium">Rating</strong>
                <strong class="column medium-1 show-for-medium">Viewed</strong>
                <strong class="column medium-1 show-for-medium">Topic</strong>
            </header>
            <div class="row" ng-repeat="article in articles">
                <span class="column small-12 medium-9">{{ article.subject }}</span>
                <span class="column medium-1 show-for-medium">{{ article.rating }}</span>
                <span class="column medium-1 show-for-medium">{{ article.viewCount }}</span>
                <span class="column medium-1 show-for-medium">{{ article.topicName }}</span>
            </div>
        </div>
        <div grey-out ng-show="loading()"></div>
    </section>
    <!--$include -placeholder'common-javascript' -indent'  '$-->
    <script src="js/fm.min.js"></script>
    <script src="js/fm.websync.min.js"></script>
    <script src="js/jstz.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular-sanitize.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular-route.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-moment/1.0.0-beta.3/angular-moment.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/angular-ui-date.js"></script>
    <script src="js/iService.util.js?v=7.4+-+2016.02.18+-+04%3a35%3a20"></script>
    <script src="js/iService.ng.js?v=7.4+-+2016.02.18+-+04%3a35%3a20"></script>


    $include -placeholder'interaction-properties' -indent'  '$
    <script src="$value -rootpath$f/$value -formid$?form=js"></script>
    <script src="$value -rootpath$js/iService.directive.js?v=$value -version -urlencode$"></script>
</body>
</html>
$endif$
$if -fieldregex'form'='^js$'$
$header -filetype(js)$
var app = angular.module("iService", ["angularMoment"]);

(function ()
{
    var loadTopics,
        loadArticles;

    iservice.ProcessLogin($json -loginloggedin$);

    app.controller("ControllerFALogin", function ($scope, $http)
    {
        $scope.loginVisible = false;
        $scope.forgotPasswordVisible = false;

        Object.defineProperty($scope, "contactName", {
            get: function ()
            {
                return iservice.loggedIn.contactName;
            }
        });

        Object.defineProperty($scope, "isLoggedIn", {
            get: function ()
            {
                return iservice.loggedIn.isLoggedIn;
            }
        });

        $scope.showLogin = function ()
        {
            $scope.errors = [];

            $scope.loginVisible = true;
            $scope.forgotPasswordVisible = false;
        };

        $scope.showForgotPassword = function ()
        {
            $scope.errors = [];

            $scope.loginVisible = false;
            $scope.forgotPasswordVisible = true;
        };

        $scope.loginSend = function ()
        {
            $scope.errors = [];

            if(!$scope.login.$invalid)
            {
                $scope.loading = iservice.Login($http, $scope.email, $scope.password, function (data)
                {
                    if(!data.loggedIn.isLoggedIn)
                    {
                        $scope.errors = ["The information you entered doesn\u0027t match our records. Please try again."];
                        return;
                    }

                    if(data.errors && data.errors.length)
                        return;

                    iservice.ProcessLogin(data.loggedIn);
                });
            }
        };

        $scope.logout = function ()
        {
            $scope.errors = [];

            $scope.loading = iservice.Logout($http, function (data)
            {
                iservice.ProcessLogin(data.loggedIn);
            });
        };

        $scope.forgotPasswordSend = function ()
        {
            if(!$scope.forgotPassword.$invalid)
            {
                var protocol = window.location.protocol,
                pathname = window.location.pathname,
                resetUrl = protocol + "//" + window.location.host + pathname.substring(0, pathname.lastIndexOf("/") + 1) + rootPath + "PasswordReset.aspx?confirm=$" + "value -passwordreset(guid)$";

                $scope.errors = [];

                $scope.loading = iservice.PasswordResetSend($http, $scope.email, resetUrl, function (data)
                {
                    $scope.errors = data.errors;

                    if(data.errors && data.errors.length)
                        return;

                    $scope.sent = true;

                    $scope.showLogin();
                });
            }
        }

        $scope.$watch("isLoggedIn", function ()
        {
            loadTopics().then(loadArticles);
        });
    });

    app.controller("ControllerFindAnswers", function ($scope, $http, $filter, orderByFilter)
    {
        //$scope.pageSize = 8;

        $scope.sort = function (keyname)
        {
            $scope.sortKey = keyname;   //set the sortKey to the param passed
            $scope.reverse = !$scope.reverse; //if true make it false and vice versa
        }

        loadTopics = function ()
        {
            $scope.loading = iservice.FindAnswerTopics($http, function (data)
            {
                var topics = data.topics,
                    topicByID = {};

                for(var i = 0; i < topics.length; i++)
                {
                    topicByID[topics[i].id] = topics[i];
                }

                for(var i = topics.length; i--;)
                {
                    var topic = topics[i],
                        parent = topicByID[topic.parentID];

                    if(parent)
                        parent.countRecurse += topic.countRecurse;
                }

                if(topics.length)
                    $scope.topicId = topics[0].id;

                $scope.topics = topics;
            });

            // Return the promise to the caller
            return $scope.loading();
        };

        $scope.loadArticles= loadArticles = function ()
        {
            $scope.loading = iservice.FindAnswerArticles($http, $scope.topicId, $scope.searchText, true, 1, 1000, null, function (data)
            {
                iservice.SanitizeHistoryRows(data.interactions);

                $scope.articles = data.interactions;
                //$scope.articleListval = data.interactions.length;

                //var p = 1;
                //for(var j = 0 ; j < data.interactions.length ; j++)
                //{
                //    var x = (parseInt(p)) * $scope.pageSize;
                //    if(x <= j)
                //    {
                //        p = parseInt(p) + 1;
                //    }
                //    if($scope.param == data.interactions[j].id)
                //    {
                //        $scope.SelectedPage = p;
                //        break;
                //    }
                //}
            });

            //$scope.selected = topic;
            //$scope.isActive = function (topic)
            //{
            //    return $scope.selected === topic;
            //};
        }

        function topfaq()
        {
            if(QueueArticleSearch(topfaq)) return;
            $scope.recursive = true;
            iservice.FindAnswerArticles($http, 1, $scope.searchString, $scope.recursive, 1, 5, "RATING_REVERSE", function (data)
            {
                $scope.articleListFaq = data.interactions;
                $timeout(FinishedArticleSearch);
            });
        }




        function FixFilePath(article, member)
        {
            iservice.SanitizeInlineImageAttachments(article, member, article.attachments);
            article[member] = article[member].split('src="File.aspx?interactionID=').join('src="$value -rootpath$File.aspx?interactionID=');
        }

        //$scope.ShowArticle = function (article, $index, init)
        //{
        //    $scope.sharetoggle = false;
        //    $scope.selectedArticle = article;
        //    if(init == "init")
        //    {
        //        articleID = article.id; change = 1; toggle = 0;
        //    } else
        //    {
        //        if(articleID != article.id) { articleID = article.id; change = 1; toggle = 0; } else { change = 0; toggle = !toggle; if(toggle) { return false; } }
        //    }
        //    $scope.Searching = iservice.FindAnswerDetails($http, article.id, function (data)
        //    {
        //        $scope.selectedArticle.data = data;
        //        FixFilePath(data, "question");
        //        FixFilePath(data, "answer");

        //        data.questionSafe = $sce.trustAsHtml(data.question);
        //        data.answerSafe = $sce.trustAsHtml(data.answer);
        //        data.articleIdSafe = $sce.trustAsHtml(data.id);
        //        data.createdBySafe = $sce.trustAsHtml(data.creatorName);
        //        data.ratingSafe = $sce.trustAsHtml(data.rating);
        //        data.dateSafe = $sce.trustAsHtml(data.date);
        //        $scope.datet = data.date;
        //        data.viewSafe = $sce.trustAsHtml(data.viewCount);
        //    });
        //}
    });
})();
$endif$