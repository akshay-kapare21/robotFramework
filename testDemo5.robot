*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    DataDriver   ./resources/data.xls     encoding=utf_8
Test Setup      open the browser with the Mortagage
#Test Teardown   close browser
Resource        resource.robot
#selenium
# robot support : id, xpath and css
Test Template    Validate UnSuccesful Login

*** Variables ***
${errorMessageLogin}        css:div.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
Validate UnSuccesful Login
    [Arguments]    ${username}  ${password}
    Fill the login Form     ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct

Fill the login Form
    [Arguments]     ${urName}       ${password}
    input text          id:username     ${urName}
    input password      id:password     ${password}
    click button        signInBtn

wait until it checks and display error message
    wait until element is visible    ${errorMessageLogin}

verify error message is correct
   ${result}=   get text    ${errorMessageLogin}
   should be equal as strings    ${result}  Incorrect username/password.
   element text should be    ${errorMessageLogin}   Incorrect username/password.