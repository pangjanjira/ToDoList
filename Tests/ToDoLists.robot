*** Settings ***
Library     SeleniumLibrary
Library     JSONLibrary
Library     Collections
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/HomePage.robot
Resource  ../Resources/PO/AddItems.robot
Resource  ../Resources/PO/Completed.robot
Resource  ../Resources/PO/Items.robot
Resource  ../Resources/PO/ToDoTasks.robot
Variables  ../Resources/WebElements.py

Test Setup  Strat TestCase
Test Teardown  Finish TestCase

*** Variables ***
#Run Script
#robot -d Results Tests/ToDoLists.robot

*** Keywords ***
User fill data and click add button
    [Arguments]                                                                             ${DATA}
    AddItems.Fill data into textfield                                                       ${DATA}
    AddItems.Click add button

*** Test Cases ***
Verify User has not fill item and click add button
    HomePage.Home page should be load element
    AddItems.Click add button
    ToDoTasks.Click tab to do tasks
    Page Should Not Contain                                                                 ${DELETE_BUTTON_TO_DO_TASKS}

Verify user fill spacebar and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     ${SPACE}
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                ${SPACE}

Verify user fill data and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working

Verify user fill data with numberic only and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     123456
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                123456

Verify user fill data with special character only and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     @$#^$#)
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                @$#^$#)

Verify user fill data with special character combine numberic and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     @$#1256
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                @$#1256

Verify user fill data with special character combine english language and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     +_)$$Jane
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                +_)$$Jane

Verify user fill data with special character combine thai language and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     +_)$$กินข้าว
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                +_)$$กินข้าว

Verify user fill data with thai language only and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     ตากผ้า
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                ตากผ้า

Verify user fill data with numberic combine thai language only and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     ตากผ้า1236
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                ตากผ้า1236

Verify user fill data with english language combine thai language only and click add button
    HomePage.Home page should be load element
    User fill data and click add button                                                     ตากผ้าabc
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                ตากผ้าabc

Verify user add multiple item
    HomePage.Home page should be load element
    User fill data and click add button                                                      test1
    User fill data and click add button                                                      test2
    User fill data and click add button                                                      test3
    ToDoTasks.Click tab to do tasks

Verify the item shows the correct text as the item was added
    HomePage.Home page should be load element
    User fill data and click add button                                                      test1
    User fill data and click add button                                                      test2
    User fill data and click add button                                                      test3
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                 test1
    Items.List items display                                                                 test2
    Items.List items display                                                                 test3

User add multiple item and page should display the correct count of the list
    HomePage.Home page should be load element
    User fill data and click add button                                                      test1
    User fill data and click add button                                                      test2
    User fill data and click add button                                                      test3
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                 test1
    Items.List items display                                                                 test2
    Items.List items display                                                                 test3

    ${ListItems} =                      Get Element Count                                    xpath: //label
    ${AmountItems} =                    Convert To String                                    ${ListItems}
    Should be equal                     ${AmountItems}                                       3
    Log to console                      ${ListItems}

Verify user can be delete item from list
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click delete button

Verify user can be delete item and item should not be display
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click delete button
    Items.No items to display                                                               working

Verify user can be check list item
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click checklist button

Verify user can be check list item and item should not be display
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working

Verify user can be check list all item and item should not be display
    HomePage.Home page should be load element
    User fill data and click add button                                                     working1
    User fill data and click add button                                                     working2
    User fill data and click add button                                                     working3
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working1
    Items.List items display                                                                working2
    Items.List items display                                                                working3
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working1
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working2
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working3

Verify user can be delete all item and item should not be display
    HomePage.Home page should be load element
    User fill data and click add button                                                     working1
    User fill data and click add button                                                     working2
    User fill data and click add button                                                     working3
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working1
    Items.List items display                                                                working2
    Items.List items display                                                                working3
    ToDoTasks.Click delete button
    Items.No items to display                                                               working1
    ToDoTasks.Click delete button
    Items.No items to display                                                               working2
    ToDoTasks.Click delete button
    Items.No items to display                                                               working3

Verify check list item should be display on completed page
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click checklist button
    Completed.Click tab completed
    Items.List items display                                                                working

Verify delete button should be display
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click checklist button
    Completed.Click tab completed
    Completed.Delete button display

Verify user can delete check list item
    HomePage.Home page should be load element
    User fill data and click add button                                                     working
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working
    ToDoTasks.Click checklist button
    Completed.Click tab completed
    Completed.Click delete button
    Items.No items to display                                                               working

Verify user can delete all check list item and item should not be display
    HomePage.Home page should be load element
    User fill data and click add button                                                     working1
    User fill data and click add button                                                     working2
    User fill data and click add button                                                     working3
    ToDoTasks.Click tab to do tasks
    Items.List items display                                                                working1
    Items.List items display                                                                working2
    Items.List items display                                                                working3
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working1
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working2
    ToDoTasks.Click checklist button
    Items.No items to display                                                               working3
    Completed.Click tab completed
    Completed.Click delete button
    Items.No items to display                                                               working1
    Completed.Click delete button
    Items.No items to display                                                               working2
    Completed.Click delete button
    Items.No items to display                                                               working3