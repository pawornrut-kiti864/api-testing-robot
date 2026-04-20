*** Settings ***
Library           Collections
Variables         ../data/testdata.py
Resource          ../keywords/api_keywords.robot

Suite Setup       Create API Session

*** Test Cases ***
Get Posts - Data Driven
    FOR    ${id}    IN    @{TEST_POST_IDS}
        ${res}=    Get Post By Id    ${id}
        Status Should Be    200    ${res}
    END

Create Posts - Data Driven
    FOR    ${data}    IN    @{CREATE_POST_DATA}
        ${res}=    Create Post    ${data}
        Status Should Be    201    ${res}
        Validate Id Exists    ${res}
    END