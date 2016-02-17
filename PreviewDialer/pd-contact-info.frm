<div id="summary" class="box summary">
        <div class="header">
           <h2>Contact</h2>
           <span class="contact-info-show-box" ng-click="toggleContactInfo()"></span>
         </div>
        <div class="content content-detail" ng-class="classinfocontent">
          <address>
            $value -customer(property'Job Title') -Pid'contactID'$ <br>
            $value -customer(property'Customer Type') -Pid'contactID'$<br>
            $value -customer(property'Address1') -Pid'contactID'$ $value -customer(property'State') -Pid'contactID'$
            $value -customer(property'Postal Code') -Pid'contactID'$<br>
            <a target="_blank" href="$value -customer(property'Web Site') -Pid'contactID' -nodescription$">$value -customer(property'Web Site') -Pid'contactID'$</a><br>
            <a target="_blank" href="$value -customer(property'LinkedIn') -Pid'contactID'$">$value -customer(property'LinkedIn') -Pid'contactID'$</a><br>
          </address>
          <p>
            Close Reason: $value -customer(property'Close Reason') -Pid'contactID'$<br>
            Follow Up: $value -customer(property'Follow Up') -Pid'contactID'$<br>
            Time Zone: $value -customer(property'Time Zone') -Pid'contactID'$<br>
            Next Action: $value -customer(property'NEXT ACTION*') -Pid'contactID'$<br>
          </p>
        </div>
      </div>
