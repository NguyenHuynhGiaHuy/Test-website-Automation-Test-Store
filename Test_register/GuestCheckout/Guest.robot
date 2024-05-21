*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String


*** Variables ***

${URL}    https://automationteststore.com/index.php?rt=account/login
${BROWSER}       Chrome
${Page Index}    https://automationteststore.com/
${Page Swap-1}   https://automationteststore.com/index.php?rt=account/login
${Page Swap-2}   https://automationteststore.com/index.php?rt=account/create
*** Test Cases ***
Check the accuracy of the error message:
    [Documentation]    (rỗng):(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) Kiểm tra tính chính xác của lỗi thông báo:
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1

    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.
    [Teardown]    Close Browser


Check entering personal information: Verify Name: Check if entering First Name is too short in length.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực Tên: Kiểm tra nhập First Name với độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    Li

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.




Check entering personal information: Verify Name: Check if entering First Name is too long.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực Tên: Kiểm tra nhập First Name với độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    Christopher Washington Jefferson Vanderbilt

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.





Check entering personal information: First Name Validation: Check entering First Name with valid length.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực Tên: Kiểm tra việc nhập Tên có độ dài hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    Elizabeth Montgomery Vanderbilt

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





Check the entry of personal information: Verify last name:Select to enter a Last Name of a valid length.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác minh họ:Chọn để nhập Họ có độ dài hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check the entry of personal information: Verify last name: Check if the last name entered is too short in length.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Verify họ:Kiểm tra họ nhập vào với độ dài quá ngắn. 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jo

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.





Check entering personal information: Verify last name: Check entering Last Name with too long length.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Verify họ:Kiểm tra nhập Last Name với độ dài quá dài
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Elizabeth Montgomery Vanderbilt-Elizabeth Montgomery Vanderbilt

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    
    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    Fail    Test Case Failed due to validation error.



Check entering personal information: E-Mail Validation: Check entering E-Mail with a invalid address.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: E-Mail Validation:Kiểm tra nhập E-Mail với địa chỉ không hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    example@gmail
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email


    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    Fail    Test Case Failed due to validation error.



Check entering personal information: E-Mail Validation: Check entering E-Mail with valid address.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: E-Mail Validation:Kiểm tra nhập E-Mail với địa chỉ hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    example@gmail.com
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


Check the entry of personal information: Telephone Validation: Check that the phone number is entered in a valid format.
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực điện thoại: Kiểm tra xem số điện thoại được nhập có định dạng hợp lệ
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]

    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email


    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}



Check the entry of personal information: Fax Validation (if any): Check that the fax number entered has a valid format
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Fax Validation (nếu có):Kiểm tra xem số fax được nhập có định dạng hợp lệ 

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email


    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check the entry of company information and address: Validate the company: Check that the entry of the company name is in a valid format.
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ công ty: Xác thực công ty: Kiểm tra việc nhập tên công ty có định dạng hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email


    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}



Check entering information and address: Verify address 1: Check to enter address 1 with a valid length.
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ: Xác thực địa chỉ 1: Kiểm tra để nhập địa chỉ 1 với độ dài hợp lệ. 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email


    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}



Check entering information and address: Verify address 1: Check for entering address 1 with a length that is too short.
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ: Xác thực địa chỉ 1: Kiểm tra nhập địa chỉ 1 với độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    Fail    Test Case Failed due to validation error.


Check entering information and address: Verify address 1: Check for entering address 1 with a length that is too long.
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ: Xác thực địa chỉ 1: Kiểm tra nhập địa chỉ 1 với độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh-19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành--19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh phố Hồ Chí Minh    
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    Fail    Test Case Failed due to validation error.



Check the information and entered address: Verify address 2 (if any): Check enter address 2 with valid format.
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: Xác thực địa chỉ 2 (nếu có): Kiểm tra nhập địa chỉ 2 với định dạng hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    


    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


Check information and entered address: City Validation: Check city input with valid length.
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: City Validation: Kiểm tra nhập thành phố với độ dài hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address

    #City:


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check information and entered address: City Validation: Check import city with length too short.
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: City Validation: Kiểm tra nhập thành phố với độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    HC
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.





Check information and entered address: City Validation: Check input city with too long length.
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: City Validation: Kiểm tra nhập thành phố với độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh Hồ Chí Minh
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.

Check information and input address: Country Selection: Check select a valid country from the list.
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: Lựa chọn quốc gia: Kiểm tra chọn một quốc gia hợp lệ từ danh sách.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check input information and addresses: Validate Region/State: Check valid selection of region/state from the list.
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác thực Vùng/Tiểu bang: Kiểm tra lựa chọn hợp lệ của vùng/tiểu bang từ danh sách.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id    Ho Chi Minh City

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


Check input information and addresses: Validate Region/State: Check when region/state is not selected.
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác thực Vùng/Tiểu bang: Kiểm tra khi vùng/tiểu bang không được chọn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     --- Please Select --- 

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.



Check input information and address: Verify ZIP/Postal code: Check input Zip/Post Code with valid format.
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác minh mã ZIP/Bưu điện: Kiểm tra mã Zip/mã bưu điện đầu vào có định dạng hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City
    Input Text    id=guestFrm_postcode    19008
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:



Check input information and address: Verify ZIP/Postal code: Check input Zip/Post Code with too short length.
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác minh mã ZIP/Bưu điện: Kiểm tra Mã Zip/Bưu điện đầu vào có độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.




Check input information and address: Verify ZIP/Postal code: Check input Zip/Post Code with too long length.
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác minh mã ZIP/Bưu điện: Kiểm tra mã Zip/Post Code đầu vào có độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City
    Input Text    id=guestFrm_postcode    1231321321321321321321321323213123
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:

    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.

