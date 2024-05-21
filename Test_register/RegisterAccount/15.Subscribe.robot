*** Settings ***
#Fax:thông tin trống,~,0,1qa,TDTU
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://automationteststore.com
${BROWSER}       Chrome
${Page Index}    https://automationteststore.com/
${Page Swap-1}   https://automationteststore.com/index.php?rt=account/login
${Page Swap-2}   https://automationteststore.com/index.php?rt=account/create
*** Test Cases ***


Register with the Register field blank then check closely

    [Documentation]    đăng kí với trường Subscribe rỗng sau đó kiểm tra ràng buộc 
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email     ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    1234567890
    Input Text    id=AccountFrm_company    Tôn Đức Thắng University
    Input Text    id=AccountFrm_address_1    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_address_2    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_city    Ho Chi Minh City


    Select From List by Label    id=AccountFrm_country_id    Viet Nam
    Sleep    10seconds
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City
    Input Text    id=AccountFrm_postcode    12345
    
    Input Text    id=AccountFrm_loginname   test${random_string}
    Input Text    id=AccountFrm_password    pass123
    Input Text    id=AccountFrm_confirm    pass123

    #Click Element    xpath=//*[@id="AccountFrm_newsletter1"]
    #Sleep    3s
    #Click Element    xpath=//*[@id="AccountFrm_newsletter0"]
    #Sleep    3s

    #Click Element    xpath=//*[@id="AccountFrm_agree"]
    # Bước 3: Xác nhận và đăng kí
    #Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    #Sleep    10s

    

   

    #Region / State:
    

    #Zip
    


    #Error
    Wait Until Element Is Visible    xpath=/html/body/div/div[2]/div/div/div/div[1]   timeout=5s

    ${message}=    Get Text    xpath=/html/body/div/div[2]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    #Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*
    Fail    Test Case Failed due to validation error.

    # Bước 4: Đóng trình duyệt
    Close Browser

Register with Subscribe as yes then check the constraints
    [Documentation]    đăng kí với trường Subscribe với giá trị là "yes" sau đó kiểm tra ràng buộc 
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email     ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    1234567890
    Input Text    id=AccountFrm_company    Tôn Đức Thắng University
    Input Text    id=AccountFrm_address_1    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_address_2    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_city    Ho Chi Minh City


    Select From List by Label    id=AccountFrm_country_id    Viet Nam
    Sleep    10seconds
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City
    Input Text    id=AccountFrm_postcode    12345
    
    Input Text    id=AccountFrm_loginname   test${random_string}
    Input Text    id=AccountFrm_password    pass123
    Input Text    id=AccountFrm_confirm    pass123

    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]
    #Sleep    3s
    #Click Element    xpath=//*[@id="AccountFrm_newsletter0"]
    #Sleep    3s

    #Click Element    xpath=//*[@id="AccountFrm_agree"]
    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    

    #Zip
    


    #Error
    Wait Until Element Is Visible    xpath=/html/body/div/div[2]/div/div/div/div[1]   timeout=5s

    ${message}=    Get Text    xpath=/html/body/div/div[2]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    #Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*
    Fail    Test Case Failed due to validation error.

    # Bước 4: Đóng trình duyệt
    Close Browser

Register with Subscribe as no then check the constraints
    [Documentation]    đăng kí với trường Subscribe với giá trị là "no" sau đó kiểm tra ràng buộc 
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email     ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    1234567890
    Input Text    id=AccountFrm_company    Tôn Đức Thắng University
    Input Text    id=AccountFrm_address_1    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_address_2    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_city    Ho Chi Minh City


    Select From List by Label    id=AccountFrm_country_id    Viet Nam
    Sleep    10seconds
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City
    Input Text    id=AccountFrm_postcode    12345
    
    Input Text    id=AccountFrm_loginname   test${random_string}
    Input Text    id=AccountFrm_password    pass123
    Input Text    id=AccountFrm_confirm    pass123

    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]
    #Sleep    3s
    #Click Element    xpath=//*[@id="AccountFrm_newsletter0"]
    #Sleep    3s

    #Click Element    xpath=//*[@id="AccountFrm_agree"]
    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    

    #Zip
    


    #Error
    Wait Until Element Is Visible    xpath=/html/body/div/div[2]/div/div/div/div[1]   timeout=5s

    ${message}=    Get Text    xpath=/html/body/div/div[2]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    #Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*
    Fail    Test Case Failed due to validation error.

    # Bước 4: Đóng trình duyệt
    Close Browser