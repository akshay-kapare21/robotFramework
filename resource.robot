*** Settings ***
Documentation    A resource file with resuable keyword and variables.
...              The system specific keyword
Library    SeleniumLibrary
*** Variables ***
${userName}         rahulshettyacademy
${userInvalidPassword}     mypassword
${userValidPassword}     learning
${url}              https://www.rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
open the browser with the Mortagage
    create webdriver    Chrome  C:\Users\akapa\Documents\chromedriver
    go to    ${url}
Close browser session
    close browser