*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Keywords ***
Click delete button
    Delete button display
    Click delete button on to do tasks page

Click tab to do tasks
    Click Element                       ${TO_DO_TASKS_TAB}

Delete button display
    Page Should Contain                 Delete

Click delete button on to do tasks page
    Click Element                       ${DELETE_BUTTON_TO_DO_TASKS}

Click checklist button
    Click Element                       ${CHECK_LIST}