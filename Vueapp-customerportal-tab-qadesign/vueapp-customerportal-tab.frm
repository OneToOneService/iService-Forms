$if -fieldregex'part'='^$'$
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>iService | Customer Portal Tabs</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta property="og:title" content="$value -article(subject) -Pid'articleID'$">
  <meta property="og:description" content="$value -article(question) -Pid'articleID'$">
  <link rel="stylesheet" href="$value -rootPath$css/bootstrap.5.1.3.min.css">
  <link rel="stylesheet" href="$value -rootPath$css/font-awesome.4.7.0.min.css">
  <link rel="stylesheet" href="$value -rootPath$css/ionicons.2.0.1.min.css">
  <link rel="stylesheet" href="$value -rootpath$css/vueapp.css">
  <link rel="stylesheet" href="$value -rootPath$css/blue.css">
  <link rel="stylesheet" href="$value -rootPath$css/icons/style.css">
  <link rel="stylesheet" href="$value -rootPath$f/$value -formid$?part=css">
  <link rel="stylesheet" href="$value -rootpath$css/vue3-date-time-picker.css" />
  <link rel="stylesheet" href="$value -rootpath$css/multiselect.default.css" />
  <link rel="stylesheet" href="$value -rootpath$css/vue-tooltip.css" />
  <link rel="stylesheet" href="$value -rootpath$css/vueapp.extra.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <style>
    body {
      background: transparent;
    }

    h1 {
      font-size: 30px;
    }
    h2 {
      font-size: 24px;
    }
    h3 {
      font-size: 18px;
    }
    h4 {
      font-size: 14px;
    }

    .top_head_sect {
      display: flex;
      justify-content: space-between;
      background: #3c8dbc;
      align-items: center;
      box-shadow: 0px 2px 5px rgb(0 0 0 / 16%);
    }

    .logo_box {
      padding: 4px 15px;
      justify-content: center;
      display: flex;
    }

    .mailbox-container {
      padding: 20px;
    }

    .nav-tabs-custom > .tab-content {
      padding: 0 !important;
    }

    .nav-tabs-custom .nav-tabs li.active, .tab-content .active, .nav-tabs-custom .nav-tabs > li.active > a, .nav-tabs-custom .nav-tabs > li.active:hover > a, .nav-link.active {
      background: #f7f7f7 !important;
      border-radius: 0 !important;
    }

    .mail-notification h1 {
      font-size: 18px;
      color: #444;
      font-weight: normal;
      margin-bottom: 15px;
    }

    .button-container {
      display: inline-block;
      width: 100%;
      margin-bottom: 15px;
    }

      .button-container.button-container2 {
        width: 50%;
        float: left;
      }

    .tab-content .tab-pane {
      padding: 15px;
    }

    .mailbox-controls {
      display: block;
    }

    .mailbox-controls-bottom {
      display: block;
      margin-top: 15px;
    }

    .chat-btn {
      font-weight: bold;
      border: 1px solid #3c8dbc;
      color: #3c8dbc;
      background-color: #ffffff;
    }

      .chat-btn i {
        font-size: 36px;
      }

    .search-mail {
      max-width: 300px;
    }

    .login-menu a {
      font-size: 16px;
      font-weight: bold;
    }

    .search-mail > input {
      border-right: 0px;
    }

    tr.unread {
      font-weight: bold;
      background: #fff !important;
    }

    .login-box {
      display: block;
    }

    .mb-15 {
      margin-bottom: 15px;
    }

    .mt-15 {
      margin-top: 15px;
    }

    .mr-15 {
      margin-right: 15px;
    }

    .ml-15 {
      margin-left: 15px;
    }

    .message-box {
      width: 100%;
      box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
      display: block;
      background: #ffffff;
    }

    .message-box-body {
      max-width: 100%;
      padding: 10px;
      min-height: 180px;
    }

    .attachments {
      border-radius: 5px;
      border: 1px dashed #dddddd;
      background: #f7f7f7;
      padding: 3px 8px;
      line-height: 20px;
      margin: 0px 8px 8px 0px;
      display: inline-block;
    }

      .attachments .filename {
        color: #444;
      }

    .attachment-icon {
      font-size: 18px !important;
      font-weight: bold;
    }

    .text-left {
      text-align: left !important;
    }
    .message-attachments{margin-left:15px; margin-right:15px;}
    .drop-box {
      cursor: pointer;
      font-weight: normal;
      background-color: #eee;
      outline: 1px dashed #dddddd;
      width: 100%;
      text-align: center;
      padding: 18px;
      transition: all ease-in-out 0.2s;
    }

    .form-group .ui-select-container {
      width: 100% !important;
    }

    .select2-container .select2-choice, .select2-container-multi .select2-choices {
      border-bottom-color: transparent;
      border-radius: 0px !important;
      background-color: white;
      background-image: none !important;
      border: 1px solid #d2d6de !important;
      height: 34px !important;
      line-height: 34px !important;
    }

    .ui-select-offscreen {
      clip: rect(0 0 0 0) !important;
      width: 1px !important;
      height: 1px !important;
      border: 0 !important;
      margin: 0 !important;
      padding: 0 !important;
      overflow: hidden !important;
      position: absolute !important;
      outline: 0 !important;
      left: 0px !important;
      top: 0px !important;
    }

    .select2-container:after {
      position: absolute;
      top: 50%;
      right: 8px;
      display: block;
      width: 0;
      height: 0;
      margin-top: -3px;
      border-color: gray transparent transparent transparent;
      border-style: solid;
      border-width: 6px 3px 0 3px;
      content: ' ';
    }

    .login-box-msg, .register-box-msg {
      margin: 0;
      text-align: center;
      padding: 15px 20px 15px 20px !important;
      margin-bottom: 16px !important;
    }

    .login-box-body, .register-box-body {
      background: #fff;
      padding: 20px;
      border-top: 0;
      color: #666;
      padding-top: 0px;
    }

    p.login-box-msg {
      background: #666;
      margin-left: -21px !important;
      margin-right: -21px;
      color: white;
      border-radius: 5px 5px 0px 0px;
      font-size: 20px;
    }

    .google-btn {
      background: #4285f4;
      width: 100%;
      text-align: left;
    }

    .copy-text {
      text-align: center;
    }

    .inbox-alert {
      margin-left: 5px;
      top: -5px;
      position: relative;
      border-radius: 5px;
      padding: 3px;
    }

    .mailbox-archive {
      width: 40px;
    }

    .archive {
      color: #ccc;
    }

      .archive:hover {
        color: #333;
        cursor: pointer
      }

    .copy-text {
      text-align: center;
      margin-top: 25px;
      color: #666666;
    }

    .notdatatable .table-controls {
      white-space: nowrap;
      display: inline-block;
    }

    .notdatatable .table-columns {
      margin-right: 10px;
    }

      .notdatatable .table-columns .btn-group {
        position: relative;
      }

      .notdatatable .table-columns .column-picker {
        position: absolute;
        left: 55px;
        top: 34px;
        display: block;
        z-index: 9999;
        background: #eee;
      }

        .notdatatable .table-columns .column-picker a {
          display: block;
          padding: 3px 20px;
          clear: both;
          font-weight: 400;
          line-height: 1.42857143;
          color: #777;
          white-space: nowrap;
        }

        .notdatatable .table-columns .column-picker .active a {
          color: #fff;
          text-decoration: none;
          background-color: #337ab7;
          outline: 0;
        }

    .notdatatable .table-filter {
      float: right;
    }

    .notdatatable .notdatatable th span {
      cursor: pointer;
      white-space: nowrap;
    }

    .small.user-initials {
      float: left;
      margin-right: 10px;
      margin-top: -2px;
    }

    .user-initials {
      height: 25px;
      width: 25px;
      font-size: 12px;
      line-height: 26px;
      color: white;
      text-align: center;
      font-family: Arial;
      margin: auto;
      cursor: default;
    }

    .round {
      border-radius: 50%;
    }

    .archivedprocess {
      opacity: 0.5;
    }

    .skin-blue .main-header .navbar .nav > li > a:hover {
      background: transparent;
      cursor: default;
    }

    .message-box img {
      max-width: 100%;
    }


    label.required {
      color: red !important;
    }

    .simple-label .float-btn-group {
      width: calc(100% - 26px);
      display: flex;
      align-items: flex-end;
      margin-bottom: 15px;
    }

    .simple-label .input-with-desc {
      width: 100%;
    }

      .simple-label .input-with-desc .group-property-1 {
        width: 40%;
        float: left;
      }

      .simple-label .input-with-desc input.group-property-2, .simple-label .input-with-desc select.group-property-2, .simple-label .input-with-desc textarea.group-property-2 {
        width: 58%;
        float: right;
      }

    .simple-label input, .simple-label select, .simple-label textarea {
      padding: 4px;
      display: block;
      width: calc(100% - 8px);
      position: relative;
    }

    .icon-button {
      background: none;
      width: 18px;
      height: 18px;
      border: none;
      padding: 0;
      line-height: 1;
      font-size: 18px;
    }

    .button-delete {
      color: #dd4b39;
      font-size: 16px;
    }

    .icheckbox_square-blue, .iradio_square-blue {
      background: url(/images/blue-n.png) no-repeat;
    }

    .icheckbox_square-blue, .iradio_square-blue {
      width: 19px;
      height: 19px;
    }

    .simple-label .button-add-row {
      position: absolute;
      bottom: 15px;
      right: 10px;
      color: #3c8dbc;
    }

    .chat-container {
      position: fixed;
      bottom: 0;
      right: 0;
      z-index: 1;
    }

    .has-error a.select2-choice, .has-error .cke_1 {
      border-color: #dd4b39 !important;
      box-shadow: none;
    }

    .drop-box_hover {
      outline-width: 3px;
      outline-offset: -5px;
      background-color: gold;
      outline-color: white;
      color: white;
    }

    div.nav-tabs-custom {
      position: relative;
    }

    a.compose-button {
      position: absolute;
      top: 4px;
      right: 5px;
    }

    .message-body-container {
      float: left;
      width: 100%;
    }

    .message-id-mobile {
      display: none;
    }

    .message-id-desktop {
      display: block;
    }

    .footer {
      text-align: right;
      float: left;
      width: 100%;
      padding: 15px;
      color: #444;
      border-top: 1px solid #d2d6de;
    }

    .google-btn {
      background: #4285f4;
      width: 100%;
      text-align: left;
    }

    .microsoft-btn {
      background: #2f2f2f;
      width: 100%;
      text-align: left;
    }

    .microsoft-auth-btn {
      background: #2672ec;
      width: 100%;
      text-align: left;
    }

    .toast-message {
      border: 1px solid #ccc;
      background: #202124;
      position: fixed;
      left: 15px;
      bottom: 15px;
      width: 100%;
      max-width: 280px;
      color: #fff;
      padding: 10px;
      border-radius: 8px;
      transition: .3s all ease;
    }

    .trans {
      -webkit-transition: all linear 0.1s;
      transition: all linear 0.1s;
    }

    .toast-message .toast-text {
      width: 80%;
      display: inline-block;
    }

    .toast-message .toast-action {
      width: 20%;
      text-align: right;
      display: inline-block;
      cursor: pointer;
    }

    .toast-message a {
      color: #3c8dbc;
    }

    @media screen and (max-width: 767px) {
      .button-container.button-container2 {
        width: 100%;
        float: left;
        margin-top: 10px;
        margin-left: 10px;
      }

      .message-id-mobile {
        display: block;
      }

      .message-id-desktop {
        display: none;
      }

      div.notdatatable.form-inline {
        text-align: left;
        width: 100%;
        margin-left: 10px;
        padding-right: 21px;
      }

      a.compose-button {
        position: relative;
      }

      .footer {
        text-align: center;
      }

      iservice-interaction-property {
        float: none;
        width: 100%;
      }
    }

    .pagination > .active > a {
      z-index: 0 !important;
    }

    iframe {
      height: 400px;
      border: 0 !important;
      width: 100%;
      border-radius: 12px;
      border-bottom-left-radius: 0;
      border-bottom-right-radius: 0;
    }

    .chat-popup .box-body {
      padding-left: 0;
      padding-right: 0;
      padding-top: 0;
    }
    /* Button used to open the chat form - fixed at the bottom of the page */
    .open-button {
      cursor: pointer;
      opacity: 0.8;
      position: fixed;
      bottom: 23px;
      right: 28px;
    }


    /*-----chat----- */
    /* The popup chat - hidden by default */
    .chat-popup {
      position: fixed;
      bottom: 74px;
      right: 38px;
      border: 1px solid #f1f1f1;
      z-index: 9;
      background: #fff;
      width: 100%;
      max-width: 350px;
      border-radius: 12px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
      box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 22.3px 17.9px rgba(0, 0, 0, 0.072), 0 41.8px 33.4px rgba(0, 0, 0, 0.086), 0 100px 80px rgba(0, 0, 0, 0.12);
    }

      .chat-popup .box-footer {
        padding: 0;
      }

    /* Add styles to the form container */
    .form-container {
      background-color: white;
      border-radius: 12px;
    }

      /* Full-width textarea */
      .form-container textarea {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        border: none;
        background: #f1f1f1;
        resize: none;
      }

        /* When the textarea gets focus, do something */
        .form-container textarea:focus {
          background-color: #ddd;
          outline: none;
        }


      /* Add some hover effects to buttons */
      .form-container .btn:hover, .open-button:hover {
        opacity: 1;
      }

    .chat-header {
      font-size: 16px;
      width: 100%;
      text-align: center;
      background: #367fa9;
      padding: 10px;
      border-radius: 12px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
    }

      .chat-header h1 {
        font-size: 16px;
        padding: 0;
        margin: 0;
        color: #ffffff;
        display: inline;
      }

    .chat-btn, .chat-btn:hover, .chat-btn:active {
      border-radius: 25px;
      font-weight: 500;
      border: 1px solid #206590;
      color: #ffffff;
      background-color: #206590;
      padding: 5px 20px;
    }

    .mtop-15 {
      margin-top: 15px;
    }

    .direct-chat-msg .direct-chat-timestamp {
      margin-left: 50px;
      font-size: 12px;
    }

    .right .direct-chat-timestamp {
      margin-right: 10px;
    }

    .minimize-icon {
      font-size: 14px;
      color: #ffffff;
      position: relative;
      display: inline;
      margin-top: 0px;
    }

    .poweredby-logo svg {
      width: 10px;
      height: 12px;
      display: inline-block;
      fill: #3c8dbc;
    }

    .poweredby-logo b {
      color: #3c8dbc;
      margin-left: -2px;
    }

    .chat-popup {
      margin-right: 0;
    }

    .chat-popup {
      width: 80%;
      z-index: 99999;
    }

    .main-header .navbar {
      margin-left: 0px;
    }

    .has-error, .validation_error {
      color: #f00000;
    }

    @media only screen and (max-width: 600px) {
      .message-portal .logo_box a img {
        max-width: 105px;
        min-width: 105px;
      }

      .small.user-initials {
        margin-right: 0px;
      }

      .nav > li > a {
        padding: 10px 6px;
      }
    }

    .chat-popup {
      margin-right: 0;
    }

    .chat-popup {
      width: 80%;
      z-index: 99999;
    }

    .main-header .navbar {
      margin-left: 0px;
    }

    .row-bggray {
      background: #f1f1f1;
    }

    @media only screen and (max-width: 600px) {
      .message-portal .logo_box a img {
        max-width: 105px;
        min-width: 105px;
      }

      .small.user-initials {
        margin-right: 0px;
      }

      .nav > li > a {
        padding: 10px 6px;
      }

      .message-portal .navbar-custom-menu {
        margin-right: 5px
      }
    }

    @media only screen and (max-height: 400px) and (orientation:landscape) {
      /* Landscape styles */
      /* show your content*/

      .chat-body {
        height: 230px !important;
        overflow-y: auto;
      }

      .chat-popup .chat-body {
        height: 300px !important
      }

      .chat-body iframe {
        height: 260px !important;
      }

      .chat-popup {
        bottom: 58px;
      }

      .direct-chat-messages {
        height: 160px;
      }
    }

    /*Knowledge base css*/
    .navbar-custom-menu .nav > li > a {
      color: #fff;
    }

      .navbar-custom-menu .nav > li > a:hover, .nav > li > a:active, .nav > li > a:focus {
        background: none;
        color: #fff;
      }

    .top_head_sect .navbar {
      margin-bottom: 0;
    }

    .navbar-nav > li > a.active {
      padding-bottom: 3px;
      border-bottom: 2px solid #fff;
    }

    .nav > li > a {
      position: relative;
      display: block;
      padding: 0;
    }

    .mtop30 {
      margin-top: 30px;
    }
    /*Search Container Box Start*/
    .search-container {
      max-width: 600px;
      text-align: center;
      width: 100%;
      margin: 0 auto;
    }

    .advanced-search-option {
      display: block;
      padding: 5px 0px;
      text-decoration: underline;
      text-align: right;
      cursor: pointer;
      color: #3c8dbc;
    }

    .search-box-container {
      display: flex;
    }

    .advanced-search-container .col-1 {
      width: 40%;
      margin-right: 15px;
    }

    .advanced-search-container .col-2 {
      width: 60%;
    }

    .select-topic-box {
      height: 44px;
      border-radius: 6px;
    }

    .knowledge-search-box {
      margin-top: 30px;
    }

      .knowledge-search-box input {
        height: 50px;
        border-radius: 6px;
      }

      .knowledge-search-box .input-group-addon {
        background: #333;
        color: #fff;
        font-size: 16px;
        line-height: 35px;
        padding-left: 20px;
        padding-right: 20px;
      }

      /*button color*/
      .knowledge-search-box .input-group-addon {
        color: #3c8dbc;
        cursor: pointer;
      }
    /*Search Container Box*/




    /*Category box container*/
    .content-container {
      max-width: 1040px;
      margin: 0 auto;
      margin-top: 50px;
      text-align: center;
    }

    .category-box {
      border-radius: 15px;
      padding: 15px;
      text-align: center;
      background: #fafafa;
      border: 1px solid #d7d7d7;
      cursor: pointer;
    }

      .category-box .icon-container {
        text-align: center;
        margin-left: calc(50% - 60px);
      }

      .category-box .c-icon {
        width: 115px;
        height: 115px;
        border: 1px solid #3c8dbc;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

        .category-box .c-icon i {
          font-size: 50px;
        }

      .category-box .c-heading {
        font-size: 16px;
        font-weight: 600;
        text-align: center;
        color: #3c8dbc;
        margin: 15px 0px 15px;
      }

      .category-box .p-detail {
        color: #333333;
        font-size: 16px;
        text-align: center;
        margin-top: 15px;
        margin-bottom: 15px;
      }

    .btn-custom-lg {
      padding: 6px;
      padding-left: 25px;
      padding-right: 25px;
      border-radius: 6px;
      font-size: 16px;
    }
    /*Category box container*/



    /*Custom section 2*/
    .page-sub-heading {
      font-size: 28px;
      margin-top: 0px;
      text-align: center;
    }

    .section-padding {
      padding: 40px 0;
      background: #f1f1f1;
    }

    .box-container {
      margin-bottom: 40px;
      padding-top: 15px;
      padding-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
    }

    .box-heading {
      margin-bottom: 20px;
    }

    .heading-desc {
      padding: 0;
      margin: 0;
      font-size: 18px;
      color: #6e7785;
      text-align: center;
      margin-top: 22px;
      margin-bottom: 35px;
      font-weight: 200;
    }

    .c-heading {
      font-size: 18px;
      font-weight: 600;
      text-align: center;
      color: #333333;
      margin: 30px 0px 25px;
    }

    .p-detail {
      color: #333333;
      font-size: 16px;
      text-align: center;
      margin-bottom: 30px;
      min-height: 50px;
    }

    .read-more {
      font-size: 16px;
      color: #6e7785;
      font-weight: bold;
      text-decoration: none;
      text-align: center;
      display: block;
    }

    .c-icon img {
      object-fit: none;
      width: 70px;
      height: 70px;
    }

    .c-icon {
      width: 115px;
      height: 115px;
      border: 1px solid #ccc;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .agent {
      object-position: 0 -0;
    }

    .mailing {
      object-position: -70px 0;
    }

    .forms {
      object-position: -140px 0;
    }

    .utility {
      object-position: 0 -70px;
    }

    .configuration {
      object-position: -68px -70px;
    }

    .reports {
      object-position: -140px -70px;
    }

    .console {
      object-position: 0 -140px;
    }

    .administration {
      object-position: -70px -140px;
    }

    .chat {
      object-position: -140px -140px;
    }

    .icon-container {
      text-align: center;
      margin-left: calc(50% - 60px)
    }

    .box-container:hover .c-icon {
      background: #579bd2;
      webkit-transition: ease 0.8s;
      -moz-transition: ease 0.8s;
      -ms-transition: ease 0.8s;
      -o-transition: ease 0.8s;
      transition: ease 0.8s;
    }

    .box-container:hover .agent {
      object-position: 0 -210px;
    }

    .box-container:hover .mailing {
      object-position: -70px -210px;
    }

    .box-container:hover .forms {
      object-position: -140px -210px;
    }

    .box-container:hover .utility {
      object-position: 0 -280px;
    }

    .box-container:hover .configuration {
      object-position: -68px -280px;
    }

    .box-container:hover .reports {
      object-position: -140px -280px;
    }

    .box-container:hover .console {
      object-position: 0 -350px;
    }

    .box-container:hover .administration {
      object-position: -70px -350px;
    }

    .box-container:hover .chat {
      object-position: -140px -350px;
    }

    .container-option {
      text-align: center;
      margin-top: 15px;
    }

    .btn-custom {
      border: 1px solid #8db8ea;
      color: #8db8ea !important;
      font-size: 12px;
      background: none;
      border-radius: 7px;
      height: 28px;
      padding: 3px 8px;
      margin-right: 15px;
    }

      .btn-custom:hover {
        background: #70a9d7;
        color: #fff !important;
        cursor: pointer;
      }

    .container-option .btn-custom:last-child {
      margin-right: 0px;
    }

    .input-group-btn .btn {
      border-radius: 0px;
      background: #70a9d7;
    }

    .search-option {
      margin-top: 15px;
      padding: 10px;
    }

      .search-option .input-group input {
        height: 32px;
        border: 1px solid #70a9d7;
      }

    .input-group-btn .btn {
      height: 32px;
      padding: 0px;
      width: 48px;
      border-top-right-radius: 3px;
      border-bottom-right-radius: 3px;
    }
    /*Custom section 2*/


    /*Ask Question container*/
    .ask-question-container {
      margin-bottom: 80px;
      background: #e1e1e1;
      border: 1px solid #d3ddde;
      padding-top: 15px;
      padding-bottom: 15px;
    }
    /*Ask Question Container */

    /*Topic listing*/
    .root-topic {
      font-size: 18px;
      cursor: pointer;
      padding: 8px 15px 8px 15px;
      text-align: left;
      margin-bottom: 0px;
      background: #daf1fe;
    }

    .text-color-segment-heading {
      color: #3c8dbc;
      border-bottom: 2px solid #3c8dbc;
      padding-bottom: 3px;
      width: auto;
      display: inline-block;
      float: left;
      font-size: 20px;
    }

    .topic-list {
      text-align: left;
      font-size: 16px;
    }

    ul.topic-list {
      padding: 0;
      margin: 0;
      padding-left: 0px;
      font-size: 16px;
    }

      ul.topic-list span, .link-color {
        color: #3c8dbc;
      }

    .pointer {
      color: #3c8dbc;
      cursor: pointer;
    }

    ul.topic-list li, ul.topic-list li ul {
      padding-bottom: 6px;
      padding-top: 6px;
      cursor: pointer;
    }

    li {
      list-style: none;
    }

    ul.topic-list ul li:before {
      content: "\f111"; /* FontAwesome Unicode */
      font-family: FontAwesome;
      display: inline-block;
      margin-left: -1.3em; /* same as padding-left set on li */
      width: 1.8em; /* same as padding-left set on li */
      font-size: 12px;
    }


    .question-list {
      text-align: left;
      font-size: 14px;
    }

    ul.question-list {
      padding: 0;
      margin: 0;
      padding-left: 4px;
      font-size: 16px;
      list-style: none;
      padding-bottom: 20px;
    }

      ul.question-list li:before {
        list-style: none;
      }

      ul.question-list li {
        font-size: 18px;
        color: #333;
        padding-bottom: 6px;
        padding-top: 6px;
      }

        ul.question-list li ul {
          padding-left: 30px;
        }

          ul.question-list li ul li {
            font-size: 16px;
            padding-bottom: 6px;
            padding-top: 6px;
            color: #3c8dbc;
            cursor: pointer;
          }

      ul.question-list ul li:before {
        content: "\f111"; /* FontAwesome Unicode */
        font-family: FontAwesome;
        display: inline-block;
        margin-left: -1.3em; /* same as padding-left set on li */
        width: 1.8em; /* same as padding-left set on li */
        font-size: 12px;
        color: #333;
      }

    /*Topic listing*/

    /*Question detail start */
    .breadcrumb {
      background: none;
    }

    .question-container {
      border-right: 1px solid #d7d7d7;
      padding: 15px;
    }

      .question-container .qa-title {
        font-size: 20px;
        color: #3c8dbc;
        margin-bottom: 5px;
      }

      .question-container .answer {
        font-size: 16px;
      }

    .related-article {
      padding-left: 15px;
    }

    .page-heading-related {
      font-size: 18px;
    }

    .share-link-btn {
      color: #3c8dbc;
      background: none;
      border: 1px solid #3c8dbc;
    }
    /*Question details end*/

    /*Ask Question page*/
    .field-label {
      font-size: 12px;
    }
    /*Ask Question page*/
    .box-placeholder {
      display: inline-block;
      background-color: white;
      box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0);
      vertical-align: top;
      width: 100%;
    }

      .box-placeholder hr {
        margin: 0;
        border-color: #f3f3f3;
      }

    .box-placeholder {
      font-size: 0;
      line-height: 0;
    }

      .box-placeholder .text {
        display: inline-block;
        background-color: #222121;
        height: 12px;
        margin: 5px 0;
        min-width: 100px;
        width: 100%;
        opacity: .1;
        animation: fading 1.5s infinite;
      }

        .box-placeholder .text:first-child {
          margin-top: 0;
        }

        .box-placeholder .text:last-child {
          margin-bottom: 0;
        }

        .box-placeholder .text.link {
          background-color: #3c8dbc;
          opacity: .2;
        }

        .box-placeholder .text.line {
          width: 100%;
        }

        .box-placeholder .text.category {
          width: 100px;
          margin-bottom: 10px;
        }

        .box-placeholder .text.title {
          width: 100%;
          background-color: #3c8dbc;
          margin-bottom: 10px;
        }

      .box-placeholder h4.text {
        height: 20px;
        margin: 3px 0;
        opacity: .2;
      }

      .box-placeholder .loading-text {
        color: #000;
        font-size: 18px;
        text-align: center;
        animation: fadingtext 1.5s infinite;
      }

    .line {
      flex: 1 1 auto;
    }

    @keyframes fading {
      0% {
        opacity: .1;
      }

      50% {
        opacity: .2;
      }

      100% {
        opacity: .1;
      }
    }

    @keyframes fadingtext {
      0% {
        opacity: .4;
      }

      50% {
        opacity: .8;
      }

      100% {
        opacity: .4;
      }
    }

    .dis-flex {
      display: flex;
    }
    /* Tree View CSS*/
    .treeview .tree li {
      margin: 0;
      padding: 0 0em 0px 1em;
      line-height: 14px;
      color: #336699;
      font-weight: 700;
      position: relative;
    }

    .treeview .tree ul li:before {
      content: "";
      display: block;
      width: 10px;
      height: 0;
      border-top: 1px solid;
      margin-top: -1px;
      position: absolute;
      top: 1em;
      left: 0;
    }

    .treeview .tree ul li:last-child:before {
      background: white;
      height: auto;
      top: 1em;
      bottom: 0;
    }

    .treeview .indicator {
      margin-right: 5px;
    }

    .treeview .tree li a {
      text-decoration: none;
      color: #336699;
    }

      .treeview .tree li a.router-link-active {
        color: #336699 !important;
      }

    .treeview .tree li button,
    .treeview .tree li button:active,
    .treeview .tree li button:focus {
      text-decoration: none;
      color: #336699;
      border: none;
      background: transparent;
      margin: 0px 0px 0px 0px;
      padding: 0px 0px 0px 0px;
      outline: 0;
    }

    .treeview .tree ul:before {
      content: "";
      display: block;
      width: 0;
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      border-left: 1px solid;
    }

    .treeview .tree ul {
      margin-left: 1em;
      position: relative;
      padding-left: 0;
    }

    .treeview .tree {
      padding-left: 0;
    }

    ul li .treeviewitem {
      display: inline-block;
      width: calc(100% - 58px);
    }

    .treeview .tree ul ul {
      margin-left: 0.5em;
    }
    /*Search List*/
    .question-list {
      font-size: 16px;
      cursor: pointer;
    }

    .question-results {
      padding-left: 20px;
    }

      .question-results li {
        list-style: decimal;
        padding-left: 15px;
      }

    .question-list .question-title {
      font-size: 18px;
      color: #3c8dbc;
      margin-bottom: 10px;
    }

    .question-list .answer-brief {
      margin-bottom: 10px;
      color: #666666;
    }

    .question-list .time {
      font-size: 14px;
    }

    .border-bottom {
      border-bottom: 1px solid #ccc;
      padding-bottom: 5px;
    }

    span.glyphicon-sort, span.glyphicon-sort-by-attributes, span.glyphicon-sort-by-attributes-alt {
      position: absolute;
      bottom: 5px;
      top: 3px;
      left: -20px;
    }

    .opacity-30 {
      opacity: 30%;
    }

    .table > thead > tr > th > span {
      width: 100%;
      position: relative;
      display: block;
    }
    /*Search List*/
    /*top menu section*/
    .top-menu-section {
      width: 100%;
      margin-top: 30px;
      text-align: left;
      margin-bottom: 30px;
    }

      .top-menu-section a {
        display: inline-block;
        margin-right: 30px;
        font-size: 17px;
        padding-top: 8px;
        padding-bottom: 8px;
        margin-bottom: 0px;
      }

        .top-menu-section a i {
          margin-right: 6px;
          font-size: 24px;
        }

        .top-menu-section a.router-link-active {
          border-bottom: 3px solid #f7941d;
          padding-bottom: 4px;
        }

          .top-menu-section a.router-link-active i {
            color: #f7941d;
          }
    /*top menu section*/

    /*login container*/
    .login_container {
      float: right;
      padding-right: 10px;
      margin-top: 30px;
    }

      .login_container a {
        text-decoration: none;
        margin-left: 20px;
        font-size: 16px;
      }

    .box_wrap {
      width: 100%;
      z-index: 9;
      background: #f1f1f1;
      margin-bottom: 20px;
      border-radius: 6px;
      float: left;
      margin-top: 15px;
      padding: 20px;
      border: 1px solid #d3ddde;
      position: relative;
    }

    .box-login:after,
    .box-login:before {
      bottom: 100%;
      border: solid transparent;
      content: " ";
      height: 0;
      width: 0;
      position: absolute;
      pointer-events: none;
    }

    .box-login:after {
      border-color: rgba(255, 255, 255, 0);
      border-bottom-color: #fffae7;
      border-width: 14px;
      left: calc(100% - 110px);
      margin-left: -14px;
    }

    .box-login:before {
      border-color: rgba(247, 148, 29, 0);
      border-bottom-color: #f7941d;
      border-width: 15px;
      left: calc(100% - 110px);
      margin-left: -15px;
    }

    .box-signup:after,
    .box-signup:before {
      bottom: 100%;
      border: solid transparent;
      content: " ";
      height: 0;
      width: 0;
      position: absolute;
      pointer-events: none;
    }

    .box-signup:after {
      border-color: rgba(255, 255, 255, 0);
      border-bottom-color: #fffae7;
      border-width: 14px;
      left: calc(100% - 38px);
      margin-left: -14px;
    }

    .box-signup:before {
      border-color: rgba(247, 148, 29, 0);
      border-bottom-color: #f7941d;
      border-width: 15px;
      left: calc(100% - 38px);
      margin-left: -15px;
    }

    .support-login-box h2 {
      font-size: 18px;
      font-weight: 500;
      margin: 0px;
      padding: 0px;
      margin-bottom: 8px;
      color: #3c8dbc;
    }

    .support-login-box .form-container {
      background: none;
    }

    .support-login-box input, .support-login-box select {
      border-radius: 4px;
      padding-left: 35px;
    }

    .support-login-box i {
      position: absolute;
      color: #999999;
      font-size: 18px;
      top: -2px;
    }

    .support-login-box .icon {
      padding: 10px;
      min-width: 35px;
      width: 35px;
      height: 35px;
    }

    .login-link a {
      margin-right: 8px;
      margin-left: 8px;
    }

    .mobile-menu {
      display: none;
    }
    /*login container*/

    /* Medium devices (landscape tablets, 768px and up) */
    @media only screen and (max-width: 1080px) {
      .mobile-menu {
        display: none;
      }

      .mobile-menu {
        font-size: 28px;
        margin-top: 5px;
        margin-left: 8px;
      }

      .search-container-box {
        margin-top: 0px !important;
      }

      .search-container {
        width: 88% !important;
      }
      /*.top-menu-section {
        margin-top: 15px;
        float: left;
        display: none;
        padding-left: 15px;
        padding-right:15px;
      }*/

      .top-menu-section a {
        width: 100%;
        text-align: left;
      }

      .showmenu {
        display: block !important;
      }
    }

    .nav > li > a {
      position: relative;
      display: block;
      padding: 10px 15px;
    }

    .kb-support-tabs .nav > li > a {
      border: none;
      font-size: 17px;
      padding: 0px;
      padding-bottom: 4px;
    }

    .kb-support-tabs .nav-tabs > li.active > a {
      border-bottom: 3px solid #f7941d;
    }

      .kb-support-tabs .nav-tabs > li.active > a i {
        color: #f7941d;
      }

    .kb-support-tabs .nav-tabs > li a i {
      font-size: 24px;
      margin-right: 5px;
    }
    /*kb support tabls*/
    /*my subscription*/

    .subscriptions {
      margin-bottom: 40px;
    }

      .subscriptions .table-row {
        width: 100%;
        float: left;
        color: #5e5e5e;
      }

      .subscriptions .table-row-head {
        background: #fffae7;
        border: 1px solid #f7941d;
        border-radius: 6px;
        font-weight: bold;
        color: #35567f;
        margin-bottom: 15px;
        font-size: 16px;
        font-weight: normal;
      }

        .subscriptions .table-row-head .list-name, .subscriptions .table-row-head .list-desc, .subscriptions .table-row-head .member-of {
          padding: 6px 10px !important;
        }

      .subscriptions .table-row .list-name {
        width: 30%;
        float: left;
        padding: 10px;
        padding-left: 15px;
      }

      .subscriptions .table-row .list-desc {
        width: 40%;
        float: left;
        padding: 10px;
      }

      .subscriptions .table-row .member-of {
        width: 20%;
        float: left;
        padding: 10px;
      }

      .subscriptions .table-row {
        width: 100%;
        float: left;
        color: #5e5e5e;
      }
    /*my subscription*/

    /*my details*/
    .heading-bar {
      background: #fffae7;
      border: 1px solid #f7941d;
      border-radius: 6px;
      color: #35567f;
      margin-bottom: 15px;
      padding: 6px 15px;
      font-size: 18px;
      float: left;
      width: 100%;
    }

    .multiple-input {
      position: relative;
    }

    .groupinput {
      margin-bottom: 15px;
    }

      .multiple-input .button-add-row, .groupinput .button-delete {
        font-size: 22px;
      }

    .multiple-input .button-add-row {
      position: absolute;
      right: 50px;
      color: #3c8dbc;
    }

    .mbottom40 {
      margin-bottom: 40px;
    }

    .support-form
    .control-label {
      font-weight: normal !important;
      font-size: 16px;
      color: #355780;
    }
    /*my details*/

    /*asq question*/
    ul.suggested-question-list {
      padding: 0;
      margin: 0;
      margin-bottom: 15px;
    }

      ul.suggested-question-list li {
        list-style: none;
        width: 100%;
        float: left;
        margin-bottom: 8px;
      }

    .suggested-question-list .question-button {
      float: left;
      width: 35px;
      margin-right: 15px;
    }

    .suggested-question-list .question {
      float: left;
      width: calc( 100% - 50px);
      font-size: 16px;
    }

    .suggested-question-list .question-details {
      border: 1px solid #ccc;
      border-radius: 6px;
      padding: 15px;
      float: left;
      width: calc( 100% - 50px);
      margin-top: 15px;
      margin-bottom: 15px;
      font-size: 16px;
      color: #666666;
    }

    .text-orange {
      color: #ff9933;
    }

    .text-blue {
      color: #355780;
    }

    .f16 {
      font-size: 16px;
    }

    .f18 {
      font-size: 18px;
    }

    /*asq question*/
    .treeviewitem .topic-selected {
      background: #dcdcdc;
      padding-right: 20px;
    }

    .topfaq a {
      color: #333 !important;
    }

    .breadcrumb-container .breadcrumb {
      text-align: left;
      padding-left: 15px;
      margin-top: 30px;
    }

    .topic-list-container .box {
      border-top: 0px;
      border: 1px solid #d7d7d7;
      padding-bottom: 30px;
    }

    .topic-list-container {
      min-height: auto;
    }

    .root-topic a {
      font-size: 18px;
      cursor: pointer;
      background: #daf1fe;
      text-align: left;
      margin-bottom: 0px;
      color: #35567f;
    }

    .topic-list-container .box-header {
      background: #a3d8f8;
    }

    .all-topic-link {
      font-size: 16px;
      margin-bottom: 15px;
      cursor: pointer;
    }

    .topic-listing .topic-list li ul li a {
      color: #333;
    }

    .view-more a {
      cursor: pointer;
      padding-right: 30px;
    }
    /*Updates*/
    .mleft15 {
      margin-left: 15px;
    }

    .article-other-detail {
      margin-bottom: 15px;
    }

    .article-date, .article-share {
      font-size: 15px;
      color: #666;
      font-weight: normal;
      position: relative;
    }

    .fb.share-button {
      width: 30px;
      float: left;
      display: flex;
      position: absolute;
      left: 89px;
      top: -4px;
    }

    .twitter.share-button {
      position: absolute;
      left: 121px;
      top: -4px;
    }

    .linkedin.share-button {
      position: absolute;
      left: 153px;
      top: -4px;
    }

    .copy.share-button {
      position: absolute;
      left: 186px;
      top: -4px;
    }


    .article-share a {
      border: 1px solid #666;
      padding: 6px;
      border-radius: 6px;
    }

    .article-share a {
      border: 1px solid #666;
      padding: 1px;
      border-radius: 6px;
      width: 23px;
      height: 25px;
      display: inline-block;
      text-align: center;
      margin-right: 6px;
    }

    .rating {
      color: #a9a9a9;
      margin: 0;
      padding: 0;
    }

    ul.rating {
      display: inline-block;
    }

    .rating li {
      list-style-type: none;
      display: inline-block;
      padding: 1px;
      text-align: center;
      font-weight: bold;
      cursor: pointer;
      font-size: 20px;
    }

    .rating .filled {
      color: orangered;
    }

    .clear {
      margin-top: 20px;
    }

    .main-title {
      font-size: 24px !important;
      font-weight: bold;
    }
    /*udpates*/
    .fa-star-o {
      color: #FF7700;
    }

    .fa-star {
      color: #FFDD00;
      -webkit-text-stroke-width: 2px;
      -webkit-text-stroke-color: #FF7700;
    }

    .question-title-icon {
      padding: 10px 12px;
      border-radius: 50px;
      border: 1px solid #3c8dbc;
      font-weight: normal !important;
      margin-right: 8px;
    }

    .sharelinkcontainer {
      padding: 3px;
      border-radius: 7px;
      border: 1px solid #ccc;
      margin-top: 5px;
      width: 100%;
      background: #f3f2f2;
    }

    div.answer img {
      max-width: 100%;
      height: auto;
    }

    .rowbg-gray {
      background: #f1f1f1;
    }

    .radius8 {
      border-radius: 8px;
    }

    .p8 {
      padding: 8px;
    }

    .property-group {
      float: left;
      width: 100%;
      margin-bottom: 10px;
    }

    .pd-user-name {
      font-size: 32px;
    }

    .pd-details span {
      font-size: 18px;
    }

    .edit-details-btn {
      cursor: pointer;
      font-size: 16px;
    }

    span.address {
      display: inline;
    }

    .alert .icon {
      margin-right: 10px;
      padding: 0 !important;
      min-width: 0px !important;
      width: auto !important;
      height: auto !important;
      color: #fff;
      position: unset;
    }

    .question-container li {
      list-style: inherit !important;
    }

    .multiselect-option {
      color: #212529 !important;
    }

      .multiselect-option.is-selected {
        color: #fff !important;
      }

    .form-control {
      background: #fff !important;
    }

    .form-inline .input-group {
      display: inline-table;
      vertical-align: middle;
      width: auto;
    }

    .input-group-text {
      display: unset;
    }

    .address-label {
      display: block;
    }

    .modal .float-btn-group {
      margin-bottom: 10px;
    }

    .modal-dialog {
      max-width: 600px;
    }

    .topic-btn-container {
      margin: 30px 0px;
    }

      .topic-btn-container .btn {
        border-radius: 5px;
        line-height: 38px;
        margin-left: 8px;
        margin-right: 8px;
        margin-bottom: 15px;
        font-size: 18px;
        background: #e1e1e1;
        padding-left: 20px;
        padding-right: 20px;
      }

        .topic-btn-container .btn:first-child {
          margin-left: 0px;
        }

        .topic-btn-container .btn:last-child {
          margin-right: 0px;
        }

        .topic-btn-container .btn.active {
          background: #4D148C;
          color: #fff;
          border: 1px solid #4D148C;
        }

    .topic_blocks__layout {
      column-count: 1
    }

      .topic_blocks__layout .topic_blocks_card-wrapper .topic_blocks_card {
        margin-right: 0
      }

    #homepage-common-questions {
      margin: 27px 20px 80px 20px
    }

    @media (min-width: 768px) {
      #homepage-common-questions {
        margin: 27px 80px 80px 80px
      }

      .topic_blocks__layout {
        column-count: 2
      }
    }

    @media (min-width: 1200px) {
      #homepage-common-questions {
        margin: 27px 140px 80px 140px
      }

      .topic_blocks__layout {
        column-count: 3
      }
    }

    @-moz-document url-prefix() {
      .topic_blocks_card-wrapper {
        display: inline-block
      }
    }

    .topic_blocks_card-wrapper {
      break-inside: avoid;
      break-after: always;
      padding-bottom: 0px;
      width: 100%
    }

      .topic_blocks_card-wrapper:not(.visible) {
        display: none
      }

      .topic_blocks_card-wrapper .topic_blocks_card {
        break-inside: avoid;
        padding: 24px;
        border: 1px solid #d3ddde;
        border-radius: 4px;
        margin: 0 12px 17px 0;
        background: #e1e1e1;
      }

        .topic_blocks_card-wrapper .topic_blocks_card .icon {
          width: 30px;
          height: 25px;
          margin: 6px 6px 0 0;
          vertical-align: top;
          display: inline-block
        }

          .topic_blocks_card-wrapper .topic_blocks_card .icon svg {
            width: 100%;
            height: 100%
          }

        .topic_blocks_card-wrapper .topic_blocks_card .topic {
          margin: 0;
          display: inline-block;
          max-width: 286px;
          margin-bottom: 6px;
          font-size: 20px;
          font-weight: 500;
        }

          .topic_blocks_card-wrapper .topic_blocks_card .topic a {
            color: #000;
          }

          .topic_blocks_card-wrapper .topic_blocks_card .topic.with-subtitle .subtitle {
            color: #17494d;
            font-size: 16px;
            font-family: 'PNR', sans-serif;
            font-weight: normal
          }

          .topic_blocks_card-wrapper .topic_blocks_card .topic.with-subtitle .title {
            color: #03363d
          }

    .kb-list-item {
      margin: 12px 0;
      margin-left: 0px;
      background: url('/images/customer-portal-list-item.png') no-repeat;
      background-position: 0px 0px;
      padding-left: 35px;
      margin-left: 15px;
    }

    .promoted-postes > :nth-child(-n+3) {
      break-before: always
    }

    #knowledge-base-container {
      left: 0;
      margin: 0 auto;
      max-width: 1160px;
      position: relative
    }

    .kb-list-item a {
      text-decoration: none;
      font-size: 16px;
    }

    .topic_blocks_card-content > ul {
      margin-left: 0px;
      padding-left: 0px;
    }

    ul li.kb-list-item:hover {
      text-decoration: none !important;
    }

    .search-container-box {
      background-color: #e1e1e1;
      background-image: url('/images/search-bg-img.png');
      background-repeat: no-repeat;
      background-position: 75% center;
      padding-top: 60px;
      padding-bottom: 108px;
      margin-top: -30px;
      border: 1px solid #d3ddde;
    }

      .search-container-box .knowledge-search-box {
        margin-top: 0;
      }

    .knowledge-search-box .input-group-addon {
      border-bottom-left-radius: 0;
      border: none;
      border-top-right-radius: 5px;
      border-bottom-right-radius: 5px;
    }

    .search-container-box h1 {
      text-align: center;
      font-size: 30px;
      font-weight: 500;
    }

    .ask-question-container .help-icon {
      color: #FF6600;
      border: 3px solid #4D148C;
      border-radius: 50%;
      width: 100px;
      height: 100px;
      display: inline-block;
      margin: 0 auto;
      font-size: 62px;
      margin-bottom: 15px;
      margin-top: 15px;
      margin-right: 15px;
    }

    .ask-question-container .page-sub-heading, .ask-question-container .btn {
      display: inline-block;
      margin-top: -15px;
      margin-right: 22px;
    }

    .box-login::before, .box-signup::before {
      border-bottom-color: #d3ddde !important;
    }

    .box-login::after, .box-signup::after {
      border-bottom-color: #f1f1f1 !important;
    }

    @media only screen and (max-width: 1080px) {
      .top-menu-section a {
        padding: 6px 12px;
        display: inline-block;
        border-radius: 3px;
        font-size: 15px;
        margin-right: 8px;
        width: auto;
        margin-bottom: 10px;
      }

        .top-menu-section a.router-link-active {
          padding-bottom: 3px !important;
        }

      .search-container-box h1 {
        font-size: 26px;
      }
    }

    .form-alert-message .alert-success .icon {
      color: #155724 !important;
    }

    .form-alert-message .alert-danger .icon {
      color: #721c24 !important;
    }

    @media only screen and (max-width: 767px) {
      .ask-question-container {
        width: 95% !important
      }

        .ask-question-container .page-sub-heading {
          margin-top: 0px !important;
          margin-bottom: 25px;
        }
    }

    @media only screen and (max-width: 480px) {
      .top-menu-section a {
        font-size: 0px !important;
      }

        .top-menu-section a i {
          margin-right: 0px;
        }
    }

    .form-input {
      position: relative;
    }

    /*theme 1*/
    .theme1 .top-menu-section {
      background: #0078BD !important;
    }

      .theme1 .top-menu-section a {
        color: #FFFFFF !important;
      }

    .theme1 .icon-container .c-icon {
      color: #FD8D0B !important;
    }

    .theme1 .btn-primary {
      background: #0078BD !important;
      border: 1px solid #0078BD !important;
    }

    .theme1 .nav-tabs-custom > .nav-tabs > li a.active, .theme1 .box.box-primary {
      border-top-color: #FD8D0B !important;
    }

      .theme1 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme1 .topic-list-container .box-header {
      background: rgba(254, 141, 11, 1) !important;
    }

    .theme1 .root-topic {
      background: rgba(252, 239, 194, 1) !important;
    }

      .theme1 .root-topic a {
        background: none !important;
      }

    .theme1 .box-header .box-title a, .root-topic a {
      color: #fff !important;
    }

    .theme1 .input-group-addon .fa-search {
      color: #333 !important;
    }

    .theme1 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme1 .knowledge-search-box .input-group-addon {
      background: #0078BD !important;
      color: #fff !important;
    }

    .theme1 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme1 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme1 .ask-question-container {
      background: #F1F1F1;
    }

      .theme1 .ask-question-container .help-icon {
        color: #FE8D0B;
        border: 3px solid #0078BD;
      }

    .theme1 .topic-btn-container .btn.active {
      background: #0078BD;
      color: #fff;
      border: 1px solid #0078BD;
    }

    .theme1 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #FE8D0B;
      background: #FE8D0B;
    }

    @media only screen and (max-width: 1080px) {
      .theme1 .top-menu-section {
        background: none !important;
      }

        .theme1 .top-menu-section a {
          background: #0078BD;
        }
    }


    /*theme 1*/
    /*theme 2*/
    .theme2 .top-menu-section {
      background: #4D148C !important;
    }

    .theme2 .knowledge-search-box .input-group-addon {
      background: #4D148C !important;
      color: #fff !important;
    }

    .theme2 .top-menu-section a {
      color: #FFFFFF !important;
    }

    .theme2 .icon-container .c-icon {
      color: #FF6600 !important;
    }

    .input-group-addon .fa-search {
      color: #333 !important;
    }

    .theme2 .btn-primary {
      background: #FF6600 !important;
      border: 1px solid #FD8D0B !important;
    }

    .theme2 .nav-tabs-custom > .nav-tabs > li a.active, .theme2 .box.box-primary {
      border-top-color: #FF6600 !important;
    }

      .theme2 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme2 .topic-list-container .box-header {
      background: rgba(255, 102, 0, 1) !important;
    }

    .theme2 .root-topic {
      background: rgb(252, 239, 194,1) !important;
    }

      .theme2 .root-topic a {
        background: none !important;
      }

    .theme2 .box-header .box-title a {
      color: #fff !important
    }

    .root-topic a {
      color: #424D52 !important;
    }

    .theme2 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme2 .btn-primary {
      background: #4D148C !important;
      border: 1px solid #4D148C !important;
    }

    .theme2 .pagination > .active > a, .theme3 .pagination > .active > a:hover {
      background-color: #4D148C !important;
      border: 1px solid #4D148C !important;
    }

    .theme2 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme2 .knowledge-search-box .input-group-addon {
      background: #4D148C !important;
      color: #fff !important;
    }

    .theme2 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme2 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme2 .ask-question-container {
      background: #F1F1F1;
    }

      .theme2 .ask-question-container .help-icon {
        color: #fff;
        border: 3px solid #FF6600;
        background: #FF6600;
      }


    @media only screen and (max-width: 1080px) {
      .theme2 .top-menu-section {
        background: none !important;
      }

        .theme2 .top-menu-section a {
          background: #4D148C;
        }
    }
    /*theme 2*/
    /*theme 3*/
    .theme3 .top-menu-section {
      background: #D6E5C9 !important;
      color: #D6E5C9 !Important
    }

      .theme3 .top-menu-section a {
        color: #709A41 !important;
        opacity: .7 !important
      }

        .theme3 .top-menu-section a:hover {
          color: #709A41 !important;
          opacity: 1 !important
        }

        .theme3 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #709A41;
          padding-bottom: 4px;
          opacity: 1 !important
        }

        .theme3 .top-menu-section a.selected {
          color: #709A41 !important;
          border-bottom: 3px solid #709A41 !important;
          opacity: 1 !important;
        }

          .theme3 .top-menu-section a.selected i {
            color: #709A41 !important;
          }

        .theme3 .top-menu-section a.router-link-active i {
          color: #709A41 !important;
          opacity: 1;
        }

    .theme3 .icon-container .c-icon {
      color: #709A41 !important;
    }

    .theme3 .btn-primary {
      background: #709A41 !important;
      border: 1px solid #D6E5C9 !important;
      color: #ffffff !important;
    }

    .theme3 .nav-tabs-custom > .nav-tabs > li a.active, .theme3 .box.box-primary {
      border-top-color: #709A41 !important;
    }

      .theme3 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme3 .topic-list-container .box-header {
      background: rgba(112, 154, 65, 1) !important;
    }

    .theme3 .root-topic {
      background: rgba(112, 154, 65, 0.2) !important;
    }

      .theme3 .root-topic a {
        background: none !important;
      }

    .theme3 .box-header .box-title a {
      color: #fff !important
    }

    .root-topic a {
      color: #424D52 !important;
    }

    .theme3 .subscriptions .table-row-head, .theme3 .heading-bar {
      background: #D6E5C9 !important;
      color: #333 !Important;
      border: 1px solid #709A41;
    }

    .theme3 .heading.page-sub-heading.text-left.text-blue {
      color: #333333 !important
    }

    .theme3 .text-blue {
      color: #333 !Important;
    }



    .theme3 .support-login-box h2 {
      color: #333 !important;
    }

    .theme3 .input-group-addon .fa-search {
      color: #333 !important
    }

    .theme3 .category-box .c-heading {
      color: #333333 !important;
    }

    .theme3 .pagination > .active > a, .theme3 .pagination > .active > a:hover {
      background-color: #D6E5C9 !important;
      border: 1px solid #D6E5C9 !important;
      color: #709A41;
    }

    .theme3 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #D6E5C9;
    }

    .theme3 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme3 .knowledge-search-box .input-group-addon {
      background: #709A41 !important;
      color: #fff !important;
    }

    .theme3 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme3 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme3 .ask-question-container {
      background: #F1F1F1;
    }

      .theme3 .ask-question-container .help-icon {
        color: #709A41;
        border: 3px solid #333333;
      }

    .theme3 .topic-btn-container .btn.active {
      background: #709A41;
      color: #fff;
      border: 1px solid #709A41;
    }

    .theme3 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #709A41;
      background: #709A41;
    }

    @media only screen and (max-width: 1080px) {
      .theme3 .top-menu-section {
        background: none !important;
      }

        .theme3 .top-menu-section a {
          background: #D6E5C9;
        }
    }
    /*theme 3*/
    /*theme 4*/
    .theme4 .top-menu-section {
      background: #5190CD !important;
      color: #ffffff !Important
    }

      .theme4 .top-menu-section a {
        color: #ffffff !important
      }

        .theme4 .top-menu-section a:hover {
          color: #fff !important
        }

        .theme4 .top-menu-section a.selected {
          color: #fff !important;
          border-bottom: 3px solid #424D52 !important;
        }

          .theme4 .top-menu-section a.selected i {
            color: #424D52 !important;
          }

    .theme4 .icon-container .c-icon {
      color: #424D52 !important
    }

    .theme4 .top-menu-section a.selected i {
      color: #424D52 !important;
    }

    .theme4 .top-menu-section a.router-link-active i {
      color: #424D52 !important;
      opacity: 1;
    }

    .theme4 .top-menu-section a.router-link-active {
      border-bottom: 3px solid #424D52;
    }

    .theme4 .icon-container .c-icon {
      color: #424D52 !important;
    }

    .theme4 .btn-primary {
      background: #5190CD !important;
      border: 1px solid #5190CD !important;
    }

    .theme4 .nav-tabs-custom > .nav-tabs > li a.active, .theme4 .box.box-primary {
      border-top-color: #424D52 !important;
    }

      .theme4 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme4 .topic-list-container .box-header {
      background: rgba(66, 77, 82, 1) !important;
    }

    .theme4 .root-topic {
      background: rgba(66, 77, 82, 0.2) !important;
    }

      .theme4 .root-topic a {
        background: none !important;
      }

    .theme4 .box-header .box-title a {
      color: #fff !important
    }

    .root-topic a {
      color: #424D52 !important;
    }

    .theme4 .heading.page-sub-heading.text-left.text-blue {
      color: #424D52 !important
    }

    .theme4 .text-blue {
      color: #424D52 !important;
    }

    .theme4 .subscriptions .table-row-head, .theme5 .heading-bar {
      background: rgba(66, 77, 82, 0.3) !important;
      color: #424D52 !Important;
      border: 1px solid #424D52;
    }


    .theme4 .support-login-box h2 {
      color: #424D52 !important;
    }

    .theme4 .input-group-addon .fa-search {
      color: #333 !important
    }

    .theme4 .category-box .c-heading {
      color: #333 !important;
    }

    .theme4 .pagination > .active > a, .theme4 .pagination > .active > a:hover {
      background-color: #5190CD !important;
      color: #fff;
    }

    .theme4 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #424D52;
    }

    .theme4 .nav-tabs-custom > .nav-tabs > li a.active, .theme4 .box.box-primary {
      border-top-color: #424D52 !important;
    }

      .theme4 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme4 .box-login::after, .theme4 .box-signup::after {
      border-bottom-color: #D9DBDC !important;
    }

    .theme4 .search-mail .input-group-text {
      padding-top: 5px;
      bottom: 8px;
    }

    .theme4 .knowledge-search-box .input-group-addon {
      background: #5190CD !important;
      color: #fff !important;
    }

    .theme4 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme4 .ask-question-container .help-icon {
      color: #5190CD;
      border: 3px solid #424D52;
    }

    .theme4 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme4 .ask-question-container {
      background: #F1F1F1;
    }

    .theme4 .topic-btn-container .btn.active {
      background: #5190CD;
      color: #fff;
      border: 1px solid #5190CD;
    }

    .theme4 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #424D52;
      background: #424D52;
    }

    @media only screen and (max-width: 1080px) {
      .theme4 .top-menu-section {
        background: none !important;
      }

        .theme4 .top-menu-section a {
          background: #5190CD;
        }
    }
    /*theme 4*/
    /*theme 5*/
    .theme5 .top-menu-section {
      background: #64766A !important;
      color: #ffffff !Important
    }

      .theme5 .top-menu-section a {
        color: #ffffff !important
      }

        .theme5 .top-menu-section a:hover {
          color: #E6DCE5 !important
        }

        .theme5 .top-menu-section a.selected {
          color: #E6DCE5 !important;
          border-bottom: 3px solid #E6DCE5 !important;
        }

          .theme5 .top-menu-section a.selected i {
            color: #E6DCE5 !important;
          }

        .theme5 .top-menu-section a.router-link-active {
          color: #fff !important
        }

          .theme5 .top-menu-section a.router-link-active i {
            color: #C0A9BD !important;
          }

        .theme5 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #C0A9BD !important;
          padding-bottom: 4px;
        }

    .theme5 .icon-container .c-icon {
      color: #C0A9BD !important
    }

    .theme5 .input-group-addon .fa-search {
      color: #333333 !important
    }

    .theme5 .btn-primary {
      background: #64766A !important;
      border: 1px solid #64766A !important;
      color: #ffffff;
    }

    .theme5 .nav-tabs-custom > .nav-tabs > li a.active, .theme5 .box.box-primary {
      border-top-color: #C0A9BD !important;
    }

      .theme5 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme5 .topic-list-container .box-header {
      background: rgba(192, 169, 189, 1) !important;
    }

    .theme5 .root-topic {
      background: rgba(192, 169, 189, 0.3) !important;
    }

      .theme5 .root-topic a {
        background: none !important;
      }

    .theme5 .box-header .box-title a {
      color: #424D52 !important
    }

    .theme5 .subscriptions .table-row-head, .theme5 .heading-bar {
      background: rgba(192, 169, 189, 0.3) !important;
      color: #64766A !Important;
      border: 1px solid #424D52;
    }

    .theme5 .heading.page-sub-heading.text-left.text-blue {
      color: #64766A !important
    }

    .theme5 .text-blue {
      color: #64766A !Important;
    }



    .theme5 .support-login-box h2 {
      color: #64766A !important;
    }

    .theme5 .category-box .c-heading {
      color: #64766A !important;
    }

    .theme5 .pagination > .active > a, .theme5 .pagination > .active > a:hover {
      background-color: #64766A !important;
      color: #ffffff;
      border: none;
    }

    .theme5 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #64766A;
      border: none;
      color: #C0A9BD;
    }

    .theme5 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme5 .knowledge-search-box .input-group-addon {
      background: #64766A !important;
      color: #fff !important;
    }

    .theme5 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme5 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme5 .ask-question-container {
      background: #F1F1F1;
    }

    .theme5 .topic-btn-container .btn.active {
      background: #64766A;
      color: #fff;
      border: 1px solid #64766A;
    }

    .theme5 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #C0A9BD;
      background: #C0A9BD;
    }

    @media only screen and (max-width: 1080px) {
      .theme5 .top-menu-section {
        background: none !important;
      }

        .theme5 .top-menu-section a {
          background: #64766A;
        }
    }
    /*theme 5*/
    /*theme 6*/
    .theme6 .top-menu-section {
      background: #FFB300 !important;
      color: #ffffff !Important
    }

      .theme6 .top-menu-section a {
        color: #ffffff !important;
        opacity: .7;
      }

        .theme6 .top-menu-section a:hover {
          color: #fff !important;
          opacity: 1 !important;
        }

        .theme6 .top-menu-section a.selected {
          color: #fff !important;
          border-bottom: 3px solid #fff !important;
        }

        .theme6 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #fff;
          padding-bottom: 4px;
          opacity: 1;
        }

          .theme6 .top-menu-section a.router-link-active i {
            color: #fff !important;
          }

        .theme6 .top-menu-section a.selected i {
          color: #fff !important;
        }

    .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme6 .icon-container .c-icon {
      color: #FE6C01 !important
    }

    .theme6 .btn-primary {
      background: #FFB300 !important;
      border: 1px solid #FFB300 !important;
    }

    .theme6 .topic-list-container .box-header {
      background: rgba(255, 108, 3, 1) !important;
    }

    .theme6 .root-topic {
      background: rgba(255, 108, 3, 0.2) !important;
    }

      .theme6 .root-topic a {
        background: none !important;
      }

    .theme6 .box-header .box-title a {
      color: #fff !important
    }

    .theme6 .subscriptions .table-row-head, .theme6 .heading-bar {
      background: rgba(255, 108, 3, 0.2) !important;
      color: #424D52 !Important;
      border: 1px solid #FF6C03 !important;
    }

    .theme6 .heading.page-sub-heading.text-left.text-blue {
      color: #fe6c01 !important
    }

    .theme6 .text-blue {
      color: #64766A !Important;
    }



    .theme6 .support-login-box h2 {
      color: #333333 !important;
    }

    .theme6 .category-box .c-heading {
      color: #333333 !important;
    }

    .theme6 .pagination > .active > a, .theme6 .pagination > .active > a:hover {
      background-color: #FFB300 !important;
      border-color: #FFB300 !important
    }

    .theme6 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #FFB300;
    }

    .theme6 .nav-tabs-custom > .nav-tabs > li a.active, .theme6 .box.box-primary {
      border-top-color: #FF6C03 !important;
    }

      .theme6 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme6 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }


    .theme6 .knowledge-search-box .input-group-addon {
      background: #FFB300 !important;
      color: #fff !important;
    }

    .theme6 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme6 .ask-question-container .help-icon {
      color: #FF6C03;
      border: 3px solid #FFB300;
    }

    .theme6 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme6 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme6 .ask-question-container {
      background: #F1F1F1;
    }

    .theme6 .topic-btn-container .btn.active {
      background: #FFB300;
      color: #fff;
      border: 1px solid #FFB300;
    }

    .theme6 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #FF6C03;
      background: #FF6C03;
    }

    @media only screen and (max-width: 1080px) {
      .theme6 .top-menu-section {
        background: none !important;
      }

        .theme6 .top-menu-section a {
          background: #FFB300;
        }
    }
    /*theme 6*/
    /*theme 7*/
    .theme7 .top-menu-section {
      background: #0962CF !important;
      color: #ffffff !Important
    }

      .theme7 .top-menu-section a {
        color: #fff !important;
      }

        .theme7 .top-menu-section a:hover {
          color: #fff !important;
        }

        .theme7 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #F4D949 !important;
          padding-bottom: 4px;
          opacity: 1;
        }

          .theme7 .top-menu-section a.router-link-active i {
            color: #F4D949 !important;
          }

        .theme7 .top-menu-section a.selected {
          color: #fff !important;
          border-bottom: 3px solid #0962CF !important;
        }

          .theme7 .top-menu-section a.selected i {
            color: #0962CF !important;
          }

    .theme7 .icon-container .c-icon {
      color: #0962CF !important
    }

    .theme7 .btn-primary {
      background: #0962CF !important
    }

    .theme7 .topic-list-container .box-header {
      background: rgba(244, 217, 73, 1) !important;
    }

    .theme7 .root-topic {
      background: rgba(244, 217, 73, 0.3) !important;
    }

      .theme7 .root-topic a {
        background: none !important;
      }

    .theme7 .box-header .box-title a {
      color: #424D52 !important
    }

    .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme7 .subscriptions .table-row-head, .theme7 .heading-bar {
      background: rgba(244, 217, 73, 0.3) !important;
      color: #424D52 !Important;
      border: 1px solid #F4D949 !important;
    }

    .theme7 .heading.page-sub-heading.text-left.text-blue {
      color: #fe6c01 !important
    }

    .theme7 .text-blue {
      color: #64766A !Important;
    }


    .theme7 .support-login-box h2 {
      color: #333333 !important;
    }


    .theme7 .category-box .c-heading {
      color: #333333 !important;
    }

    .theme7 .pagination > .active > a, .theme7 .pagination > .active > a:hover {
      background-color: #0962CF !important;
      border-color: #0962CF !important
    }

    .theme7 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #0962CF;
    }

    .theme7 .nav-tabs-custom > .nav-tabs > li a.active, .theme7 .box.box-primary {
      border-top-color: #F4D949 !important;
    }

      .theme7 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme7 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }


    .theme7 .knowledge-search-box .input-group-addon {
      background: #0962CF !important;
      color: #fff !important;
    }

    .theme7 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme7 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme7 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme7 .ask-question-container {
      background: #F1F1F1;
    }

    .theme7 .topic-btn-container .btn.active {
      background: #0962CF;
      color: #fff;
      border: 1px solid #0962CF;
    }

    .theme7 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #F4D949;
      background: #F4D949;
    }

    @media only screen and (max-width: 1080px) {
      .theme7 .top-menu-section {
        background: none !important;
      }

        .theme7 .top-menu-section a {
          background: #0962CF;
        }
    }
    /*theme 7*/
    /*theme 8*/
    .theme8 .top-menu-section {
      background: #F76566 !important;
      color: #ffffff !Important
    }

      .theme8 .top-menu-section a {
        color: #ffffff !important;
        opacity: .6;
      }

        .theme8 .top-menu-section a:hover {
          color: #fff !important;
          opacity: 1 !important
        }

        .theme8 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #fff;
          padding-bottom: 4px;
          color: #fff !important;
          opacity: 1 !important
        }

          .theme8 .top-menu-section a.router-link-active i {
            color: #fff !important;
            opacity: 1 !important
          }

    .theme8 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme8 .top-menu-section a.selected {
      color: #fff !important;
      border-bottom: 3px solid #ffffff !important;
      opacity: 1 !important;
    }

      .theme8 .top-menu-section a.selected i {
        color: #fff !important;
        opacity: 1 !important;
      }

    .theme8 .icon-container .c-icon {
      color: #F76566 !important
    }

    .theme8 .btn-primary {
      background: #F76566 !important;
      border: 1px solid #F76566 !important
    }

    .theme8 .topic-list-container .box-header {
      background: rgba(24, 172, 186, 1) !important;
    }

    .theme8 .root-topic {
      background: rgba(24, 172, 186, 0.2) !important;
    }

      .theme8 .root-topic a {
        background: none !important;
      }

    .theme8 .box-header .box-title a {
      color: #fff !important
    }

    .theme8 .subscriptions .table-row-head, .theme8 .heading-bar {
      background: rgba(24, 172, 186, 0.1) !important;
      color: #424D52 !Important;
      border: 1px solid #18ACBA !important;
    }

    .theme8 .heading.page-sub-heading.text-left.text-blue {
      color: #18ACBA !important
    }

    .theme8 .text-blue {
      color: #64766A !Important;
    }



    .theme8 .support-login-box h2 {
      color: #333333 !important;
    }

    .theme8 .category-box .c-heading {
      color: #333333 !important;
    }

    .theme8 .pagination > .active > a, .theme8 .pagination > .active > a:hover {
      background-color: #f76566 !important;
      border-color: #f76566 !important;
    }

    .theme8 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #18ACBA;
    }

    .theme8 .nav-tabs-custom > .nav-tabs > li a.active, .theme8 .box.box-primary {
      border-top-color: #18ACBA !important;
    }

      .theme8 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme8 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }


    .theme8 .knowledge-search-box .input-group-addon {
      background: #f76566 !important;
      color: #fff !important;
    }

    .theme8 .search-container-box {
      background-color: #EBF8F9;
    }

    .theme8 .ask-question-container .help-icon {
      color: #18ACBA;
      border: 3px solid #f76566;
    }

    .theme8 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme8 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme8 .ask-question-container {
      background: #F1F1F1;
    }

    .theme8 .topic-btn-container .btn.active {
      background: #F76566;
      color: #fff;
      border: 1px solid #F76566;
    }

    .theme8 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #18ACBA;
      background: #18ACBA;
    }

    @media only screen and (max-width: 1080px) {
      .theme8 .top-menu-section {
        background: none !important;
      }

        .theme8 .top-menu-section a {
          background: #f76566;
        }
    }
    /*theme 8*/
    /*theme 9*/
    .theme9 .top-menu-section {
      background: #709A41 !important;
      color: #ffffff !Important
    }

      .theme9 .top-menu-section a {
        color: #ffffff !important;
        opacity: .7;
      }

        .theme9 .top-menu-section a:hover {
          color: #fff !important;
          opacity: 1;
        }

        .theme9 .top-menu-section a.selected {
          color: #709A41 !important;
          border-bottom: 3px solid #709A41 !important;
        }

          .theme9 .top-menu-section a.selected i {
            color: #f7941d !important;
          }

        .theme9 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #fff;
          padding-bottom: 4px;
          color: #fff !important;
          opacity: 1;
        }

    .theme9 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme9 .top-menu-section a.router-link-active i {
      color: #fff !important;
    }

    .theme9 .icon-container .c-icon {
      color: #709A41 !important;
    }

    .theme9 .btn-primary {
      background: #709A41 !important;
      border: 1px solid #709A41 !important;
    }

    .theme9 .topic-list-container .box-header {
      background: rgba(214, 229, 201, 1) !important;
    }

    .theme9 .root-topic {
      background: rgba(214, 229, 201, 0.6) !important;
    }

      .theme9 .root-topic a {
        background: none !important;
      }

    .theme9 .box-header .box-title a {
      color: #424D52 !important;
    }

    .theme9 .subscriptions .table-row-head, .theme9 .heading-bar {
      background: rgba(113, 155, 66, 0.3) !important;
      color: #424D52 !Important;
      border: 1px solid #709A41 !important;
    }

    .theme9 .heading.page-sub-heading.text-left.text-blue {
      color: #709A41 !important
    }

    .theme9 .text-blue {
      color: #709A41 !Important;
    }

    .theme9 .box_wrap {
      background: rgba(113, 155, 66, 0.3) !important;
      color: #fe6c01 !Important;
      border: 1px solid #709A41;
    }

    .theme9 .support-login-box h2 {
      color: #333 !important;
    }

    .theme9 .category-box .c-heading {
      color: #333 !important;
    }

    .theme9 .pagination > .active > a, .theme9 .pagination > .active > a:hover {
      background-color: #709A41 !important;
      border-color: #709A41 !important;
    }

    .theme9 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #709A41;
    }

    .theme9 .nav-tabs-custom > .nav-tabs > li a.active, .theme9 .box.box-primary {
      border-top-color: #D6E5C9 !important;
    }

      .theme9 .box.box-primary a .fa-times {
        color: #333;
      }


    .theme9 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme9 .knowledge-search-box .input-group-addon {
      background: #709A41 !important;
      color: #fff !important;
    }

    .theme9 .search-container-box {
      background-color: #E6EFDE;
    }

    .theme9 .ask-question-container .help-icon {
      color: #333;
      border: 3px solid #709A41;
    }

    .theme9 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme9 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme9 .ask-question-container {
      background: #F1F1F1;
    }

    .theme9 .topic-btn-container .btn.active {
      background: #709A41;
      color: #fff;
      border: 1px solid #709A41;
    }

    .theme9 .ask-question-container .help-icon {
      color: #709A41;
      border: 3px solid #D6E5C9;
      background: #D6E5C9;
    }

    @media only screen and (max-width: 1080px) {
      .theme9 .top-menu-section {
        background: none !important;
      }

        .theme9 .top-menu-section a {
          background: #709A41;
        }
    }
    /*theme 9*/
    /*theme 10*/
    .theme10 .top-menu-section {
      background: #424D52 !important;
      color: #ffffff !Important
    }

      .theme10 .top-menu-section a {
        color: #fff !important
      }

        .theme10 .top-menu-section a:hover {
          color: #fff !important
        }

        .theme10 .top-menu-section a.selected {
          color: #fff !important;
          border-bottom: 3px solid #fff !important;
        }

          .theme10 .top-menu-section a.selected i {
            color: #fff !important;
          }

    .theme10 .icon-container .c-icon {
      color: #414D51 !important
    }

    .theme10 .btn-primary {
      background: #424D52 !important;
      border: 1px solid #424D52 !important;
    }

    .theme10 .top-menu-section a.router-link-active {
      border-bottom: 3px solid #f7941d;
      padding-bottom: 4px;
      color: #fff !important;
    }

    .theme10 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme10 .top-menu-section a.router-link-active i {
      color: #f7941d !important;
    }

    .theme10 .topic-list-container .box-header {
      background: rgba(60, 141, 188, 1) !important;
    }

    .theme10 .root-topic {
      background: rgba(60, 141, 188, 0.2) !important;
    }

      .theme10 .root-topic a {
        background: none !important;
      }

    .theme10 .box-header .box-title a {
      color: #fff !important
    }

    .theme10 .subscriptions .table-row-head, .theme10 .heading-bar {
      background: rgba(60, 141, 188, 0.2) !important;
      color: #424D52 !Important;
      border: 1px solid #3C8DBC !important;
    }

    .theme10 .heading.page-sub-heading.text-left.text-blue {
      color: #414D51 !important
    }

    .theme10 .text-blue {
      color: #414D51 !important;
    }



    .theme10 .support-login-box h2 {
      color: #414D51 !important;
    }

    .theme10 .category-box .c-heading {
      color: #414D51 !important;
    }

    .theme10 .pagination > .active > a, .theme10 .pagination > .active > a:hover {
      background-color: #424D52 !important;
      border-color: #424D52 !important
    }

    .theme10 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #414D51;
    }

    .theme10 .nav-tabs-custom > .nav-tabs > li a.active, .theme10 .box.box-primary {
      border-top-color: #3C8DBC !important;
    }

      .theme10 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme10 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme10 .knowledge-search-box .input-group-addon {
      background: #424D52 !important;
      color: #fff !important;
    }

    .theme10 .search-container-box {
      background-color: #ECF0F5;
    }

    .theme10 .ask-question-container .help-icon {
      color: #F7941D;
      border: 3px solid #424D52;
    }

    .theme10 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme10 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme10 .ask-question-container {
      background: #F1F1F1;
    }

    .theme10 .topic-btn-container .btn.active {
      background: #424D52;
      color: #fff;
      border: 1px solid #424D52;
    }

    .theme10 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #3C8DBC;
      background: #3C8DBC;
    }

    @media only screen and (max-width: 1080px) {
      .theme9 .top-menu-section {
        background: none !important;
      }

        .theme9 .top-menu-section a {
          background: #424D52;
        }
    }
    /*theme 10*/
    /*theme 11*/
    .theme11 .top-menu-section {
      background: #C0A9BD !important;
      color: #ffffff !Important
    }

      .theme11 .top-menu-section a {
        color: #fff !important
      }

        .theme11 .top-menu-section a:hover {
          color: #fff !important
        }

        .theme11 .top-menu-section a.selected {
          color: #fff !important;
          border-bottom: 3px solid #414D51 !important;
        }

          .theme11 .top-menu-section a.selected i {
            color: #414D51 !important;
          }

        .theme11 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #64766A;
          padding-bottom: 4px;
          color: #fff !important;
        }

          .theme11 .top-menu-section a.router-link-active i {
            color: #64766A !important;
          }

    .theme11 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme11 .icon-container .c-icon {
      color: #414D51 !important
    }

    .theme11 .btn-primary {
      background: #C0A9BD !important;
      border: 1px solid #C0A9BD !important;
    }

    .theme11 .topic-list-container .box-header {
      background: rgba(100,118,106, 1) !important;
    }

    .theme11 .root-topic {
      background: rgba(100,118,106, 0.2) !important;
    }

      .theme11 .root-topic a {
        background: none !important;
      }

    .theme11 .box-header .box-title a {
      color: #fff !important
    }

    .theme11 .subscriptions .table-row-head, .theme11 .heading-bar {
      background: rgba(100,118,106, 0.3) !important;
      color: #424D52 !Important;
      border: 1px solid #64766A !important;
    }

    .theme11 .heading.page-sub-heading.text-left.text-blue {
      color: #64766A !important
    }

    .theme11 .text-blue {
      color: #64766A !Important;
    }


    .theme11 .support-login-box h2 {
      color: #414D51 !important;
    }

    .theme11 .category-box .c-heading {
      color: #414D51 !important;
    }

    .theme11 .pagination > .active > a, .theme11 .pagination > .active > a:hover {
      background-color: #C0A9BD !important;
      border-color: #C0A9BD !important;
      color: #ffffff;
    }

    .theme11 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #414D51;
    }

    .theme11 .nav-tabs-custom > .nav-tabs > li a.active, .theme11 .box.box-primary {
      border-top-color: #64766A !important;
    }

      .theme11 .box.box-primary a .fa-times {
        color: #333;
      }


    .theme11 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme11 .knowledge-search-box .input-group-addon {
      background: #C0A9BD !important;
      color: #fff !important;
    }

    .theme11 .search-container-box {
      background-color: #E0E3E1;
    }

    .theme11 .ask-question-container .help-icon {
      color: #64766A;
      border: 3px solid #C0A9BD;
    }

    .theme11 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme11 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme11 .ask-question-container {
      background: #F1F1F1;
    }

    .theme11 .topic-btn-container .btn.active {
      background: #C0A9BD;
      color: #fff;
      border: 1px solid #C0A9BD;
    }

    .theme11 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #64766A;
      background: #64766A;
    }

    @media only screen and (max-width: 1080px) {
      .theme11 .top-menu-section {
        background: none !important;
      }

        .theme11 .top-menu-section a {
          background: #C0A9BD;
        }
    }
    /*theme 11*/
    /*theme 12*/
    .theme12 .top-menu-section {
      background: #344649 !important;
      color: #ffffff !Important
    }

      .theme12 .top-menu-section a {
        color: #fff !important
      }

        .theme12 .top-menu-section a:hover {
          color: #FFBC99 !important
        }

        .theme12 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #FFBC99;
          padding-bottom: 4px;
          color: #fff !important;
        }

          .theme12 .top-menu-section a.router-link-active i {
            color: #FFBC99 !important;
          }

    .theme12 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme12 .top-menu-section a.selected {
      color: #FFBC99 !important;
      border-bottom: 3px solid #FFBC99 !important;
    }

      .theme12 .top-menu-section a.selected i {
        color: #FFBC99 !important;
      }

    .theme12 .icon-container .c-icon {
      color: #FFBC99 !important
    }

    .theme12 .btn-primary {
      background: #344649 !important;
      border: 1px solid #344649 !important;
      color: #fff !important
    }

    .theme12 .topic-list-container .box-header {
      background: rgba(255,188,153, 1) !important;
    }

    .theme12 .root-topic {
      background: rgba(255,188,153, 0.4) !important;
    }

      .theme12 .root-topic a {
        background: none !important;
      }

    .theme12 .box-header .box-title a {
      color: #344649 !important
    }

    .theme12 .subscriptions .table-row-head, .theme12 .heading-bar {
      background: rgba(255,188,153, 0.3) !important;
      color: #424D52 !Important;
      border: 1px solid #FFBC99 !important;
    }

    .theme12 .heading.page-sub-heading.text-left.text-blue {
      color: #64766A !important
    }

    .theme12 .text-blue {
      color: #64766A !Important;
    }

    .theme12 .support-login-box h2 {
      color: #344649 !important;
    }

    .theme12 .category-box .c-heading {
      color: #344649 !important;
    }

    .theme12 .pagination > .active > a, .theme12 .pagination > .active > a:hover {
      background-color: #344649 !important;
      border-color: #344649 !important;
    }

    .theme12 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #FFBC99;
    }

    .theme12 .nav-tabs-custom > .nav-tabs > li a.active, .theme12 .box.box-primary {
      border-top-color: #FFBC99 !important;
    }

      .theme12 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme12 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme12 .knowledge-search-box .input-group-addon {
      background: #344649 !important;
      color: #fff !important;
    }

    .theme12 .search-container-box {
      background-color: #ECF0F5;
    }

    .theme12 .ask-question-container .help-icon {
      color: #FFBC99;
      border: 3px solid #344649;
    }

    .theme12 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme12 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme12 .ask-question-container {
      background: #F1F1F1;
    }

    .theme12 .topic-btn-container .btn.active {
      background: #344649;
      color: #fff;
      border: 1px solid #344649;
    }

    .theme12 .ask-question-container .help-icon {
      color: #344649;
      border: 3px solid #FFBC99;
      background: #FFBC99;
    }

    @media only screen and (max-width: 1080px) {
      .theme12 .top-menu-section {
        background: none !important;
      }

        .theme12 .top-menu-section a {
          background: #344649;
        }
    }
    /*theme 12*/
    /*theme 13*/
    .theme13 .top-menu-section {
      background: #FFBC99 !important;
      color: #ffffff !Important
    }

      .theme13 .top-menu-section a {
        color: #344648 !important;
        opacity: .7;
      }

        .theme13 .top-menu-section a:hover {
          color: #344648 !important;
          opacity: 1;
        }

        .theme13 .top-menu-section a.selected {
          color: #344648 !important;
          border-bottom: 3px solid #344648 !important;
        }

        .theme13 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #344648;
          padding-bottom: 4px;
          color: #344648 !important;
          opacity: 1;
        }

          .theme13 .top-menu-section a.router-link-active i {
            color: #344648 !important;
          }

    .theme13 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme13 .top-menu-section a.selected i {
      color: #344648 !important;
    }

    .theme13 .icon-container .c-icon {
      color: #344649 !important
    }

    .theme13 .btn-primary {
      background: #FFBC99 !important;
      border: 1px solid #FFBC99 !important;
      color: #344649 !important;
    }

    .theme13 .topic-list-container .box-header {
      background: rgba(52,70,73, 1) !important;
    }

    .theme13 .root-topic {
      background: rgba(52,70,73, 0.2) !important;
    }

      .theme13 .root-topic a {
        background: none !important;
      }

    .theme13 .box-header .box-title a {
      color: #fff !important
    }

    .theme13 .subscriptions .table-row-head, .theme13 .heading-bar {
      background: rgba(52,70,73, 0.2) !important;
      color: #344649 !Important;
      border: 1px solid #344649 !important;
    }

    .theme13 .heading.page-sub-heading.text-left.text-blue {
      color: #344649 !important
    }

    .theme13 .text-blue {
      color: #344649 !Important;
    }

    .theme13 .support-login-box h2 {
      color: #344649 !important;
    }


    .theme13 .category-box .c-heading {
      color: #344649 !important;
    }

    .theme13 .inbox-alert {
      background-color: #f39c12 !important;
    }

    .theme13 .pagination > .active > a, .theme13 .pagination > .active > a:hover {
      background-color: #FFBC99 !important;
      border-color: #FFBC99 !important;
      color: #344648 !important;
    }

    .theme13 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #344649;
    }

    .theme13 .nav-tabs-custom > .nav-tabs > li a.active, .theme13 .box.box-primary {
      border-top-color: #344648 !important;
    }

      .theme13 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme13 .box-login::after, .theme13 .box-signup::after {
      border-bottom-color: #D6DADA !important;
    }

    .theme13 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme13 .knowledge-search-box .input-group-addon {
      background: #FFBC99 !important;
      color: #333 !important;
    }

    .theme13 .search-container-box {
      background-color: #ECF0F5;
    }

    .theme13 .ask-question-container .help-icon {
      color: #344649;
      border: 3px solid #FFBC99;
    }

    .theme13 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme13 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme13 .ask-question-container {
      background: #F1F1F1;
    }

    .theme13 .topic-btn-container .btn.active {
      background: #FFBC99;
      color: #344649;
      border: 1px solid #FFBC99;
    }

    .theme13 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #344649;
      background: #344649;
    }

    @media only screen and (max-width: 1080px) {
      .theme13 .top-menu-section {
        background: none !important;
      }

        .theme13 .top-menu-section a {
          background: #FFBC99;
        }
    }
    /*theme 13*/
    /*theme 14*/
    .theme14 .top-menu-section {
      background: #712E1E !important;
      color: #ffffff !Important
    }

      .theme14 .top-menu-section a {
        color: #ffffff !important;
        opacity: .7;
      }

        .theme14 .top-menu-section a:hover {
          color: #ffffff !important;
          opacity: 1;
        }

        .theme14 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #fff;
          padding-bottom: 4px;
          color: #fff !important;
          opacity: 1;
        }

          .theme14 .top-menu-section a.router-link-active i {
            color: #fff !important;
          }

    .theme14 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme14 .top-menu-section a.selected {
      color: #ffffff !important;
      border-bottom: 3px solid #344648 !important;
    }

      .theme14 .top-menu-section a.selected i {
        color: #ffffff !important;
      }

    .theme14 .icon-container .c-icon {
      color: #87876F !important
    }

    .theme14 .btn-primary {
      background: #712E1E !important;
      border: 1px solid #712E1E !important;
    }

    .theme14 .topic-list-container .box-header {
      background: rgba(136,136, 112, 1) !important;
    }

    .theme14 .root-topic {
      background: rgba(136,136, 112, 0.2) !important;
    }

      .theme14 .root-topic a {
        background: none !important;
      }

    .theme14 .box-header .box-title a {
      color: #fff !important
    }

    .theme14 .subscriptions .table-row-head, .theme14 .heading-bar {
      background: rgba(136,136,111, 0.3) !important;
      color: #64766A !Important;
      border: 1px solid #888870 !important;
    }

    .theme14 .heading.page-sub-heading.text-left.text-blue {
      color: #64766A !important
    }

    .theme14 .text-blue {
      color: #64766A !Important;
    }


    .theme14 .support-login-box h2 {
      color: #712E1E !important;
    }

    .theme14 .category-box .c-heading {
      color: #712E1E !important;
    }

    .theme14 .pagination > .active > a, .theme14 .pagination > .active > a:hover {
      background-color: #712E1E !important;
      border-color: #712E1E !important;
    }

    .theme14 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #87876F;
    }

    .theme14 .nav-tabs-custom > .nav-tabs > li a.active, .theme14 .box.box-primary {
      border-top-color: #888870 !important;
    }

      .theme14 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme14 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme14 .knowledge-search-box .input-group-addon {
      background: #712E1E !important;
      color: #ffffff !important;
    }

    .theme14 .search-container-box {
      background-color: #ECF0F5;
    }

    .theme14 .ask-question-container .help-icon {
      color: #888870;
      border: 3px solid #712E1E;
    }

    .theme14 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme14 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme14 .ask-question-container {
      background: #F1F1F1;
    }

    .theme14 .topic-btn-container .btn.active {
      background: #712E1E;
      color: #fff;
      border: 1px solid #712E1E;
    }

    .theme14 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #888870;
      background: #888870;
    }

    @media only screen and (max-width: 1080px) {
      .theme14 .top-menu-section {
        background: none !important;
      }

        .theme14 .top-menu-section a {
          background: #712E1E;
        }
    }
    /*theme 14*/
    /*theme 15*/
    .theme15 .top-menu-section {
      background: #888870 !important;
      color: #ffffff !Important
    }

      .theme15 .top-menu-section a {
        color: #ffffff !important;
        opacity: .7;
      }

        .theme15 .top-menu-section a:hover {
          color: #ffffff !important;
          opacity: 1;
        }

        .theme15 .top-menu-section a.selected {
          color: #712D1D !important;
          border-bottom: 3px solid #712D1D !important;
        }

        .theme15 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #fff;
          padding-bottom: 4px;
          color: #fff !important;
          opacity: 1;
        }

          .theme15 .top-menu-section a.router-link-active i {
            color: #ffffff !important;
          }

        .theme15 .top-menu-section a.selected i {
          color: #712D1D !important;
        }

    .theme15 .icon-container .c-icon {
      color: #712D1D !important
    }

    .theme15 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme15 .btn-primary {
      background: #888870 !important;
      border: 1px solid #888870 !important;
    }

    .theme15 .topic-list-container .box-header {
      background: rgba(113, 46, 30, 1) !important;
    }

    .theme15 .root-topic {
      background: rgba(136, 136, 112, 0.2) !important;
    }

      .theme15 .root-topic a {
        background: none !important;
      }

    .theme15 .box-header .box-title a {
      color: #fff !important
    }

    .theme15 .subscriptions .table-row-head, .theme15 .heading-bar {
      background: rgba(136, 136, 112, 0.2) !important;
      color: #424D52 !Important;
      border: 1px solid #712E1E !important;
    }

    .theme15 .heading.page-sub-heading.text-left.text-blue {
      color: #424D52 !important
    }

    .theme15 .text-blue {
      color: #64766A !Important;
    }

    .theme15 .support-login-box h2 {
      color: #712D1D !important;
    }

    .theme15 .category-box .c-heading {
      color: #333 !important;
    }

    .theme15 .pagination > .active > a, .theme15 .pagination > .active > a:hover {
      background-color: #888870 !important;
      border-color: #888870 !important;
    }

    .theme15 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #712D1D;
    }

    .theme15 .nav-tabs-custom > .nav-tabs > li a.active, .theme15 .box.box-primary {
      border-top-color: #712E1E !important;
    }

      .theme15 .box.box-primary a .fa-times {
        color: #333;
      }


    .theme15 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme15 .knowledge-search-box .input-group-addon {
      background: #888870 !important;
      color: #ffffff !important;
    }

    .theme15 .search-container-box {
      background-color: #ECF0F5;
    }

    .theme15 .ask-question-container .help-icon {
      color: #712E1E;
      border: 3px solid #888870;
    }

    .theme15 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme15 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme15 .ask-question-container {
      background: #F1F1F1;
    }

    .theme15 .topic-btn-container .btn.active {
      background: #888870;
      color: #fff;
      border: 1px solid #888870;
    }

    .theme15 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #712E1E;
      background: #712E1E;
    }

    @media only screen and (max-width: 1080px) {
      .theme15 .top-menu-section {
        background: none !important;
      }

        .theme15 .top-menu-section a {
          background: #888870;
        }
    }
    /*theme 15*/
    /*theme 16*/
    .theme16 .top-menu-section {
      background: #DFD36A !important;
      color: #ffffff !Important
    }

      .theme16 .top-menu-section a {
        color: #424D52 !important
      }

        .theme16 .top-menu-section a:hover {
          color: #182D01 !important
        }

        .theme16 .top-menu-section a.selected {
          color: #182D01 !important;
          border-bottom: 3px solid #344648 !important;
        }

        .theme16 .top-menu-section a.router-link-active {
          border-bottom: 3px solid #192D01;
          padding-bottom: 4px;
          color: #192D01 !important;
        }

          .theme16 .top-menu-section a.router-link-active i {
            color: #192D01 !important;
          }

        .theme16 .top-menu-section a.selected i {
          color: #182D01 !important;
        }

    .theme16 .icon-container .c-icon {
      color: #DFD36A !important
    }

    .theme16 .input-group-addon .fa-search {
      color: #333333 !important;
    }

    .theme16 .btn-primary {
      background: #DFD36A !important;
      border: 1px solid #DFD36A !important;
      color: #192D01 !important;
    }

    .theme16 .topic-list-container .box-header {
      background: rgba(25,45,1, 1) !important;
    }

    .theme16 .root-topic {
      background: rgba(25,45,1, 0.2) !important;
    }

      .theme16 .root-topic a {
        background: none !important;
      }

    .theme16 .box-header .box-title a {
      color: #fff !important
    }

    .theme16 .subscriptions .table-row-head, .theme16 .heading-bar {
      background: rgba(25,45,1, 0.2) !important;
      color: #192D01 !Important;
      border: 1px solid #192D01 !important;
    }

    .theme16 .heading.page-sub-heading.text-left.text-blue {
      color: #192D01 !important
    }

    .theme16 .text-blue {
      color: #192D01 !important;
    }

    .theme16 .support-login-box h2 {
      color: #192D01 !important;
    }

    .theme16 .category-box .c-heading {
      color: #192D01 !important;
    }

    .theme16 .pagination > .active > a, .theme16 .pagination > .active > a:hover {
      background-color: #DFD36A !important;
      border-color: #DFD36A !important;
      color: #192D01 !important;
    }

    .theme16 .nav-tabs-custom > .nav-tabs > li.active {
      border-top-color: #182D01;
    }

    .theme16 .nav-tabs-custom > .nav-tabs > li a.active, .theme16 .box.box-primary {
      border-top-color: #192D01 !important;
    }

      .theme16 .box.box-primary a .fa-times {
        color: #333;
      }

    .theme16 .search-mail .input-group-text {
      padding-top: 5px;
      padding-bottom: 8px;
    }

    .theme16 .knowledge-search-box .input-group-addon {
      background: #DFD36A !important;
      color: #192D01 !important;
    }

    .theme16 .search-container-box {
      background-color: #ECF0F5;
    }

    .theme16 .ask-question-container .help-icon {
      color: #192D01;
      border: 3px solid #DFD36A;
    }

    .theme16 .search-container-box {
      background-color: #f1f1f1;
    }

    .theme16 .topic_blocks_card-wrapper .topic_blocks_card {
      background: #F1F1F1;
    }

    .theme16 .ask-question-container {
      background: #F1F1F1;
    }

    .theme16 .topic-btn-container .btn.active {
      background: #DFD36A;
      color: #192D01;
      border: 1px solid #DFD36A;
    }

    .theme16 .ask-question-container .help-icon {
      color: #fff;
      border: 3px solid #192D01;
      background: #192D01;
    }

    @media only screen and (max-width: 1080px) {
      .theme16 .top-menu-section {
        background: none !important;
      }

        .theme16 .top-menu-section a {
          background: #DFD36A;
        }
    }
    /*theme 16*/

  </style>
  $include -blob'portal-tabs-css'$
