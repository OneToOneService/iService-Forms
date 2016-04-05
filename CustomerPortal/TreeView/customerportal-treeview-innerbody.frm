$if -fieldregex'form'='^$'$
<div ng-controller="ControllerBody" class="mainbody">
  <div  class="main_container" ng-cloak>
        <div ng-cloak class="page loginsection" ng-controller="ControllerFALogin">
        <div ng-show="iservice.loggedIn.isLoggedIn" class="login_container">
        <span ng-click="toggleSearch()" class="userOption"> <span class="loggedinuname"> Hello </span>{{ iservice.loggedIn.contactName }}<img width="10" style="margin-left: 7px;" height="5" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAFCAYAAAELY03+AAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAKNJREFUeNpiZmBgaGZgYPgHAAAA//9iYGBgYAAAAAD//4KhDgYGBgYAAAAA///CQAIAAAAA//+CMRZA6RgGBgZNAAAAAP//YmBgYPBBU9nBwMDAIM/AwJAOFViOLMvNwMAwGcYBAAAA//9czqENwCAAAMFrSNigg2AYgq3As11VZQ0boGsQBPvi8gEJHRHPQZU1OK4t3qh4MZHR8MEPAAD//wMAd+4NMU2SDSIAAAAASUVORK5CYII=" /></span>
           <div class="user-option" ng-show="toggleUserOption">
              <img class="user-option-arrow" width="22" height="18" title="" alt="" src="data:image/png;base64,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" />
              <ul>
                 <li><a href="#/details" class="profile"  ng-href="#/details">User Profile</a></li>
                 <li><a href="#/subscription" ng-href="#/subscription" class="subscription">My Subscription</a></li>
                 <li><a href="javascript:void(0)" class="logout" ng-click="Logout()">Logout</a></li>
              </ul>
            </div>
        </div>
     <div ng-show="!iservice.loggedIn.isLoggedIn">   
      <div class="login_container" >
        <a href="javascript:void(0)" id="show_login" ng-click="loginOpen()">Login</a>
        <a href="javascript:void(0)" id="show_register" ng-click="registerOpen();">Sign Up</a>
      </div>
      <div class="box_wrap" id="box_wrap" ng-hide="toggleLogin" ng-animate="'box_wrap'">
         <img width="16" height="12" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAMCAYAAAEc4A0XAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAABc0lEQVR42mL8//8/AwgABBATiHj1+s1/gABiAIncu3cvECCAQMTkl69e/wcIILAIVLQXJAAQQHABmFKAAGJhgAKQAUxMTAwAAYQwDQj+/ftXCRBAKFqQtHa9ePnq/6PHj/8DBBDcCBC4f//+BG4e3nwgBvP//P59GSCAGEE6gBLTgIKZDGjg65fPGgABhNUKqDW7QDRAADHC/IoMHj569J+TkwtkQgpAADGhSz6CSkLBKYAAQjEB5GoODk4GqBcZJMTFGAECCG7C48dP4JJgH/z5DaYBAogF6AN+FlbWD+wcHChW/f3zB0wDBBBWR+ICQMPqGBmZGtk52Bl+//4NMiQIIIBYiNTYy8zMXMTFzcPAyMgIFgMZAAS/AAIIrwtAMcPMzJLPwcnJgCUSQBQ7QACx4NA4mYWFJQcWpegAGkDLFBUVfwEEEHpamAYMsExcGhEGgANwGYgACCBQKLsC6UxWNrZAQhph4N/fvyDqCIgACDAAcxzWeG16dZIAAAAASUVORK5CYII=" class="login_arrow" />
        <div class="box">
          <div class="clear"></div>
           <div class="box_con">
            <div class="formcontainer" ng-show="loginshow">
                    <div ng-cloak ng-repeat="error in errors" class="error-messages">{{ error }} </div>
                    <form ng-show="!iservice.loggedIn.isLoggedIn" name="login" action="" method="POST" novalidate>  
                   <span class="l formheading">Login</span>
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
                   <a href="javascript:void(0)" ng-click="registerOpen()">Register New Account</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)" ng-click="showForget()"> Forgot Password</a> 
                   </span>
                   <div grey-out ng-show="Loading()"></div>
                   </form>
               </div>
            <div class="formcontainer" ng-show="forgetshow">
              <div ng-cloak ng-repeat="error in errorsforget" class="error-messages">{{ error }} </div>
               <form ng-show="!iservice.loggedIn.isLoggedIn" name="forgetPassword" action="" method="POST" novalidate>  
                   <span class="l formheading">Forgot Password</span>
                   <span class="c_text">Please enter the email address associated with your iService account.
