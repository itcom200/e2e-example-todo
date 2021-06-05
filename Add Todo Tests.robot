*** Settings ***
Library    PuppeteerLibrary    

*** Variables ***
${DEFAULT_BROWSER}    pwchrome

*** Test Cases ***
Add new todo item
    Open browser to test page
    Run Async Keywords
    ...    Wait For Navigation    AND
    ...    Click Element    css=a[href="/add"]
    Input Text    id=id_name    Test001    
    Run Async Keywords
    ...    Wait For Navigation    AND
    ...    Click Element    css=button[type="submit"]    
    Wait Until Page Contains    Test001
    Click Element    css=a[href*="/done"]
    

*** Keywords ***
Open browser to test page
    [Arguments]    ${url}
    ${URL} =        Get variable value    ${URL}        https://django-demo-qahive.herokuapp.com/
    ${BROWSER} =    Get variable value    ${BROWSER}    ${DEFAULT_BROWSER}
    ${HEADLESS} =   Get variable value    ${HEADLESS}    ${False}
    &{options} =    create dictionary   headless=${HEADLESS}
    Open browser    ${url}    browser=${BROWSER}   options=${options}
