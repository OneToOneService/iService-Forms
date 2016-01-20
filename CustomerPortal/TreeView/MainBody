$if -fieldregex'form'='^$'$
<!DOCTYPE html>
<html xmlns:ng="http://angularjs.org" id="ng-app" ng-app="iService">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Find Answer Demonstration</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content=""/>
  $include -placeholder'common-head' -indent'  '$
  <link rel="stylesheet" href="$value -rootpath$f/$value -formid$?form=css" />
  <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>  
  <script> 
    var rootPath = '$value -rootpath$';
    var o2o = {};
  </script>
</head>
<body ng-controller="ControllerBody">
  
  <div class="body_container"> 
      
  </div>    
 
  <div  class="main_container" ng-cloak>
       <div ng-cloak class="page loginsection" ng-controller="ControllerFALogin">
        <div ng-show="iservice.loggedIn.isLoggedIn" class="login_container">
        <span ng-click="toggleUserOption = !toggleUserOption" class="userOption"> <span class="loggedinuname"> Hello </span>{{ iservice.loggedIn.contactName }}<img width="10" style="margin-left: 7px;" height="5" title="" alt="" src="data:image/png;base64,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" /></span>

           <div class="user-option" ng-show="toggleUserOption">
              <img class="user-option-arrow" width="22" height="18" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAYAAABfJS4tAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAZlJREFUeNqs1DGLE1EUhuEoFmIji4WFlZ2FraX/YFuxsLG3trCz9BcIlpZ2so0gCwpRdPG9N1eUYScxuKAZCGMgke9eZ1j12GQkumY3E7f42odTvJyOmXWOY8AmkAPbZtY5DvAkcM0591FSDtS/YUlrD7jlnPsiqayq6jMw+S8YOAPcDSG8TSntxxhtOp0G4OXaMHAaeBhC2E0p7UsySTYcDp8B99eCgQ3gcZ7nr1JK3xtUkmVZ1gVutoaBi8DTfr+/k1KyRVSSee8z4FIrGLgMDEej0U6M8QAqyYAEnFoZBq4Cg/F47JehkgbAhybDI2HgunOuP5lM3i9DY4xWluVr4MlKMHADKCV9WnKlSbKUUlPEvUPheU63e72elzQ6DG0WQvDA5lHwA+99Vtd1WgWVZM65PeDcP2Hg7Dx8X1XVt1XReRFfgRMHYOACsJVlWbeua2uDzmazPeDd4nNqPtR5YDfP8+dtUUlWFMUb4NEfMHAFyIuieFFVVWtUkg0Ggy5w52/4R1EU3bquLcbYeiklCyH0gJ+L+zUAZs8Ml0kOo0gAAAAASUVORK5CYII=" />
              <ul>
                 <li><a href="#/details" class="profile"  ng-href="#/details">User Profile</a></li>
                 <li><a href="#/subscription" ng-href="#/subscription" class="subscription">My Subscription</a></li>
                 <li><a href="javascript:void(0)" class="logout" ng-click="Logout()">Logout</a></li>
              </ul>
            </div>
        </div>
       
        <form ng-show="!iservice.loggedIn.isLoggedIn" name="login" action="" method="POST" novalidate>  
      <div class="login_container">
        <a href="javascript:void(0)" id="show_login" ng-click="toggleLogin = !toggleLogin">Login</a>
        <a href="javascript:void(0)" id="show_login">Sign Up</a>
      </div>
      <div class="box_wrap" id="box_wrap" ng-hide="toggleLogin" ng-animate="'box_wrap'">
         <img width="16" height="12" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAMCAYAAAEc4A0XAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAABc0lEQVR42mL8//8/AwgABBATiHj1+s1/gABiAIncu3cvECCAQMTkl69e/wcIILAIVLQXJAAQQHABmFKAAGJhgAKQAUxMTAwAAYQwDQj+/ftXCRBAKFqQtHa9ePnq/6PHj/8DBBDcCBC4f//+BG4e3nwgBvP//P59GSCAGEE6gBLTgIKZDGjg65fPGgABhNUKqDW7QDRAADHC/IoMHj569J+TkwtkQgpAADGhSz6CSkLBKYAAQjEB5GoODk4GqBcZJMTFGAECCG7C48dP4JJgH/z5DaYBAogF6AN+FlbWD+wcHChW/f3zB0wDBBBWR+ICQMPqGBmZGtk52Bl+//4NMiQIIIBYiNTYy8zMXMTFzcPAyMgIFgMZAAS/AAIIrwtAMcPMzJLPwcnJgCUSQBQ7QACx4NA4mYWFJQcWpegAGkDLFBUVfwEEEHpamAYMsExcGhEGgANwGYgACCBQKLsC6UxWNrZAQhph4N/fvyDqCIgACDAAcxzWeG16dZIAAAAASUVORK5CYII=" class="login_arrow" />
        <div class="box">
          <div class="clear"></div>
           <div class="box_con">
              <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }} </div>
               <div>
               
               <span class="l">Login</span>
               <span class="l_row control-group"  ng-class="{true: 'error'}[submitted && login.username.$invalid]">
                 <input type="text" name="username" class="uname" placeholder="Email" ng-model="emailAddress" required>
                  <span class="validation_error" ng-show="submitted && login.username.$error.required">Username Required</span>
               </span>
                <span class="l_row control-group" ng-class="{true: 'error'}[submitted && login.password.$invalid]">
                <input type="password" name="password" class="upassword" placeholder="Password" ng-model="password" required>
                 <span class="validation_error" ng-show="submitted && login.password.$error.required">Password Required</span>
                </span>
               <span class="l_btn_row">
               <input type="submit"   class="btn_okay" value="Login" ng-click="Login()" />
               <input type="button"  class="btn_cancel" value="Cancel" ng-click="reset(login)" />
               </span>
               <span class="box-title" >
                <a href="javascript:void(0)" > Forgot Password</a> <a href="javascript:void(0)"> Register New Account</a>
               </span>
               <div grey-out ng-show="Loading()"></div>
           </div>
           <div class="clear"></div> 
        </div>
      </div>
      </form> 
       </div>
    
     <div class="clear"></div>
     <div class="content_section"  ng-controller="ControllerTab">
        <ul class="tabs" data-persist="true">
                  <li class="" ng-class="{ active: isActive('/find-answers')}" ng-click="showfindanswer()" ><a href="#/find-answers" class="findanswer"  ng-href="#/find-answers">FIND ANSWERS </a></li>
                  <li class="" ng-class="{ active: isActive('/ask-question')}" ><a href="#/ask-question" ng-click="showaskquestion()"  class="askquestion" ng-href="#/ask-question">ASK QUESTIONS </a></li>
                  <li class="" ng-class="{ active: isActive('/my-inbox')}" ><a href="#/my-inbox"   class="myinbox" ng-href="#/my-inbox">MY INBOX </a></li>
                  <div class="clearfix"></div>
        </ul>
    <div class="clearfix"></div>
    
  
    <script type=text/ng-template id=findanswer.html> 
    <div class="findanswersection" ng-controller="ControllerFindAnswers">
     <section class="content">
     
     <section class="left_container">
                        <article class="list_container">
                           <div class="showmenu" ng-click="toggle()">&nbsp;</div>
                           <h2 class="">Topic List</h2>
                           
                           <nav class="nav topiclist" role="navigation" ng-class="myClass" >
                                <ul class="nav__list">
                                  <li></li>
                                  <li ng-repeat="topic in topicList" ng-click="ShowTopic(topic)" id="{{topic.id}}"  ng-init="(topic.id == param2) ? ShowTopic(topic) : ''" 
  ng-class="{active: isActive(topic)}" on-finish-render="test()">
                                    <input id="group-[]" type="checkbox" hidden />
                                    <label for="group-1"><span class="fa fa-angle-right">{{topic.segmentName}} - </span> <span class="nglink1" >{{topic.name}}</span><strong>&nbsp;{{topic.count}} ({{topic.countRecurse}})</strong></label>
                                  </li>
                                </ul>
                              </nav>
                        </article>
                        
                        <article class="list_container topfaq" ng-controller="ControllerTopFaq" >
                           <div class="showtopfaq" ng-click="togglefaq()">&nbsp;</div>
                           <h2 class="">Top FAQ</h2>
                           <nav class="nav topfaqlist" role="navigation" ng-class="myClassFaq">
                                <ul class="nav__list">
                                 <li ng-repeat="articles in articleListFaq">
                                    <label ><span class="fa fa-angle-right"></span><a href="#/find-answers?articleID={{articles.id}}">{{articles.subject}}</a></label>
                                  </li>
                                </ul>
                              </nav>
                        </article>
      </section>                   
     <div class="right_container">
    <div class="article-list" ng-cloak ng-show="selectedTopic">
    
      <article class="search_container">
        <h2 class="pagenave">Article List ({{selectedTopic.segmentName}} -&gt; {{selectedTopic.name}})</h2>
      <label class="labal"><input type="checkbox" name="checkbox" ng-model="recursive" value="value" ng-change="ShowTopic(selectedTopic)">Include Sub Topics</label><br>
       <div style="clear:both"></div>
	   <form method="" name="" id="search" onSubmit="return false;">
        <input type="text" ng-model="searchString" value="" placeholder="Search Keyword">
        <input type="submit" class="submitBtn" name="search" ng-click="ShowTopic(selectedTopic)" value="Search">
        </form>
      </article>
      <section class="pagination">
        <dir-pagination-controls></dir-pagination-controls>
      </section>
      
      <div style="clear:both"></div>
                           <section class="search_results_container">
                              <article class="t_heading">
                                 <article class="col1" ng-click="sort('subject')">Subject<span class="glyphicon sort-icon" ng-show="sortKey=='subject'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></article>
                                 <article class="col2" ng-click="sort('topicName')">Topic<span class="glyphicon sort-icon" ng-show="sortKey=='topicName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></article>
                                 <article class="col3" ng-click="sort('date')">Date<span class="glyphicon sort-icon" ng-show="sortKey=='date'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></article>
                                 <article class="col4" ng-click="sort('viewCount')">Views<span class="glyphicon sort-icon" ng-show="sortKey=='viewCount'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></article>
                                 <article class="col5" ng-click="sort('rating')">Rating<span class="glyphicon sort-icon" ng-show="sortKey=='rating'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></article>
                              </article>
                          </section>
                          <section class="search_results" >
                              <div class="t_content" id="articleID{{article.id}}"   ng-click="ShowArticle(article,$index)"  dir-paginate="article in articleList|orderBy:sortKey:reverse|filter:search|itemsPerPage:8" current-page="SelectedPage" ng-init="(article.id == param) ? ShowArticle(article,$index) : ''" >
                                <div class="question">
                                     <aside class="col1">
                                        {{article.subject}}
                                     </aside>
                                      <aside class="col2">
                                      {{article.topicName}}
                                     </aside>
                                      <aside class="col3">
                                        {{article.date}}
                                     </aside>
                                     <aside class="col4">
                                       {{article.viewCount}}
                                     </aside>
                                      <aside class="col5">
                                       {{article.rating}}
                                     </aside>
                                </div>
                                <div class="article-details" ng-cloak ng-show="SeeArticle(article,$index)">
                                     <div id="first_ans" class="ans article-details" ng-cloak style="display: block;" >
                                        <aside class="ans_in">
                                        <img class="ans_arrow" width="22" height="18" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAMAAABo+94fAAAAz1BMVEX////MzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzd3d3Z2dni4uLW1tbm5ubMzMzr6+vPz8/Q0NDQ0NDPz8/w8PDMzMzOzs7MzMzMzMz09PTNzc3MzMzMzMzMzMzNzc3Nzc34+PjMzMzMzMzMzMz8/PzMzMzMzMzMzMzMzMzMzMz///+D0GoAAAAARHRSTlMAAQIECAoPERMXGyEoLDU9TFVXW2BrdXmAiJaZoamwsre6vL/AwMPDxcjOzs/Q0NPW2NnZ2tvc3d/g5Ovs7fHy9vn9/qTS6xoAAACfSURBVBjTbc9HAoIwFEXR2Ltib1iBIKKIxF6w/f2vyUgQE/AOz+g9hKaOhP70IIdqPMrXE7k0ozyzwF12UmHuKQCuLSdD3MBAHQ8zIhdt+IQnBYETd49B25cE3xHm+rbC89hgDMamxnFX8RnIuf5jyYTA561gaPYYMD3Q/3LsBpybctr3lcU54FGe8UDjGdR1zuO2KjDoThm9aAsI+fMNUo8uTB28rI4AAAAASUVORK5CYII=" />
                                        <span class="label">Question:</span><div class="article-body" ng-bind-html="selectedArticle.data.questionSafe"></div>
                                        <span class="label">Answer:</span><div class="article-body" ng-bind-html="selectedArticle.data.answerSafe"></div>
                                        <aside class="articleDetail">
                                           <span class="label">Article Details</span>                                             <aside class="detail">
                                              <aside class="row">
                                                <aside class="dcol">
                                                 Article ID - <span ng-bind-html="selectedArticle.data.articleIdSafe"></span>
                                                 </aside> 
                                                 <aside class="dcol">
                                                 Date Updated -<span ng-bind-html="selectedArticle.data.dateSafe"></span>
                                                </aside> 
                                                <aside class="dcol">
                                                 #Views - <span ng-bind-html="selectedArticle.data.viewSafe"></span>
                                                </aside> 
                                                 <aside class="dcol">
                                                 Article Creator - <span ng-bind-html="selectedArticle.data.createdBySafe"></span>
                                                </aside> 
                                              
                                            </aside> 
                                        </aside>
                                         <aside class="articleDetail">
                                           <span class="label">Subscribe and Rate this article</span>     
                                           
                                            <aside class="detail">
                                              <aside class="row">
                                                <aside class="dcol">
                                                   Not Helpful ---------> Very Helpful - 46546
                                                 </aside> 
                                                 <aside class="dcol">
                                                 
                                                </aside>
                                                <aside class="dcol">
                                                  <a href="" class="btn"> 
                                                     Email me when this article changes!
                                                  </a>   
                                                </aside>
                                            </aside> 
                                            </aside>
                                        </aside> 
                                            
                                    </div>
                                 </div>
                              </div>
                              <span ng-show="!articleList.length" ng-cloak>No Articles</span>
                          </section>
      
      
    </div>
    
    
    <div grey-out ng-show="Searching()"></div>
    </div>
    </section>
    </div>
    </script>
    <script type=text/ng-template id=askquestion.html>
    <div class="askquestion_content" >
             <div class="page askqu" ng-controller="ControllerAskAQuestion">
               <form name="askquestionform" novalidate>    
                  <span ng-show="result" class="submitedsuccess">Your question was submitted.  Ref #{{ result }}.</span>
                  <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }}</div>
                 <div class="clear"></div>
   				 <div ng-cloak style="float:left;">

                  <div ng-show="!iservice.loggedIn.isLoggedIn">
                    <div class="row  control-group"  ng-class="{true: 'error'}[askquestionsubmitted && askquestionform.fromEmail1.$invalid]"> 
                      <label>From </label><input type="text" name="fromEmail1" ng-model="destEmail" placeholder="Your Email Address" value="" required>

                    <span class="validation_error" ng-show="askquestionsubmitted && askquestionform.fromEmail1.$error.required">Please enter from email</span> 
   
                       <span class="w100 subtext">The answer to your question will be sent to the specified address.</span>
                     </div>
                    
                  </div>
                  <div ng-show="iservice.loggedIn.isLoggedIn">
                    <div class="row  control-group"  ng-class="{true: 'error'}[askquestionsubmitted && askquestionform.fromEmail.$invalid]"> 
                   <label> From </label><select class="w60" ng-cloak ng-model="destEmail" name="fromEmail" ng-options="login.name as login.name for login in iservice.loggedIn.logins" required></select>
                  <span class="validation_error" ng-show="askquestionsubmitted && askquestionform.fromEmail.$error.required"> Please enter from email</span> 

                   <span class="w100 subtext">The answer to your question will be sent to the specified address.</span>
                   </div>
                  </div>
                  <div class="row  control-group"  ng-class="{true: 'error'}[askquestionsubmitted && askquestionform.questionsubject.$invalid]"> 
                   <label> Subject </label>
                   <input type="text" ng-model="details.subject" name="questionsubject" placeholder="Subject" value="" required>
                   <span class="validation_error" ng-show="askquestionsubmitted && askquestionform.questionsubject.$error.required">Please enter the subject</span> 

                   </div>
                   <div class="row control-group"  ng-class="{true: 'error'}[askquestionsubmitted && askquestionform.questionTopic.$invalid]">
                  <span class="w100">
  				    Please pick the topic of your question:
                  </span> 
   				 <select ng-cloak class="topic t_select" ng-model="details.topicID" name="questionTopic"  ng-options="topic.id as topic.option for topic in topicsList" ></select>
                  <span class="validation_error" ng-show="askquestionsubmitted && askquestionform.questionTopic.$error.required">Please enter topic of your question</span> 
                 </div>
                  <div class="row2 control-group"  ng-class="{true: 'error'}[askquestionsubmitted && askquestionform.questionBody.$invalid]">
                  <span class="w100 blk">
  				    Enter the body of your question:
                  </span>
                  <textarea style="width:100%" name="questionBody" ckeditor ng-model="details.bodyHtml" required></textarea> 
                  <span class="validation_error" ng-show="askquestionsubmitted && askquestionform.questionBody.$error.required">Please enter body of your question</span> 
                  </div>
                  <div class="interaction-property-list" ng-repeat="group in properties" ng-controller="ControllerPropertyGroup">
                    <div class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-repeat="property in group.properties" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
                  </div>
                  <button type="submit" id="submit" class="asksubmitbtn" ng-show="!result" ng-click="Submit()">Submit</button>
                
                </div>
                </form>
   			 <div grey-out ng-show="Searching()"></div>
             </div>
 		 </div>
    </script>	
    
    <script type=text/ng-template id=myinbox.html>
	    <div class="hitory_content contact-history-section" >
		    <div ng-show="!iservice.loggedIn.isLoggedIn">
			    <p>
				   Login to view your previous questions and answers. If you don&rsquo;t have an account in our support portal Sign Up now
				</p>
			</div>
            <div class="page" ng-controller="ControllerMyHistory" ng-show="iservice.loggedIn.isLoggedIn">
			   	
				<div ng-cloak class="customer-history history-content">
				  <div class="page-links pagination">
				      <ul>
						 <li ng-repeat="page in pageNums" ng-controller="ControllerPageLink">
							  <span id="{{idPrefix}}link" ng-class="PageLinkClass(page)" ng-click="SelectPage(page)">{{page}}</span> 
						 </li>
         			 </ul>   
				  </div>
				  <div class="interaction-history" ng-controller="ControllerHistory">
          <div class="history-common-search-results">
              <div class="history-heading">
                <div class="column-subject"><span class="nglink" ng-click="SortClick('subject')">Subject</span><div class="sort-direction-indicator" ng-class="SortDirectionClass('subject')"></div></div>
                <div class="column-type"><span class="nglink" ng-click="SortClick('type')">Type</span><div class="sort-direction-indicator" ng-class="SortDirectionClass('type')"></div></div>
                <div class="column-date"><span class="nglink" ng-click="SortClick('dateObj')">Date</span><div class="sort-direction-indicator" ng-class="SortDirectionClass('dateObj')"></div></div>
              </div> 
              <div class="history-content"> 
                <div ng-repeat="thread in Rows()" ng-controller="ControllerHistoryThread" ng-class-even="'thread-even'" class="history-content-row" ng-class-odd="'thread-odd'" ng-include="HistoryThreadUrl(thread)"></div>
               </div>
          </div>
        $include -placeholder'history-partials'$
        
            <script type="text/ng-template" id="stockresponse-picker.html">
          <div class="stock-picker" ng-controller="ControllerPicker">
            <div class="tabs">
              <div class="tab" class="variable" ng-class="TabClass('var')"><span class="nglink" ng-click="ClickTab('var')">Variables</span></div>
              <div class="tab" class="stock" ng-class="TabClass('stock')"><span class="nglink" ng-click="ClickTab('stock')">Stock Responses</span></div>
            </div>
            <div class="vars " ng-show="tab == 'stock'" ng-controller="ControllerPickerStock">
              <input id="{{idPrefix}}stockSearch" class="response-filter" type="text" value="" ng-model="stockSearch" placeholder="Keyword Search"/>
              <div ng-repeat="section in stockSections" class="section" ng-controller="ControllerPickerSection">
                <span class="label">{{section.name}}</span>
                <div class="stock" ng-repeat="stock in section.responses | filter:stockSearch" ng-controller="ControllerPickerStock">
                  <span id="{{idPrefix}}add" class="nglink" ng-click="PasteStockVar(stock, pasteTarget)">{{stock.name}}</span>
                  <div id="{{idPrefix}}text" class="var-only nglink" ng-click="PasteStockText(stock, pasteTarget)">Text</div>
                </div>
              </div>
            </div>
            <div class="vars" ng-show="tab == 'var'" ng-controller="ControllerPickerVariable">
              <div ng-repeat="section in varSections" class="section" ng-controller="ControllerPickerSection">
                <span class="label">{{section.name}}</span>
                <div class="var" ng-repeat="variable in section.properties" ng-controller="ControllerPickerVariable" ng-class="VarClass(variable)">
                  <span id="{{idPrefix}}add" ng-class="{nglink: variable.text, 'seg-name': !variable.text }" ng-click="PasteVariable(variable, pasteTarget)">{{variable.name}}</span>
                </div>
              </div>
            </div>
            <div grey-out ng-show="StockLoadRunning()"></div>
          </div>
        </script>
			<script type="text/ng-template" id="history-thread-closed.html">
              <div class="list-history-row-container"> 
              <div class="thread-root interaction-type-history" ng-class="InteractionType(thread.type)">
                <div class="column-expand thread-expander-history">
                  <div id="{{idPrefix}}expand" class="expander-image list-expand" ng-click="ThreadExpandClick(thread)"></div>
                  <div grey-out ng-show="ThreadExpandRunning()"></div>
                </div>
                <div class="column-subject thread-subject-history">{{ thread.subject }}</div>
                <div class="column-type thread-type-history">{{ thread.type }}</div>
                <div class="column-date thread-date-history">{{ thread.date }}</div>
              </div>
              </div>
            </script>
            <script type="text/ng-template" id="history-thread-open.html">
              <div class="thread-root interaction-type-history" ng-class="InteractionType(thread.type)">
                <div class="column-expand thread-expander-history">
                  <div id="{{idPrefix}}expand" class="expander-image list-contract" ng-click="ThreadExpandClick(thread)"></div>
                </div>
                <div class="column-subject thread-subject-history">{{ thread.subject }}</div>
                <div class="column-type thread-type-history"></div>
                <div class="column-date thread-date-history"></div>
              </div>
              <div class="thread-children-history">
                <div class="thread-child-history interaction-type-history" ng-repeat="child in thread.children" ng-controller="ControllerHistoryChild" ng-class-even="'child-even'" ng-class-odd="'child-odd'" ng-class="InteractionType(child.type)" ng-include="HistoryChildUrl(child)"></div>
              </div>
            </script>
            <script type="text/ng-template" id="history-child-closed.html">
              <div class="child-expander">
                <div id="{{idPrefix}}expand" class="expander-image list-expand" ng-click="ChildExpandClick(child)"></div>
                <div grey-out ng-show="ChildExpandRunning()"></div>
              </div>
              <div class="column-subject child-subject">{{ child.subject }}</div>
              <div class="column-type child-type">{{ child.type }}</div>
              <div class="column-date child-date">{{ child.date }}</div>
            </script>
            <script type="text/ng-template" id="history-child-open.html">
              <div ng-repeat="details in [child.details]" ng-controller="ControllerHistoryChildOpen" class="child-details-container">
               <div class="child-details" ng-class="ActionClass()">
			   <div>
                  <div class="child-header">
				    <div class="child-open-header">
                    <div class="child-open-expander">
                      <div id="{{idPrefix}}expand" class="expander-image list-contract" ng-click="ChildExpandClick(child)"></div>
                    </div>
                    <div class="column-subject-h child-open-subject">{{ child.subject }}</div>
                    <div class="column-type-h child-open-type">{{ child.type }}</div>
                    <div class="child-open-date">{{ child.date }}</div>
                  </div>
				  </div>
				 
                  <div class="child-details-body">
                    <div ng-cloak ng-repeat="error in localErrors" class="error-messages">{{ error }}</div>
                    <div ng-cloak ng-repeat="message in localSuccess" class="success-messages">{{ message }}</div>
                    <div ng-include="BodyUrl()"></div>
                  </div>
                  <div class="child-details-info">
                    <div ng-include="InfoUrl()"></div>
                  </div>
                </div>
                  <div class="child-details-actions">
                    <div ng-include="ActionsUrl()"></div>
                  </div>
				</div>
                <div grey-out ng-show="ActionRunning()"></div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-history.html">
              <div class="child-details-body">
                <textarea ng-show="details.displayPlain" id="{{idPrefix}}plain" class="body-plain" ng-model="details.bodyPlain">dddd</textarea>
                <div ng-show="!details.displayPlain" id="{{idPrefix}}html" class="body-html" bind-html-compile="details.bodyHtml"></div>
                <div ng-show="details.note">Agent Notes:<br />
                  <textarea id="{{idPrefix}}note" class="note" ng-model="details.note"></textarea>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-search.html">
              <div class="bodies">
                <textarea ng-show="details.displayPlain" id="{{idPrefix}}plain" class="body-plain" ng-model="details.bodyPlain"></textarea>
                <div class="bodyhtml" ng-show="!details.displayPlain" id="{{idPrefix}}html" bind-html-compile="details.bodyHtml"></div>
                <div class="note" ng-show="details.note">Agent Notes:<br /><textarea ng-model="details.note"></textarea></div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-agentemail.html">
              <div class="action-body">
                <div class="menus">
                  <div class="button send"><img class="button-send-withdropdown" alt="Send" src="../images/nothing.png" ng-click="SendAgentEmail(idPrefix, agentEmail, thread)" /><img class="button-dropdown" alt="Send Options" src="../images/nothing.png" ng-click="menuOpen = !menuOpen" />
                    <div class="dropdown" ng-show="menuOpen">
                      <div class="item secure" ng-show="secureNotifications">
                        <span class="nglink" ng-click="SendSecureEmail(idPrefix, agentEmail, thread)">Send Secure (With Notification)</span><br>
                        <select ng-options="response.id as response.name for response in secureNotifications" id="{{idPrefix}}NotifyID" ng-model="agentEmail.notificationID"></select>
                      </div>
                      <div class="item expect-reply"><label><input type="checkbox" ng-model="agentEmail.expectingResponse">Expect Customer Reply</label></div>
                      <div class="item suppress-ref"><label><input type="checkbox" ng-model="agentEmail.addSubjectRefNum">Suppress Reference Number</label></div>
                    </div>
                  </div>
                </div>
                <div class="header-row">
                  <div class="label">From:</div>
                  <select ng-options="mailbox.id as mailbox.name for mailbox in mailboxes" id="{{idPrefix}}From" ng-model="agentEmail.mailboxID"></select>
                </div>
                <div class="header-row">
                  <div class="label">To:</div>
                  <select ng-options="address for address in addresses" id="{{idPrefix}}To" ng-model="agentEmail.destEmail"></select>
                </div>
                <div class="header-row"><div class="label">CC:</div><input type="text" ng-model="agentEmail.cc" value=""></div>
                <div class="header-row"><div class="label">BCC:</div><input type="text" ng-model="agentEmail.bcc" value=""></div>
                <div class="header-row"><div class="label">Subject:</div><input type="text" ng-model="agentEmail.subject" value=""></div>
                <div class="header-row" id="{{idPrefix}}Files">
                  <div ng-repeat="file in uploads" ng-controller="ControllerFileUpload"><input id="{{idPrefix}}File" name="{{idPrefix}}File" type="file" value=""></div>
                  <span class="nglink" ng-click="AddFile()">Attach a file</span> -- Maximum 10 MB upload at one time.
                </div>
                <div class="header-row body">
                  <textarea class="body" ng-init="EditorID(idPrefix + 'Body')" ckeditor id="{{idPrefix}}Body" ng-model="agentEmail.bodyHtml"></textarea>
                </div>
                <div class="header-row">
                  <div class="label">Agent<br>Notes:</div>
                  <textarea id="{{idPrefix}}Note" ng-model="agentEmail.note"></textarea>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-forwardemail.html">
              <div class="action-body">
                <div class="menus">
                  <div class="button forward"><img class="button-forward" alt="Forward" src="../images/nothing.png" ng-click="SendForwardEmail(idPrefix, forwardEmail, thread)" /></div>
                </div>
                <div class="header-row">
                  <div class="label">From:</div>
                  <select ng-options="mailbox.id as mailbox.name for mailbox in mailboxes" id="{{idPrefix}}From" ng-model="forwardEmail.mailboxID"></select>
                </div>
                <div class="header-row"><div class="label">To:</div><input type="text" ng-model="forwardEmail.destEmail" value=""></div>
                <div class="header-row"><div class="label">CC:</div><input type="text" ng-model="forwardEmail.cc" value=""></div>

                <div class="header-row"><div class="label">BCC:</div><input type="text" ng-model="forwardEmail.bcc" value=""></div>
                <div class="header-row"><div class="label">Subject:</div><input type="text" ng-model="forwardEmail.subject" value=""></div>
                <div class="header-row" id="{{idPrefix}}Files">
                  <div ng-repeat="file in uploads" ng-controller="ControllerFileUpload"><input id="{{idPrefix}}File" name="{{idPrefix}}File" type="file" value=""></div>
                  <span class="nglink" ng-click="AddFile()">Attach a file</span> -- Maximum 10 MB upload at one time.
                </div>
                <div class="header-row body">
                  <textarea class="body" ng-init="EditorID(idPrefix + 'Body')" ckeditor id="{{idPrefix}}Body" ng-model="forwardEmail.bodyHtml"></textarea>
                </div>
                <div class="header-row">
                  <div class="label">Agent<br>Notes:</div>
                  <textarea id="{{idPrefix}}Note" ng-model="forwardEmail.note"></textarea>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-ticket.html">
              <div class="action-body">
                <div class="menus">
                  <div class="button ticket"><img class="button-ticket" alt="Create Ticket" src="../images/nothing.png" ng-click="CreateTicket(idPrefix, ticket, thread)" /></div>
                </div>
                <div class="header-row">
                  <div class="label">From:</div>
                  <select ng-options="address for address in addresses" id="{{idPrefix}}To" ng-model="ticket.destEmail"></select>
                </div>
                <div class="header-row"><div class="label">Subject:</div><input type="text" ng-model="ticket.subject" value=""></div>
                <div class="header-row" id="{{idPrefix}}Files">
                  <div ng-repeat="file in uploads" ng-controller="ControllerFileUpload"><input id="{{idPrefix}}File" name="{{idPrefix}}File" type="file" value=""></div>
                  <span class="nglink" ng-click="AddFile()">Attach a file</span> -- Maximum 10 MB upload at one time.
                </div>
                <div class="header-row body">
                  <textarea class="body" ng-init="EditorID(idPrefix + 'Body')" ckeditor id="{{idPrefix}}Body" ng-model="ticket.bodyHtml"></textarea>
                </div>
                <div class="header-row">
                  <div class="label">Agent<br>Notes:</div>
                  <textarea id="{{idPrefix}}Note" ng-model="ticket.note"></textarea>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-note.html">
              <div class="action-body">
                <div class="menus">
                  <div class="button note-private"><img class="button-note-private" alt="Save Private Note" src="../images/nothing.png" ng-click="CreateNotePrivate(idPrefix, note, thread)" /></div>
                  <div class="button note-public"><img class="button-note-public" alt="Save Public Note" src="../images/nothing.png" ng-click="CreateNotePublic(idPrefix, note, thread)" /></div>
                </div>
                <div class="header-row"><div class="label">Subject:</div><input type="text" ng-model="note.subject" value=""></div>
                <div class="header-row" id="{{idPrefix}}Files">
                  <div ng-repeat="file in uploads" ng-controller="ControllerFileUpload"><input id="{{idPrefix}}File" name="{{idPrefix}}File" type="file" value=""></div>
                  <span class="nglink" ng-click="AddFile()">Attach a file</span> -- Maximum 10 MB upload at one time.
                </div>
                <div class="header-row body">
                  <textarea class="body" ng-init="EditorID(idPrefix + 'Body')" ckeditor id="{{idPrefix}}Body" ng-model="note.bodyHtml"></textarea>
                </div>
                <div class="header-row">
                  <div class="label">Agent<br>Notes:</div>
                  <textarea id="{{idPrefix}}Note" ng-model="note.note"></textarea>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-body-saveresolve.html">
              <div class="action-body action-body-save-resolve">
                <div class="menus">
                  <div class="save-resolve"><span class="nglink" ng-click="SaveResolve(idPrefix, answer, answerData, thread)">Save And Resolve</span></div>
                </div>
                <div class="header-row"><div class="label">Subject:</div><input type="text" ng-model="answer.subject" value=""></div>
                <div class="header-row">
                  <label ng-repeat="attachment in answerData.responseAttachments" ng-controller="ControllerResponseAttachment">
                    <input type="checkbox" id="{{idPrefix}}Selected" checklist-model="answer.attachments" checklist-value="attachment.attachmentID">{{ attachment.name }}<br>
                  </label>
                </div>
                <div class="header-row" id="{{idPrefix}}Files">
                  <div ng-repeat="file in uploads" ng-controller="ControllerFileUpload"><input id="{{idPrefix}}File" name="{{idPrefix}}File" type="file" value=""></div>
                  <span class="nglink" ng-click="AddFile()">Attach a file</span> -- Maximum 10 MB upload at one time.
                </div>
                <div class="header-row body">
                  <textarea class="body" ng-init="EditorID(idPrefix + 'Body')" ckeditor id="{{idPrefix}}Body" ng-model="answer.bodyHtml"></textarea>
                </div>
                <div class="header-row">
                  <div class="label">Agent<br>Notes:</div>
                  <textarea id="{{idPrefix}}Note" ng-model="answer.note"></textarea>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-info-agentemail.html">
              <div class="interaction-history-action-properties">
                <div class="interaction-properties interaction-property-list">
                  <div class="title"><div class="decoration"></div>Message Properties</div>
                  <div class="properties-area">
                    <div class="section"><span class="label">Segment Name:</span> {{details.segmentName}}</div>
                    <div class="section"><span class="label">Topic Name:</span> {{details.topicName}}</div>
                    <div ng-repeat="group in properties" ng-controller="ControllerPropertyGroup">
                      <div class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-repeat="property in group.properties" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>

                    </div>
                  </div>
                </div>

                <div ng-include="'stockresponse-picker.html'"></div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-info-answer.html">
              <div class="interaction-history-action-properties">
                <div class="interaction-properties interaction-property-list">
                  <div class="title"><div class="decoration"></div>Message Properties</div>
                  <div class="properties-area">
                    <div class="section"><span class="label">Segment Name:</span> {{details.segmentName}}</div>
                    <div class="section"><span class="label">Topic Name:</span> {{details.topicName}}</div>
                    <div class="section interaction-property-list" ng-repeat="section in answerData.propertySections" ng-controller="ControllerPropertySection">
                      <span class="label">{{section.label}}:</span>
                      <div ng-repeat="group in section.groups" ng-controller="ControllerPropertyGroup">
                        <div class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-repeat="property in group.properties" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div ng-include="'stockresponse-picker.html'"></div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-info-ticket.html">
              <div class="interaction-history-action-properties">
                <div class="interaction-properties interaction-property-list">
                  <div class="title"><div class="decoration"></div>Message Properties</div>
                  <div class="properties-area">
                    <div class="section"><span class="label">Segment Name:</span> {{details.segmentName}}</div>
                    <div class="section"><span class="label">Topic Name:</span> {{details.topicName}}</div>
                    <div class="interaction-property"><span>Assign To Agent:</span>
                      <div class="property-value">
                        <select id="{{idPrefix}}AssignTo" class="choice-no-desc" ng-model="ticket.assignToAgentID" ng-options="agent.id as agent.option for agent in agentList"></select>
                      </div>
                    </div>
                    <div ng-repeat="group in properties" ng-controller="ControllerPropertyGroup">
                      <div class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-repeat="property in group.properties" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
                    </div>
                  </div>
                </div>
                <div ng-include="'stockresponse-picker.html'"></div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-info.html">
              <div class="interaction-property-list interaction-details-properties" ng-controller="ControllerHistoryInfo">
                <p ng-show="details.id"><span class="label">Interaction ID:</span> {{ details.id }}</p>
                <p ng-show="details.type"><span class="label">Type:</span> {{ details.type }}</p>
                <p ng-show="details.fromAddress"><span class="label">From:</span> {{ details.fromAddress }}</p>
                <p ng-show="details.toAddress"><span class="label">To:</span> {{ details.toAddress }}</p>
                <p ng-show="details.cc"><span class="label">CC:</span> {{ details.cc }}</p>
                <p ng-show="details.bcc"><span class="label">BCC:</span> {{ details.bcc }}</p>
                <p ng-show="details.segmentName"><span class="label">Segment:</span> {{ details.segmentName }}</p>
                <p ng-show="details.topicName"><span class="label">Topic:</span> {{ details.topicName }}</p>
                <p ng-show="details.operatorName"><span class="label">Operator Name:</span> {{ details.operatorName }}</p>
                <p ng-show="details.status"><span class="label">Status:</span> {{ details.status }}</p>
                <div ng-show="details.attachments.length" class="attachments">
                  <span class="label">Attachments:</span>
                  <p ng-repeat="file in details.attachments"><a href="{{rootPath}}File.aspx?interactionID={{details.id}}&fileID={{file.attachmentID}}">{{file.name}}</a></p>
                </div>
                <div class="interaction-properties">
                  <div ng-repeat="group in PropertyGroups(details)" ng-controller="ControllerPropertyGroup">
                    <div class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-repeat="property in group.properties" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
                  </div>
                  <div class="property-actions" ng-show="ShowEdit(details)">
                    <span class="nglink" ng-show="CanStartEdit(details)" ng-click="EditProperties(details)">Edit Properties</span>
                    <span class="nglink" ng-show="details.editingProperties" ng-click="SaveProperties(details)">Save</span><span ng-show="details.editingProperties"> -- </span>
                    <span class="nglink" ng-show="details.editingProperties" ng-click="details.editingProperties = false">Cancel</span>
                  </div>
                  <div grey-out ng-show="HistoryPropertySetRunning()"></div>
                </div>
              </div>
            </script>
            <script type="text/ng-template" id="child-details-actions.html">
              <div class="child-details-actions">
                <div class="options">
                  <span ng-class="{nglink: !details.displayPlain}" ng-click="details.displayPlain = true">Plain</span> -- 
                  <span ng-class="{nglink: details.displayPlain}" ng-click="details.displayPlain = false">Html</span> -- 
                  <span class="nglink" ng-click="details.showAudit = !details.showAudit">Status Audit</span>
                </div>
                Take Action: <span class="nglink" ng-click="StartAgentEmail()">Agent Email</span> -- 
                <span class="nglink" ng-click="StartNote()">Create Note</span> -- 
                <span class="nglink" ng-click="StartTicket()">Create Ticket</span> 
                <span ng-show="CanSaveResolve()"> -- <span class="nglink" ng-click="StartSaveResolve()">Save & Resolve</span></span>
                <span> -- <span class="nglink" ng-click="StartForwardEmail()">Forward Email</span></span>
                <div class="options-end"></div>
                <div class="detail_audit" ng-show="details.showAudit">
                  <div class="interaction-status-audit">
                    <div class="auditheading">
						 <div class="time">Time</div>
						 <div class="name">Modifier</div>
						 <div class="status">Status</div>
						 <div>Action</div>
						 <div class="name">Assigned To</div>
						 <div class="topic">Topic</div>
					 </div>
                    <div class="auditdetail" ng-repeat="record in details.statusAudit" ng-class-even="'even'">
                      <div class="time">{{record.timeStamp | date: 'M/d/yyyy h:mm:ss a'}}</div>
                      <div class="name">{{record.modifierName}}</div>
                      <div class="status">{{record.statusName}}</div>
                      <div>{{record.action}}</div>
                      <div class="name">{{record.assignedToName}}</div>
                      <div class="topic">{{record.topicName}}</div>
                    </div>
                  </div>
                </div>
              </div>
            </script>
        </div>
     <div ng-view></div>  
     
		<script type=text/ng-template id=contact-details.html>
		<div class="setting-container">   
		  <div ng-show="!iservice.loggedIn.isLoggedIn">
		         <p>
				  Required Login to view your details. If you don&rsquo;t have an account in our support portal Sign Up now
				</p>
		  </div>
          <div class="page my-details interaction-property-list" ng-controller="ControllerMyDetails" ng-show="iservice.loggedIn.isLoggedIn">
        <h2 ng-click="showContDetail()"  ng-class="{active: detailcontent}">My Details</h2>
		<div ng-show="detailcontent">
        <div ng-cloak ng-repeat="segment in segments" ng-controller="ControllerPropertyGroup" class="segment" ng-class="{ 'not-first': $index }">
          <h3>{{ segment.name }}</h3>
          <div class="properties-left" ng-conroller="ControllerPropertiesLeft">
            <div ng-repeat="property in segment.properties" class="interaction-property" ng-class="InteractionPropertyClass(property)" ng-controller="ControllerPropertyProperty" ng-include="PropertyUrl(property)"></div>
          </div>
          <div class="logins" ng-show="segment.logins.length">
            <h3>Logins:</h3>
			<div class="loginc">
            <div ng-repeat="login in segment.logins" ng-controller="ControllerPropertyLogin" class="login">
              <input id="{{idPrefix}}name" type="text" value="" ng-model="login.name" class="text-no-desc">
              <label><input id="{{idPrefix}}isEmail" type="checkbox" ng-model="login.isEmail">Is Email</label>
              <label><input id="{{idPrefix}}isBounced" type="checkbox" ng-model="login.isBounced">Is Bounced</label>
            </div>
            <button class="add-login" id="{{idPrefix}}addValue" type="button" ng-click="AddLoginClick(segment)">+</button>
			</div>
          </div>
        </div>
        <button ng-cloak class="save" id="{{idPrefix}}save" type="button" ng-click="SaveClick()">Save Details</button>
        <div class="errors">
          <div ng-cloak ng-repeat="error in iservice.errors" class="error-messages">{{ error }}</div>
          <div ng-cloak ng-repeat="message in iservice.success" class="success-messages">{{ message }}</div>
        </div>
        <div ng-cloak ng-show="Getting()">Loading</div>
        <div grey-out ng-show="Getting() || Saving()"></div>
		</div>
      </div>
      <!-- Subscription container-->		
        <div class="page subscriptions" ng-controller="ControllerMySubscriptions" ng-show="iservice.loggedIn.isLoggedIn" >
        <h2 ng-click="showSubs()"  ng-class="{active: subscontent}">My Subscriptions</h2>
		<div ng-show="subscontent">
		<div class="s-container" >
        <h3 ng-cloak>Mailing Lists</h3>
        <div ng-cloak >
          <div class="table-row table-row-head">
		      <div class="list-name">List Name</div>
			  <div class="list-desc">Description</div>
			  <div class="member-of">Member Of</div>
		  </div>
          <div ng-repeat="list in lists" ng-controller="ControllerList" class="table-row">
            <div class="list-name">{{ list.name }}</div>
			<div class="list-desc">{{ list.description }}</div>
            <div class="member-of"><input id="{{idPrefix}}IsOn" type="checkbox" ng-model="list.isOnList"></div>
          </div>
          <div ng-show="!lists.length" class="table-row"><div>No Mailing Lists</div></div>
        </div>
		</div>
		
		<div class="s-container">
        <h3 ng-cloak>Campaigns</h3>
        <div ng-cloak class="table-row">
          <div class="table-row table-row-head">
			  <div class="list-name">Name</div>
			  <div class="list-desc">Description</div>
			  <div class="member-of">Member Of</div>
		  </div>
          <div ng-repeat="campaign in campaigns" ng-controller="ControllerCampaign" class="table-row">
            <div class="list-name">{{ campaign.name }}</div>
			<div class="list-desc">{{ campaign.description }}</div>
            <div class="member-of"><input id="{{idPrefix}}IsOn" type="checkbox" ng-model="campaign.isOnList"></div>
          </div>
          <div ng-show="!campaigns.length" class="table-row"><div colspan="3">No Campaigns</div></div>
        </div>
		</div>
		<div class="s-container">
        <h3 ng-cloak>Subscribed Articles</h3>
        <div ng-cloak class="table-row">
          <div class="table-row table-row-head">
			  <div class="list-name">Topic</div>
			  <div class="list-desc">Subject</div>
			  <div class="member-of">Stay Subscribed</div>
		  </div>
          <div ng-repeat="article in articles" ng-controller="ControllerArticle" class="table-row">
            <div class="list-name">{{ article.topic }}</div>
			<div class="list-desc">{{ article.subject }}</div>
            <div class="member-of"><input id="{{idPrefix}}IsOn" type="checkbox" ng-model="article.isOnList"></div>
          </div>
          <div ng-show="!articles.length" class="table-row"><div colspan="3">No Articles</div></div>
        </div>
		</div>
        <button ng-cloak class="save" id="{{idPrefix}}save" type="button" ng-click="SaveClick()">Save Subscriptions</button>
        <div class="errors" class="table-row">
          <div ng-cloak ng-repeat="error in iservice.errors" class="error-messages">{{ error }}</div>
          <div ng-cloak ng-repeat="message in iservice.success" class="success-messages">{{ message }}</div>
        </div>
        <div ng-cloak ng-show="Getting()">Loading</div>
        <div grey-out ng-show="Getting() || Saving()"></div>
      </div>
	  </div>
	  </div>
        </script>
   
          <div ng-cloak ng-show="Getting()">Loading</div>
          <div grey-out ng-show="Getting()"></div>
        </div>
      </div>
 	 </div>
     </div>
    </div>
  </div>
  
  $include -placeholder'common-javascript' -indent'  '$
  <script src="$value -rootpath$f/$value -formid$?form=js"></script>
  <script src="$value -rootpath$js/iService.directive.js?v=$value -version -urlencode$"></script>
  $include -placeholder'interaction-properties' -indent'  '$

  <script type="text/javascript">


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

        /**
         * Removes the variations on dir-paginate (data-, -start, -end) and the dir-paginate-no-compile directives.
         * @param element
         */
        function removeTemporaryAttributes(element) {
            angular.forEach(element, function(el) {
                if (el.nodeType === Node.ELEMENT_NODE) {
                    angular.element(el).removeAttr('dir-paginate-no-compile');
                }
            });
            element.eq(0).removeAttr('dir-paginate-start').removeAttr('dir-paginate').removeAttr('data-dir-paginate-start').removeAttr('data-dir-paginate');
            element.eq(element.length - 1).removeAttr('dir-paginate-end').removeAttr('data-dir-paginate-end');
        }

        /**
         * Creates a getter function for the current-page attribute, using the expression provided or a default value if
         * no current-page expression was specified.
         *
         * @param scope
         * @param attrs
         * @param paginationId
         * @returns {*}
         */
        function makeCurrentPageGetterFn(scope, attrs, paginationId) {
            var currentPageGetter;
            if (attrs.currentPage) {
                currentPageGetter = $parse(attrs.currentPage);
            } else {
                // if the current-page attribute was not set, we'll make our own
                var defaultCurrentPage = paginationId + '__currentPage';
                scope[defaultCurrentPage] = 1;
                currentPageGetter = $parse(defaultCurrentPage);
            }
            return currentPageGetter;
        }
    }

    /**
     * This is a helper directive that allows correct compilation when in multi-element mode (ie dir-paginate-start, dir-paginate-end).
     * It is dynamically added to all elements in the dir-paginate compile function, and it prevents further compilation of
     * any inner directives. It is then removed in the link function, and all inner directives are then manually compiled.
     */
    function noCompileDirective() {
        return {
            priority: 5000,
            terminal: true
        };
    }
     function dirPaginationControlsTemplateInstaller($templateCache) {
            $templateCache.put('angularUtils.directives.dirPagination.template', '<ul class="pagination" ng-if="1 < pages.length"><li ng-if="boundaryLinks" ng-class="{ disabled : pagination.current == 1 }"><a href="" ng-click="setCurrent(1)">PREVIOUS</a></li><li ng-if="directionLinks" ng-class="{ disabled : pagination.current == 1 }"><a href="" ng-click="setCurrent(pagination.current - 1)">PREVIOUS</a></li><li ng-repeat="pageNumber in pages track by $index" ng-class="{ active : pagination.current == pageNumber, disabled : pageNumber == \'...\' }"><a href="" ng-click="setCurrent(pageNumber)">{{ pageNumber }}</a></li><li ng-if="directionLinks" ng-class="{ disabled : pagination.current == pagination.last }"><a href="" ng-click="setCurrent(pagination.current + 1)">NEXT</a></li><li ng-if="boundaryLinks"  ng-class="{ disabled : pagination.current == pagination.last }"><a href="" ng-click="setCurrent(pagination.last)">NEXT</a></li></ul>');
        }
    function dirPaginationControlsDirective(paginationService, paginationTemplate) {

        var numberRegex = /^\d+$/;

        return {
            restrict: 'AE',
            templateUrl: function(elem, attrs) {
                return attrs.templateUrl || paginationTemplate.getPath();
            },
            scope: {
                maxSize: '=?',
                onPageChange: '&?',
                paginationId: '=?'
            },
            link: dirPaginationControlsLinkFn
        };

        function dirPaginationControlsLinkFn(scope, element, attrs) {

            // rawId is the un-interpolated value of the pagination-id attribute. This is only important when the corresponding dir-paginate directive has
            // not yet been linked (e.g. if it is inside an ng-if block), and in that case it prevents this controls directive from assuming that there is
            // no corresponding dir-paginate directive and wrongly throwing an exception.
            var rawId = attrs.paginationId ||  DEFAULT_ID;
            var paginationId = scope.paginationId || attrs.paginationId ||  DEFAULT_ID;

            if (!paginationService.isRegistered(paginationId) && !paginationService.isRegistered(rawId)) {
                var idMessage = (paginationId !== DEFAULT_ID) ? ' (id: ' + paginationId + ') ' : ' ';
                throw 'pagination directive: the pagination controls' + idMessage + 'cannot be used without the corresponding pagination directive.';
            }

            if (!scope.maxSize) { scope.maxSize = 9; }
            scope.directionLinks = angular.isDefined(attrs.directionLinks) ? scope.$parent.$eval(attrs.directionLinks) : true;
            scope.boundaryLinks = angular.isDefined(attrs.boundaryLinks) ? scope.$parent.$eval(attrs.boundaryLinks) : false;

            var paginationRange = Math.max(scope.maxSize, 5);
            scope.pages = [];
            scope.pagination = {
                last: 1,
                current: 1
            };
            scope.range = {
                lower: 1,
                upper: 1,
                total: 1
            };

            scope.$watch(function() {
                return (paginationService.getCollectionLength(paginationId) + 1) * paginationService.getItemsPerPage(paginationId);
            }, function(length) {
                if (0 < length) {
                    generatePagination();
                }
            });

            scope.$watch(function() {
                return (paginationService.getItemsPerPage(paginationId));
            }, function(current, previous) {
                if (current != previous && typeof previous !== 'undefined') {
                    goToPage(scope.pagination.current);
                }
            });

            scope.$watch(function() {
                return paginationService.getCurrentPage(paginationId);
            }, function(currentPage, previousPage) {
                if (currentPage != previousPage) {
                    goToPage(currentPage);
                }
            });

            scope.setCurrent = function(num) {
                if (isValidPageNumber(num)) {
                    num = parseInt(num, 10);
                    paginationService.setCurrentPage(paginationId, num);
                }
            };

            function goToPage(num) {
                if (isValidPageNumber(num)) {
                    scope.pages = generatePagesArray(num, paginationService.getCollectionLength(paginationId), paginationService.getItemsPerPage(paginationId), paginationRange);
                    scope.pagination.current = num;
                    updateRangeValues();

                    // if a callback has been set, then call it with the page number as an argument
                    if (scope.onPageChange) {
                        scope.onPageChange({ newPageNumber : num });
                    }
                }
            }

            function generatePagination() {
                var page = parseInt(paginationService.getCurrentPage(paginationId)) || 1;

                scope.pages = generatePagesArray(page, paginationService.getCollectionLength(paginationId), paginationService.getItemsPerPage(paginationId), paginationRange);
                scope.pagination.current = page;
                scope.pagination.last = scope.pages[scope.pages.length - 1];
                if (scope.pagination.last < scope.pagination.current) {
                    scope.setCurrent(scope.pagination.last);
                } else {
                    updateRangeValues();
                }
            }

            /**
             * This function updates the values (lower, upper, total) of the `scope.range` object, which can be used in the pagination
             * template to display the current page range, e.g. "showing 21 - 40 of 144 results";
             */
            function updateRangeValues() {
                var currentPage = paginationService.getCurrentPage(paginationId),
                    itemsPerPage = paginationService.getItemsPerPage(paginationId),
                    totalItems = paginationService.getCollectionLength(paginationId);

                scope.range.lower = (currentPage - 1) * itemsPerPage + 1;
                scope.range.upper = Math.min(currentPage * itemsPerPage, totalItems);
                scope.range.total = totalItems;
            }

            function isValidPageNumber(num) {
                return (numberRegex.test(num) && (0 < num && num <= scope.pagination.last));
            }
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


</script>
</body>
</html>
$endif$$if -fieldregex'form'='^js$'$$header -filetype(js)$
var app = angular.module('iService',['angularUtils.directives.dirPagination','ngRoute']);
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

function ControllerFALogin($scope, $http,$rootScope) {
 
 $scope.toggleLogin = true;
 $scope.toggleUserOption = false;
 $scope.reset = function(login) {
  if (login) {
    login.$pristine = true
    login.$valid = true
    $scope.toggleLogin = !$scope.toggleLogin
  }
 };
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
}


var topics = [ $repeat -topics(findanswer)${ "id": "$value -Pjs -topic(id)$", "name": "$value -Pjs -topic(name)$", "count": $value -Pjs -topic(messagecount)$, "countRecurse": $value -Pjs -topic(messagecount)$, "parentID": "$value -Pjs -topic(parentID)$", "segmentName": "$value -Pjs -topic(segmentname)$" }$if -more$,
               $endif$$endrepeat$ ];

function ControllerFindAnswers($scope, $http, $sce, $rootScope,$location,$routeParams,$timeout) {
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
      $scope.topicList = topics;
      var topicByID = {};
      for (var i = 0; i < topics.length; i++) { topicByID[topics[i].id] = topics[i]; if(topics[i].id == $scope.param2){ $scope.match = 1;}}
      for (var i = topics.length - 1; i >= 0; i--) {
        var topic = topics[i];
        var parent = topicByID[topic.parentID];
        if (parent) parent.countRecurse += topic.countRecurse;
      }
    });
     $rootScope.firstTopicID = topics[0].id;
  }
  LoadTopics();
  

  $scope.ShowTopic = function (topic) {
    $scope.selectedTopic = topic;
    $scope.Searching = iservice.FindAnswerArticles($http, topic.id, $scope.searchString, $scope.recursive, 1, 1000, null, function (data) {
      iservice.SanitizeHistoryRows(data.interactions);
      $scope.articleList = data.interactions;
      $scope.topFaqList = $filter('orderBy')(data.interactions, "viewCount");
      var p =1;
      for (var j=0 ; j< data.interactions.length ; j++) {
          var x = (parseInt(j)+1)%$scope.pageSize;
          if(x == 0)  
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
 
  function FixFilePath(body) {
    return body.split('src="File.aspx?interactionID=').join('src="$value -rootpath$File.aspx?interactionID=');
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
  $scope.ShowArticle = function (article,$index) {
    $scope.selectedArticle = article;
     if(articleID != article.id){ articleID = article.id;change  = 1;toggle = 0; }else{change = 0; toggle = !toggle; if(toggle){return false;}} 
      $scope.Searching = iservice.FindAnswerDetails($http, article.id, function (data) {
      $scope.selectedArticle.data = data;
      data.question = FixFilePath(data.question);
      data.answer = FixFilePath(data.answer);
      data.questionSafe = $sce.trustAsHtml(data.question);
      data.answerSafe = $sce.trustAsHtml(data.answer);
      data.articleIdSafe = $sce.trustAsHtml(data.id); 
      data.createdBySafe = $sce.trustAsHtml(data.creatorName);
      data.ratingSafe = $sce.trustAsHtml(data.rating); 
      data.dateSafe =  $sce.trustAsHtml(data.date);
      data.viewSafe = $sce.trustAsHtml(data.viewCount);
    });
  }
  
  

   $scope.test = function() {
       if($scope.match !=1)
       { 
          if(topics[0].id != ''){
          $timeout(function() {
                angular.element("#"+topics[0].id).triggerHandler('click');
               
            }, 0);
           } 
       }
    }
 
}
               
function ControllerTopFaq($scope, $http,$rootScope){
   $scope.recursive = true;
   $scope.Searching = iservice.FindAnswerArticles($http,  $rootScope.firstTopicID, $scope.searchString, $scope.recursive, 1, 5, null, function (data) {
   iservice.SanitizeHistoryRows(data.interactions);
   $scope.articleListFaq = data.interactions;
   });  
}


function ControllerAskAQuestion($scope, $http,$rootScope) {

 $scope.topicList = [];
  $scope.details = { topicID: '' };
  function LoadTopics() {
    $scope.Loading = iservice.FindAnswerTopics($http, function (data) {
      var topics = data.topics;
      $scope.topicsList = topics;
    });
  }
  LoadTopics();
  $scope.$watch('details.topicID', function(newValue, oldValue) {
    $scope.Searching = iservice.FindAnswerTopicProperties($http, $scope.details.topicID, function (data) {
      iservice.SanitizePropertyGroups(data.properties);
      $scope.properties = data.properties;
    });
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

$endif$$if -fieldregex'form'='^css$'$$header -filetype(css)$
$include -placeholder'82'$
$include -placeholder'85'$
$include -placeholder'83'$

$endif