We will send you a link so you can change your password.</span>
                   <span class="l_row control-group"  ng-class="{true: 'error'}[submittedforget && forgetPassword.fname.$invalid]">
                     <input type="text" value="" class="text reset-email inputbox" name="fname" ng-model="reset.email" required>
                      <span class="validation_error" ng-show="submittedforget && forgetPassword.fname.$error.required">Username Required</span>
                   </span>
                   <span class="l_btn_row">
                   <input type="submit" id="{{idPrefix}}forgotSend"   class="btn_okay" value="Submit" ng-click="ForgetSend()" />
                   <input type="button"  class="btn_cancel" value="Cancel" ng-click="reset(login)" />
                   </span>
                   <span class="box-title" >
                   <a href="javascript:void(0)" ng-click="showLogin()">Login</a>
                   </span>
                   </form>
                   <span class="c_text">
                     <div ng-show="sent && !iservice.loggedIn.isLoggedIn" class="password-reset page">
                          <div class="password-reset-main-content">
                            Password reset confirmation email has been sent to the address:<br>
                            <div class="reset-address">{{reset.email}}</div>
                            Please follow the included instructions, then click to <span id="{{idPrefix}}forgotRefresh" class="nglink" ng-click="ForgetRefresh()">Refresh</span> this page.
                          </div>        
                          <div class="fade"></div>
                        </div>
                   </span>
                 <div grey-out ng-show="Loading()"></div>
            </div>
           <div class="clear"></div> 
        </div>
        </div>
       </div>
       <div class="box_wrap" id="box_wrap" ng-hide="toggleRegister" ng-animate="'box_wrap'">
         <img width="16" height="12" title="" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAMCAYAAAEc4A0XAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAABc0lEQVR42mL8//8/AwgABBATiHj1+s1/gABiAIncu3cvECCAQMTkl69e/wcIILAIVLQXJAAQQHABmFKAAGJhgAKQAUxMTAwAAYQwDQj+/ftXCRBAKFqQtHa9ePnq/6PHj/8DBBDcCBC4f//+BG4e3nwgBvP//P59GSCAGEE6gBLTgIKZDGjg65fPGgABhNUKqDW7QDRAADHC/IoMHj569J+TkwtkQgpAADGhSz6CSkLBKYAAQjEB5GoODk4GqBcZJMTFGAECCG7C48dP4JJgH/z5DaYBAogF6AN+FlbWD+wcHChW/f3zB0wDBBBWR+ICQMPqGBmZGtk52Bl+//4NMiQIIIBYiNTYy8zMXMTFzcPAyMgIFgMZAAS/AAIIrwtAMcPMzJLPwcnJgCUSQBQ7QACx4NA4mYWFJQcWpegAGkDLFBUVfwEEEHpamAYMsExcGhEGgANwGYgACCBQKLsC6UxWNrZAQhph4N/fvyDqCIgACDAAcxzWeG16dZIAAAAASUVORK5CYII=" class="login_arrow" style="margin-right: 25px;" />
        <div class="box">
          <div class="clear"></div>
           <div class="box_con">
               <div class="formcontainer formregister">
              <div ng-cloak ng-repeat="error in errorregister" class="error-messages">{{ error }}</div>
               <form ng-show="!iservice.loggedIn.isLoggedIn" name="registration" action="" method="POST" novalidate> 
                  <div ng-show="!iservice.loggedIn.isLoggedIn" class="register page">
                          <div class="register-account-user-form">
                           <span class="l formheading">Create an account</span>
                           <span class="l_row control-group"  ng-class="{true: 'error'}[submittedregister && registration.inputrequiredcontactproperty1firstname.$invalid]">
                             <input id="inputrequiredcontactproperty1firstname" name="inputrequiredcontactproperty1firstname" type="text" value="" class="text uname" placeholder="First Name" ng-model="firstName" required>
                              <span class="validation_error" ng-show="submittedregister && registration.inputrequiredcontactproperty1firstname.$error.required">First Name Required</span>
                           </span>
                            <span class="l_row control-group"  ng-class="{true: 'error'}[submittedregister && registration.inputrequiredcontactproperty3lastname.$invalid]">
                              <input id="inputrequiredcontactproperty3lastname" name="inputrequiredcontactproperty3lastname" type="text" value="" class="text uname" placeholder="Last Name" required>
                              <span class="validation_error" ng-show="submittedregister && registration.inputrequiredcontactproperty3lastname.$error.required">Last Name Required</span>
                           </span>
                            <span class="l_row control-group"  ng-class="{true: 'error'}[submittedregister && registration.inputemailrequired.$invalid]">
                           <input id="inputemailrequired" name="inputemailrequired" type="text" value="" class="text uemail" placeholder="Email" required>
                              <span class="validation_error" ng-show="submittedregister && registration.inputemailrequired.$error.required">Email Required</span>
                           </span>
                           <div class="clear"></div>
                            <span class="l_row control-group"  ng-class="{true: 'error'}[submittedregister && registration.inputpasswordrequired.$invalid]">
                             <input id="inputpasswordrequired" name="inputpasswordrequired" type="password" value="" class="text upassword" placeholder="Password" required>
                              <span class="validation_error" ng-show="submittedregister && registration.inputpasswordrequired.$error.required">Password Required</span>
                           </span>
                            <span class="l_row control-group"  ng-class="{true: 'error'}[submittedregister && registration.inputpasswordrequired1.$invalid]">
                            <input id="inputpasswordrequired1" name="inputpasswordrequired1" type="password" value="" class="text upassword" placeholder="Confirm Password" required>
                              <span class="validation_error" ng-show="submittedregister && registration.inputpasswordrequired1.$error.required">Confirm Required</span>
                           </span>
                          <span class="l_btn_row">
                          <input type="submit" id="{{idPrefix}}registerSend" class="btn_okay" ng-click="RegisterSubmit('div.register-account-user-form')" value="Register Now"> 
                           <input type="button"  class="btn_cancel" value="Cancel" ng-click="resetregister(registration)" />
                          </span>
                          &nbsp;
                        </div>
                        <div grey-out ng-show="Loading()"></div>
                      </div>
                  <span class="box-title" >
                   </span>
               </form>       
               </div>
           <div class="clear"></div> 
        </div>
        </div>
       </div>
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
   		 <div class="findanswersection">
    		 <section class="content">
    			 <section class="left_container">
                    <article class="list_container">
                       <div class="showmenu" ng-click="toggle()">&nbsp;</div>
                       <h2 class="">Topic List</h2>
                       <nav class="nav topiclist" role="navigation" ng-class="myClass" >
                          <div accordion="" close-others="false">
                             <div ng-repeat="topicarraylist in topicArrya" on-finish-render="showArticleInt()">
                                <div accordion-group="" ng-class="{isOpen: status.isOpen}"  ng-repeat="topic in topicarraylist" ng-init="status = {isOpen: true}" is-open="status.isOpen"  >
                                  <div accordion-heading="">
                                     <div class="xa" ng-class="{active: isActive(topic)}">
                                       <div ng-class="{isOpen: status.isOpen}" ng-click="ShowTopic(topic)" id="{{topic.id}}" ng-init="(topic.id==param2) ? ShowTopic(topic) : ''"  >{{topic.name}}({{topic.countRecurse}})</div>
                                     </div>
                                  </div>
                                  <div accordion="" close-others="false">
                                    <div ng-repeat="subtopic in topic.subarray" >
                                    <div class="subsubtopics"  ng-if="topic.subarray[$index].subarray.length > 0" ng-class="{isOpen: status.isOpen}" accordion-group="nested" ng-init="status = {isOpen: true}" is-open="status.isOpen">
                                      <div accordion-heading="" >
                                        <div ng-class="{isOpen: status.isOpen}" class="subsubtopiclist" ng-class="{active: isActive(subtopic)}" ng-click="ShowTopic(subtopic)" id="{{subsubtopic.id}}" >{{topic.subarray[$index].name}}({{topic.subarray[$index].countRecurse}})</div>
                                      </div>
                                      <ul>
                                        <li ng-repeat="subsubtopic in topic.subarray[$index].subarray" ng-click="ShowTopic(subsubtopic)" id="{{subsubtopic.id}}"  ng-init="(subsubtopic==param2) ? ShowTopic(subsubtopic) : ''" ng-class="{active: isActive(subsubtopic)}"> {{subsubtopic.name}}({{subsubtopic.countRecurse}})
                                        </li>
                                      </ul>
                                    </div>
                                     <div class="subtopics" ng-if="topic.subarray[$index].subarray.length <= 0" ng-click="ShowTopic(subtopic)" id="{{topic.subarray[$index].id}}"  ng-init="(topic.subarray[$index].id==param2) ? ShowTopic(subtopic) : ''"  ng-class="{active: isActive(subtopic)}" >
                                     {{topic.subarray[$index].name}}({{topic.subarray[$index].countRecurse}}) 
                                     </div>  
                                    </div>
                                  </div>
                                 
                                </div>
                              </div>
                              </div>
                       </nav>
                    </article>
                    <article class="list_container topfaq"  >
                       <div class="showtopfaq" ng-click="togglefaq()">&nbsp;</div>
                       <h2 class="">Top FAQ</h2>
                       <nav class="nav topfaqlist" role="navigation" ng-class="myClassFaq">
                            <ul class="nav__list">
                             <li ng-repeat="articles in articleListFaq" ng-if="$index < 5">
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
                          <div class="t_content"   dir-paginate="article in articleList|orderBy:sortKey:reverse|filter:search|itemsPerPage:8" current-page="SelectedPage" ng-init="(article.id==param) ? ShowArticle(article,$index,'init') : ''" >
                            <div class="question" id="articleID{{article.id}}"  ng-click="ShowArticle(article,$index,'')">
                                 <aside class="col1">
                                    {{article.subject}}
                                 </aside>
                                  <aside class="col2">
                                  {{article.topicName}}
                                 </aside>
                                  <aside class="col3">
                                    {{article.date|amDateFormat:'YYYY-MM-DD h:mm:ss A'}}
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
                                    <span ng-show="selectedArticle.data.attachments.length" class="attachments">
                                        <span class="label">Attachments:</span>
                                        <p ng-repeat="file in selectedArticle.data.attachments"><a href="{{rootPath}}File.aspx?interactionID={{selectedArticle.id}}&fileID={{file.attachmentID}}">{{file.name}}</a></p>
                                   </span>
                                    <aside class="articleDetail">
                                       <span class="label">Article Details</span>                                             <aside class="detail">
                                          <aside class="row">
                                            <aside class="dcol">
                                             Article ID - <span ng-bind-html="selectedArticle.data.articleIdSafe"></span>
                                             </aside> 
                                             <aside class="dcol">
                                             Date Updated -<span>{{datet|amDateFormat:'YYYY-MM-DD h:mm:ss A'}}</span>
                                            </aside> 
                                            <aside class="dcol">
                                             #Views - <span ng-bind-html="selectedArticle.data.viewSafe"></span>
                                            </aside> 
                                             <aside class="dcol">
                                             Article Creator - <span ng-bind-html="selectedArticle.data.createdBySafe"></span>
                                            </aside> 
                                            <aside class="dcol sharelink">
                                             <span ng-click="sharetoggle = !sharetoggle" class="slink">Share link to article</span>
                                             <span class="sharelinkcontainer" ng-show="sharetoggle">
                                               <input type="text" value="{{hosturl}}?topicID={{article.topicID}}&articleID={{article.id}}">
                                             </span>
                                            </aside> 
                                        </aside> 
                                    </aside>
                                  </div>
                               </div>
                            </div>
                          <span ng-show="!articleList.length"  ng-cloak >No Articles</span>
                          </section>
                        </div>
                <div grey-out ng-show="Searching()"></div>
                </div>
              </section>
	     </div>
	</script>
    <script type=text/ng-template id=askquestion.html>
  		  <div class="askquestion_content" >
             <div class="page askqu">
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
                   <label> From </label>
				   <select class="w60" ng-cloak ng-model="destEmail" name="fromEmail" ng-options="login.name as login.name for login in iservice.loggedIn.logins" ng-init="destEmail = iservice.loggedIn.logins[0].name"  required></select>
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
   				 <select ng-cloak class="topic t_select" ng-model="details.topicID" name="questionTopic"  ng-options="topic.id as topic.option for topic in topicsList"  
        ></select>
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
			   <div grey-out ng-show="ThreadExpandRunning()"></div>
          </div>
        $include -placeholder'history-partials'$
		<script type="text/ng-template" id="history-thread-closed.html">
		  <div class="list-history-row-container"> 
		  <div class="thread-root interaction-type-history" ng-class="InteractionType(thread.type)"  ng-click="ThreadExpandClick(thread)">
			<div class="column-expand thread-expander-history">
			  <div id="{{idPrefix}}expand" class="expander-image list-expand" ng-click="ThreadExpandClick(thread)"></div>
			  
			</div>
			<div class="column-subject thread-subject-history">{{ thread.subject }}</div>
			<div class="column-type thread-type-history">{{ thread.type }}</div>
			<div class="column-date thread-date-history">{{ thread.date|amDateFormat:'YYYY-MM-DD h:mm:ss A' }}</div>
		  </div>
		  </div>
	</script>
	<script type="text/ng-template" id="history-thread-open.html">
      <div class="thread-root interaction-type-history" ng-class="InteractionType(thread.type)" ng-click="ThreadExpandClick(thread)">
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
      <div  ng-click="ChildExpandClick(child)" class="sublink">
          <div class="child-expander" >
            <div id="{{idPrefix}}expand" class="expander-image list-expand"></div>
            <div grey-out ng-show="ChildExpandRunning()"></div>
          </div>
          <div class="column-subject child-subject">{{ child.subject }}</div>
          <div class="column-type child-type">{{ child.type }}</div>
          <div class="column-date child-date">{{ child.date|amDateFormat:'YYYY-MM-DD h:mm:ss A' }}</div>
      </div>
    </script>
    <script type="text/ng-template" id="history-child-open.html">
      <div ng-repeat="details in [child.details]" ng-controller="ControllerHistoryChildOpen" class="child-details-container">
       <div class="child-details" ng-class="ActionClass()">
       <div>
          <div class="child-header">
            <div class="child-open-header" ng-click="ChildExpandClick(child)">
            <div class="child-open-expander">
              <div id="{{idPrefix}}expand" class="expander-image list-contract" ></div>
            </div>
            <div class="column-subject-h child-open-subject">{{ child.subject }}</div>
            <div class="column-type-h child-open-type">{{ child.type }}</div>
            <div class="child-open-date">{{ child.date|amDateFormat:'YYYY-MM-DD h:mm:ss A' }}</div>
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
    <script type="text/ng-template" id="child-details-actions.html">
      <div class="child-details-actions">
        <div class="options">
          <span ng-class="{nglink: !details.displayPlain}" ng-click="details.displayPlain = true">Plain</span> -- 
          <span ng-class="{nglink: details.displayPlain}" ng-click="details.displayPlain = false">Html</span> -- 
          <span class="nglink" ng-click="details.showAudit = !details.showAudit">Status Audit</span>
        </div>
        <div ng-hide="true">
            Take Action: <span class="nglink" ng-click="StartAgentEmail()">Agent Email</span> -- 
            <span class="nglink" ng-click="StartNote()">Create Note</span> -- 
            <span class="nglink" ng-click="StartTicket()">Create Ticket</span> 
            <span ng-show="CanSaveResolve()"> -- <span class="nglink" ng-click="StartSaveResolve()">Save & Resolve</span></span>
            <span> -- <span class="nglink" ng-click="StartForwardEmail()">Forward Email</span></span>
        </div>
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
$endif$
