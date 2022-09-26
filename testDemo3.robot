*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup      open the browser with the Mortagage
#Test Teardown   close browser
Resource        resource.robot
#selenium
# robot support : id, xpath and css

*** Variables ***
${errorMessageLogin}        css:div.alert-danger

*** Test Cases ***
Validate Windows Switch Login
    Select the link of child window
    Verify the user is switched to child window
    Grab the Email id in the child window
    Switch to parent window and enter the email

*** Keywords ***
Select the link of child window
    click element    css:.blinkingText
    sleep            5

Verify the user is switched to child window
    switch window    NEW
    element text should be    css:h2    DOCUMENTS REQUEST

Grab the Email id in the child window
    ${text}=    get text    css:.red
    @{words}=   split string    ${text}     at
    ${text}=    get from list    ${words}   1
    @{words}=   split string    ${text}
    ${email}=    get from list    ${words}   0
    log    ${email}
    set global variable     ${email}

Switch to parent window and enter the email
    switch window    MAIN
    title should be    LoginPage Practise | Rahul Shetty Academy
    input text  id:username     ${email}