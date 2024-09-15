*** Settings ***
Library           RequestsLibrary

Suite Setup       Create Session  testapi  http://localhost:8080

*** Test Cases ***

Test Plus Endpoint
    ${response}=    GET On Session  testapi  /plus/5/10
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json_response['num1']}    5
    Should Be Equal As Numbers    ${json_response['num2']}    10
    Should Be Equal As Numbers    ${json_response['sum']}    15

Add Two Numbers With Invalid Parameters Should Return Error
    ${response}=    GET On Session  testapi  /plus/text/text  expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    Should Be Equal As Strings    ${response.json()['error']}    parameters are not numbers
