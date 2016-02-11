$if -fieldregex'form'='^js$'$$header -filetype(js)$
var rootPath = '$value -rootpath$',
    app = angular.module('iService', ['ngSanitize', 'ngRoute', 'ui.date', "angularMoment"]),
    loggedIn = $json -loginloggedin$,
    canAgentLogin = $if -domainuser$true$else$false$endif$,
    messageList = {},
    agentList = {},
    agentsByID,
    nobody = null,
    agents,
    httpService,
    fetchParams;

iservice.ProcessLogin(loggedIn);

app.filter('formatInterval', function ()
{
    return function (wholeHours)
    {
        // wholeHours is a decimal number resembling hours with the fraction part as the minutes. We want to
        // format it in the HH:mm format
        var hours,
            minutes;

        hours = Math.floor(wholeHours); // Get the hours part by removing the fractions
        minutes = Math.round((wholeHours - hours) * 60).toString(); // Get the minutes by multiplying the fraction part by 60

        // If the minutes is a single digit number, pad it with a 0
        if(minutes.length == 1)
            minutes = "0" + minutes;

        return hours.toString() + ":" + minutes;
    };
});

function onDataFetched(data)
{
    agentsByID = {};
    agents = [];
    nobody = null;

    iservice.SanitizeHistoryRows(data.interactions);

    data.interactions.forEach(function (inter)
    {
        inter.hours = iservice.calculateWorkHours(inter.dateObj);
    });

    messageList.NewRows(data.interactions);

    data.interactions.forEach(incrementAgent);

    agents.forEach(function (ag)
    {
        ag.hours = iservice.calculateWorkHours(ag.oldestObj);
    });

    agentList.NewRows(agents);

    // TODO: Data should be refreshed using live socket connection
    setTimeout(fetchData, 15 * 1000); // Refresh the data every 15 seconds
}

function fetchData()
{
    return iservice.MessageSearch(httpService, fetchParams, 0, 1000, null, onDataFetched);
}

function incrementAgent(message)
{
    var id = message.assignedToID;

    if(id)
    {
        var agent = agentsByID[id];

        if(agent)
        {
            agent.num++;

            if(message.dateObj < agent.oldestObj)
            {
                agent.oldestObj = message.dateObj;
                agent.date = message.date;
            }

            return;
        }

        agent = { id: message.assignedToID, name: message.agentName, num: 1, oldest: message.date, oldestObj: message.dateObj };

        agentsByID[id] = agent;
        agents.push(agent);

        return;
    }

    message.assignedToID = 'none';

    if(nobody)
    {
        nobody.num++;

        if(message.dateObj < nobody.oldestObj)
        {
            nobody.oldestObj = message.dateObj;
            nobody.date = message.date;
        }

        return;
    }

    nobody = { id: 'none', name: 'Unassigned', num: 1, oldest: message.date, oldestObj: message.dateObj };

    agents.push(nobody);
}

function ControllerMessageQueueSuperviseByAgent($scope, $http, $timeout)
{
    var statuses = [ $repeat -messagesearchfields(statuses)$ { id: '$value -Pjs -messagesearchfield(value)$', name: '$value -Pjs -messagesearchfield(name)$' } $if -more$,
                     $endif$$endrepeat$ ],
    unassigned,
    queued;

    for(var i = 0; i < statuses.length; i++)
    {
        var status = statuses[i];

        if(status.name == 'Queued')
            queued = status.id;
        else if(status.name == 'Unassigned')
            unassigned = status.id;
    }

    var param = {
        groups:
          [{
              fields:
              [{ where: 'entire', fieldID: 'status', searchString: unassigned },
                { where: 'entire', fieldID: 'status', searchString: queued }]
          }]
    };

    $scope.agentList = agentList;

    InstallControllerSort(agentList, { column: 'num', ascend: false });

    $scope.messageList = messageList;

    InstallControllerSort(messageList, { column: 'dateObj', ascend: true });

    $scope.showFor = null;

    $scope.showMessage = function (message)
    {
        return $scope.showFor && message.assignedToID == $scope.showFor.id;
    }

    function isAgentSelected(agent)
    {
        return $scope.showFor && agent.id == $scope.showFor.id;
    }

    $scope.isAgentSelected = isAgentSelected;

    httpService = $http;
    fetchParams = param;

    $scope.SearchRunning = fetchData();

    $scope.selectAgent = function (agent)
    {
        $scope.showFor = isAgentSelected(agent) ? null : agent;
    }
}

