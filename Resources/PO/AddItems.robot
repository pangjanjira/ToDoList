*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Keywords ***
Fill data into textfield
    [Arguments]                         ${DATA}
    Input text                          ${INPUT_TEXT_FIELD}        ${DATA}

Click add button
    Click Element                       ${ADD_BUTTON}