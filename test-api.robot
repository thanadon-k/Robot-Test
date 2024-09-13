*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://127.0.0.1:8080

*** Test Cases ***
Add Two Numbers
    [Tags]    API
    ${response}=    GET    ${BASE_URL}/plus/5/6
    Status Should Be    200
    ${json}=    Set Variable    ${response.json()}
    ${result}=    Get From Dictionary    ${json}    sum
    Should Be Equal As Numbers    ${result}    11

Invalid Parameters Should Return Error
    [Tags]    API
    ${response}=    GET    ${BASE_URL}/plus/foo/bar
    Status Should Be    400
    ${json}=    Set Variable    ${response.json()}
    ${error}=    Get From Dictionary    ${json}    error
    Should Be Equal    ${error}    parameters are not numbers
