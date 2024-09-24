*** Settings ***
Library           RequestsLibrary

Suite Setup       Create Session  testapi  http://localhost:8080

*** Test Cases ***

Should return the sum of two numbers
    ${response}=    GET On Session  testapi  /plus/5/10
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json_response['num1']}    5
    Should Be Equal As Numbers    ${json_response['num2']}    10
    Should Be Equal As Numbers    ${json_response['sum']}    15

Should return an error if the expression of two numbers is not valid
    ${response}=    GET On Session  testapi  /plus/text/text  expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json_response['error']}    parameters are not valid numbers

Should return an error if parameters are not numbers
    ${response}=    GET On Session  testapi  /plus/text/text  expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json_response['error']}    parameters are not valid numbers
