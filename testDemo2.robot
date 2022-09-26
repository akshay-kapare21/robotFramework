*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Documentation   To validate the login form
Library         SeleniumLibrary
Test Setup      open the browser with the Mortagage
Test Teardown   Close browser session
Resource        resource.robot
Library    SeleniumLibrary
Library    Collections
*** Variables ***
${errorMessageLogin}        css:div.alert-danger

*** Test Cases ***
#Validate UnSuccesful Login
 #   Fill the login Form     ${userName}    ${userInvalidPassword}
 #   wait until it checks and display error message
 #   verify error message is correct

#Validate cards displays in the shopping page
 #   Fill the login Form     ${userName}     ${userValidPassword}
 #   wait until find locator
 #  verify card titles in the shop page
 #   Select the card     Blackberry


Select the form and navigate to child window
    Fill the login Details and select the user

*** Keywords ***
Fill the login Form
    [Arguments]     ${urName}       ${password}
    input text          id:username     ${urName}
    input password      id:password     ${password}
    click button        signInBtn

wait until it checks and display error message
    wait until element is visible    ${errorMessageLogin}

wait until find locator
    wait until element is visible    css:.nav-link

verify error message is correct
   ${result}=   get text    ${errorMessageLogin}
   should be equal as strings    ${result}  Incorrect username/password.
   element text should be    ${errorMessageLogin}   Incorrect username/password.

verify card titles in the shop page
    @{expectedList} =   create list     iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get WebElements    css:.card-title
    @{actualList} =  create list
    FOR    ${element}   IN    @{elements}
        log    ${element.text}
        append to list      ${actualList}       ${element.text}

    END
    lists should be equal    ${expectedList}    ${actualList}

Select the card
    [Arguments]     ${cardName}
    ${elements} =   Get WebElements    css:.card-title
    ${index} =  set variable    1
    FOR    ${element}   IN    @{elements}
            exit for loop if    '${cardName}' == '${element.text}'
            ${index} =  Evaluate    ${index} +1

    END
    click button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login Details and select the user
    input text          id:username     rahulshettyacademy
    input password      id:password     learning
    click element       css:input[value='user']
    wait until element is visible    css:.modal-body
    click element       okayBtn
    wait until element is not visible    css:.modal-body
    select from list by value    css:select.form-control    teach
    select checkbox    terms
    checkbox should be selected    terms
