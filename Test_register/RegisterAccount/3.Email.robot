*** Settings ***
#testemail : 0 thông tin, a, admin@gmail.haha, admin.com,admin@gmail.com
Library    SeleniumLibrary
Library    String

*** Variables ***

${URL}    https://automationteststore.com
${BROWSER}       Chrome
${Page Index}    https://automationteststore.com/
${Page Swap-1}   https://automationteststore.com/index.php?rt=account/login
${Page Swap-2}   https://automationteststore.com/index.php?rt=account/create
*** Test Cases ***
Register with the Email field having no characters (empty) and check the constraint:    [Documentation]    Đăng ký với trường Email không có ký tự nào (rỗng) và kiểm tra ràng buộc:
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    #first name
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LastName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.    Log    Email rỗng  

    # Bước 4: Đóng trình duyệt
    Close Browser



Register with valid Email field and check the constraint: 
    [Documentation]    Đăng ký với trường Email hợp lệ và kiểm tra ràng buộc:
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email


    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field without the "@" character: and check the force
    [Documentation]    Đăng kí với trường Email Address không có ký tự "@": và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    exampleexample.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field without domain: and check the binding
    [Documentation]    Đăng kí với trường Email Address không có domain: và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field without the local-part: part and check the binding
    [Documentation]    Đăng kí với trường Email Address không có phần local-part:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    @example.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field having the "@" character and domain but missing the local-part: and binding check
    [Documentation]    Đăng kí với trường  Email Address có ký tự "@" và domain nhưng thiếu local-part:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    @example



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field containing the "@" character but the domain is missing: and check the binding
    [Documentation]    Đăng kí với trường  Email Address có ký tự "@" nhưng domain thiếu:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field having the "@" character and the domain correct, but the local-part is missing the : and binding checks
    [Documentation]    Đăng kí với trường Email Address có ký tự "@" và domain đúng, nhưng local-part thiếu: và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field containing malformed special characters: and check the constraint
    [Documentation]    Đăng kí với trường Email Address chứa ký tự đặc biệt sai định dạng:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example!@example.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*

    Fail    Test Case Failed due to validation error.
    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field having the "@" character and the correct domain, valid local-part but with invalid spaces: and check the constraint
    [Documentation]    Đăng kí với trường Email Address có ký tự "@" và domain đúng, local-part hợp lệ nhưng có khoảng trắng không hợp lệ:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    exam ple@example.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser

Register with the Email Address field having the "@" character and the correct domain, valid local-part but missing the: character and check the constraint
    [Documentation]    Đăng kí với trường Email Address có ký tự "@" và domain đúng, local-part hợp lệ nhưng thiếu ký tự:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    #FirstName
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    e@example.com



    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    



    #Email

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser

