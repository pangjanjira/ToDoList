*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Keywords ***
List items display
    [Arguments]                         ${DATA}
    Page Should Contain                 ${DATA}

No items to display
    [Arguments]                         ${DATA}
    Page Should Not Contain             ${ITEM_LABEL}    ${DATA}