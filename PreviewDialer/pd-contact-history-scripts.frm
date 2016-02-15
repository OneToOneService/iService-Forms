<div id="contact-history" class="dialer-section contact-history-section">
      <div class="header">
      <h2>Contact History</h2>
      <span class="contact-info-show-box" ng-click="toggleContactHistory('classhistorytcontent')"></span>
      </div>
      <div ng-cloak class="customer-history history-content" ng-class="classhistorytcontent" ng-controller="ControllerPreviewDialerHistory">
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
                <div class="column-date thread-date-history">{{ thread.date| date: 'M/d/yyyy h:mm:ss a' }}</div>
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
              <div class="column-date child-date">{{ child.date | date: 'M/d/yyyy h:mm:ss a'}}</div>
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
                    <div class="child-open-date">{{ child.date | date: 'M/d/yyyy h:mm:ss a'}}</div>
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
           
      

        <div ng-cloak ng-show="Getting()">Loading</div>
        <div grey-out ng-show="Getting()"></div>
      </div>
    </div>
