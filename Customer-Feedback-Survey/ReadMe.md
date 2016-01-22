To add feedback to your iService, perform the following steps.

1. Determine where you want the Feedback properties stored. You can add them to an existing segment, or create a new segment to contain them if you want to restrict access. That is, if the properties are created in a segment that your agents can access, any user with the ability to edit properties can change the values of the feedback item. If you create them in a segment that agents can't access then they will not be able to modify the feedback.

2. Create the contact properties by running the selenium script named FeedbackPropertyScript.html. Learn more about Selenium at http://docs.seleniumhq.org/.

3. The base Feedback Form is contained in the file FeedbackFormBody.html. Paste the updated form into the form body of a new iService form. Be sure to change the interaction property values to match the values you create in step 2. Set the topic on the new form to match the topic where you want the feedback to be queued. If desired, you can autoresolve these with a filter (in case you don't want to view them as they arrive).

4. Create the form actions using the image below as a guide. The file Action-TicketBody.txt file contains text you can use within the body of the Create Ticket/AAQ action. Edit the url in the ticket body to match your tenant.

5. Create a thank you page that will be used upon submission of the feedback form. This can be another form, or an existing page on your website.You can also add the thank you into the Feedback Form itself using the $IF -submitsuccess$ parameter.

6. Create a new stock response that includes the following for the link to the form. Change the URL and formID ## as needed.

https://TenantName.iservicecrm.com/F/##?ref=$ref$