Check format validity if you have a separate shipping address.
    [Documentation]    Kiểm tra hợp lệ định dạng nếu bạn có địa chỉ giao hàng riêng.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[1]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}    

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





Check entering personal information: Verify Name: Check if entering First Name is too short in length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực Tên: Kiểm tra nhập First Name với độ dài quá ngắn.
     Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    Jo




    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[1]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}    

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.


Check entering personal information: Verify Name: Check if entering First Name is too long in length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực Tên: Kiểm tra nhập First Name với độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    Christopher Washington Jefferson Vanderbilt




    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[1]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}    

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.

Check entering personal information: First Name Validation: Check entering First Name with valid length.(Check here if you have a separate shipping address.)    
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác thực Tên: Kiểm tra việc nhập Tên có độ dài hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John




    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name


    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check the entry of personal information: Verify last name:Select to enter a Last Name of a valid length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác minh họ:Chọn để nhập Họ có độ dài hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jo


    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name


    #Last Name:


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check the entry of personal information: Verify last name: Check if the last name entered is too short in length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác minh họ:Chọn để nhập Họ có độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jo


    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name


    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.






Check entering personal information: Verify last name: Check entering Last Name with too long length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Xác minh họ:Chọn để nhập Họ có độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Elizabeth Montgomery Vanderbilt-Elizabeth Montgomery Vanderbilt


    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name


    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.


Check the entry of company information and address: Validate the company: Check that the entry of the company name is in a valid format.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin cá nhân: Fax Validation (nếu có):Kiểm tra xem số fax được nhập có định dạng hợp lệ 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng


    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address
    #first name


    #Last Name:


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


Check entering information and address: Verify address 1: Check to enter address 1 with a valid length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ: Xác thực địa chỉ 1: Kiểm tra để nhập địa chỉ 1 với độ dài hợp lệ. 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Elizabeth Montgomery Vanderbilt-Elizabeth Montgomery Vanderbilt
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #address

    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}



Check entering information and address: Verify address 1: Check for entering address 1 with a length that is too short.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ: Xác thực địa chỉ 1: Kiểm tra nhập địa chỉ 1 với độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.




Check entering information and address: Verify address 1: Check for entering address 1 with a length that is too long.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra việc nhập thông tin và địa chỉ: Xác thực địa chỉ 1: Kiểm tra nhập địa chỉ 1 với độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa,22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa,22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.


Check the information and entered address: Verify address 2 (if any): Check enter address 2 with valid format.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: Xác thực địa chỉ 2 (nếu có): Kiểm tra nhập địa chỉ 2 với định dạng hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa,22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa,22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa


    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${expected_message}=    Set Variable    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





Check information and entered address: City Validation: Check city input with valid length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: City Validation: Kiểm tra nhập thành phố với độ dài hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.






Check information and entered address: City Validation: Check import city with length too short.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: City Validation: Kiểm tra nhập thành phố với độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nh

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.




Check information and entered address: City Validation: Check input city with too long length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: City Validation: Kiểm tra nhập thành phố với độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang-Nha Trang

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message} 

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.



Check information and input address: Country Selection: Check select a valid country from the list.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ nhập: Lựa chọn quốc gia: Kiểm tra chọn một quốc gia hợp lệ từ danh sách.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    Select From List by Label    id=guestFrm_shipping_country_id    Viet Nam

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check input information and addresses: Validate Region/State: Check valid selection of region/state from the list.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác thực Vùng/Tiểu bang: Kiểm tra lựa chọn hợp lệ của vùng/tiểu bang từ danh sách.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    Select From List by Label    id=guestFrm_shipping_country_id    Viet Nam
    Select From List by Label    id=guestFrm_shipping_zone_id    Dong Thap



    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




Check input information and addresses: Validate Region/State: Check when region/state is not selected.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác thực Vùng/Tiểu bang: Kiểm tra khi vùng/tiểu bang không được chọn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    Select From List by Label    id=guestFrm_shipping_country_id    Viet Nam
    Select From List by Label    id=guestFrm_shipping_zone_id    --- Please Select ---



    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 
    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.



Check input information and address: Verify ZIP/Postal code: Check input Zip/Post Code with valid format.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác minh mã ZIP/Bưu điện: Kiểm tra mã Zip/mã bưu điện đầu vào có định dạng hợp lệ.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    Select From List by Label    id=guestFrm_shipping_country_id    Viet Nam
    Select From List by Label    id=guestFrm_shipping_zone_id    Dong Thap

    Input Text    id=guestFrm_shipping_postcode    190079

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:

    #ZIP/Post Code:



Check input information and address: Verify ZIP/Postal code: Check input Zip/Post Code with too short length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác minh mã ZIP/Bưu điện: Kiểm tra Mã Zip/Bưu điện đầu vào có độ dài quá ngắn.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    Select From List by Label    id=guestFrm_shipping_country_id    Viet Nam
    Select From List by Label    id=guestFrm_shipping_zone_id    Dong Thap

    Input Text    id=guestFrm_shipping_postcode    19

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.




Check input information and address: Verify ZIP/Postal code: Check input Zip/Post Code with too long length.(Check here if you have a separate shipping address.)
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác minh mã ZIP/Bưu điện: Kiểm tra Mã Zip/Bưu điện đầu vào có độ dài quá dài.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang

    Select From List by Label    id=guestFrm_shipping_country_id    Viet Nam
    Select From List by Label    id=guestFrm_shipping_zone_id    Dong Thap

    Input Text    id=guestFrm_shipping_postcode    190079190079

    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city


    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    Fail    Test Case Failed due to validation error.

























































































































































































































































































































