</head>
$include -blob'portal-tabs-component-templates'$
<body class="skin-blue sidebar-mini message-portal">
  <div id="customerPortalTabs">
    <div class="clearfix"></div>
    <div class="row-container-full-width" v-bind:class="configuration.themeClass">
      $include -blob'portal-tabs-header'$
      <login-component v-bind:config="configuration.config" v-if="configuration.config.pageComponents && configuration.config.pageComponents.enableLoginRegister"></login-component>
      <div class="clearfix"></div>
      <tabs v-bind:config="configuration.config"></tabs>
      <div class="clearfix"></div>
      <router-view v-bind:config="configuration.config"></router-view>
      $include -blob'portal-tabs-footer'$
      <div class="mtop30 mbottom40">&nbsp;</div>
      <footer class="footer">
        <b>Powered by iService - </b>Version  $value -version$
      </footer>
    </div>
  </div>
  <script type="text/x-template" id="login-component">
    <div class="row-container-full-width" v-if="!loggedIn.isLoggedIn">
      <div class="row">
        <div class="col-md-12">
          <div class="container">
            <!--login section-->
            <div class="login_container">
              <a href="javascript:void(0)" id="show_login" @click="loginOpen()">Login</a>
              <a href="javascript:void(0)" id="show_register" @click="registerOpen();">Sign Up</a>
            </div>
            <div class="box_wrap box-login" v-show="feature.showlogin">
              <div class="support-login-box" v-show="feature.login">

                <div class="form-container">
                  <div class="form-horizontal">
                    <form name="login" @submit.prevent="featureLogin.Click" id="loginForm">
                      <div class="row">
                        <div class="col-12 col-md-5">
                          <h2>Login</h2>
                          <div class="form-group" v-bind:class="{ 'has-error': !loginName }">
                            <div class="col-12 col-md-12">
                              <i class="fa fa-user icon"></i>
                              <input type="text" class="form-control username" name="username" placeholder="Username" v-model="loginName">
                            </div>
                          </div>
                        </div>
                        <div class="col-12 col-md-5">
                          <h2>Password</h2>
                          <div class="form-group" v-bind:class="{ 'has-error': !password }">
                            <div class="col-12 col-md-12">
                              <i class="fa fa-lock icon"></i>
                              <input type="password" class="form-control" name="password" placeholder="Password" v-model="password">
                            </div>
                          </div>
                        </div>
                        <div class="col-md-2 mt-4">
                          <button type="submit" class="btn btn-primary">Login</button>
                          <button type="button" class="btn btn-link" @click="cancelall()">Cancel</button>
                        </div>
                        <div class="col-md-12">
                          <iservice-message-notification v-bind:feature="featureLogin"></iservice-message-notification>
                        </div>
                        <div class="col-md-12 login-link">
                          <a href @click.prevent="registerOpen()">Register New Account</a> |
                          <a href @click.prevent="showForget()">Forgot Password</a>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="support-login-box" v-show="feature.forgetpassword">
                <h2>Forgot Password</h2>
                <p>Please enter the email address associated with your iService account. We will send you a link so you can change your password.</p>
                <div class="form-container">
                  <div class="form-horizontal">
                    <form name="forgetPassword" @submit.prevent="featureForget.Submit()">
                      <div class="row">
                        <div class="col-12 col-md-5">
                          <div class="form-group" v-bind:class="{'has-error': !featureForget.email}">
                            <div class="col-md-12">
                              <i class="fa fa-user icon"></i>
                              <input type="email" class="form-control" v-model="featureForget.email">
                              <span v-if="featureForget.error.email && !featureForget.email" class="text-red"><span class="fa fa-warning"></span> Email address is required field.</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-2">
                          <button type="submit" class="btn btn-primary">Submit</button>
                          <button type="button" class="btn btn-link" @click="cancelall()">Cancel</button>
                        </div>
                      </div>
                      <iservice-message-notification v-bind:feature="featureForget"></iservice-message-notification>

                      <div class="form-alert-message" v-show="featureForget.forgotSuccess">
                        <div class="alert alert-success alert-dismissible">
                          <button type="button" class="close" @click="closeForgotSuccess()">×</button>
                          <div class="message-container">
                            <div class="icon"><i class="icon fa fa-check-circle"></i></div>
                            <div class="message">
                              <div>
                                <p>We've sent an email with instructions for resetting your password.</p>
                                <a href class="btn-link" @click.prevent="loginOpen(true)">Return to Login page.</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

            </div>
            <div class="box_wrap" v-if="featurePasswordReset.passwordreset">
              <div class="support-login-box">
                <h2>Reset Password</h2>
                <p>Please enter the email address associated with your iService account. We will send you a link so you can change your password.</p>
                <div class="form-container">
                  <div class="form-horizontal">
                    <form name="passwordreset" @submit.prevent="featurePasswordReset.Submit()">
                      <div class="row">
                        <div class="col-12 col-md-5">
                          <div class="form-group" v-bind:class="{'has-error': !featurePasswordReset.newPasswprd}">
                            <div class="col-md-12">
                              <i class="fa fa-lock icon"></i>
                              <input type="password" class="form-control" v-model="featurePasswordReset.newPasswprd">
                              <span v-if="featurePasswordReset.error.newPasswprd && !featurePasswordReset.newPasswprd" class="text-red"><span class="fa fa-warning"></span> New Password is required field.</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-12 col-md-5">
                          <div class="form-group" v-bind:class="{'has-error': !featurePasswordReset.confirmPassword}">
                            <div class="col-md-12">
                              <i class="fa fa-lock icon"></i>
                              <input type="password" class="form-control" v-model="featurePasswordReset.confirmPassword">
                              <span v-if="featurePasswordReset.error.confirmPassword && !featurePasswordReset.confirmPassword" class="text-red"><span class="fa fa-warning"></span> Confirm Password is required field.</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-2">
                          <button type="submit" class="btn btn-primary">Submit</button>
                          <button type="button" class="btn btn-link" @click="cancelall()">Cancel</button>
                        </div>
                      </div>
                      <iservice-message-notification v-bind:feature="featurePasswordReset"></iservice-message-notification>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div class="box_wrap box-signup" v-show="feature.register">
              <div class="support-login-box">
                <h2>Create an account</h2>
                <div class="form-container">
                  <div class="form-horizontal">
                    <form name="registration" @submit.prevent="featureRegister.Submit()" id="registerForm">
                      <div class="row register-account-user-form">
                        <div class="col-md-4">
                          <div class="form-group" v-bind:class="{'has-error': ! featureRegister.inputrequiredcontactproperty1firstname}">
                            <div class="col-12 col-md-12">
                              <label>First Name</label>
                              <div class="form-input">
                                <i class="fa fa-user icon"></i>
                                <input type="text" class="form-control username" placeholder="First Name" v-model="featureRegister.inputrequiredcontactproperty1firstname">
                                <span v-if="featureRegister.error.firstname && !featureRegister.inputrequiredcontactproperty1firstname" class="text-red"><i class="fa fa-warning"></i> First name is required field.</span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group" v-bind:class="{'has-error': ! featureRegister.inputrequiredcontactproperty3lastname}">
                            <div class="col-12 col-md-12">
                              <label>Last Name</label>
                              <div class="form-input">
                                <i class="fa fa-user icon"></i>
                                <input type="text" class="form-control" placeholder="Last Name" v-model="featureRegister.inputrequiredcontactproperty3lastname">
                                <span v-if="featureRegister.error.lastname && !featureRegister.inputrequiredcontactproperty3lastname" class="text-red"><i class="fa fa-warning"></i> Last name is required field.</span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group" v-bind:class="{'has-error': ! featureRegister.inputemailrequired}">
                            <div class="col-12 col-md-12">
                              <label>Email</label>
                              <div class="form-input">
                                <i class="fa fa-envelope icon"></i>
                                <input type="text" class="form-control" placeholder="Email" v-model="featureRegister.inputemailrequired">
                                <span v-if="featureRegister.error.email && !featureRegister.inputemailrequired" class="text-red"><i class="fa fa-warning"></i> Email is required field.</span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group" v-bind:class="{'has-error': ! featureRegister.inputpasswordrequired}">
                            <div class="col-12 col-md-12">
                              <label>Password</label>
                              <div class="form-input">
                                <i class="fa fa-lock icon"></i>
                                <input type="password" class="form-control" placeholder="Password" v-model="featureRegister.inputpasswordrequired">
                                <span v-if="featureRegister.error.password && !featureRegister.inputpasswordrequired" class="text-red"><i class="fa fa-warning"></i> Password is required field.</span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group" v-bind:class="{'has-error': !featureRegister.confirmpassword}">
                            <div class="col-12 col-md-12">
                              <label>Confirm Password</label>
                              <div class="form-input">
                                <i class="fa fa-lock icon"></i>
                                <input type="password" class="form-control" placeholder="Confirm Password" v-model="featureRegister.confirmpassword" required>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <label style="display:block;">&nbsp;</label>
                          <button type="submit" class="btn btn-primary">Register Now</button>
                          <button type="button" class="btn btn-link" v-on:click="cancelall()">Cancel</button>
                        </div>
                      </div>
                      <iservice-message-notification v-bind:feature="featureRegister"></iservice-message-notification>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="row-container-full-width" v-else>
      <div class="row">
        <div class="col-md-12">
          <div class="container">
            <div class="login_container">
              <div class="small user-initials round no-select" iservice-name-initials="iservice.loggedIn.contactName"></div>
              <span class="hidden-xs">{{ loggedIn.contactName }}</span>
              <a href="javascript:void(0)" class="logout" @click="logoutapp()">Logout</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>

  <script type="text/x-template" id="tabs">
    <div class="row-container-full-width">
      <div class="row">
        <div class="col-md-12">
          <!--top menu section-->
          <a class="mobile-menu pull-left" @click="ShowMenu()"><i class="fa fa-bars"></i></a>
          <div class="top-menu-section" v-bind:class="{'showmenu': feature.showmenu}">
            <div class="container">
              <router-link v-bind:to="formPath" v-if="config.pageComponents && config.pageComponents.enableHome"><i class="fa fa-home"></i> Support Home</router-link>
              <router-link v-bind:to="formPath+'/knowledge-base'" v-bind:class="{'router-link-active': activeKnowledge()}" v-if="config.pageComponents && config.pageComponents.enableKB"><i class="fa fa-book"></i> Knowledge Base</router-link>
              <router-link v-bind:to="formPath+'/subscriptions'" v-if="config.pageComponents && config.pageComponents.enableLoginRegister && config.pageComponents.enableSubscription"><i class="fa fa-bell-o"></i>My Subscriptions</router-link>
              <router-link v-bind:to="formPath+'/ask-question'" v-if="config.pageComponents && config.pageComponents.enableAAQ"><i class="fa  fa-question-circle-o"></i>Ask A Question</router-link>
              <router-link v-bind:to="formPath+'/my-history'" v-if="config.pageComponents && config.pageComponents.enableLoginRegister && config.pageComponents.enableInbox"><i class="fa fa-inbox"></i>My Inbox</router-link>
              <router-link v-bind:to="formPath+'/my-profile'" v-if="config.pageComponents && config.pageComponents.enableLoginRegister && config.pageComponents.enableProfile"><i class="fa fa-user-o"></i>Update Profile</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>

  <script type="text/x-template" id="support-home">
    <div class="container min-vh-100">
      $include -blob'portal-tabs-homepage'$
    </div>
  </script>

  <script type="text/x-template" id="knowledge-base">
    <div class="row" v-if="config.pageComponents && config.pageComponents.enableKB">
      <div class="col-md-12" v-if="!feature.loaddetails">
        <div class="search-container-box">
          <h1>Search The Knowledge Base</h1>
          <div class="search-container">
            <form @submit.prevent="feature.getSearched(feature.keyword)">
              <div class="input-group knowledge-search-box">
                <input class="form-control" v-model="feature.keyword" placeholder="Search the support knowledge base">
                <span class="input-group-addon" @click="feature.getSearched(feature.keyword)">Search</span>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="row-container-full-width mtop30" v-if="feature.type != 'searchresults' && !feature.loaddetails">
      <div class="row">
        <div class="col-md-12">
          <div class="container">
            <div class="segment-topic-container">
              <div class="row">
                <div class="col-md-12">
                  <div class="pull-left all-topic-link mbottom15">
                    Click on a topic to browse its articles. Or <a href="/f/vueapp-customerportal-tabs/knowledge-base/articles">view all the articles</a> in the knowledge base.
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="topic-btn-container mbottom30">
                    <loading-placeholder v-if="!feature.rootTopics.length"></loading-placeholder>
                    <div v-for="topic in feature.rootTopics" v-else>
                      <button class="btn btn-default topictabs" v-bind:class="feature.activeTab == 'topic'+ children.id ? 'active': ''" v-for="(children, i) in topic.children" v-bind:data-id="children.id" @click="feature.getTopicTabArticles(children, false)" v-show="children.countRecurse > 0">{{children.name}} ({{children.countRecurse}})</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-12">
                  <topic-articles v-bind:topic="feature.selectedTopic" v-bind:all-topics="feature.rootTopics" v-if="feature.selectedTopic"></topic-articles>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row-container-full-width mtop30" v-if="feature.type == 'searchresults' && !feature.loaddetails">
      <div class="row">
        <div class="col-md-12">
          <div class="container">
            <div class="segment-topic-container">
              <div class="row">
                <div class="col-md-12">
                  <div class="box-body table-responsive with-border">
                    <iservice-table v-bind:config="tableConfig" v-bind:IDs="feature.IDs"></iservice-table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <article-details v-bind:article-details="feature.articleDetails" v-bind:loading="feature.loadingArticleDetails" v-if="feature.loaddetails"></article-details>
    <div class="row" v-if="!feature.loaddetails">
      <div class="col-md-12">
        <div class="container text-center ask-question-container">
          <span class="help-icon"><i class="fa fa-question"></i></span>
          <h1 class="heading page-sub-heading">Not Finding What You Need ?</h1>
          <a class="btn btn-primary btn-custom-lg mtop30" href="/f/vueapp-customerportal-tabs/ask-question">Ask A Question ?</a>
        </div>
      </div>
    </div>
  </script>

  <script type="text/x-template" id="topic-articles">
    <loading-placeholder v-if="feature.searching"></loading-placeholder>
    <div class="panel topics topic_blocks__layout active" style="min-height:190px;">
      <div class="topic_blocks_card-wrapper visible" v-for="topic in feature.topicsData">
        <div class="topic_blocks_card">
          <div class="topic_blocks_card-content">
            <h2 class="topic">
              <a v-bind:href="'/f/vueapp-customerportal-tabs/knowledge-base/articles/' + topic.id">{{ topic.name }}</a>
            </h2>
            <ul>
              <li class="kb-list-item" v-for="article in topic.articles">
                <a v-bind:href="'/f/vueapp-customerportal-tabs/knowledge-base/articles/' + article.topicID+'/' + article.id">{{article.subject}}</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </script>
  <script type="text/x-template" id="article-details">
    <div class="row-container-full-width mtop30">
      <div class="row">
        <div class="col-md-12">
          <div class="container">
            <loading-placeholder v-if="loading"></loading-placeholder>
            <div class="row" v-if="!loading && articleDetails.id">
              <iservice-message-notification v-bind:feature="feature"></iservice-message-notification>
              <div class="col-md-8">
                <div class="question-container">
                  <div class="qa-title main-title">
                    <i class="question-title-icon fa  fa-file-text-o "></i> {{ articleDetails.subject }}
                    <div class="clearfix"></div>
                    <div class="article-other-detail">
                      <span class="article-date"><span class="text-blue">Modified on - </span> {{ articleDetails.date }} <span class="mleft15 text-blue">Views - </span>{{ articleDetails.viewCount }}</span>

                      <span class="article-share">
                        <span class="mleft15 text-blue">Share on </span>
                        <div class="fb share-button" data-href="{{feature.socialLink}}" data-layout="button" data-size="small"><a target="_blank" v-bind:href="'https://www.facebook.com/sharer/sharer.php?u='+feature.socialLink+'&amp;src=sdkpreparse'" class="fb-xfbml-parse-ignore"><i class="fa fa-facebook text-blue"></i></a></div>
                        <a target="_blank" class="twitter share-button" v-bind:href="'https://twitter.com/intent/tweet?url='+feature.socialTwitterLink+'&text='+articleDetails.subject"><i class="fa fa-twitter text-blue"></i></a>
                        <a target="_blank" class="linkedin share-button" v-bind:href="'https://www.linkedin.com/sharing/share-offsite/?url='+feature.socialLink"><i class="fa fa-linkedin text-blue"></i></a>
                        <a href="javascript:void(0);" class="copy share-button" v-tooltip="{text: 'Copy to clipboard',theme: {placement: 'bottom' }}"><i class="fa fa-copy text-blue"></i></a>
                        <span v-show="feature.copylink" class="success-copied">Copied!</span>

                      </span>
                    </div>
                    <div class="sharelinkcontainer" v-show="feature.copylink">
                      <input type="text" class="form-control" v-bind:value="feature.articleLink" id="sharedLink" />
                    </div>
                  </div>
                  <div class="qa-title">Question:</div>
                  <div class="answer" v-html="articleDetails.questionHtml"></div><br />

                  <div class="qa-title">Answer:</div>
                  <div class="answer" v-html="articleDetails.answerHtml"></div>
                </div>
              </div>
              <div class="col-md-4">
                <div v-if="articleDetails.attachments.length">
                  <h2 class="heading page-heading-related text-left">Article Documents</h2>
                  <a class="attachments" v-bind:href="rootPath+'File.aspx?interactionID='+articleDetails.id+'&fileID='+file.attachmentID"
                     v-for="file in articleDetails.attachments">
                    <i class="fa" v-bind:class="file.iconClass"></i>
                    <span class="filename">{{ file.name }}</span>
                  </a>
                </div>
                <h2 class="heading page-heading-related text-left">Rate this article</h2>
                <div class="rate-this-article">
                  <star-rating v-model:rating="articleDetails.rating" :round-start-rating="false" :show-rating="false" :star-size="30" @update:rating="feature.getSelectedRating(articleDetails.rating)"></star-rating>
                  <div class="clearfix"></div>
                  <div class="clearfix"></div>
                  <span class="mtop-15">Average rating - {{averageRating}}</span>
                </div>

                <div class="rate-this-article mbottom40">
                  <h2 class="heading page-heading-related text-left">Subscribe to this article</h2>
                  <!--<button class="btn btn-primary">Subscribe</button>-->
                  <div class="clearfix"></div>
                  <a href="" @click.prevent="feature.loginToSubscribe()" v-if="!loggedIn.isLoggedIn">Login to subscribe to this article</a>
                  <button class="btn btn-primary btn-custom-lg" @click="feature.SubscribeArticle(articleDetails, 'subscribe')" v-if="loggedIn.isLoggedIn && !articleDetails.isSubscribed">Subscribe</button>
                  <button class="btn btn-primary btn-custom-lg" @click="feature.SubscribeArticle(articleDetails, 'unsubscribe')" v-if="loggedIn.isLoggedIn && articleDetails.isSubscribed">Unsubscribe</button>
                </div>
                <h2 class="heading page-heading-related text-left">Related Articles</h2>
              </div>
            </div>
            <div class="row" v-if="!loading && !articleDetails.id">
              <div class="col-md-4 text-right">
                <img v-bind:src="rootPath+'images/no-article.jpg'" style="width: 70%; margin-top: -18px;" />
              </div>
              <div class="col-md-8">
                <h2 style="margin-top: 30px; font-size: 26px;">That's not a valid article</h2>
                <p style="font-size:16px;">It looks like you tried to load an article that either doesn't exist or requires special access privileges. You can use the back button in your browser to start over, or <a v-bind:href="formPath+'/knowledge-base'">load the knowledge base home page.</a> If you have a Login, you can try to load the article again after you login to the support portal.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>
  <script type="text/x-template" id="subscriptions">
    <div class="container" v-if="config.pageComponents && config.pageComponents.enableLoginRegister && config.pageComponents.enableSubscription">
      <p v-if="!loggedIn.isLoggedIn">
        Please login to view your subscriptions.
      </p>
      <div v-else>
        <loading-placeholder v-if="subscriptionList.loading"></loading-placeholder>
        <div v-else>
          <h2 class="heading page-sub-heading text-left text-blue">Mailing List</h2>
          <div class="subscriptions">
            <div class="table-row table-row-head">
              <div class="list-name text-blue">List Name</div>
              <div class="list-desc text-blue">Description</div>
              <div class="member-of text-blue">Member Of</div>
            </div>
            <div class="table-row table-data" v-for="list in subscriptionList.lists">
              <div class="list-name">{{ list.name }}</div>
              <div class="list-desc">{{ list.description }}</div>
              <div class="member-of">
                <input type="checkbox" v-model="list.isOnList" class="form-check-input">
              </div>
            </div>
            <div v-show="!subscriptionList.lists.length" class="table-row">
              <div>No Mailing Lists</div>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="s-container subscriptions">
            <h2 class="heading page-sub-heading text-left text-blue">Campaigns</h2>
            <div class="table-row">
              <div class="table-row table-row-head">
                <div class="list-name text-blue">Name</div>
                <div class="list-desc text-blue">Description</div>
                <div class="member-of text-blue">Member Of</div>
              </div>
              <div class="table-row table-data" v-for="campaign in subscriptionList.campaigns">
                <div class="list-name">{{ campaign.name }}</div>
                <div class="list-desc">{{ campaign.description }}</div>
                <div class="member-of"><input type="checkbox" v-model="campaign.isOnList" class="form-check-input"></div>
              </div>
              <div v-show="!subscriptionList.campaigns.length" class="table-row">
                <div>No Campaigns Lists</div>
              </div>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="s-container subscriptions">
            <h2 class="heading page-sub-heading text-left text-blue">Subscribed Articles</h2>
            <div class="table-row">
              <div class="table-row table-row-head">
                <div class="list-name text-blue">Topic</div>
                <div class="list-desc text-blue">Subject</div>
                <div class="member-of text-blue">Stay Subscribed</div>
              </div>
              <!-- ngRepeat: article in articles -->
              <div class="table-row table-data" v-for="article in subscriptionList.articles">
                <div class="list-name">{{ article.topic }}</div>
                <div class="list-desc"><a v-bind:href="'/f/vueapp-customerportal-tabs/knowledge-base/articles/'+article.topicID+'/'+article.id">{{ article.subject }}</a></div>
                <div class="member-of"><input type="checkbox" v-model="article.isOnList" class="form-check-input"></div>
              </div>
              <div v-show="!subscriptionList.articles.length" class="table-row">
                <div>No Subscribed Articles</div>
              </div>
            </div>
          </div>
          <button class="btn btn-primary btn-custom-lg mtop30" v-bind:disabled="saveSubscription.loading" @click="SaveClick()">Save Subscriptions <i class="fa fa-spinner fa-spin" v-if="saveSubscription.loading"></i></button>
          <iservice-message-notification v-bind:feature="saveSubscription"></iservice-message-notification>
        </div>
      </div>
    </div>
  </script>

  <script type="text/x-template" id="ask-question">
    <div class="message-panel" v-if="config.pageComponents && config.pageComponents.enableAAQ">
      <div class="row overlay-wrapper">
        <div class="col-12 support-form">
          <form @submit.prevent="featureAAQ.Submit()">
            <!--<div class="overlay" ng-if="submitProcessing">
              <i class="fa fa-refresh fa-spin" style="z-index: 1;"></i>
            </div>-->
            <div class="box-body container min-vh-100">
              <div class="message-body-container mb-15">
                <div class="row">
                  <iservice-message-notification v-bind:feature="featureAAQ" v-if="featureAAQ.success"></iservice-message-notification>
                  <div class="col-12 col-md-6">
                    <div class="form-group" v-bind:class="{'has-error': !featureAAQ.details.topicID}">
                      <label for="inputPassword3" class="col-12 control-label text-left">Please pick the topic of your question</label>
                      <div class="col-12">
                        <Multiselect v-model="featureAAQ.details.topicID" v-bind:caret="true" placeholder="Select or search for a topic" valueProp="id" label="name" trackBy="name" v-bind:groups="true" v-bind:searchable="true" v-bind:options="topicGroups" v-bind:can-clear="false" @select="featureAAQ.getArticlesByTopic(featureAAQ.details.topicID)" noOptionsText="Gathering topics...">
                          <template v-slot:option="{ option }">
                            <span> {{ option.name }} </span>
                          </template>
                        </Multiselect>
                        <span v-if="featureAAQ.error.topic && !featureAAQ.details.topicID" class="text-red"><i class="fa fa-warning"></i> Topic is required field.</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-md-6 mtop30" v-if="featureAAQ.submitticket">
                    <div class="message-attachments">
                      <div class="row">
                        <div class="col-md-12">
                          <label class="drop-box" @drop="featureUploads.Drop">
                            Drop files here or click to upload
                            <input type="file" style="display:none;" multiple @change="featureUploads.Choose">
                          </label>
                          <div>(Maximum 10 MB upload at one time.)</div>
                          <div class="imageuploadify">
                            <div class="imageuploadify-details" v-for="file in featureUploads.files">
                              <button class="icon-button button-delete" type="button" @click="featureUploads.Remove(file)">
                                <i class="fa fa-times-circle"></i>
                              </button>
                              <i class="fa" v-bind:class="file.iconClass"></i> {{ file.name }}
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="row" v-if="featureAAQ.details.topicID">
                  <div class="col-12">
                    <h3 class="submit-ticket-heading f18 mtop30" v-if="featureAAQ.totalResults" v-show="!featureAAQ.submitticket">Here are some articles that might answer your question. If you don't see your answer, you can <a href @click.prevent="featureAAQ.openSubmitticket()">Create a Ticket</a>.</h3>
                    <div class="clearfix" v-if="featureAAQ.IDs.length > 0"></div>
                    <div class="box-body table-responsive with-border row-bggray" v-if="featureAAQ.totalResults" v-show="!featureAAQ.submitticket">
                      <iservice-table v-bind:config="tableConfig" v-bind:IDs="featureAAQ.IDs"></iservice-table>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row" v-if="featureAAQ.submitticket">
                      <div class="col-12">
                        <div class="col-md-6" v-if="featureAAQ.details.topicID">
                          <div class="form-group" v-bind:class="{'has-error': !featureAAQ.details.subject}">
                            <label for="inputPassword3" class="control-label text-left">Subject</label>
                            <input type="text" id="subjectInput" class="form-control" v-model="featureAAQ.details.subject" />
                            <span v-if="featureAAQ.error.subject && !featureAAQ.details.subject" class="text-red"><i class="fa fa-warning"></i> Subject is required field.</span>
                          </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6" v-if="!loggedIn.isLoggedIn">
                          <div class="form-group" v-bind:class="{'has-error': !featureAAQ.details.destEmail}">
                            <label for="inputPassword3" class="control-label text-left">Your Email Address</label>
                            <input type="text" class="form-control" v-model="featureAAQ.details.destEmail" />
                            <span v-if="featureAAQ.error.email && !featureAAQ.details.destEmail" class="text-red"><i class="fa fa-warning"></i> Email is required field.</span>
                          </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6" v-if="featureAAQ.caseproperties.props.length || featureAAQ.properties.props.length">
                          <div class="propertiesrow property-group rowbg-gray p8 radius8">
                            <div class="f18 text-blue mbottom30"> Additional information for your selected topic</div>
                            <div class="col-12" v-if="featureAAQ.caseproperties.props.length">
                              <property-edit v-for="prop in featureAAQ.caseproperties.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop"></property-edit>
                            </div>
                            <div class="col-12" v-if="featureAAQ.properties.props.length">
                              <property-edit v-for="prop in featureAAQ.properties.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop"></property-edit>
                            </div>
                          </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group" v-bind:class="{'has-error': !featureAAQ.details.bodyHtml}">
                          <label for="inputPassword3" class="col-12 control-label text-left">Body</label>
                          <div class="col-12">
                            <tinymce-editor v-model="featureAAQ.details.bodyHtml" v-bind:customer-tools="featureAAQ.customerTools"></tinymce-editor>
                            <span v-if="featureAAQ.error.body && !featureAAQ.details.bodyHtml" class="text-red"><i class="fa fa-warning"></i> Body is required field.</span>
                          </div>
                        </div>
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary btn-custom-lg mtop15" v-bind:disabled="featureAAQ.loading"><i class="fa fa-send"></i> Submit Ticket <i class="fa fa-spinner fa-spin" v-if="featureAAQ.loading"></i></button>
                        </div>
                        <div class="col-12">
                          <iservice-message-notification v-bind:feature="featureAAQ"></iservice-message-notification>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </script>
  <script type="text/x-template" id="article-view-loader">
    <loading-placeholder v-if="featureArtcleDetail.loading"></loading-placeholder>
    <div class="overlay-wrapper question-container" v-else>
      <div class="qa-title">Question:</div>
      <div class="question-details" v-html="featureArtcleDetail.details.questionHtml"></div>

      <div class="qa-title">Answer:</div>
      <div class="question-details" v-html="featureArtcleDetail.details.answerHtml"></div>
    </div>
  </script>
  <script type="text/x-template" id="my-history">
    <div class="container" v-if="config.pageComponents && config.pageComponents.enableInbox">

      <p v-if="!loggedIn.isLoggedIn">
        Please login to view your message history.
      </p>
      <div class="nav-tabs-custom mtop-15" v-else>
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a href @click.prevent="featureHistory.TabClick('inbox')" class="nav-link" v-bind:class="featureHistory.TabClass('inbox')">
              <div>
                <i class="fa fa-inbox"></i>
                Inbox  <small class="label pull-right bg-yellow inbox-alert">{{UnreadMessages(featureHistory.inboxItems)}}</small>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a href @click.prevent="featureHistory.TabClick('sent')" class="nav-link" v-bind:class="featureHistory.TabClass('sent')">
              <div>
                <i class="fa fa-send"></i>
                Sent
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a href @click.prevent="featureHistory.TabClick('trash')" class="nav-link" v-bind:class="featureHistory.TabClass('trash')">
              <div>
                <i class="fa fa-trash"></i>
                Trash
              </div>
            </a>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane" v-bind:class="featureHistory.TabClass('inbox')">
            <div class="row">
              <loading-placeholder v-if="featureHistory.dataloading"></loading-placeholder>
              <div class="table-responsive inbox" v-if="!featureHistory.dataloading && featureHistory.type=='inbox'">
                <iservice-table v-bind:config="tableConfig" v-bind:IDs="featureHistory.inboxIDs"></iservice-table>
              </div>
              <div v-if="featureHistory.type == 'readmessage'">
                <read-message v-bind:selected-row="featureHistory.selectedRow" v-bind:click-method="featureHistory.showOption" v-bind:delete-method="featureHistory.MakeDelete"></read-message>
              </div>
              <div v-if="featureHistory.type == 'replymessage'">
                <reply-message v-bind:selected-row="featureHistory.selectedRow" v-bind:click-method="featureHistory.showOption" v-bind:interaction-props="featureHistory.interactionProperties" v-bind:case-props="featureHistory.caseProperties" v-bind:sentids="featureHistory.sentIDs"></reply-message>
              </div>
            </div>
          </div>
          <div class="tab-pane" v-bind:class="featureHistory.TabClass('sent')">
            <div class="row">
              <loading-placeholder v-if="featureHistory.dataloading"></loading-placeholder>
              <div class="table-responsive inbox" v-if="!featureHistory.dataloading && featureHistory.type=='inbox'">
                <iservice-table v-bind:config="tableConfigSent" v-bind:IDs="featureHistory.sentIDs"></iservice-table>
              </div>
              <div v-if="featureHistory.type == 'readmessage'">
                <read-message v-bind:selected-row="featureHistory.selectedRow" v-bind:click-method="featureHistory.showOption" v-bind:delete-method="featureHistory.MakeDelete"></read-message>
              </div>
              <div v-if="featureHistory.type == 'replymessage'">
                <reply-message v-bind:selected-row="featureHistory.selectedRow" v-bind:click-method="featureHistory.showOption" v-bind:interaction-props="featureHistory.interactionProperties" v-bind:case-props="featureHistory.caseProperties"></reply-message>
              </div>
            </div>
          </div>
          <div class="tab-pane" v-bind:class="featureHistory.TabClass('trash')">
            <div class="row">
              <loading-placeholder v-if="featureHistory.dataloading"></loading-placeholder>
              <div class="table-responsive inbox" v-if="!featureHistory.dataloading && featureHistory.type=='inbox'">
                <iservice-table v-bind:config="tableConfigTrash" v-bind:IDs="featureHistory.trashIDs" v-model:checkedids="selectedIDs"></iservice-table>
              </div>
              <div v-if="featureHistory.type == 'readmessage'">
                <read-message v-bind:selected-row="featureHistory.selectedRow" v-bind:click-method="featureHistory.showOption" v-bind:delete-method="featureHistory.MakeDelete"></read-message>
              </div>
              <div v-if="featureHistory.type == 'replymessage'">
                <reply-message v-bind:selected-row="featureHistory.selectedRow" v-bind:click-method="featureHistory.showOption" v-bind:interaction-props="featureHistory.interactionProperties" v-bind:case-props="featureHistory.caseProperties"></reply-message>
              </div>
            </div>
          </div>
        </div>

        <iservice-message-notification v-bind:feature="featureHistory"></iservice-message-notification>
      </div>
      <p v-if="!featureHistory.isCheck" v-bind:class="{'trans':!featureHistory.isCheck}" class="toast-message"><span class="toast-text">Moved to the Trash folder</span><span class="toast-action"><i class="fa fa-close" @click="featureHistory.hideToast()"></i></span></p>
    </div>
  </script>
  <script type="text/x-template" id="my-profile">
    <div class="container" v-if="config.pageComponents && config.pageComponents.enableProfile">
      <p v-if="!loggedIn.isLoggedIn">
        Please login to view your profile.
      </p>
      <loading-placeholder v-if="featureProfile.loading"></loading-placeholder>
      <div v-if="!featureProfile.loading && loggedIn.isLoggedIn">
        <iservice-message-notification v-bind:feature="featureProfile"></iservice-message-notification>
        <div class="col-md-12 mbottom40 support-form">
          <div class="form-horizontal">
            <div class="pd-user-name" v-if="featureProfile.personalInfo && featureProfile.personalInfo.props.length">
              <span v-for="property in featureProfile.personalInfo.props">
                <span v-if="property && property.def.values[0]">&nbsp;{{ property.def.values[0].value }}</span>
              </span> <span class="edit-details-btn" @click="featureProfile.openPersonalInfoModal()"><i class="fa fa-pencil"></i></span>
            </div>
            <div class="pd-details">
              <span>{{featureProfile.customerType}}</span>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <iservice-message-notification v-bind:feature="featureProfile"></iservice-message-notification>
        </div>
        <div class="row">
          <div class="col-md-4 mbottom40 support-form">
            <div class="heading-bar">
              Company  <span class="edit-details-btn" @click="featureProfile.openCompanyModal()"><i class="fa fa-pencil"></i></span>
            </div>
            <div class="form-horizontal">
              <div class="pd-details" v-if="featureProfile.companyInfo && featureProfile.companyInfo.props.length">
                <span v-for="property in featureProfile.companyInfo.props" class="address-label">
                  <span v-if="property && property.def.values[0]">
                    <strong>{{ property.def.name }} - </strong> {{ property.def.values[0].value }}
                  </span>
                </span>
              </div>
            </div>
          </div>
          <div class="col-md-4 mbottom40 support-form">
            <div class="heading-bar">
              Contact Information  <span class="edit-details-btn" @click="featureProfile.openContactInfoModal()"><i class="fa fa-pencil"></i></span>
            </div>
            <div class="pd-details" v-if="featureProfile.contactInfo && featureProfile.contactInfo.props.length">
              <span v-for="property in featureProfile.contactInfo.props">
                <span v-if="property && property.def.values[0] && property.def.name == 'Phone'">
                  <strong>{{ property.def.name }} - </strong> {{ property.def.values[0].value }}
                </span>
              </span>
              <span v-if="featureProfile.contactInfo.props.length" class="address-label"><strong>Address - </strong></span>
              <span class="address" v-for="property in featureProfile.contactInfo.props">
                <span v-if="property && property.def.values[0] && property.def.name == 'Address1'">
                  {{ property.def.values[0].value }} <br />
                </span>
              </span>

              <span class="address" v-for="property in featureProfile.contactInfo.props">
                <span v-if="property && property.def.values[0] && property.def.name == 'Address2'">{{ property.def.values[0].value }} <br /></span>
              </span>
              <span class="address" v-for="property in featureProfile.contactInfo.props">
                <span v-if="property && property.def.values[0] && property.def.name == 'City'">{{ property.def.values[0].value }}, </span>
              </span>
              <span class="address" v-for="property in featureProfile.contactInfo.props">
                <span v-if="property && property.def.values[0] && property.def.name == 'State'"> {{ property.def.values[0].value }}</span>
              </span>
              <span class="address" v-for="property in featureProfile.contactInfo.props">
                <span v-if="property && property.def.values[0] && property.def.name == 'Postal Code'">{{ property.def.values[0].value }}</span>
              </span>
              <span v-for="property in featureProfile.contactInfo.props" class="address-label"> <span v-if="property && property.def.values[0] && property.def.name == 'Country'">{{ property.def.values[0].value }}</span></span>
            </div>
          </div>
          <div class="col-md-4 mbottom40 support-form">
            <div class="heading-bar">
              Logins  <span class="edit-details-btn" @click="featureProfile.openLoginsModal()"><i class="fa fa-pencil"></i></span>
            </div>
            <div class="pd-details">
              <div class="segment" v-for="segment in featureProfile.segments">
                <div v-for="logins in [segment.logins]">
                  <span v-for="login in logins" class="address-label"><strong v-if="login.type && login.name">{{login.type}} -</strong>  <strong v-if="!login.type">Username - </strong> {{ login.name}}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row" v-if="featureProfile.segmentsData && featureProfile.segmentsData.length">
          <div class="col-md-4 mbottom40 support-form" v-for="segment in featureProfile.segmentsData">
            <div class="heading-bar">
              Segment Info - {{ segment.name }} <span class="edit-details-btn" @click="featureProfile.openSegmentsModal(segment.properties)"><i class="fa fa-pencil"></i></span>
            </div>
            <div class="pd-details">
              <span v-for="property in segment.properties">
                <span class="address-label" v-if="property && property.values[0]">
                  <strong>{{ property.name }} - </strong>
                  <span class="address" v-if="!property.isDate">{{ property.values[0].value }}</span>
                  <span class="address" v-if="property.isDate">{{ returnDateFormat(property.values[0].valueDate) }}</span>
                </span>
              </span>
            </div>
          </div>
        </div>
      </div>

    </div>
    <div class="modal hide userEdit" style="z-index: 10500; display: block;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body logout-notice" id="modal-body">
            <div class="modal-header">
              <h3>Edit Personal Info</h3>
            </div>
            <div class="modal-body logout-notice" id="modal-body">
              <div class="row mtop15">
                <property-edit v-for="prop in featureProfile.personalInfo.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop"></property-edit>
                <div class="col-md-12">
                  <button class="btn btn-primary btn-custom-lg" @click="featureProfile.SaveClick('.userEdit')">Save</button>
                  <button class="btn btn-link btn-custom-lg" @click="featureProfile.closeModal('.userEdit')">Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal hide contactInfoEdit" style="z-index: 10500; display: block;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body logout-notice" id="modal-body">
            <div class="modal-header">
              <h3>Edit Contact Info</h3>
            </div>
            <div class="modal-body logout-notice" id="modal-body">
              <div class="row mtop15">
                <property-edit v-for="prop in featureProfile.contactInfo.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop" v-bind:classname="prop.def.name == 'Phone' ? 'col-md-12': 'col-md-6'"></property-edit>
                <div class="col-md-12">
                  <button class="btn btn-primary btn-custom-lg" @click="featureProfile.SaveClick('.contactInfoEdit')">Save</button>
                  <button class="btn btn-link btn-custom-lg" @click="featureProfile.closeModal('.contactInfoEdit')">Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal hide segmentPropEdit" style="z-index: 10500; display: block;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body logout-notice" id="modal-body">
            <div class="modal-header">
              <h3>Edit Segment Info</h3>
            </div>
            <div class="modal-body logout-notice" id="modal-body">
              <div class="row mtop15">
                <property-edit v-for="prop in featureProfile.segmentProperties.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop" v-bind:classname="'col-md-6'"></property-edit>

                <div class="col-md-12">
                  <button class="btn btn-primary btn-custom-lg" @click="featureProfile.SaveClick('.segmentPropEdit')">Save</button>
                  <button class="btn btn-link btn-custom-lg" @click="featureProfile.closeModal('.segmentPropEdit')">Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal hide loginInfoEdit" style="z-index: 10500; display: block;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body logout-notice" id="modal-body">
            <div class="modal-header">
              <h3>Edit Personal Info</h3>
            </div>
            <div class="modal-body logout-notice" id="modal-body">
              <div class="row mtop15">
                <div class="form-group">
                  <div class="segment" v-for="segment in featureProfile.segments">
                    <div v-for="(logins,index) in segment.logins">
                      <div class="col-md-12">
                        <div class="form-horizontal">
                          <div class="row multiple-input groupinput">
                            <button class="col-2 margin-5 icon-button button-delete" @click="featureProfile.removeLogins(segment,index)" type="button" v-bind:disabled="segment.logins && !segment.canModifyLogins">
                              <i class="fa fa-times-circle"></i>
                            </button>
                            <div class="col-5">
                              <select v-model="logins.type" class="form-control" v-bind:disabled="segment.logins && !segment.canModifyLogins">
                                <option value="Email">Email</option>
                                <option value="Bounced">Bounced</option>
                                <option value=""></option>
                              </select>
                            </div>
                            <div class="col-5">
                              <input type="text" v-model="logins.name" class="form-control" v-bind:disabled="segment.logins && !segment.canModifyLogins">
                            </div>
                            <div class="clearfix"></div>
                            <button class="margin-5 icon-button button-add-row" @click="featureProfile.addLogins(segment)" type="button" v-bind:disabled="segment.logins && !segment.canModifyLogins">
                              <i class="fa fa-plus-circle"></i>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-12">
                  <button class="btn btn-primary btn-custom-lg" @click="featureProfile.SaveClick('.loginInfoEdit')">Save</button>
                  <button class="btn btn-link btn-custom-lg" @click="featureProfile.closeModal('.loginInfoEdit')">Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal hide companyInfoEdit" style="z-index: 10500; display: block;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body logout-notice" id="modal-body">
            <div class="modal-header">
              <h3>Edit Company Info</h3>
            </div>
            <div class="modal-body logout-notice" id="modal-body">
              <div class="row mtop15">
                <property-edit v-for="prop in featureProfile.companyInfo.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop"></property-edit>
                <div class="col-md-12">
                  <button class="btn btn-primary btn-custom-lg" @click="featureProfile.SaveClick('.companyInfoEdit')">Save</button>
                  <button class="btn btn-link btn-custom-lg" @click="featureProfile.closeModal('.companyInfoEdit')">Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>
  <script type="text/x-template" id="read-message">

    <div class="message-panel">
      <loading-placeholder v-if="!selectedRow"></loading-placeholder>
      <div class="row" v-else>
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-envelope-open"></i> {{ selectedRow.subject }}</h3>
              <a href class="pull-right" @click.prevent="showOption('inbox', null)" v-tooltip="{text: 'Close',theme: {placement: 'bottom' }}"><i class="fa fa-times"></i></a>
            </div>
            <div class="box-body">
              <div class="from-container mb-15 row">
                <div class="message-info col-md-6">
                  <span v-if="selectedRow.type == 'Ask A Question' || selectedRow.type == 'Customer Ticket' || selectedRow.type == 'Ticket' || selectedRow.type == 'Agent Ticket' || selectedRow.type == 'Customer Email' || selectedRow.type == 'Chat'"><b>To : </b> {{ selectedRow.segmentName }} / {{ selectedRow.topicName }}<br /></span>
                  <span v-if="selectedRow.type != 'Ask A Question' && selectedRow.type != 'Customer Ticket' && selectedRow.type != 'Ticket' && selectedRow.type != 'Agent Ticket' && selectedRow.type != 'Customer Email' && selectedRow.type != 'Chat'"><b>From : </b> {{ selectedRow.segmentName }} / {{ selectedRow.topicName }}<br /></span>
                  <b>Date : </b> {{ selectedRow.date }}<br />
                  <span class="message-id-mobile"><b>Message ID : </b> {{ selectedRow.id }}</span>
                </div>
                <div class="message-info col-md-6" style="text-align:right;">
                  <span class="message-id-desktop"><b>Message ID : </b> {{ selectedRow.id }}</span>
                </div>
              </div>
              <div class="message-body-container mb-15">
                <div class="message-box">
                  <div class="message-box-body">
                    <div class="clear"></div>
                    <div v-html="selectedRow.bodyHtml" style="word-break: break-word; overflow-wrap: anywhere;"></div>
                  </div>
                </div>
              </div>
              <div class="message-attachments">
                <div class="row">
                  <div class="col-md-12 mtop-15" v-if="selectedRow.attachments.length">
                    <b>
                      <i class="fa fa-paperclip attachment-icon mr-15"></i>
                    </b>
                    <a class="attachments" v-bind:href="rootPath+'/File.aspx?interactionID='+selectedRow.id+'&fileID='+file.attachmentID"
                       v-for="file in selectedRow.attachments">
                      <i class="fa" v-bind:class="file.iconClass"></i>
                      <span class="filename">{{ file.name }}</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="box-footer">
              <button type="button" class="btn btn-primary mr-15 buttons-custom-color" @click="showOption('replymessage', selectedRow, false, true);"><i class="fa fa-reply"></i> Reply</button>
              <button type="button" class="btn mr-15" @click="deleteMethod(selectedRow)"><i class="fa fa-trash"></i> Delete</button>
              <button type="button" class="btn btn-link" @click="showOption('inbox', null)">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>
  <script type="text/x-template" id="reply-message">
    <div class="message-panel">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-reply"></i> Compose A Reply</h3>
              <a href="#" class="pull-right" @click="showOption('inbox', null)" uib-tooltip="Close" tooltip-placement="top"><i class="fa fa-times"></i></a>
            </div>
            <div class="box-body">
              <div class="message-body-container mb-15">
                <div class="row">
                  <div class="col-6 col-md-6">
                    <div class="form-group">
                      <label for="inputPassword3" class="col-12 control-label text-left">Subject</label>
                      <div class="col-12">
                        <input type="text" class="form-control" v-model="selectedRow.subject" />
                      </div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="col-md-6" v-if="caseProps.props || interactionProps.props">
                    <div class="propertiesrow">
                      <div class="col-12" v-if="caseProps.props.length">
                        <property-edit v-for="prop in caseProps.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop"></property-edit>
                      </div>
                      <div class="col-12" v-if="interactionProps.props.length">
                        <property-edit v-for="prop in interactionProps.props" v-id="'Prop' + prop.def.propertyID" v-bind:property="prop"></property-edit>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-group">
                      <label for="inputPassword3" class="col-12 control-label text-left">Body</label>
                      <div class="col-12">
                        <tinymce-editor v-model="selectedRow.bodyHtml"></tinymce-editor>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="message-attachments">
                <div class="row">
                  <div class="col-12 col-md-6 col-lg-6 mb-15">
                    <label class="drop-box" @drop="featureUploads.Drop">
                      Drop files here or click to upload
                      <input type="file" style="display:none;" multiple @change="featureUploads.Choose">
                    </label>
                    <div>(Maximum 10 MB upload at one time.)</div>
                    <div class="imageuploadify">
                      <div class="imageuploadify-details" v-for="file in featureUploads.files">
                        <button class="icon-button button-delete" type="button" @click="featureUploads.Remove(file)">
                          <i class="fa fa-times-circle"></i>
                        </button>
                        <i class="fa" v-bind:class="file.iconClass"></i> {{ file.name }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="box-footer">
              <button type="button" class="btn btn-primary mr-15 buttons-custom-color" @click="featureReply.SendReply(selectedRow)"><i class="fa fa-send"></i> Send</button>
              <button type="button" class="btn btn-link" @click="showOption('inbox', null)">Close</button>
            </div>
            <iservice-message-notification v-bind:feature="featureReply"></iservice-message-notification>

          </div>
        </div>
      </div>
    </div>
  </script>
  <script type="text/x-template" id="iservice-table-cell-history-simple">
    <a href @click.prevent="clickMethod('readmessage', thread, true)">{{ segmentName }} / {{ topicName }}</a>
  </script>


  $include -placeholder'vueapp-templates-common' -indent'  '$
  $include -placeholder'vueapp-templates-tables' -indent'  '$
  $include -placeholder'vueapp-interaction'$

  <script>
                                                                                                                                                                                                                             //$include -placeholder'vueapp-customerportal-tabs-static-js' -indent'    '$
  </script>
  <script src="$value -rootpath$js/fm.min.js"></script>
  <script src="$value -rootpath$js/fm.websync.min.js"></script>
  <script src="$value -rootpath$js/jquery.min.js"></script>
  <script src="$value -rootpath$js/jquery.cookie.js"></script>
  <script src="$value -rootpath$js/moment.min.js"></script>
  <script src="$value -rootpath$jsv/rangyinputs-jquery.js"></script>
  <script src="$value -rootpath$jsv/Sortable.js"></script>
  <script src="$value -rootpath$jsv/zipcelx.js"></script>
  <script src="$value -rootpath$jsv/vue.3.2.22.global.js"></script>
  <script src="$value -rootpath$jsv/vue-router.4.0.11.global.js"></script>
  <script src="$value -rootpath$jsv/vue3-date-time-picker.2.3.5.min.js"></script>
  <script src="$value -rootpath$jsv/multiselect.2.2.1.global.js"></script>
  <script src="$value -rootpath$jsv/vue3-star-ratings.min.js"></script>
  <script src="$value -rootpath$jsv/axios.min.js"></script>
  <script src="$value -rootpath$tinymce/tinymce.5.10.2.min.js"></script>
  <script src="$value -rootpath$jsv/clipboard.min.js"></script> <!--Used to copy text to clipboard-->
  <script src="$value -rootpath$jsv/iService.util.js"></script>
  <script src="$value -rootpath$jsv/iService.data.js"></script>
  <script src="$value -rootpath$jsv/iService.tables.js"></script>
  <script src="$value -rootpath$jsv/iService.common.js"></script>
  $include -blob'portal-tabs-component-js'$
  <script src="$value -rootpath$f/$value -formid$?part=js"></script>
</body>
</html>

$endif$$if -fieldregex'part'='^js$'$$header -filetype(js)$
  var iservice = window.iservice || {};
  (function (iservice) {
    iservice.components = iservice.components || {};
    iservice.directives = iservice.directives || {};
    function SetID(el, suffix) {
        var id = suffix;
        if (!el) return;
        var parent = el.parentElement;
        while (parent) {
          var prefix = GetSuffix(parent);
          if (prefix) id = prefix + '_' + id;
          parent = parent.parentElement;
        }
        el.id = id;
      }
      function GetSuffix(el) {
          var node = el.__vnode;
          if (!node) {
            return null;
          }
          if (!node.dirs || !node.dirs.length) return null;
          for (var dir of node.dirs) {
            if (dir.dir.name != 'id') continue;
            return dir.value;
          }
          return null;
        }
      iservice.directives.iserviceIdPrefix = {
        name: 'id',
        mounted(el, binding, vnode) {
          SetID(el, binding.value);
        },
        updated(el, binding, vnode) {
          SetID(el, binding.value);
        }
      };
    //create vue app.
      var vueRoot = {
        setup() {
          var configuration = Vue.reactive({ themeClass: 'theme1',  config: { styleSelection: {} , pageComponents: {}} });

          configuration.config = iservice.config;
          if(configuration.config.styleSelection && configuration.config.styleSelection.theme) configuration.themeClass = configuration.config.styleSelection.theme;
          if(configuration.config.pageComponents){
            if(!configuration.config.pageComponents.hasOwnProperty('enableLoginRegister')) configuration.config.pageComponents.enableLoginRegister = true;
            if(!configuration.config.pageComponents.hasOwnProperty('enableInbox')) configuration.config.pageComponents.enableInbox = true;
            if(!configuration.config.pageComponents.hasOwnProperty('enableProfile')) configuration.config.pageComponents.enableProfile = true;
            if(!configuration.config.pageComponents.hasOwnProperty('enableHome')) configuration.config.pageComponents.enableHome = true;
            if(!configuration.config.pageComponents.hasOwnProperty('enableKB')) configuration.config.pageComponents.enableKB = true;
            if(!configuration.config.pageComponents.hasOwnProperty('enableAAQ')) configuration.config.pageComponents.enableAAQ = true;

             if(!configuration.config.pageComponents.enableHome && configuration.config.pageComponents.enableKB){
              if(router.options.history.state.current == iservice.formPath)
                router.push({path: iservice.formPath + '/knowledge-base'});
            }else if(!configuration.config.pageComponents.enableKB && !configuration.config.pageComponents.enableHome && configuration.config.pageComponents.enableSubscription){
              if(router.options.history.state.current == iservice.formPath)
                router.push({path: iservice.formPath + '/subscriptions'});
            }else if(!configuration.config.pageComponents.enableKB && !configuration.config.pageComponents.enableHome && !configuration.config.pageComponents.enableSubscription &&  configuration.config.pageComponents.enableAAQ){
              if(router.options.history.state.current == iservice.formPath)
                router.push({path: iservice.formPath + '/ask-question'});
            }
          }else{
            configuration.config.pageComponents = {
              enableLoginRegister: true,
              enableInbox: true,
              enableProfile: true,
              enableHome: true,
              enableKB: true,
              enableAAQ: true
            }

          }


          return { configuration };
        }
      };
      var app = Vue.createApp(vueRoot);
      iservice.components.supportHome = {
        name: 'support-home',
        template: '#support-home',
	      route() { return { path: iservice.formPath, priority: 100 } },
        props: ['config'],
	      setup(props) {
          var config = Vue.computed(function(){
            return props.config;
          })
          return { config }
        }
      }
      iservice.components.loginComponent = {
          name: 'login-component',
          template: '#login-component',
	        props: ['config'],
          data() {
            return { showDropDown: false }
          },
          methods: {
            logoutapp() {
              var featureLogin = Vue.reactive({ working: false });
              loggedIn.Logout(featureLogin);
            }
          },
          setup(props) {
            var path = window.location.search;
            var loggedIn = iservice.LoggedInData();
            var config = Vue.computed(function(){
              return props.config;
            });
            var loginName = Vue.ref('');
            var password = Vue.ref('');
            var working = Vue.ref(false);
            var featureLogin = Vue.reactive({ working: false});
            featureLogin.Click = function (e) {
              loggedIn.Login(featureLogin, e, loginName.value, password.value);
            }
            var featureRegister = Vue.reactive({ errors: [] })
            featureRegister.error = {};
            featureRegister.Submit = function(){
              featureRegister.errors = [];
              if(!featureRegister.inputrequiredcontactproperty1firstname){
                featureRegister.errors.push({ msg: 'Please enter first name.', details: { description: '' } });
                featureRegister.error.firstname = true;
              }
              if(!featureRegister.inputrequiredcontactproperty3lastname){
                featureRegister.errors.push({ msg: 'Please enter last name.', details: { description: '' } });
                featureRegister.error.lastname = true;
              }
              if(!featureRegister.inputemailrequired){
                featureRegister.errors.push({ msg: 'Please enter email address.', details: { description: '' } });
                featureRegister.error.email = true;
              }
              if(!featureRegister.inputpasswordrequired){
                featureRegister.errors.push({ msg: 'Please enter password.', details: { description: '' } });
                featureRegister.error.password = true;
              }
              if(featureRegister.inputpasswordrequired !== featureRegister.confirmpassword){
                featureRegister.errors.push({ msg: 'Confirm Password does not match.', details: { description: '' } });
                featureRegister.error.confirmpasswordmatch = true;
              }

              if(featureRegister.errors.length) return;
              var inputs = {
                inputrequiredcontactproperty1firstname : featureRegister.inputrequiredcontactproperty1firstname,
                inputrequiredcontactproperty3lastname : featureRegister.inputrequiredcontactproperty3lastname,
                inputemailrequired : featureRegister.inputemailrequired,
                inputpasswordrequired : featureRegister.inputpasswordrequired,
                inputpasswordrequired1 : featureRegister.confirmpassword
              }
              featureRegister.loading = true;
              iservice.API('webapp-api-login?api=register', null, inputs).then(function(response){
                featureRegister.success = 'Your account has been created.';
                featureRegister.loading = false;
                if(response.loggedIn.isLoggedIn) {
                  loggedIn.Login(featureLogin,null,featureRegister.inputemailrequired,featureRegister.inputpasswordrequired);
                  featureRegister.inputrequiredcontactproperty1firstname = null;
                  featureRegister.inputrequiredcontactproperty3lastname = null;
                  featureRegister.inputemailrequired = null;
                  featureRegister.inputpasswordrequired = null;
                  featureRegister.confirmpassword = null;
                }
              }).catch(function(errors){
                featureRegister.errors = errors;
              }).finally(function(){

              });
            }

            var featurePasswordReset = Vue.reactive({})
            featurePasswordReset.error = {};
            featurePasswordReset.Submit = function(){
              featurePasswordReset.errors = [];
              if(!featurePasswordReset.newPasswprd){
                featurePasswordReset.errors.push({ msg: 'Please enter new password.', details: { description: '' } });
                featurePasswordReset.error.newPasswprd = true;
              }
              if(!featurePasswordReset.confirmPassword){
                featurePasswordReset.errors.push({ msg: 'Please enter confirm password.', details: { description: '' } });
                featurePasswordReset.error.confirmPassword = true;
              }
              if(featurePasswordReset.newPasswprd && featurePasswordReset.confirmPassword && featurePasswordReset.newPasswprd !== featurePasswordReset.confirmPassword){
                featurePasswordReset.errors.push({ msg: 'Confirm Password does not match.', details: { description: '' } });
                featurePasswordReset.error.confirmPassword = true;
              }

              if(featurePasswordReset.errors.length) return;

              featurePasswordReset.loading = true;
              var confirmGuid = router.currentRoute.value.query.resetPassword;
              iservice.API('webapp-api-login?api=resetconfirm', null, { confirmGuid: confirmGuid, newPassword: featurePasswordReset.newPasswprd }).then(function(response){
                featurePasswordReset.success = 'Your password has been changed';
                featurePasswordReset.loading = false;
                featurePasswordReset.newPasswprd = "";
                featurePasswordReset.confirmPassword = "";
              }).catch(function(errors){
                featurePasswordReset.errors = errors;
              }).finally(function(){

              });
            }

            if(path.includes("?resetPassword")) {
              featurePasswordReset.passwordreset = true;
            }

            var featureForget = Vue.reactive({})
            featureForget.error = {};
            featureForget.Submit = function(){
              featureForget.errors = [];
              if(!featureForget.email){
                featureForget.errors.push({ msg: 'Please enter email address.', details: { description: '' } });
                featureForget.error.email = true;
              }

              if(featureForget.errors.length) return;

              featureForget.loading = true;
              var protocol = document.location.protocol,
              host = document.location.host,
              guid = '$value - passwordreset(guid)$',
              guid = guid.replace('- passwordreset', '-passwordreset'),
              resetUrl = protocol + '//' + host + '/f/vueapp-customerportal-tabs' + '?resetPassword=' + guid;
              iservice.API('webapp-api-login?api=resetSend', null, { emailAddress: featureForget.email, resetUrl: resetUrl }).then(function(response){
                featureForget.forgotSuccess = true;
                featureForget.loading = false;
              }).catch(function(errors){
                featureForget.errors = errors;
              }).finally(function(){

              });
            }
            function closeForgotSuccess(){
              featureForget.forgotSuccess = false;
            }
            var feature = Vue.reactive({ login:false, register:false, forgetpassword:false, showlogin:false });
           function clearInputs(){
              featureRegister.inputrequiredcontactproperty1firstname = '';
              featureRegister.inputrequiredcontactproperty3lastname = '';
              featureRegister.inputemailrequired = '';
              featureRegister.inputpasswordrequired = '';
              featureRegister.confirmPassword = '';
              loginName.value = '';
              password.value = '';
            }
            function loginOpen() {
              feature.showlogin = !feature.showlogin;
              feature.login = true;
              feature.register = false;
              feature.forgetpassword = false;
              featureForget.forgotSuccess = false;
              featurePasswordReset.passwordreset = false;
            }
            function registerOpen() {
              feature.showlogin = false;
              feature.register = !feature.register;
              featurePasswordReset.passwordreset = false;
            }
            function showForget() {
              feature.showlogin = true;
              feature.login = false;
              feature.register = false;
              feature.forgetpassword = true;
              featurePasswordReset.passwordreset = false;
            }
            function cancelall() {
              feature.showlogin = false;
              feature.register = false;
              featurePasswordReset.passwordreset = false;
              clearInputs();
            }
            return { loggedIn, config, featureLogin, loginName, password, featureRegister, featureForget, featurePasswordReset, closeForgotSuccess, cancelall, showForget, registerOpen, loginOpen, feature };
          }
        }
        iservice.components.tabs = {
          name: 'tabs',
          template: '#tabs',
          props: ['config'],
          setup(props) {
            var router = VueRouter.useRouter();
            var feature = Vue.reactive({ showmenu: false })
            var config = Vue.computed(function(){
              return props.config;
            })
            function activeKnowledge(){
              if(router.currentRoute.value.params.all || router.currentRoute.value.params.topicID) return true;
              return false;
            }
            function ShowMenu(){
              feature.showmenu = !feature.showmenu
            }
            return { config, feature, activeKnowledge,ShowMenu };
          }
        };
        iservice.components.tabsKnowledgeBase = {
          name: 'knowledge-base',
          template: '#knowledge-base',
          route() { return { path: iservice.formPath+'/knowledge-base/:all?/:topicID?/:articleID?', priority: 100 } },
          props: ['config'],
          setup(props) {
            var router = VueRouter.useRouter();
            var feature = Vue.reactive({ type: '', keyword:'', selectedTopic:'' })
            var config = Vue.computed(function(){
              return props.config;
            });
            var articles = iservice.ArticleData();
           //table columns declaration
            var tableColumns = Vue.computed(() => {
              var columns = [
                Vue.reactive({
                  name: 'Subject', label: 'Subject',
                  filterText: iservice.tables.SimpleFilterTextFunc(articles, 'subject'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-portal-article-simple', shown: true
                }),
                Vue.reactive({
                  name: 'Topic', label: 'Topic',
                  filterText: iservice.tables.SimpleFilterTextFunc(articles, 'topicName'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-portal-article-simple', shown: true
                }),
                Vue.reactive({
                  name: 'Views', label: 'Views',
                  filterText: iservice.tables.SimpleFilterTextFunc(articles, 'viewCount'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-portal-article-simple', shown: true
                })];

              return columns;
            });

            //table configuration
            var tableConfig = Vue.reactive({
              componentControls: 'iservice-table-controls-customerportal-aaq',
              componentBody: 'iservice-table-body',
              componentStatus: 'iservice-table-status',
              componentRow: 'iservice-table-row-expandable',
              filterLabel: 'Filter Articles',
              emptyMessage: 'No articles',
              pageSize: 5,
              expandable: true,
              searching: false,
              initialSort: 'Subject',
              exportName: "KB Articles",
              columns: tableColumns.value
            });

            feature.getTopicTabArticles = function(topic, onload = false){
              if(topic){
                feature.selectedTopic = topic;
                if(onload){
                  feature.activeTab = router.currentRoute.value.query.tab;
                }else{
                  router.push({ query: { tab: 'topic'+topic.id } });
                  feature.activeTab = 'topic'+topic.id;
                }
              }

            }
            feature.IDs = [];

            feature.getInputSearchedRecords = async function(keywords = '',topics = []){
              feature.IDs = [];
              feature.mergeSearchIDs = [];
              feature.type = 'searchresults';
              feature.loaddetails = false;
              tableConfig.searching = true;
              for(var i = 1; i <= topics.length; i++){
                await iservice.API('webapp-api-findanswer?api=articles', null, { topicID: topics[i-1].id, pageNum: 1, perPage: 1000, recursive: true, searchString: keywords }, null).then(function (data) {
                  data.interactions.forEach(function(article){
                    articles.add(article);
                    feature.mergeSearchIDs.push(article.id);
                  })
                }).catch(function(errors){

                }).finally(function(){

                });
                if(i == topics.length){
                  tableConfig.searching = false;
                  feature.IDs = feature.mergeSearchIDs
                }
              }
            }
            feature.getSearchedRecords = function(keywords = '', topicID = ''){
              feature.IDs = [];
              feature.type = 'searchresults';
              tableConfig.searching = true;
              iservice.API('webapp-api-findanswer?api=articles', null, { topicID: topicID, pageNum: 1, perPage: 1000, recursive: true, searchString: keywords }, null).then(function (data) {
                data.interactions.forEach(function(article){
                  articles.add(article);
                  feature.IDs.push(article.id);
                })
                feature.loaddetails = false;
                tableConfig.searching = false;
              }).catch(function(errors){
                tableConfig.searching = false;
              }).finally(function(){
                tableConfig.searching = false;
              });
            }
            feature.rootTopics = [];
            feature.getSearched = function(keywords = '') {
              if(keywords != "") {
                let queryParams = { search: keywords };
                router.push({ query: queryParams });
              }
              if(feature.rootTopics.length){
                feature.getInputSearchedRecords(keywords, feature.rootTopics);
              }

            }
            var topicsloaded = false;
            Vue.watchEffect(function(){
              let query = router.currentRoute.value.query;
              feature.keyword = query.search || "";
               if(router.currentRoute.value.params.all && !router.currentRoute.value.params.topicID && !router.currentRoute.value.params.articleID && !query.search){
                feature.getSearchedRecords();
              }
              else if(router.currentRoute.value.params.all && router.currentRoute.value.params.topicID && !router.currentRoute.value.params.articleID && !query.search){
                  feature.getSearchedRecords('', router.currentRoute.value.params.topicID);
              }
              else if(router.currentRoute.value.params.all && router.currentRoute.value.params.topicID && router.currentRoute.value.params.articleID && !query.search){
                feature.loadingArticleDetails = true;
                iservice.API('webapp-api-findanswer?api=details', null, { articleID: router.currentRoute.value.params.articleID }, null).then(function (data) {
                  feature.articleDetails = data;
                  feature.loadingArticleDetails = false;
                  feature.loaddetails = true;
                }).catch(function(errors){
                  feature.loadingArticleDetails = false;
                }).finally(function(){
                  feature.loadingArticleDetails = false;
                });
              }else {
                feature.type = !router.currentRoute.value.query.search ? 'knowledgebase': 'searchresults';
                feature.loaddetails = false;
                feature.topics = [];
                function chunk(arr, size) {
                  var newArr = [];
                  for (var i = 0; i < arr.length; i += size) {
                    newArr.push(arr.slice(i, i + size));
                  }
                  return newArr;
                }

                /*function topfaq() {
                  iservice.API('webapp-api-findanswer?api=articles', null, { topicID: feature.rootTopics[0].id, pageNum: 1, perPage: 10, recursive: true, sort: 'RATING_REVERSE', searchString: "" }, null).then(function (data) {
                    feature.articleListFaq = data.interactions;
                    feature.topFAQ = chunk(data.interactions, 2);
                  }).catch(function (errors) {

                  })
                }*/
                feature.limit = 3;
                function LoadTopics() {
                  if(topicsloaded) return;

                  feature.loadingTopics = true;
                  feature.topicLimit = 3;
                  feature.rootTopics = []
                  feature.allTopics = []
                  iservice.API('webapp-api-findanswer?api=topics', null, {}).then(data => {
                    topicsloaded = true;
                    var topics = data.topics;
                    feature.totalTopics = topics.length;
                    var isRoot = {};
                    var topicByID = {};
                    var curChild = null;
                    iservice.ForArray(topics, function (topic) {

                      topicByID[topic.id] = topic;
                      var parent = topicByID[topic.parentID];
                      if (!parent) {
                        isRoot[topic.id] = true;
                        feature.rootTopics.push(topic);
                        topic.children = [];
                      }
                      else if (isRoot[parent.id]) {
                        parent.children.push(topic);
                        topic.children = [];
                        curChild = topic;
                      }
                      else {
                        curChild.children.push(topic);
                      }

                    });
                    iservice.ForArray(feature.rootTopics, function (root) {
                      root.countRecurseExclude = root.countRecurse;
                      iservice.ForArray(root.children, function (child) {
                        iservice.ForArray(child.children, function (subchild) {
                          child.countRecurse += subchild.countRecurse;
                        });
                        root.countRecurse += child.countRecurse;
                      });
                    });
                    feature.loadingTopics = false;
                    if(router.currentRoute.value.query.search) feature.getSearched(router.currentRoute.value.query.search);

                    for(var j = 0; j < feature.rootTopics.length; j++){
                      if(feature.selectedTopic) break;
                      for(var i = 0; i < feature.rootTopics[j].children.length; i++){
                        if(feature.rootTopics[j].children[i].countRecurse > 0){
                          if(feature.selectedTopic) break;
                          var onloadtab = router.currentRoute.value.query.tab ? true : false;
                          var topic = '';
                          if(onloadtab){
                            topic = router.currentRoute.value.query.tab.split('c');
                            topicID = topic[1];
                            feature.rootTopics.forEach(function(roottopic){
                              roottopic.children.forEach(function(childtop){
                                if(childtop.id == topicID) topic = childtop;
                              })
                            })
                          }else{
                            topic = feature.rootTopics[j].children[i];
                          }
                          feature.getTopicTabArticles(topic, onloadtab);
                          break;
                        }
                      }
                    }

                  })
                }
                LoadTopics();
              }
            })
            return { config, feature, tableConfig };
          }
        };
        iservice.components.PortalTopicArticles = {
          name: 'topic-articles',
          template: '#topic-articles',
          props: ['topic', 'allTopics'],
          setup(props){
            var feature = Vue.reactive({ articles: [], subTopics: [] });
            var topic =  Vue.computed(function(){
              return props.topic;
            });

            feature.rootTopics = Vue.computed(function(){
              return props.allTopics;
            })
            Vue.watchEffect(function(){
              feature.searching = true;
              feature.topicsData = [];
              topic.value.articles = [];
              getArtcilesByTopicID(topic.value, feature.topicsData);
              topic.value.children.forEach(function(child){
                child.articles = [];
                getArtcilesByTopicID(child, feature.topicsData);
              })
              feature.searching = false;
            });
            return { feature, topic };
          }
        }
        function getArtcilesByTopicID(topic, topicsData){
          iservice.API('webapp-api-findanswer?api=articles', null, { topicID: topic.id, pageNum: 1, perPage: 1000, recursive: false, searchString:"" }, null).then(function (data) {
              if(data.interactions.length){
                topic.articles = data.interactions;
                topicsData.push(topic);
              }
            }).catch(function(errors){
            }).finally(function(){
            });
        }
        iservice.components.PortalArticleDetails = {
          name: 'article-details',
          template: '#article-details',
          props: ['articleDetails', 'loading'],
          setup(props){
            var router = VueRouter.useRouter();
            var loggedIn = iservice.LoggedInData();
            var articleDetails = Vue.computed(function(){
              return props.articleDetails;
            });
            var loading = Vue.computed(function(){
              return props.loading;
            });

            var feature = Vue.reactive({ errors: [] });
            var averageRating = articleDetails.value.rating;
            feature.articleLink = window.location.origin + window.location.pathname
            feature.socialLink = encodeURIComponent(window.location.origin + window.location.pathname + '?articleID=' + articleDetails.value.id);
            feature.socialTwitterLink = encodeURIComponent(window.location.origin + window.location.pathname);
            feature.copylink = false;
            var clipboard = new ClipboardJS('a.copy', {
              text: function(trigger) {
                  feature.copylink = true;
                  return document.querySelector('input#sharedLink').value;
              }
            });
            clipboard.on('success', function(e) {
              var copyText = document.getElementById("sharedLink");

              copyText.select();
              copyText.setSelectionRange(0, 99999);
              setTimeout(function(){
                $('.success-copied').hide();
              }, 1500)
              e.clearSelection();
            });

            articleDetails.value.rating = parseFloat(articleDetails.value.rating);
            articleDetails.value.date = moment(articleDetails.value.date).format('YYYY-MM-DD hh:mm:ss A');
            var isInline = Vue.reactive({})
            articleDetails.value.questionHtml = iservice.FindInlineAttachments(articleDetails.value.questionHtml, articleDetails.value.attachments, isInline);
            articleDetails.value.answerHtml = iservice.FindInlineAttachments(articleDetails.value.answerHtml, articleDetails.value.attachments, isInline);
            articleDetails.value.attachments = iservice.DownloadableFiles(articleDetails.value.attachments, isInline)
            feature.getSelectedRating = function(rating){
              var articleID = articleDetails.value.id;
              iservice.API('webapp-api-findanswer?api=feedback',null, { articleID: articleID, rating: rating}, null).then(function(data){

              }).catch(function(errors){
                feature.errors = errors;
              })
            }
            feature.loginToSubscribe = function(){
              var link = document.getElementById('show_login');
              link.click();
            }

            function CollectItemIDs(items, idName, checkedName) {
              var ids = [];
              for (var i = 0; i < items.length; i++) {
              var item = items[i];
              if (!checkedName || item[checkedName]) ids.push(item[idName]);
              }
              return ids;
            }

            feature.SubscribeArticle = function(article, action) {
              if(action == 'unsubscribe'){
                iservice.API('webapp-api-findanswer?api=mysubscriptions', null, {}).then(function(data){
                    var articlesList = data.articles.filter(function(item){ return item.id != article.id});

                    var listID = CollectItemIDs(data.lists, 'id', 'isOnList');
                    var campaignID = CollectItemIDs(data.campaigns, 'id', 'isOnList');
                    var articleID = CollectItemIDs(articlesList, 'id', 'isOnList');

                    var subscriptionsItems = {
                      listIDs: listID,
                      campaignIDs: campaignID,
                      articleIDs: articleID
                    };
                    iservice.API('webapp-api-findanswer?api=mysubscriptionsset',null, {subscriptions: subscriptionsItems}, null).then(function(data){
                      article.isSubscribed = false;
                      feature.success = "Article unsubscribed successfully.";
                    }).catch(function(errors){
                        feature.errors= erros;
                    });
                });
              }else{
                iservice.API('webapp-api-findanswer?api=subscribe', null, { articleID: article.id }, null).then(function(response){
                    article.isSubscribed = true;
                    feature.success = "Article subscribed successfully."
                }).catch(function(errors){
                    feature.errors= errors;
                });
              }
            }

            return { articleDetails, feature, loggedIn, averageRating, loading }
          }

        }
        iservice.components.tabsSubscriptions = {
          name: 'subscriptions',
          template: '#subscriptions',
          route() { return { path: iservice.formPath+'/subscriptions', priority: 100 } },
          props: ['config'],
          setup(props) {
            var loggedIn = iservice.LoggedInData();
            var articles = iservice.ArticleData();
            var subscriptionList = Vue.reactive({ lists: [], campaigns: [], articles: [] })
            var config = Vue.computed(function(){
              return props.config;
            });
            LoadSubscriptions();
            function LoadSubscriptions() {
              subscriptionList.loading = true;
              iservice.API('webapp-api-findanswer?api=mysubscriptions', null, {}).then(data => {
                subscriptionList.lists = data.lists;
                subscriptionList.listsLength =  subscriptionList.lists.length;
                subscriptionList.campaigns = data.campaigns;
                subscriptionList.campaignsLength = subscriptionList.campaigns.length;
                subscriptionList.articles = data.articles;
                subscriptionList.articlesLength = subscriptionList.articles.length;
                subscriptionList.loading = false;
              }).catch(function (errors) {
                subscriptionList.loading = false;
                subscriptionList.errors = errors;
              }).finally(function () {
                subscriptionList.loading = false;
              });
            }
            function CollectItemIDs(items, idName, checkedName) {
              var ids = [];
              for (var i = 0; i < items.length; i++) {
              var item = items[i];
              if (!checkedName || item[checkedName]) ids.push(item[idName]);
              }
              return ids;
            }

            var contactID = Vue.ref(null);
            Vue.watchEffect(() => {
              if (contactID.value != iservice.data.loggedIn.contactID) {
                contactID.value = iservice.data.loggedIn.contactID;
                LoadSubscriptions();
              }
            });
            var saveSubscription = Vue.reactive({ errors: [], success:'', working: false });
            function SaveClick(){
              var listID = CollectItemIDs(subscriptionList.lists, 'id', 'isOnList');
              var campaignID = CollectItemIDs(subscriptionList.campaigns, 'id', 'isOnList');
              var articleID = CollectItemIDs(subscriptionList.articles, 'id', 'isOnList');

              var subscriptionsItems = {
                listIDs: listID,
                campaignIDs: campaignID,
                articleIDs: articleID
              };
              saveSubscription.loading = true;
              iservice.API('webapp-api-findanswer?api=mysubscriptionsset', null, { subscriptions: subscriptionsItems}).then(function () {
                saveSubscription.loading = false;
                saveSubscription.success = 'Subscriptions updated successfully.';
              }).catch(function (errors) {
                saveSubscription.errors = errors;
              }).finally(function () {
                saveSubscription.loading = false;
              })

            }
            return { config, subscriptionList, SaveClick, loggedIn, saveSubscription };
          }
        };
        iservice.components.tabsAskQuestion = {
          name: 'ask-question',
          template: '#ask-question',
          route() { return { path: iservice.formPath+'/ask-question', priority: 100 } },
          props: ['config'],
          setup(props) {
            var loggedIn = iservice.LoggedInData();
            var featureAAQ = Vue.reactive({})
            featureAAQ.errors = [];
            var segments = iservice.SegmentData();
            featureAAQ.details = {};
            var config = Vue.computed(function(){
              return props.config;
            });
            var topicGroups = Vue.computed(() => {
              var groups = Vue.reactive([]);
              if (!segments.loaded) {
                segments.Load();
              }
              if(!segments.list.length) return
              iservice.API('webapp-api-findanswer?api=topics', null, {}).then(data=> {
                var topicslist =  data.topics;

                segments.list.forEach(function(segment){
                  var group = Vue.reactive({ label: "", options: [] });
                  topicslist.forEach(function(topic){
                    if(topic.segmentID == segment.id){
                      group.label = topic.segmentName;
                      group.options.push({ name: topic.option, id: topic.id });
                    }
                  });
                  if(group.label)
                    groups.push(group);
                })
              });
              return groups;
            });
             var articles = iservice.ArticleData();
            var tableColumns = Vue.computed(() => {
              var columns = [
                Vue.reactive({
                  name: 'expand', hidable: false,
                  filterText: function () { },
                  componentHead: 'iservice-table-head-empty', componentCell: 'iservice-table-cell-customportal-article-expand', shown: true, tdClass: 'expand-td'
                }),
                Vue.reactive({
                  name: 'Subject', label: 'Subject',
                  filterText: iservice.tables.SimpleFilterTextFunc(articles, 'subject'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-portal-tab-article-simple', shown: true
                })];

              return columns;
            });

            //table configuration
            var tableConfig = Vue.reactive({
              componentControls: 'iservice-table-controls-customerportal-aaq',
              componentBody: 'iservice-table-body',
              componentStatus: 'iservice-table-status',
              componentRow: 'iservice-table-row-expandable',
              componentExpanded: 'article-view-loader',
              filterLabel: 'Filter Articles',
              emptyMessage: 'No articles',
              pageSize: 5,
              expandable: true,
              searching: false,
              initialSort: 'Subject',
              exportName: "KB Articles",
              columns: tableColumns.value
            });
            featureAAQ.IDs = [];
            featureAAQ.submitticket = false;
            featureAAQ.getArticlesByTopic = function (topicID) {
              if (topicID) {
                tableConfig.searching = true;
                iservice.API('webapp-api-findanswer?api=articles', null, { topicID: topicID, pageNum: 1, perPage: 1000, recursive: true, searchString: "" }, null).then(function (data) {
                  //iservice.SanitizeHistoryRows(data.interactions);
                  // $scope.topicArticles = data.interactions;

                   data.interactions.forEach(function(article){
                      articles.add(article);
                      featureAAQ.IDs.push(article.id);
                  })
                  tableConfig.searching = false;
                  featureAAQ.totalResults = data.interactions.length;
                  if (!data.interactions.length)
                    featureAAQ.submitticket = true
                  else
                    featureAAQ.submitticket = false
                }).catch(function(errors){
                  featureAAQ.errors = errors;
                  tableConfig.searching = false;
                }).finally(function(){
                  tableConfig.searching = false;
                });
              }
            }
            featureAAQ.openSubmitticket = function () {
              featureAAQ.submitticket = true;
            }
            featureAAQ.customerTools = true;
           var featureUploads = iservice.FeatureUploads();
            Vue.watchEffect(function(){
              if(featureAAQ.details.topicID){
                featureAAQ.caseproperties = { props : [] };
                featureAAQ.properties = { props : [] };
                iservice.API('webapp-api-findanswer?api=properties', null, { topicID: featureAAQ.details.topicID }).then(data => {
                  var properties = data.properties;
                  var caseproperties = data.caseProperties;
                  iservice.EditableProperties(featureAAQ.properties, properties);
                  iservice.EditableProperties(featureAAQ.caseproperties, caseproperties);
                });
              }
            });
            var findFirstEmailaddress = function () {
              for (var i = 0; i < loggedIn.logins.length; i++) {
                if (loggedIn.logins[i].type == 'Email') {
                  featureAAQ.details.destEmail = loggedIn.logins[i].name;
                  break;
                }
              }
            }
            findFirstEmailaddress();
            featureAAQ.error = {}
            function validateEmail(email) {
              const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
              return re.test(String(email).toLowerCase());
            }
            featureAAQ.Submit = function(){
              featureAAQ.errors = [];
              if (!featureAAQ.details.topicID) {
                featureAAQ.errors.push({ msg: 'Please select a topic.', details: { description: '' } });
                featureAAQ.error.topic = true;
              }
              if (!featureAAQ.details.destEmail) {
                featureAAQ.errors.push({ msg: 'Please enter email address.', details: { description: '' } });
                featureAAQ.error.email = true;
              }
              if (!featureAAQ.details.subject) {
                featureAAQ.errors.push({ msg: 'Please enter subject.', details: { description: '' } });
                featureAAQ.error.subject = true;
              }
              if (!featureAAQ.details.bodyHtml) {
                featureAAQ.errors.push({ msg: 'Please enter body.', details: { description: '' } });
                featureAAQ.error.body = true;
              }
              if (featureAAQ.details.destEmail && !validateEmail(featureAAQ.details.destEmail)) {
                featureAAQ.errors.push({ msg: 'Please enter valid email address.', details: { description: '' } });
                featureAAQ.error.email = true;
              }
              if(featureAAQ.errors.length) return;
              featureAAQ.loading = true;
              featureAAQ.details.properties = featureAAQ.properties.out;
              featureAAQ.details.caseproperties = featureAAQ.caseproperties.out;
              iservice.API('webapp-api-findanswer?api=aaq', null, { destEmail: featureAAQ.details.destEmail, details: featureAAQ.details }, featureUploads.files).then(data => {
                featureAAQ.details = {};
                featureAAQ.properties = {};
                featureAAQ.caseproperties = {};
                featureAAQ.success = "Your question has been submitted successfully.";
                featureAAQ.submitticket = false;
                featureAAQ.loading = false;
                featureUploads.files = [];
              }).catch(function(errors){
                featureAAQ.loading = false;
                featureAAQ.errors = errors
              }).finally(function(){
                featureAAQ.loading = false;
              });

            }
            return { config, featureAAQ, topicGroups, tableConfig, loggedIn, featureUploads };
          }
        };
        iservice.components.articleViewLoader = {
          name: 'article-view-loader',
          template: '#article-view-loader',
          props: ['itemid'],
          setup(props) {
            var featureArtcleDetail = Vue.reactive({})
            featureArtcleDetail.loading = true
            var isInline = Vue.reactive({});
            iservice.API('webapp-api-findanswer?api=details', null, { articleID: props.itemid }).then(data => {

              featureArtcleDetail.details = data;
              featureArtcleDetail.details.questionHtml = iservice.FindInlineAttachments(featureArtcleDetail.details.questionHtml, featureArtcleDetail.details.attachments, isInline);
              featureArtcleDetail.details.answerHtml = iservice.FindInlineAttachments(featureArtcleDetail.details.answerHtml, featureArtcleDetail.details.attachments, isInline);
            }).catch(errors => {
              featureArtcleDetail.loading = false;
            }).finally(() => {
              featureArtcleDetail.loading = false;
            });

            return { featureArtcleDetail };
          }
        };
        iservice.components.tabsMyHistpry = {
          name: 'my-history',
          template: '#my-history',
          route() { return { path: iservice.formPath+'/my-history', priority: 100 } },
          props: ['config'],
          setup(props) {
            var interactions = iservice.InteractionData();
            var loggedIn = iservice.LoggedInData();
            var featureHistory = Vue.reactive({})
            var config = Vue.computed(function(){
              return props.config;
            })
            var selectedIDs = Vue.ref([]);
            featureHistory.type = 'inbox';
            featureHistory.tab = 'inbox';
            featureHistory.TabClass = function (tab) { return { 'active': tab == featureHistory.tab } }
            featureHistory.TabClick = function (tab) {
              featureHistory.tab = tab;
              featureHistory.type = 'inbox';
            }
            function pushToArray(arr, obj) {
              const index = arr.findIndex((e) => e.propertyID === obj.propertyID);

              if (index === -1) {
                arr.push(obj);
              } else {
                arr[index] = obj;
              }
            }
            featureHistory.interactionProperties = {}
            featureHistory.caseProperties = {}
            featureHistory.showOption = function (type, row = null, updateProperty = false, replyForm = false) {
              featureHistory.type = type;
              if (row) {
                iservice.API('webapp-api-history?api=details', null, { interactionID: row.id }, null).then(function (response) {

                  var isInline = Vue.reactive({})

                  response.date = moment(response.date).format('YYYY-MM-DD hh:mm:ss A');
                  if(!replyForm){
                    response.bodyHtml = iservice.FindInlineAttachments(response.bodyHtml, response.attachments, isInline);
                    response.attachments = iservice.DownloadableFiles(response.attachments, isInline);
                  }
                  if (type == 'replymessage') {
                    response.bodyHtml = '';
                    iservice.API('webapp-api-history?api=startticket', null, {
                      interactionID: row.id,
                      topicID: row.topicID,
                      segmentID: row.segmentID,
                      customerID: row.customerID
                    }).then(function (result) {
                      if (replyForm) {
                        result.quotedBody = iservice.FindInlineAttachments(result.quotedBody, response.attachments, isInline);
                        response.bodyHtml = '<div><br /><br /><br></div>' + result.quotedBody;

                        iservice.EditableProperties(featureHistory.interactionProperties, result.interactionProperties);
                        iservice.EditableProperties(featureHistory.caseProperties, result.caseProperties);

                      }
                    }).catch(function (errors) {

                    }).finally(function () {

                    });
                  }
                  var subjectRefReplaceRegex = /\[(.+?)\]/g;
                  var interactionSubject = response.subject;
                  response.subject = interactionSubject.replace(subjectRefReplaceRegex, '');

                  featureHistory.selectedRow = response;
                  if (updateProperty) {
                    var properties = {}
                    iservice.EditableProperties(properties, response.interactionProperties);
                    var propertyID;
                    if (properties.props) {
                      properties.props.forEach(function (prop) {
                        if (prop.def.name == 'HasBeenRead') {
                          propertyID = prop.propertyID;
                        }
                      });
                    }

                    iservice.API('webapp-api-myaccount?api=setread', null, { interactionIDs: [row.id] }, null).then(function (response) {


                    }).catch(function (errors) {

                    }).finally(function () {
                      var hasbeenread = {
                        "propertyID": propertyID, "name": "HasBeenRead", "isDate": false, "isInteger": false, "isNumber": false, "allowMultiple": false, "hasDescriptions": false, "isMultiLine": false, "isReadOnly": false, "isRequired": false, "values": [{ value: "True" }], "valueChoices": ["False", "True"], "descriptionChoices": []
                      };

                      if (featureHistory.inboxItems) {
                        featureHistory.inboxItems.forEach(function (item) {
                          //check for the item which is marked as HasBeenRead
                          if (item.id == row.id) {
                            pushToArray(item.properties, hasbeenread); //update or add row if HasBeenRead marked
                          }
                        });
                      }
                    });
                  }
                }).catch(function (errors) {
                  featureHistory.errors = errors;
                });
              } else {
                featureHistory.selectedRow = null;
              }
            }
           featureHistory.HasbeenRead = function (properties) {
              if (properties) {
                for (var i = 0; i < properties.length; i++) {
                  if (properties[i].name == 'HasBeenRead' && properties[i].values[0].value == 'True') {
                    return true;
                    break;
                  }
                }
              }
            }
            featureHistory.isCheck = true;
            featureHistory.hideToast = function () {
              featureHistory.isCheck = true;
            }
            featureHistory.MakeDelete = function (row = null) {
              featureHistory.isCheck = true;
              if (row) {
                if (featureHistory.tab == 'trash') {
                  if (!confirm('This will permanently remove the message. Continue?')) {
                    return false;
                  }
                }
                row.archivedProcess = true;
                var api = (featureHistory.tab == 'inbox' || featureHistory.tab == 'sent') ? 'setarchived' : 'setdeleted';
                iservice.API('webapp-api-myaccount?api=' + api, null, { interactionIDs: [row.id] }, null).then(function (response) {
                  featureHistory.showOption('inbox', null);
                  if (featureHistory.inboxItems){
                    const index = featureHistory.inboxIDs.indexOf(row.id);
                    if (index > -1) {
                      featureHistory.inboxIDs.splice(index, 1);
                    }
                  }
                  if (featureHistory.sentItems){
                    const index = featureHistory.sentIDs.indexOf(row.id);
                    if (index > -1) {
                      featureHistory.sentIDs.splice(index, 1);
                    }
                  }
                }).catch(function (errors) {

                }).finally(function () {
                  row.archivedProcess = false;
                  featureHistory.isCheck = false;
                  if (!featureHistory.isCheck) {
                    setTimeout(function () {
                      featureHistory.hideToast();
                    }, 3000);
                  }
                });
              }
            };
            featureHistory.DeleteSelected = function () {
              if (!confirm('This will permanently remove the message. Continue?')) {
                return false;
              }
              if (selectedIDs.value.length > 0) {
                iservice.API('webapp-api-myaccount?api=setdeleted', null, { interactionIDs: selectedIDs.value }, null).then(function (response) {
                  featureHistory.success = "Successfully Deleted.";
                  featureHistory.showOption('inbox', null);
                }).catch(function (errors) {

                }).finally(function () {
                  if (featureHistory.ArchiveItems){
                    selectedIDs.value.forEach(function(id){
                      const index = featureHistory.trashIDs.indexOf(id);
                      if (index > -1) {
                        featureHistory.trashIDs.splice(index, 1);
                      }
                    })
                  }
                });
              }
            }
            //table columns declaration
            var tableColumns = Vue.computed(() => {
              var columns = [
                Vue.reactive({
                  name: 'expand', hidable: false,
                  filterText: function () { },
                  componentHead: 'iservice-table-head-empty', componentCell: 'iservice-table-cell-delete', shown: true, tdClass: 'expand-td'
                }),
                Vue.reactive({
                  name: 'From', label: 'From',
                  filterText: iservice.tables.SimpleFilterTextFunc(interactions, 'headerFrom'),
                  clickMethod: featureHistory.showOption,
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-history-simple', shown: true
                }),
                Vue.reactive({
                  name: 'Subject', label: 'Subject',
                  filterText: iservice.tables.SimpleFilterTextFunc(interactions, 'subjectBare'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-simple', shown: true
                }),
                Vue.reactive({
                  name: 'Date', label: 'Date', sortIncreasing: false,
                  filterText: iservice.tables.DateFromNowFilterTextFunc(interactions, 'date'), sortText: iservice.tables.DateSortTextFunc(interactions, 'date'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-date-from-now', shown: true
                })];

              return columns;
            });
            //table columns declaration
            var tableColumnsTrash = Vue.computed(() => {
              var columns = [
                Vue.reactive({
                  name: 'checkbox', hidable: false,
                  filterText: function () { },
                  componentHead: 'iservice-table-head-select-all', componentCell: 'iservice-table-cell-select', shown: true
                }),,
                Vue.reactive({
                  name: 'From', label: 'From',
                  filterText: iservice.tables.SimpleFilterTextFunc(interactions, 'headerFrom'),
                  clickMethod: featureHistory.showOption,
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-history-simple', shown: true
                }),
                Vue.reactive({
                  name: 'Subject', label: 'Subject',
                  filterText: iservice.tables.SimpleFilterTextFunc(interactions, 'subjectBare'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-simple', shown: true
                }),
                Vue.reactive({
                  name: 'Date', label: 'Date', sortIncreasing: false,
                  filterText: iservice.tables.DateFromNowFilterTextFunc(interactions, 'date'), sortText: iservice.tables.DateSortTextFunc(interactions, 'date'),
                  componentHead: 'iservice-table-head-sortable-label', componentCell: 'iservice-table-cell-date-from-now', shown: true
                })];

              return columns;
            });
            //table configuration
            var tableConfig = Vue.reactive({
              componentControls: 'iservice-table-controls-customerportal',
              componentBody: 'iservice-table-body',
              componentStatus: 'iservice-table-status',
              componentRow: 'iservice-table-row-portal-tabs',
              filterLabel: 'Filter by Subject',
              emptyMessage: 'No inbox items available.',
              pageSize: 10,
              expandable: true,
              searching: false,
              initialSort: 'Date',
              columns: tableColumns.value,
              portal: true,
              hasBeanRead: featureHistory.HasbeenRead,
              MakeDelete: featureHistory.MakeDelete
            });
            //table configuration
            var tableConfigSent = Vue.reactive({
              componentControls: 'iservice-table-controls-customerportal',
              componentBody: 'iservice-table-body',
              componentStatus: 'iservice-table-status',
              componentRow: 'iservice-table-row-portal-tabs-sent',
              filterLabel: 'Filter by Subject',
              emptyMessage: 'No sent items available.',
              pageSize: 10,
              expandable: true,
              searching: false,
              initialSort: 'Date',
              columns: tableColumns.value,
              portal: true,
              hasBeanRead: featureHistory.HasbeenRead,
              MakeDelete: featureHistory.MakeDelete
            });
            //table configuration
            var tableConfigTrash = Vue.reactive({
              componentControls: 'iservice-table-controls-customerportal',
              componentBody: 'iservice-table-body',
              componentStatus: 'iservice-table-status',
              componentRow: 'iservice-table-row-portal-tabs-sent',
              filterLabel: 'Filter by Subject',
              emptyMessage: 'No archived items available.',
              pageSize: 10,
              expandable: true,
              searching: false,
              initialSort: 'Date',
              columns: tableColumnsTrash.value,
              portal: true,
              hasBeanRead: featureHistory.HasbeenRead,
              MakeDelete: featureHistory.MakeDelete,
              DeleteSelected: featureHistory.DeleteSelected,
              checkAllMode: 'visible'
            });
            featureHistory.inboxIDs = [];
            featureHistory.sentIDs = [];
            featureHistory.trashIDs = [];
            var intProperties = iservice.IntPropertyData();
            if(!intProperties.loaded){
              intProperties.Load();
            }
            featureHistory.GetRecords = function () {
              if(!intProperties.loaded){
                intProperties.Load();
              }
              featureHistory.dataloading = true;
              iservice.API('webapp-api-findanswer?api=history', null, {}).then(function (data) {
                featureHistory.inboxItems = data.history.filter(getInboxItems);
                featureHistory.inboxItems.forEach(function(item){
                  item.properties.forEach(function (prop) {
                    var property = intProperties.get(prop.propertyID);
                    if (property) {
                      prop.name = property.name;
                    }
                  });
                });
                featureHistory.inboxItems = featureHistory.inboxItems.filter(removeArchived);
                featureHistory.inboxItems = featureHistory.inboxItems.filter(removeDeleted);
                featureHistory.inboxItems.forEach(function(item){
                  interactions.add(item);
                  featureHistory.inboxIDs.push(item.id);
                });
                featureHistory.sentItems = data.history.filter(getSentItems);
                featureHistory.sentItems.forEach(function(item){
                  item.properties.forEach(function (prop) {
                    var property = intProperties.get(prop.propertyID);
                    if (property) {
                      prop.name = property.name;
                    }
                  });
                });
                featureHistory.sentItems = featureHistory.sentItems.filter(removeArchived);
                featureHistory.sentItems = featureHistory.sentItems.filter(removeDeleted);
                featureHistory.sentItems.forEach(function(item){
                  interactions.add(item);
                  featureHistory.sentIDs.push(item.id);
                });
                var ArchivedItems = data.history;
                ArchivedItems.forEach(function(item){
                  item.properties.forEach(function (prop) {
                    var property = intProperties.get(prop.propertyID);
                    if (property) {
                      prop.name = property.name;
                    }
                  });
                });
                featureHistory.ArchiveItems = ArchivedItems.filter(archivedData);
                featureHistory.ArchiveItems = featureHistory.ArchiveItems.filter(removeDeleted);
                featureHistory.ArchiveItems.forEach(function(item){
                  interactions.add(item);
                  featureHistory.trashIDs.push(item.id);
                });
              }).catch(function (errors) {
                featureHistory.dataloading = false;
              }).finally(function () {
                featureHistory.dataloading = false;
              });
            }

            featureHistory.GetRecords();
            function getSentItems(interaction) {
              return interaction.type == 'Ask A Question' || interaction.type == 'Customer Ticket' || interaction.type == 'Customer Email' || interaction.type == 'Chat';
            }
            function getInboxItems(interaction) {

              return interaction.type == 'Agent Response' || interaction.type == 'Secure Email' || interaction.type == 'Resolve Note' || interaction.type == 'Agent Email' || interaction.type == 'Public Note' || interaction.type == 'Note' || interaction.type == 'Secure Response' || interaction.type == 'Mass Mailing';
            }
            function removeArchived(interaction) {
              return !isArchived(interaction.properties);
            }
            function removeDeleted(interaction) {
              return !isDeleted(interaction.properties);
            }
            function archivedData(interaction) {
              return isArchived(interaction.properties);
            }
            function isArchived(properties) {
              if (properties) {
                for (var i = 0; i < properties.length; i++) {
                  if (properties[i].name == 'Archived' && properties[i].values[0].value == 'True') {
                    return true;
                    break;
                  }
                }
              }
            }

            function isDeleted(properties) {
              if (properties) {
                for (var i = 0; i < properties.length; i++) {
                  if (properties[i].name == 'Deleted' && properties[i].values[0].value == 'True') {
                    return true;
                    break;
                  }
                }
              }
            }
            function hasValue(obj, key, propertyName) {
              return obj.hasOwnProperty(key) && obj[key] === propertyName;
            }
            var UnreadMessages = function (data) {
              var totalUnread = 0;
              if (data) {
                data.forEach(function (row) {
                  if (row.properties) {
                    var checkHasBeenRead = row.properties.some(function (e) {
                      var hasBeenReadExists = hasValue(e, "name", 'HasBeenRead');
                      if (hasBeenReadExists) {
                        if (e.values[0] && e.values[0].value == 'True') return true;
                      }
                    });
                    if (!checkHasBeenRead) {
                      totalUnread = totalUnread + 1;
                    }
                  }
                });
                return totalUnread;
              }
            }
            return { config, featureHistory, loggedIn, tableConfig, UnreadMessages, tableConfigSent, tableConfigTrash, selectedIDs };
          }
        };
        iservice.components.readMessages = {
          name: 'read-message',
          template: '#read-message',
          props: ['selectedRow', 'clickMethod', 'deleteMethod'],
          setup(props) {
            var feature = Vue.reactive({});
            var selectedRow = Vue.computed(function(){
              return props.selectedRow;
            })

            var showOption = Vue.computed(function(){
              return props.clickMethod;
            })
            var deleteMethod = Vue.computed(function(){
              return props.deleteMethod;
            })
            return { feature, selectedRow, showOption, deleteMethod };
          }
        };
        iservice.components.replyMessages = {
          name: 'reply-message',
          template: '#reply-message',
          props: ['selectedRow', 'clickMethod', 'interactionProps', 'caseProps', 'sentids'],
          setup(props) {
            var interactions = iservice.InteractionData();
            var featureUploads = iservice.FeatureUploads();
            var loggedIn = iservice.LoggedInData();
            var featureReply = Vue.reactive({ errors: [] });
            var selectedRow = Vue.computed(function(){
              return props.selectedRow;
            })

            var showOption = Vue.computed(function(){
              return props.clickMethod;
            });
            var sentIDs = Vue.computed(function(){
              return props.sentids;
            })
            var operationDetails = {
                addSubjectRefNum: true,
                assignToAgentID: '',
                bodyHtml: '',
                caseProperties: [],
                inResponseToID: '',
                properties: [],
                segmentID: '',
                subject: '',
                topicID: ''
            }
            var interactionProps = Vue.computed(function(){
              return props.interactionProps;
            })
            var caseProps = Vue.computed(function(){
              return props.caseProps;
            })

            featureReply.SendReply = function (row) {
              var emailLogin = loggedIn.logins.find(function (lgn) {
                return lgn.type === 'Email' || lgn.type === 'Bounced';
              });

              var destEmail = emailLogin ? emailLogin.name : '';
              operationDetails.bodyHtml = row.bodyHtml;
              operationDetails.caseProperties = caseProps.value.out;
              operationDetails.inResponseToID = row.id;
              operationDetails.properties = interactionProps.value.out;
              operationDetails.segmentID = row.segmentID;
              operationDetails.subject = row.subject;
              operationDetails.topicID = row.topicID;
              iservice.API('webapp-api-findanswer?api=aaq', null, { destEmail: destEmail, details: operationDetails }, featureUploads.files).then(function (response) {
                featureReply.success = "Your message was sent.";
                //sentIDs.value.push(response.resultID)
                props.clickMethod('inbox', null);
              }).catch(function (errors) {
                featureReply.errors = errors;
              });
            }
            return { featureReply, selectedRow, showOption, featureUploads, interactionProps, caseProps };
          }
        };
        iservice.components.tabsMyProfile = {
          name: 'my-profile',
          template: '#my-profile',
          route() { return { path: iservice.formPath+'/my-profile', priority: 100 } },
          props: ['config'],
          setup(props) {
            var loggedIn = iservice.LoggedInData();
            var featureProfile = Vue.reactive({ errors: [] })
            var config = Vue.computed(function(){
              return props.config;
            });
            featureProfile.allProps = {};
            featureProfile.personalInfo = {}
            featureProfile.companyInfo = {}
            featureProfile.contactInfo = {}
            featureProfile.loading = true;
            function loadDetails(){
              iservice.API('webapp-api-findanswer?api=mydetails', null, {}).then(function(data){

                featureProfile.loading = false;
                iservice.EditableProperties(featureProfile.allProps, data.properties);
                featureProfile.segments = data.properties;
                featureProfile.segmentsData = [];
                featureProfile.segments.forEach(function(segment){
                  if(segment.name == 'Global'){
                    iservice.EditableProperties(featureProfile.personalInfo, getPersonalInfo(segment.properties));
                    iservice.EditableProperties(featureProfile.companyInfo, getCompanyInfo(segment.properties));
                    iservice.EditableProperties(featureProfile.contactInfo, getContactInfo(segment.properties));
                    featureProfile.customerType = getCustomerType(segment.properties);
                  }else{
                    featureProfile.segmentsData.push(segment);
                  }
                })
              }).catch(function(errors){
                featureProfile.errors = errors;
              }).finally(function(){
                featureProfile.loading = false;
              })
            }
            loadDetails();
            var getCustomerType = function(properties){
              var properties = properties.filter(function(item){
                return item.name == 'Customer Type';
              });
              return properties[0].values[0].value;
            }
            var getPersonalInfo = function(properties){
              var properties = properties.filter(function(item){
                return item.name == 'First Name' || item.name == 'Middle Initial' || item.name == 'Last Name';
              });
              return properties
            }
            var getCompanyInfo = function(properties){
              var properties = properties.filter(function(item){
                return item.name == 'Job Title' || item.name == 'Company';
              });
              return properties
            }
            var getContactInfo = function(properties){
              var properties = properties.filter(function(item){
                return item.name == 'Phone' || item.name == 'Customer Type' || item.name == 'Address1' || item.name == 'Address2' || item.name == 'City' || item.name == 'State' || item.name == 'Postal Code' || item.name == 'Country';
              });
              return properties
            }
            var returnDateFormat = function(date){
              return moment(date).format('YYYY-MM-DD hh:mm:ss A');
            }
            featureProfile.openPersonalInfoModal = function(){
             var bodyEl = $('.userEdit.modal')[0];
              bodyEl.classList.remove('hide')
              bodyEl.classList.add('modal-open')
            }
            featureProfile.openContactInfoModal = function(){
              var bodyEl = $('.contactInfoEdit.modal')[0];
              bodyEl.classList.remove('hide')
              bodyEl.classList.add('modal-open')
            }
            featureProfile.openCompanyModal = function(){
              var bodyEl = $('.companyInfoEdit.modal')[0];
              bodyEl.classList.remove('hide')
              bodyEl.classList.add('modal-open')
            }
            featureProfile.openLoginsModal = function(){
              var bodyEl = $('.loginInfoEdit.modal')[0];
              bodyEl.classList.remove('hide')
              bodyEl.classList.add('modal-open')
            }
            featureProfile.segmentProperties = {};
            featureProfile.openSegmentsModal = function(segmentProperties){
              iservice.EditableProperties(featureProfile.segmentProperties, segmentProperties);
              var bodyEl = $('.segmentPropEdit.modal')[0];
              bodyEl.classList.remove('hide')
              bodyEl.classList.add('modal-open')

            }
            featureProfile.closeModal = function(classname){
              var bodyEl = $(classname)[0];
              bodyEl.classList.add('hide')
              bodyEl.classList.remove('modal-open')
            }
            featureProfile.addLogins = function (seg) {
              seg.logins.push({ name: '', type: 'Email' });
            }
            featureProfile.removeLogins = function (seg, index) {
              seg.logins.splice(index, 1);
              if (seg.logins.length == 0) {
                seg.logins.push({ name: '', type: '' });
              }
            }
            var CollectLogins = function (groups) {
              var logins = [];
              for (var g = 0; g < groups.length; g++) if (groups[g].logins) for (var l = 0; l < groups[g].logins.length; l++) {
                var source = groups[g].logins[l];
                if (!source.name) continue;
                logins.push(source);
              }
              return logins;
            }
            var CanModifyLogins = function (groups) {
              for (var i = 0; i < groups.length; i++) if (groups[i].logins && groups[i].logins.length && groups[i].canModifyLogins) return true;
              return false;
            }
            featureProfile.SaveClick = function (classname) {
              var props = featureProfile.personalInfo.out;
              var props2 = featureProfile.companyInfo.out;
              var props3 = featureProfile.contactInfo.out;
              var props4 = featureProfile.segmentProperties.out;
              var finalProps;
              if(props4)
                finalProps = props.concat(props2, props3, props4);
              else
                finalProps = props.concat(props2, props3);

              const properties = {
                properties: finalProps,
                setLogins: CanModifyLogins(featureProfile.segments),
                logins: CollectLogins(featureProfile.segments)
              };

              iservice.API('webapp-api-custinfo?api=setdetails', null,{ contactID: loggedIn.contactID, details: properties, membership: loggedIn.accessibleSegments}).then(data => {
                loadDetails();
                featureProfile.success = 'Your changes have been saved.';
                featureProfile.closeModal(classname)

              }).catch(function(errors){
                featureProfile.errors = errors;
              }).finally(function(){

              });
            };
            return { config, featureProfile, loggedIn, returnDateFormat };
          }
        };

        iservice.components.iserviceTableCellHistorySimple = {
          name: 'iservice-table-cell-history-simple',
          template: '#iservice-table-cell-history-simple',
          props: ['itemid', 'column', 'rowIDs'],
          setup(props) {
            var interactions = iservice.InteractionData();
            var text = Vue.computed(() => {
              return iservice.BreakWord(props.column.filterText(props.itemid));
            });
            var thread =  Vue.computed(function(){
              return interactions.get(props.itemid);
            })
            var segmentName = Vue.computed(function(){
              var interaction = interactions.get(props.itemid);
              if(interaction){
                return interaction.segmentName;
              }
            })
            var topicName = Vue.computed(function(){
              var interaction = interactions.get(props.itemid);
              if(interaction){
                return interaction.topicName;
              }
            })
            var clickMethod = Vue.computed(function(){
              return props.column.clickMethod
            })

            return { text, segmentName, topicName, clickMethod, thread };
          }
        }
        iservice.directives.iserviceTooltip = {
        name: 'tooltip',
        updateTooltip(el, { value, modifiers }) {
          value.displayArrow = true;
          if (typeof value === "string") {
            // we can pass either a string
            el.setAttribute("data-v-tooltip", value);

            // this check if when v-tooltip receives string with .arrow modifier
            if (modifiers.arrow) {
              el.style.setProperty("--v-tooltip-arrow-display", "inline");
            }
          } else {
            // or an object
            if (value.text) {
              el.setAttribute("data-v-tooltip", value.text);
            }
            if (value.displayArrow || modifiers.arrow) {
              // if there is a prop global: true then mutate the :root css variables
              // otherwise it adds given variables to the element, which makes it possible to be different than others
              const targetEl = value.global ? document.documentElement : el;
              targetEl.style.setProperty(
                "--v-tooltip-arrow-display",
                "inline"
              );
            }
            if (value.theme) {
              // if there is a prop global: true then mutate the :root css variables
              // otherwise it adds given variables to the element, which makes it possible to be different than others
              const targetEl = value.global ? document.documentElement : el;
              for (const [key, val] of Object.entries(value.theme)) {
                if (key === "placement") {
                  switch (val) {
                    case "top":
                      targetEl.style.setProperty(
                        "--v-tooltip-left",
                        "50%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-top",
                        "0%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-translate",
                        "translate(-50%, -110%)"
                      );
                      if (value.displayArrow || modifiers.arrow) {
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-border-color",
                          "var(--v-tooltip-background-color) transparent transparent transparent"
                        );
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-top",
                          "calc(var(--v-tooltip-top) - var(--v-tooltip-top-offset) + 8px)"
                        );
                      }
                      break;
                    case "bottom":
                      targetEl.style.setProperty(
                        "--v-tooltip-left",
                        "50%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-top",
                        "100%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-translate",
                        "translate(-50%, 10%)"
                      );
                      if (value.displayArrow || modifiers.arrow) {
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-border-color",
                          "transparent transparent var(--v-tooltip-background-color) transparent"
                        );
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-top",
                          "calc(var(--v-tooltip-top) - var(--v-tooltip-top-offset) - 7px)"
                        );
                      }
                      break;
                    case "left":
                      targetEl.style.setProperty(
                        "--v-tooltip-left",
                        "0%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-top",
                        "50%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-translate",
                        "translate(-110%, -50%)"
                      );
                      if (value.displayArrow || modifiers.arrow) {
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-border-color",
                          "transparent transparent transparent var(--v-tooltip-background-color)"
                        );
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-top",
                          "calc(var(--v-tooltip-top)"
                        );
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-left",
                          "calc( var(--v-tooltip-left) - var(--v-tooltip-left-offset) + 1.5px)"
                        );
                      }
                      break;
                    case "right":
                      targetEl.classList.add("right-tooltip")
                      targetEl.style.setProperty(
                        "--v-tooltip-left",
                        "100%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-top",
                        "50%"
                      );
                      targetEl.style.setProperty(
                        "--v-tooltip-translate",
                        "translate(10%, -50%)"
                      );
                      if (value.displayArrow || modifiers.arrow) {
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-border-color",
                          "transparent var(--v-tooltip-background-color) transparent  transparent"
                        );
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-top",
                          "calc(var(--v-tooltip-top)"
                        );
                        targetEl.style.setProperty(
                          "--v-tooltip-arrow-left",
                          "calc( var(--v-tooltip-left) - var(--v-tooltip-left-offset) - 2px)"
                        );
                      }
                      break;
                    default:
                      break;
                  }
                } else if (key === "offset" && !value.global) {
                  for (const direction of val) {
                    if (direction === "left") {
                      targetEl.style.setProperty(
                        "--v-tooltip-left-offset",
                        `-${targetEl.scrollWidth -
                        targetEl.clientWidth
                        }px`
                      );
                    } else if (direction === "right") {
                      targetEl.style.setProperty(
                        "--v-tooltip-left-offset",
                        `${targetEl.scrollWidth -
                        targetEl.clientWidth
                        }px`
                      );
                    } else if (direction === "top") {
                      targetEl.style.setProperty(
                        "--v-tooltip-top-offset",
                        `-${targetEl.scrollHeight -
                        targetEl.clientHeight
                        }px`
                      );
                    } else if (direction === "bottom") {
                      targetEl.style.setProperty(
                        "--v-tooltip-top-offset",
                        `${targetEl.scrollHeight -
                        targetEl.clientHeight
                        }px`
                      );
                    }
                  }
                } else {
                  targetEl.style.setProperty(`--v-tooltip-${key}`, val);
                }
              }
            }
          }
        },
        // hooks
        mounted(el, { value, dir, modifiers }) {
          // v-tooltips with global prop won't show the tooltip
          // also object notation without text prop won't show neither
          if (typeof value === "object" && !value.global && value.text) {
            el.classList.add("data-v-tooltip");
          } else if (typeof value === "string") {
            el.classList.add("data-v-tooltip");
          }

          // to use functions in Vue's directives which are inside this object, we can't use this, we have to use dir, which is the directive object
          dir.updateTooltip(el, { value, modifiers });
        },
        updated(el, { value, dir, modifiers }) {
          dir.updateTooltip(el, { value, modifiers });
        },
      };

      //set up global rootPath so we can use it in all template html
      app.config.globalProperties.rootPath = window.rootPath;
      app.config.globalProperties.formPath = iservice.formPath;

      //add all of our directives.
      Object.getOwnPropertyNames(iservice.directives).forEach(name => {
        var directive = iservice.directives[name];
        app.directive(directive.name, directive);
      });

      //add all of our components.
      Object.getOwnPropertyNames(iservice.components).forEach(name => {
        var component = iservice.components[name];
        app.component(component.name, component);
      });
      app.component('Datepicker', Vue3DatePicker);
      app.component('Multiselect', VueformMultiselect);
      app.component('star-rating', VueStarRating.default)

      //create page routes
      var routes = [];
      Object.getOwnPropertyNames(iservice.components).forEach(name => {
        var component = iservice.components[name];
        if (!component.route) return;
        var route = component.route();
        route.component = component;
        routes.push(route);
      });
      routes.sort((l, r) => {
        if (l.priority < r.priority) return -1;
        if (l.priority > r.priority) return 1;
        return 0;
      });
      var router = VueRouter.createRouter({
        history: VueRouter.createWebHistory(),
        routes
      });
      app.use(router);

      //start vue
      app.mount('#customerPortalTabs');
  })(iservice);

$endif$