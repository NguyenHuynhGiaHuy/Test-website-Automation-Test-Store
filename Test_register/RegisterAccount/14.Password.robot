*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://automationteststore.com
${BROWSER}       Chrome
${Page Index}    https://automationteststore.com/
${Page Swap-1}   https://automationteststore.com/index.php?rt=account/login
${Page Swap-2}   https://automationteststore.com/index.php?rt=account/create
*** Test Cases ***
Register with the Password having no characters (empty) and check the constraint: [Documentation] Đăng ký với trường Password không có ký tự nào (rỗng) và kiểm tra ràng buộc:
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


    # Bước 4: Đóng trình duyệt
    Close Browser



Register with the Password field of minimum length and containing only alphanumeric characters: and check the constraint
    [Documentation]    Đăng kí với trường Password đạt độ dài tối thiểu và chỉ chứa ký tự chữ cái và số: và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
    #first name
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    pass123


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    

    #Zip
    

    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


Register with a Password field longer than 20 characters: and check the constraints
    [Documentation]   Đăng kí với trường Password dài hơn 20 ký tự:và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
    #first name
    #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    thisisalongpasswordthatisdefinitelymorethan20characterslong


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
 


    #Zip
    
    #LoginName

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


Register with the Password field shorter than 4 characters: and check the constraints
    [Documentation]   Đăng kí với trường  Password ngắn hơn 4 ký tự: và kiểm tra ràng buộc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    abc


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
   


    #Zip
   

    #LoginName
   
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


Register with the Password field containing special characters: and check the constraints

    [Documentation]   Đăng kí với trường Password chứa ký tự đặc biệt:và kiểm tra ràng buộc

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    pass!@#123


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
   

    #Zip
   

    #LoginName
    

    


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


Register with the Password field containing only special characters and check the constraints
    [Documentation]   Đăng kí với trường Password chỉ chứa ký tự đặc biệt và kiểm tra ràng buộc

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    $%^&*_*&%


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    

    #Zip
   
    #LoginName
  



    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


Register with the Password field less than 5 characters in length: and check the constraint
    [Documentation]   Đăng kí với trường  Password có độ dài nhỏ hơn 5 ký tự: và kiểm tra ràng buộc

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    ha ha ha


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    


    #Zip
   

    #LoginName
    


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser

Register with a Password field that has a combination of letters, numbers and special characters, of all length: and check the constraints
    [Documentation]   Đăng kí với trường  Password có kết hợp ký tự chữ cái, số và ký tự đặc biệt, đủ độ dài:và kiểm tra ràng buộc


    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    P@ssw0rd!


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    


    #Zip
   

    #LoginName
    



    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser



Register with the Password field exactly 4 characters long: and check the constraints

    [Documentation]  Đăng kí với trường Password có độ dài chính xác 4 ký tự:và kiểm tra ràng buộc

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
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
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    pass


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    

    #Zip
   




    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser



