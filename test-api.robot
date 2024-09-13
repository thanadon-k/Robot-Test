*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       http://localhost:8080

*** Test Cases ***
Add Two Numbers
    [Tags]    API
    ${response}=    GET    ${BASE_URL}/plus/5/6
    Status Should Be    200
    Dictionary Should Contain Value    ${response.json()}    11

Invalid Parameters Should Return Error
    [Tags]    API
    ${response}=    GET    ${BASE_URL}/plus/foo/bar
    Status Should Be    400
    Dictionary Should Contain Value    ${response.json()}    parameters are not numbers
