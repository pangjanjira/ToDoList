*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Keywords ***
Home page should be load element
    Wait Until Page Contains                 To Do List
    Wait Until Page Contains Element         ${ADD_ITEM_TAB}
    Wait Until Page Contains Element         ${TO_DO_TASKS_TAB}
    Wait Until Page Contains Element         ${COMPLETED_TAB}
    Wait Until Page Contains Element         ${INPUT_TEXT_FIELD}
    Wait Until Page Contains Element         ${ADD_BUTTON}