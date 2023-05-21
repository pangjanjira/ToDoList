*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Keywords ***
Click delete button
    Delete button display
    Click delete button on completed page

Delete button display
    Page Should Contain                 Delete

Click tab completed
    Click Element                       ${COMPLETED_TAB}

Click delete button on completed page
    Click Element                       ${DELETE_BUTTON_COMPLETED}