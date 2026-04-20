*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Keywords ***
Create API Session
    Create Session    json    https://jsonplaceholder.typicode.com

Get Post By Id
    [Arguments]    ${post_id}
    ${res}=    GET On Session    json    /posts/${post_id}
    RETURN    ${res}

Create Post
    [Arguments]    ${payload}
    ${res}=    POST On Session    json    /posts    json=${payload}
    RETURN    ${res}

Status Should Be
    [Arguments]    ${expected}    ${response}
    Should Be Equal As Integers    ${response.status_code}    ${expected}

Validate Id Exists
    [Arguments]    ${response}
    Dictionary Should Contain Key    ${response.json()}    id