// TODO: This controller is copied from form 68. We need to place it in a common script file
function ControllerFALogin($scope, $http, $rootScope)
{
    $scope.toggleLogin = iservice.loggedIn.isLoggedIn;
    $scope.toggleUserOption = false;
    $scope.reset = function (login)
    {
        if(login)
        {
            login.$pristine = true
            login.$valid = true
            $scope.toggleLogin = !$scope.toggleLogin
        }
    };
    $scope.Login = function ()
    {
        $scope.submitted = true;
        $scope.errors = [];
        if(!$scope.login.$invalid)
        {
            $scope.Loading = iservice.Login($http, $scope.emailAddress, $scope.password, function (data)
            {
                if(!data.loggedIn.isLoggedIn) { $scope.errors = ['The information you entered doesn\u0027t match our records. Please try again.']; return; }
                if(data.errors && data.errors.length) return;
                iservice.ProcessLogin(data.loggedIn);
                fetchData();
                $scope.toggleUserOption = false;
            });
        }
    }
    $scope.Logout = function ()
    {
        $scope.errors = [];
        $scope.Loading = iservice.Logout($http, function (data)
        {
            iservice.ProcessLogin(data.loggedIn);
        });
    }
}

var ControllerAgent = ControllerWithID('Agent'),
    ControllerMessage = ControllerWithID('Message');

$endif$
$if -fieldregex'form'='^$'$
<!DOCTYPE html>
<html xmlns:ng="http://angularjs.org" id="ng-app" ng-app="iService">
<head>
    $include -placeholder'common-head' -indent'  '$
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/6.1.1/foundation.min.css" />
    <link rel="stylesheet" href="$value -rootpath$css/webapp.messagequeue.css" />
    <link rel="stylesheet" href="$value -rootpath$f/$value -formid$?form=css" />
    <link rel="stylesheet" href="$value -rootpath$f/68?form=css" />
