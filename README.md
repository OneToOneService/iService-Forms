# iService Forms
This repository contains both in-development and finalized forms.  

### Repository Structure
The following structure should be followed when working with form projects:
- Each form project is contained in a sub-folder off of the top level. Other than README and LICENSE files, this folder only contains iService form code, as .frm files, that can be pasted directly into a form item in an iService Form Admin page.   
- The main form name in the project should be called **MainBody.frm**.  -
- Other sub-forms that are called by **MainBody.frm** should also be placed in the same folder alongside MainBody.
- Forms should have an .frm file extension in the repository. - for example, **MainCSS.frm** is OK, do not use names such as "MainCSS.txt" or "MainBody.CSS", etc
- Form actions are placed in a subfolder called **<formname>Actions** alongside the form. (ie, MainBodyActions)  This folder can contain information, such as screenshots, on form actions that should be set, as well as text bodies of items such as tickets generated.
- Any non-form code, such as form setup scripts, should be placed in a subfolder.
