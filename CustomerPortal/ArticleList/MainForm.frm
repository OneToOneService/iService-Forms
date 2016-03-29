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
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/6.2.0/foundation.min.css" />
    <link href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300" rel="stylesheet" type="text/css">
    <script>
        var rootPath = "$value -rootpath$";
    </script>
</head>
<body>
    <section ng-cloak ng-controller="ControllerFALogin">
        <div ng-show="isLoggedIn">
            <button type="button" class="alert tiny button" ng-click="logout()">Logout</button> Welcome <strong>{{ contactName }}</strong>
        </div>
        <div ng-hide="isLoggedIn || loginVisible || forgotPasswordVisible">
            <button type="button" class="tiny button" ng-click="showLogin()">Login</button> Welcome <strong>Guest</strong>
        </div>
        <form name="login" ng-hide="isLoggedIn || !loginVisible" ng-submit="loginSend()">
            <input type="email" placeholder="Email address" ng-model="email" />
            <input type="password" placeholder="Password" ng-model="password" />
            <button type="submit" class="success tiny button">Submit</button>
            <a ng-click="showForgotPassword()">Forgot password</a>
            <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }} </div>
        </form>
        <form name="forgotPassword" ng-hide="isLoggedIn || !forgotPasswordVisible" ng-submit="forgotPasswordSend()">
            <input type="email" placeholder="Email address" ng-model="email" />
            <button type="submit" class="success tiny button">Submit</button>
            <button type="button" ng-click="showLogin()" class="tiny button">Cancel</button>
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
        <form ng-submit="search()" class="row">
            <div class="column small-7">
                <input type="search" placeholder="Search terms" ng-model="searchText" />
            </div>
            <select placeholder="Select topic" class="column small-4" ng-model="topicId">
                <option ng-repeat="topic in topics" value="{{ topic.id }}">{{ topic.name }} ({{ topic.countRecurse }})</option>
            </select>
            <button type="submit" class="column small-1 success button">Search</button>
        </form>
        <div>
            <header class="row">
                <a class="column small-12 medium-9" ng-click="sort('subject')">
                    <strong>Support</strong>
                    <strong>{{ getSortGlyph("subject") }}</strong>
                </a>
                <a class="column medium-1 show-for-medium" ng-click="sort('rating')">
                    <strong>Rating</strong>
                    <strong>{{ getSortGlyph("rating") }}</strong>
                </a>
                <a class="column medium-1 show-for-medium" ng-click="sort('viewCount')">
                    <strong>Viewed</strong>
                    <strong>{{ getSortGlyph("viewCount") }}</strong>
                </a>
                <a class="column medium-1 show-for-medium" ng-click="sort('topicName')">
                    <strong>Topic</strong>
                    <strong>{{ getSortGlyph("topicName") }}</strong>
                </a>
            </header>
            <div class="row" ng-repeat-start="article in articles" ng-click="select(article)">
                <span class="column small-12 medium-9">{{ article.subject }}</span>
                <span class="column medium-1 show-for-medium">{{ article.rating }}</span>
                <span class="column medium-1 show-for-medium">{{ article.viewCount }}</span>
                <span class="column medium-1 show-for-medium">{{ article.topicName }}</span>
            </div>
            <div ng-if="selectedArticle == article" ng-repeat-end>
                <span>Question:</span>
                <div ng-bind-html="selectedArticle.questionSafe"></div>
                <span>Answer:</span>
                <div ng-bind-html="selectedArticle.answerSafe">
                </div>
                <div ng-show="selectedArticle.attachments.length">
                    <span>Attachments:</span>
                    <p ng-repeat="file in selectedArticle.attachments">
                        <a href="$value -rootpath$File.aspx?interactionID={{selectedArticle.id}}&fileID={{file.attachmentID}}">{{file.name}}</a>
                    </p>
                </div>
                <div>
                    <span>Article Details</span>
                    <div class="row">
                        <div class="column small-6">
                            Article ID - <span ng-bind-html="selectedArticle.articleIdSafe"></span>
                        </div>
                        <div class="column small-6">
                            Date Updated - {{ selectedArticle.date|amDateFormat:'YYYY-MM-DD h:mm:ss A' }}
                        </div>
                    </div>
                    <div class="row">
                        <div class="column small-6">
                            #Views - <span ng-bind-html="selectedArticle.viewSafe"></span>
                        </div>
                        <div class="column small-6">
                            Article Creator - <span ng-bind-html="selectedArticle.createdBySafe" class="ng-binding"></span>
                        </div>

                    </div>
                    <div>
                        <button class="button tiny" ng-click="sharetoggle = !sharetoggle">Share link to article</button>
                        <div ng-show="sharetoggle">
                            <input type="text" value="{{ hosturl }}?topicID={{ article.topicID }}&articleID={{ article.id }}" readonly />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="row">
            <button class="column small-1 tiny button" ng-class="{ disabled: currentPage == 1 }" ng-click="page(currentPage - 1)" ng-disabled="currentPage == 1">Previous</button>
            <button class="column small-1 tiny button" ng-repeat="p in pages" ng-class="{ disabled: p == currentPage, hollow: p != currentPage }" ng-click="page(p)" ng-disabled="p == currentPage">{{ p }}</button>
            <button class="column small-1 tiny button end" ng-class="{ disabled: currentPage == pagesCount }" ng-click="page(currentPage + 1)" ng-disabled="currentPage == pagesCount">Next</button>
        </nav>
        <div grey-out ng-show="loading()"></div>
    </section>
    $include -placeholder'common-javascript' -indent'  '$
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

    app.controller("ControllerFindAnswers", function ($scope, $http, $filter, $sce, $location, orderByFilter)
    {
        const recordsPerPage = 8,
              pagingButtonsCount = 5;

        var articles,
            currentPagerPage = 1,
            pagerButtonsPagesCount;

        $scope.hosturl = $location.absUrl().split("?")[0];
        $scope.pagesCount = 0;
        $scope.sortField = "";
        $scope.reverse = false;
        $scope.currentPage = 1;

        function getSortField()
        {
            var sortField = $scope.sortField.toUpperCase();

            if($scope.reverse)
                sortField += "_REVERSE";

            return sortField;
        }

        $scope.sort = function (keyName)
        {
            if(keyName == $scope.sortField) // If the user sorts by the same current sort key, just reverse the direction
                $scope.reverse = !$scope.reverse;
            else
                $scope.reverse = false; // Otherwise, reset the direction flag

            $scope.sortField = keyName; // Set the sortField to the param passed

            loadArticles();
        };

        $scope.page = function (pageNumber)
        {
            $scope.currentPage = pageNumber;

            page();
        };

        $scope.getSortGlyph = function (keyName)
        {
            if(keyName == $scope.sortField)
                return $scope.reverse ? "\u25BC" /* ▼ */ : "\u25B2" /* ▲ */;

            return "";
        };

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

        function page()
        {
            var pagerStart = (currentPagerPage - 1) * pagingButtonsCount + 1,
                pagerEnd = currentPagerPage * pagingButtonsCount;

            if(pagerEnd < $scope.currentPage)
            {
                currentPagerPage++;

                pagerStart += pagingButtonsCount;
                pagerEnd += pagingButtonsCount;

            }
            else if(pagerStart > $scope.currentPage)
            {
                currentPagerPage--;

                pagerStart -= pagingButtonsCount;
                pagerEnd -= pagingButtonsCount;
            }

            if(pagerEnd > $scope.pagesCount)
                pagerEnd = $scope.pagesCount;

            $scope.pages = new Array(pagerEnd - pagerStart + 1);

            for(var i = 0; i < $scope.pages.length; i++)
                $scope.pages[i] = pagerStart + i;

            var currentPageStart = ($scope.currentPage - 1) * recordsPerPage,
                currentPageEnd = currentPageStart + recordsPerPage,
                currentPageRecords;

            if(currentPageEnd > articles.length)
                currentPageEnd = articles.length;

            currentPageRecords = new Array(currentPageEnd - currentPageStart);

            for(var j = 0; currentPageStart < currentPageEnd; currentPageStart++, j++)
                currentPageRecords[j] = articles[currentPageStart];

            $scope.articles = currentPageRecords;
        }

        $scope.search = function ()
        {
            currentPagerPage = 1;
            $scope.currentPage = 1;

            loadArticles();
        }

        $scope.loadArticles = loadArticles = function ()
        {
            $scope.loading = iservice.FindAnswerArticles($http, $scope.topicId, $scope.searchText, true, 1, 1000, getSortField(), function (data)
            {
                iservice.SanitizeHistoryRows(data.interactions);

                articles = data.interactions;

                $scope.pagesCount = Math.ceil(articles.length / recordsPerPage);
                pagerButtonsPagesCount = Math.ceil($scope.pagesCount / pagingButtonsCount);

                page();
            });
        };

        function FixFilePath(article, member)
        {
            iservice.SanitizeInlineImageAttachments(article, member, article.attachments);

            article[member] = article[member].split('src="File.aspx?interactionID=').join('src="$value -rootpath$File.aspx?interactionID=');
        }

        $scope.select = function (article)
        {
            if($scope.selectedArticle == article)
                $scope.selectedArticle = null;
            else if(article.articleIdSafe)
                $scope.selectedArticle = article;
            else
            {
                $scope.loading = iservice.FindAnswerDetails($http, article.id, function (data)
                {
                    $scope.selectedArticle = article;

                    FixFilePath(data, "question");
                    FixFilePath(data, "answer");

                    article.date = data.date;
                    article.attachments = data.attachments;
                    article.questionSafe = $sce.trustAsHtml(data.question);
                    article.answerSafe = $sce.trustAsHtml(data.answer);
                    article.articleIdSafe = $sce.trustAsHtml(data.id);
                    article.createdBySafe = $sce.trustAsHtml(data.creatorName);
                    article.ratingSafe = $sce.trustAsHtml(data.rating);
                    article.viewSafe = $sce.trustAsHtml(data.viewCount);
                });
            }
        }
    });
})();
$endif$