</head>
<body ng-controller="ControllerBody">
    <div ng-cloak class="page loginsection" ng-controller="ControllerFALogin">
        <div ng-show="iservice.loggedIn.isLoggedIn" class="login_container">
            <span ng-click="toggleUserOption = !toggleUserOption" class="userOption"> <span class="loggedinuname"> Hello </span>{{ iservice.loggedIn.contactName }}<img width="10" style="margin-left: 7px;" height="5" title="" alt="" src="data:image/png;base64,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" /></span>

            <div class="user-option" ng-show="toggleUserOption">
                <img class="user-option-arrow" width="22" height="18" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAYAAABfJS4tAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAZlJREFUeNqs1DGLE1EUhuEoFmIji4WFlZ2FraX/YFuxsLG3trCz9BcIlpZ2so0gCwpRdPG9N1eUYScxuKAZCGMgke9eZ1j12GQkumY3E7f42odTvJyOmXWOY8AmkAPbZtY5DvAkcM0591FSDtS/YUlrD7jlnPsiqayq6jMw+S8YOAPcDSG8TSntxxhtOp0G4OXaMHAaeBhC2E0p7UsySTYcDp8B99eCgQ3gcZ7nr1JK3xtUkmVZ1gVutoaBi8DTfr+/k1KyRVSSee8z4FIrGLgMDEej0U6M8QAqyYAEnFoZBq4Cg/F47JehkgbAhybDI2HgunOuP5lM3i9DY4xWluVr4MlKMHADKCV9WnKlSbKUUlPEvUPheU63e72elzQ6DG0WQvDA5lHwA+99Vtd1WgWVZM65PeDcP2Hg7Dx8X1XVt1XReRFfgRMHYOACsJVlWbeua2uDzmazPeDd4nNqPtR5YDfP8+dtUUlWFMUb4NEfMHAFyIuieFFVVWtUkg0Ggy5w52/4R1EU3bquLcbYeiklCyH0gJ+L+zUAZs8Ml0kOo0gAAAAASUVORK5CYII=" />
                <ul>
                    <li><a href="javascript:void(0)" class="logout" ng-click="Logout()">Logout</a></li>
                </ul>
            </div>
        </div>

        <form ng-show="!iservice.loggedIn.isLoggedIn" name="login" action="" method="POST" novalidate>
            <div class="login_container">
                <a href="javascript:void(0)" id="show_login" ng-click="toggleLogin = !toggleLogin">Login</a>
            </div>
            <div class="box_wrap" id="box_wrap" ng-hide="toggleLogin" ng-animate="'box_wrap'">
                <img width="16" height="12" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAMCAYAAAEc4A0XAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAABc0lEQVR42mL8//8/AwgABBATiHj1+s1/gABiAIncu3cvECCAQMTkl69e/wcIILAIVLQXJAAQQHABmFKAAGJhgAKQAUxMTAwAAYQwDQj+/ftXCRBAKFqQtHa9ePnq/6PHj/8DBBDcCBC4f//+BG4e3nwgBvP//P59GSCAGEE6gBLTgIKZDGjg65fPGgABhNUKqDW7QDRAADHC/IoMHj569J+TkwtkQgpAADGhSz6CSkLBKYAAQjEB5GoODk4GqBcZJMTFGAECCG7C48dP4JJgH/z5DaYBAogF6AN+FlbWD+wcHChW/f3zB0wDBBBWR+ICQMPqGBmZGtk52Bl+//4NMiQIIIBYiNTYy8zMXMTFzcPAyMgIFgMZAAS/AAIIrwtAMcPMzJLPwcnJgCUSQBQ7QACx4NA4mYWFJQcWpegAGkDLFBUVfwEEEHpamAYMsExcGhEGgANwGYgACCBQKLsC6UxWNrZAQhph4N/fvyDqCIgACDAAcxzWeG16dZIAAAAASUVORK5CYII=" class="login_arrow" />
                <div class="box">
                    <div class="clear"></div>
                    <div class="box_con">
                        <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }} </div>
                        <div>

                            <span class="l">Login</span>
                            <span class="l_row control-group" ng-class="{true: 'error'}[submitted && login.username.$invalid]">
                                <input type="text" name="username" class="uname" placeholder="Email" ng-model="emailAddress" required>
                                <span class="validation_error" ng-show="submitted && login.username.$error.required">Username Required</span>
                            </span>
                            <span class="l_row control-group" ng-class="{true: 'error'}[submitted && login.password.$invalid]">
                                <input type="password" name="password" class="upassword" placeholder="Password" ng-model="password" required>
                                <span class="validation_error" ng-show="submitted && login.password.$error.required">Password Required</span>
                            </span>
                            <span class="l_btn_row">
                                <input type="submit" class="btn_okay" value="Login" ng-click="Login()" />
                                <input type="button" class="btn_cancel" value="Cancel" ng-click="reset(login)" />
                            </span>
                            <span class="box-title">
                                <a href="javascript:void(0)">Forgot Password</a>
                            </span>
                            <div grey-out ng-show="Loading()"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="clear"></div>
    <section ng-show="!iservice.loggedIn.isLoggedIn" class="main-tabbed-content common-tabs-container">
        <strong>Please login to view the messages</strong>
    </section>
    <div ng-cloak ng-controller="ControllerMessageQueueSuperviseByAgent" class="main-tabbed-content common-tabs-container" ng-show="HaveRight('Tab.Top.MessageQueue')">
        <div ng-include="'superviseByAgentBody.html'"></div>
    </div>
    $include -placeholder'common-footer' -indent'  '$
    $include -placeholder'interaction-properties' -indent'  '$
    $include -placeholder'history-partials' -indent'  '$
    $include -placeholder'common-javascript' -indent'  '$
    <script type="text/javascript" src="$value -rootpath$js/iService.messagequeue.js?v=$value -version -urlencode$"></script>
    <script type="text/javascript" src="$value -rootpath$f/84"></script>
    <script type="text/javascript" src="$value -rootpath$f/$value -formid$?form=js"></script>
    <script src="$value -rootpath$js/iService.directive.js?v=$value -version -urlencode$"></script>
    <script type="text/ng-template" id="superviseByAgentBody.html">
        <h2>Count of open messages by agent.</h2>
        <table class="messages common-search-results hover stack">
            <thead>
                <tr>
                    <th class="column-name"><span class="nglink" ng-click="agentList.SortClick('name')">Agent Name</span><div class="sort-direction-indicator" ng-class="agentList.SortDirectionClass('name')"></div></th>
                    <th class="column-num"><span class="nglink" ng-click="agentList.SortClick('num')"># Messages Assigned</span><div class="sort-direction-indicator" ng-class="agentList.SortDirectionClass('num')"></div></th>
                    <th class="column-hours"><span class="nglink" ng-click="agentList.SortClick('hours')">Oldest Message Business Hours</span><div class="sort-direction-indicator" ng-class="agentList.SortDirectionClass('oldHours')"></div></th>
                </tr>
            </thead>
            <tbody class="agents">
                <tr ng-repeat-start="agent in agentList.rows" ng-class-even="'row-even'" ng-class-odd="'row-odd'" ng-class="{'row-selected': isAgentSelected(agent) }" ng-controller="ControllerAgent">
                    <td class="column-name padded">{{ agent.name }}</td>
                    <td class="column-num padded"><span class="nglink" ng-click="selectAgent(agent)">{{ agent.num }}</span></td>
                    <td class="column-hours padded">{{ agent.hours | formatInterval }}</td>
                </tr>
                <tr ng-repeat-end ng-if="isAgentSelected(agent)">
                    <td colspan="3" class="agent-messages">
                        <table class="messages common-search-results hover stack">
                            <thead>
                                <tr>
                                    <th class="column-topic"><span class="nglink" ng-click="messageList.SortClick('topicName')">Topic Name</span><div class="sort-direction-indicator" ng-class="messageList.SortDirectionClass('topicName')"></div></th>
                                    <th class="column-date"><span class="nglink" ng-click="messageList.SortClick('dateObj')">Message Date</span><div class="sort-direction-indicator" ng-class="messageList.SortDirectionClass('dateObj')"></div></th>
                                    <th class="column-hours"><span class="nglink" ng-click="messageList.SortClick('hours')">Business Hours</span><div class="sort-direction-indicator" ng-class="messageList.SortDirectionClass('hours')"></div></th>
                                </tr>
                            </thead>
                            <tbody class="agents">
                                <tr ng-repeat="message in messageList.rows | filter: showMessage" ng-class-even="'row-even'" ng-class-odd="'row-odd'" ng-controller="ControllerMessage">
                                    <td class="column-topic padded">{{ message.topicName }}</td>
                                    <td class="column-date padded">{{ message.date | amDateFormat:'YYYY-MM-DD h:mm:ss A' }}</td>
                                    <td class="column-hours padded">{{ message.hours | formatInterval }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </script>
</body>
</html>
$endif$$if -fieldregex'form'='^css$'$$header -filetype(css)$
/* Foundation overrides */
tbody td,
tbody th,
tfoot td,
tfoot th,
thead td,
thead th
{
    padding: 0; /* Eliminate the big padding set by Foundation */
}
/* End of Foundation overrides*/

/* Override for the login section style */
.loginsection
{
    width: 85% !important;
    float: none !important;
    margin: 5px auto auto auto;
}

/* Style for the agent messages table cell */
.common-search-results .agent-messages
{
    border-style: dashed;
    padding: 5px;
    border-width: 2px;
}

.common-search-results { width: 100%; table-layout: fixed; }
.common-search-results td { border: solid 1px #cacaca; }
.common-search-results th { border-bottom: solid 1px #cacaca; }
.common-search-results tr.row-even td { background-color: #e8e8e8; }
.common-search-results tr.row-odd td { background-color: #fff; }
.common-search-results tr.row-selected td { background-color: #f0fff0; }
$endif$