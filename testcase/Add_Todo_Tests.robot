*** Settings ***
Library    Browser

*** Variables ***
${DEFAULT_BROWSER}    chromium

*** Test Cases ***
Add new todo item
    Open browser to test page
    Click    text=Add
    Fill Text    id=id_name    Test001
    Click    css=button[type="submit"]
    Wait For Elements State    text=Test001    visible
    Click    text=Done

*** Keywords ***
Open browser to test page
    # log   ${URL}
    # ${URL}=        Set Variable    https://default-url.com/
    ${BROWSER}=    Get Variable Value    ${BROWSER}    ${DEFAULT_BROWSER}
    ${HEADLESS}=   Get Variable Value    ${HEADLESS}    False
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page    ${URL}
# robot -v URL:http://127.0.0.1:8000/ -v HEADLESS:True -d results testcase/Add_Todo_Tests.robot