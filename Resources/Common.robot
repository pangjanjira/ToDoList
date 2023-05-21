*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL} =            https://abhigyank.github.io/To-Do-List/
${BROWSER} =        chrome

*** Keywords ***
Strat TestCase
    Open Browser  about:blank  ${BROWSER}
    Go To  ${URL}
    Maximize Browser Window

Finish TestCase
    Close Browser