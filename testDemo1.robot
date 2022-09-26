*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown   close browser
#Resource
#selenium
# robot support : id, xpath and css

*** Variables ***
${errorMessageLogin}        css:div.alert-danger

*** Test Cases ***
Validate UnSuccesful Login
    open the browser with the Mortagage
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortagage
    create webdriver    Chrome  C:\Users\akapa\Documents\chromedriver
    go to    https://www.rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    input text          id:username     Akshay
    input password      id:password     mypassword
    click button        signInBtn

wait until it checks and display error message
    wait until element is visible    ${errorMessageLogin}

verify error message is correct
   ${result}=   get text    ${errorMessageLogin}
   should be equal as strings    ${result}  Incorrect username/password.
   element text should be    ${errorMessageLogin}   Incorrect username/password.