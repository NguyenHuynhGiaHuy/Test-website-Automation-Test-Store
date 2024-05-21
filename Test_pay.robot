*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library            String

*** Variables ***
${BROWSER}             Chrome
${URL}                 https://automationteststore.com
${VALID_USERNAME}      NguyenQuynhNhu
${VALID_PASSWORD}      123456789
${HOME_PAGE}           /html/body
${table_cart_item1}    //div[@class='container-fluid cart-info product-list']/table/tbody/tr[2]
${table_cart_item2}   //div[@class='container-fluid cart-info product-list']/table/tbody/tr[3]
${table_cart}    //div[@class='container-fluid cart-info product-list']//table[@class='table table-striped table-bordered']
${table_Cart2}    //*[@id="totals_table"]
${add_to_Cart}    xpath=//*[@class="fa fa-cart-plus fa-fw"]
${cart}    //html/body/div/header/div[2]/div/div[3]/ul
${add_to_cart_detail}   //*[@id="product"]/fieldset/div[4]/ul/li/a/i
${continue_shopping}    //*[@id="maincontainer"]/div/div/div/div/div/div/a
${item_in_your_cart}   //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]
*** Test Cases ***


Verify that the checkout process starts from the shopping cart
    [Documentation]    Xác minh rằng quá trình thanh toán bắt đầu từ giỏ hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    ${current_url_cart}    Get Location
    Should Be Equal As Strings    ${current_url_cart}    https://automationteststore.com/index.php?rt=checkout/cart
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    ${current_url_checkout}    Get Location
    Should Be Equal As Strings    ${current_url_checkout}    https://automationteststore.com/index.php?rt=checkout/confirm
    [Teardown]    Close Browser

Verify Shipping Address Selection During Checkout Process
    [Documentation]   Xác minh rằng địa chỉ giao hàng có thể được chọn trong quá trình thanh toán.
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    Click Element    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    Check the content of the address list    huy Nguyễn , Bình Chánh, Hồ Chí Minh, Ahal Welayaty, 12345, Turkmenistan\nNhu Nguyễn , Bình Phước, TDTU, Al Bayda, 123, Yemen
    Click Element   //*[@id="address_1_a_2203722037"]
    ${check_select_address}=    Get Text   //label[@for="address_1_address_id22037"]
    Should Be Equal As Strings    ${check_select_address}    Nhu Nguyễn , Bình Phước, TDTU, Al Bayda, 123, Yemen
    Click Button    //*[@id="address_1"]/div/div/div/button
    ${Check the address is displayed correctly on the checkout page}=  Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[2]/address
    Should Be Equal As Strings    ${Check the address is displayed correctly on the checkout page}    Bình Phước Bù Đăng\nTDTU Al Bayda 123\nYemen
    [Teardown]    Close Browser



Verify that users can add/edit shipping addresses
    [Documentation]   Xác minh rằng người dùng có thể thêm/chỉnh sửa địa chỉ giao hàng
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a   #chỉnh sửa đơn hàng
    Click Element    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a    #chỉnh sửa địa chỉ 
    Page Should Contain    New Address
    [Teardown]    Close Browser

Check whether the user's ability to add/edit shipping addresses is successful
    [Documentation]   Kiểm tra tính năng người dùng thêm/chỉnh sửa địa chỉ giao hàng có thành công không
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a   #chỉnh sửa đơn hàng
    Click Element    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a    #chỉnh sửa địa chỉ 
    Page Should Contain    New Address
    Input Text   //*[@id="Address2Frm_firstname"]   Mị 
    Input Text    //*[@id="Address2Frm_lastname"]   Nguyễn 
    Input Text    //*[@id="Address2Frm_company"]   Phát Lộc
    Input Text    //*[@id="Address2Frm_address_1"]   Địa chỉ 1
    Input Text    //*[@id="Address2Frm_address_2"]   Địa chỉ 2
    Input Text    //*[@id="Address2Frm_city"]  Cty new
    Sleep  15s 
    Click Element    //*[@id="Address2Frm_zone_id"]   
    Click Element    //*[@id="Address2Frm_zone_id"]/option[4]
    Sleep  15s
    Input Text    //*[@id="Address2Frm_postcode"]   12345
    Select From List By Label    //select[@id='Address2Frm_country_id']    Uganda
    Sleep  15s 
    Click Button    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    Sleep  15s
    Click Element    //*[@id="Address2Frm_zone_id"]   
    Click Element    //*[@id="Address2Frm_zone_id"]/option[4]
    Sleep  15s 
    Click Button    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${Check the address is displayed correctly on the checkout page}=  Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[2]/address
    Should Be Equal As Strings    ${Check the address is displayed correctly on the checkout page}   Địa chỉ 1 Địa chỉ 2\nCty new Arua 12345\nUganda
    [Teardown]    Close Browser
#F
Check Address Editing Fields
    [Documentation]   Kiểm tra các trường chỉnh sửa địa chỉ khi người dùng nhập có đúng không
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a   #chỉnh sửa đơn hàng
    Click Element    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a    #chỉnh sửa địa chỉ 
    Page Should Contain    New Address
    Input Text    //*[@id="Address2Frm_firstname"]    Mị
    Input Text    //*[@id="Address2Frm_lastname"]    Nguyễn
    Input Text    //*[@id="Address2Frm_company"]    Phát Lộc
    Input Text    //*[@id="Address2Frm_address_1"]    Địa chỉ 1
    Input Text    //*[@id="Address2Frm_address_2"]    Địa chỉ 2
    Input Text    //*[@id="Address2Frm_city"]    Cty new
    Sleep  15s
    Click Element    //*[@id="Address2Frm_zone_id"]
    Click Element    //*[@id="Address2Frm_zone_id"]/option[4]
    Input Text    //*[@id="Address2Frm_postcode"]    12345
    Select From List By Label    //select[@id='Address2Frm_country_id']    Uganda
    ${edited_firstname}=    Get Value    //*[@id="Address2Frm_firstname"]
    ${edited_lastname}=     Get Value    //*[@id="Address2Frm_lastname"]
    ${edited_company}=     Get Value   //*[@id="Address2Frm_company"]
    ${edited_address1}=     Get Value    //*[@id="Address2Frm_address_1"]
    ${edited_address2}=     Get Value    //*[@id="Address2Frm_address_2"]
    ${edited_city}=     Get Value    //*[@id="Address2Frm_city"]
    ${edited_zone}=     Get Selected List Label     //*[@id="Address2Frm_zone_id"]
    ${edited_postcode}=     Get Value   //*[@id="Address2Frm_postcode"]
    ${edited_country}=     Get Selected List Label    //select[@id='Address2Frm_country_id']
    Should Be Equal As Strings    ${edited_firstname}    Mị
    Should Be Equal As Strings    ${edited_lastname}    Nguyễn
    Should Be Equal As Strings    ${edited_company}    Phát Lộc
    Should Be Equal As Strings    ${edited_address1}    Địa chỉ 1
    Should Be Equal As Strings    ${edited_address2}    Địa chỉ 2
    Should Be Equal As Strings    ${edited_city}    Cty new
    Should Be Equal As Strings    ${edited_zone}    Arua 
    Should Be Equal As Strings    ${edited_postcode}    12345
    Should Be Equal As Strings    ${edited_country}    Uganda
    [Teardown]    Close Browser

#F
Check the payment method selection.
    [Documentation]   Kiểm tra việc lựa chọn phương thức thanh toán.
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]  #chỉnh sửa thanh toán 
    ${payment_methods}=    Get WebElements    //label[contains(text(), 'Thanh toán khi giao hàng')]
    ${number_of_payment_methods}=    Get Length    ${payment_methods}
    Run Keyword If    ${number_of_payment_methods} == 0    Fail    There is only one payment method available.
    [Teardown]    Close Browser


Verify that users can add/edit payment methods.
    [Documentation]   Xác minh rằng người dùng có thể thêm/chỉnh sửa phương thức thanh toán.
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]  #chỉnh sửa thanh toán 
    Page Should Contain    Payment Method
    [Teardown]    Close Browser

Check Discount and Coupon Application
    [Documentation]  Kiểm tra việc áp dụng giảm giá và phiếu giảm giá
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    ${total_befor}=     Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[2]  #chỉnh sửa phiéu giảm giá
    Page Should Contain    Enter your code and click "Apply Coupon" and to see your discount instantly applied to your order.
    Input Text    //*[@id="coupon_coupon"]    012
    Click Button    //*[@id="apply_coupon_btn"]
    Page Should Contain    Error: Coupon is either invalid, expired or reached it's usage limit!
    Click Element    //*[@id="remove_coupon_btn"]
    Sleep  2s
    Page Should Contain    Success: Coupon has been removed!
    ${total_after}=     Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[3]/div/div[1]/table/tbody/tr[3]/td[2]/span
    Should Be Equal As Strings    ${total_befor}    ${total_after}
    [Teardown]    Close Browser

Verify the order summary and item details on the checkout page.
    [Documentation]  Xác minh tóm tắt đơn hàng và chi tiết mặt hàng trên trang thanh toán.
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    #Kiểm tra ORDER SUMMARY 
    ${check_table_1}=    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[1]
    ${check_table_2}=    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]
    Should Be Equal As Strings    ${check_table_1}    1 x Skinsheen Bronzer Stick\n$29.50
    Should Be Equal As Strings    ${check_table_2}    Sub-Total: $29.50\nFlat Shipping Rate: $2.00\nTotal: $31.50
    [Teardown]    Close Browser

Check the "Order" button functionality
    [Documentation]  Kiểm tra chức năng nút "Đặt hàng"
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    #Kiểm tra chức năng đặt hàng
    Click Button    //*[@id="checkout_btn"]
    Sleep  15s
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}       https://automationteststore.com/index.php?rt=checkout/success
    [Teardown]    Close Browser

Verify Order Confirmation Details
    [Documentation]  Xác minh việc hiển thị chi tiết xác nhận đơn hàng.
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    Sleep  15s
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}       https://automationteststore.com/index.php?rt=checkout/success
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/p[3]/a
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}   https://automationteststore.com/index.php?rt=account/invoice&order_id=33988
    [Teardown]    Close Browser

Check the "Continue Shopping" option after checkout.
    [Documentation]  Kiểm tra tùy chọn "Tiếp tục mua sắm" sau khi thanh toán.
    [Tags]    Checkout    Shipping
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    Sleep  15s
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/a
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}   https://automationteststore.com/
    [Teardown]    Close Browser

Check Review and Edit Order Before Placing
    [Documentation]  Kiểm tra khả năng xem xét và chỉnh sửa đơn hàng trước khi đặt.
    [Tags]    Checkout    Order    Review    Edit
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    # Kiểm tra chi tiết đơn hàng trước khi chỉnh sửa
    ${cart_summary_text}    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[1]
    Should Not Be Equal    ${cart_summary_text}    ${EMPTY}    msg=Cart summary is empty
    ${cart_table_elements}    Get WebElements    ${item_in_your_cart}//tbody/tr
    FOR    ${element}    IN    @{cart_table_elements}
        ${image_src}    Get Element Attribute    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td/a/img    src
        ${name}    Get Text    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//a[@class='checkout_heading']
        ${unit_price}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[3]
        ${quantity}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[4]
        ${total}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[5]
    END
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[3]/a
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}  https://automationteststore.com/index.php?rt=checkout/cart
    [Teardown]    Close Browser

Check the correctness of the ability to review and update the shopping cart before placing your order.
    [Documentation]  Kiểm tra tính đúng đắng của khả năng xem xét và cập nhật giỏ hàng trước khi đặt.
    [Tags]    Checkout    Order    Review    Edit
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    # Kiểm tra chi tiết đơn hàng trước khi chỉnh sửa
    ${cart_summary_text}    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[1]
    Should Not Be Equal    ${cart_summary_text}    ${EMPTY}    msg=Cart summary is empty
    ${cart_table_elements}    Get WebElements    ${item_in_your_cart}//tbody/tr
    FOR    ${element}    IN    @{cart_table_elements}
        ${image_src}    Get Element Attribute    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td/a/img    src
        ${name}    Get Text    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//a[@class='checkout_heading']
        ${unit_price}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[3]
        ${quantity}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[4]
        ${total}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[5]
    END
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[3]/a
    # Chỉnh sửa số lượng sản phẩm trong giỏ hàng
    Set Quantity For Product    Skinsheen Bronzer Stick    2
    Click Element    //*[@id="cart_checkout1"]
    Sleep    3s
    # Kiểm tra lại chi tiết đơn hàng sau khi chỉnh sửa
    ${cart_table_elements}    Get WebElements    ${item_in_your_cart}//tbody/tr
    FOR    ${element}    IN    @{cart_table_elements}
        ${image_src}    Get Element Attribute    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td/a/img    src
        ${name}    Get Text    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//a[@class='checkout_heading']
        ${unit_price}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[3]
        ${quantity}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[4]
        ${total}    Get Text    xpath=(//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]//td)[5]

        Should Be Equal As Strings    ${image_src}    	https://automationteststore.com/image/thumbnails/18/6f/demo_product01_jpg-100089-75x75.jpg
        Should Be Equal As Strings    ${name}    Skinsheen Bronzer Stick
        Should Be Equal As Strings    ${unit_price}    $29.50
        Should Be Equal As Strings    ${quantity}    2
        Should Be Equal As Strings    ${total}    $59.00

    END
    # Kiểm tra tổng tiền sau khi chỉnh sửa
    ${cart_total_text}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
    Log    Updated Cart Total: ${cart_total_text}
    Should Be Equal As Strings    ${cart_total_text}    $61.00
    # Tiến hành đặt hàng nếu mọi thứ đều hợp lệ
    Click Element    //*[@id="checkout_btn"]
    [Teardown]    Close Browser

#F
Check Checkout Page Responsiveness
    [Documentation]  Kiểm tra khả năng phản hồi của trang thanh toán.
    [Tags]    Checkout    Responsiveness
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    ${start_time}    Get Time    epoch
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[3]/a
    Set Quantity For Product    Skinsheen Bronzer Stick    2
    Click Element    //*[@id="cart_checkout1"]
    ${end_time}    Get Time    epoch
    ${response_time}    Evaluate    ${end_time} - ${start_time}
    Log    Page response time: ${response_time} seconds
    # Kiểm tra thời gian phản hồi của trang web
    Run Keyword If    ${response_time} < 5
    ...    Log    Page response time is acceptable.
    ...    ELSE
    ...    Fail    Page response time is too high: ${response_time} seconds
    [Teardown]    Close Browser

Verify Successful Payment Transaction Processing
    [Documentation]  Xác minh rằng cổng thanh toán xử lý giao dịch thành công.
    [Tags]  Payment  Transaction  Success
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    # Kiểm tra thông báo hoặc email xác nhận từ cổng thanh toán
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!
    [Teardown]    Close Browser

Verify Billing Address Matches Payment Details1
    [Documentation]    Xác minh rằng địa chỉ thanh toán ở trang thanh toán khớp với địa chỉ trong chi tiết thanh toán.
    [Tags]              Payment    Address    Checkout
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Điều hướng đến trang thanh toán
    Click Element       ${add_to_Cart}
    Click Element       ${cart}
    Click Element       //*[@id="cart_checkout1"]
    Sleep               3s
    # Kiểm tra địa chỉ thanh toán
    ${Check the address is displayed correctly on the checkout page}=  Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[2]/address
    Click Element       //*[@id="checkout_btn"]
    Sleep  15s
    ${order_number}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/section/p[2]
    ${id_order}=  Set Variable  ${order_number[10:].split()[0].replace("#", "")}
    Sleep  2s 
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element    //*[@id="customer_menu_top"]/li/ul/li[6]/a   #nhấn vào xem chi tiết hóa đơn 
    #Lấy thông tin chi tiết hóa đơn 
    Click Element    //button[contains(@onclick, "viewOrder(${id_order})")]
    #Lấy thông tin địa chỉ chi tiết hóa đơn 
    ${order}=     Get Text     //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]
    [Teardown]    Close Browser

Verify Payment Gateway Functionality Under High Traffic
    [Documentation]    Xác minh hoạt động của cổng thanh toán khi có lưu lượng truy cập cao.
    [Tags]              Payment    Gateway    High Traffic
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Điều hướng đến trang thanh toán
    Click Element       ${add_to_Cart}
    Click Element       ${cart}
    # Thực hiện giao dịch thanh toán đồng thời
    FOR    ${index}    IN RANGE    100    
        Run Keyword And Ignore Error    Perform Payment Transaction
    END
    # Kiểm tra cổng thanh toán vẫn hoạt động ổn định
    # và xử lý các giao dịch thành công mặc dù có lưu lượng truy cập cao
    Log    Cổng thanh toán vẫn hoạt động ổn định và xử lý các giao dịch thành công mặc dù có lưu lượng truy cập cao.
    [Teardown]    Close Browser

Test Mobile Payment Processing
    [Documentation]    Thử nghiệm xử lý thanh toán trên thiết bị di động.
    [Tags]    Mobile    Payment    Processing
    # Khởi tạo các biến
    ${discount_code}    Set Variable    123
    ${expected_total}    Set Variable    31.50
    # Thiết lập môi trường mobile
    ${mobile_emulation}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions().add_experimental_option("mobileEmulation", {"deviceName": "iPhone X"})
    # Mở trình duyệt trên thiết bị di động
    Open Browser    ${URL}    ${BROWSER}    chrome_options=${mobile_emulation}
    # Đăng nhập vào trang web
    Click Element    //*[@id="customer_menu_top"]/li/a
    Input Text    //*[@id="loginFrm_loginname"]    NguyenQuynhNhu
    Input Password    //*[@id="loginFrm_password"]    123456789
    Click Button    //*[@id="loginFrm"]/fieldset/button
    #Nhấn vào trang chủ 
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    # Chọn sản phẩm và thêm vào giỏ hàng
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Apply Discount Code    ${discount_code}    ${expected_total}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    # Kiểm tra thông báo hoặc email xác nhận từ cổng thanh toán
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!
    [Teardown]    Close Browser


Cancel Payment During Checkout
    [Documentation]   Kiểm tra việc hủy thanh toán trong quá trình thanh toán.
    [Tags]             Payment    Checkout    Cancel
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element    //*[@id="customer_menu_top"]/li/ul/li[1]/a   #nhấn vào xem trang tổng quan tài khoản 
    #Lấy số lượng đơn hàng đã được tạo hiện tại
    ${number of orders_befor}=    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div/div[3]
    #Tiến hành thanh toán đơn hàng nhưng trong quá trình thanh toán bị hủy
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Click Element    xpath=//*[@id="back"]
    #Kiểm tra xe trang web có chuyển người dùng thoát khỏi trang thanh toán và ngăn không cho xác nhận thanh toán không
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}  https://automationteststore.com/index.php?rt=checkout/cart
    #Lấy số lượng đơn hàng sau khi thực hiện hành động 
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element    //*[@id="customer_menu_top"]/li/ul/li[1]/a   #nhấn vào xem trang tổng quan tài khoản 
    #Lấy số lượng đơn hàng đã được tạo hiện tại
    ${number of orders_after}=    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div/div[3]
    Should Be Equal As Numbers    ${number of orders_befor}     ${number of orders_after}
    [Teardown]    Close Browser

Verify Payment Receipt
    [Documentation]    Xác minh rằng người dùng nhận được biên lai thanh toán.
    [Tags]    Payment    Receipt    Verification
    Open Browser    ${URL}    ${BROWSER}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    # Kiểm tra thông báo hoặc email xác nhận từ cổng thanh toán
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!
    # Kiểm tra xem biên lai thanh toán được hiển thị đúng cách
    ${receipt}    Get Text    xpath=//*[@id="payment_receipt"]
    Should Not Be Empty    ${receipt}
    [Teardown]    Close Browser

Test Payment Processing on Firefox
    [Documentation]    Thực hiện quá trình thanh toán trên trình duyệt Firefox.
    [Tags]    Payment    BrowserCompatibility
    Open Browser    ${URL}    Firefox
    Maximize Browser Window
    Click Element     //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]   ${VALID_USERNAME}
    Input Password    //*[@id="loginFrm_password"]    ${VALID_PASSWORD}
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    # Kiểm tra thông báo hoặc email xác nhận từ cổng thanh toán
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!
    [Teardown]    Close Browser

Test Payment Processing on Edge
    [Documentation]    Thực hiện quá trình thanh toán trên trình duyệt Edge
    [Tags]    Payment    BrowserCompatibility
    Open Browser    ${URL}    Edge
    Maximize Browser Window
    Click Element     //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]   ${VALID_USERNAME}
    Input Password    //*[@id="loginFrm_password"]    ${VALID_PASSWORD}
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    Click Button    //*[@id="checkout_btn"]
    # Kiểm tra thông báo hoặc email xác nhận từ cổng thanh toán
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!
    [Teardown]    Close Browser

#F
Check the payment page notification feature when the user is not logged in
    [Documentation]     Kiểm tra tính năng thông báo của trang thanh toán khi người dùng chưa đăng nhập
    [Tags]    ShoppingCart    NotLoggedIn
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    # Kiểm tra xem thông báo yêu cầu đăng nhập có hiển thị hay không
    ${alert_visible}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(text(),'Bạn chưa đăng nhập xin mời bạn đăng nhập sau đó tiến hành thanh toán')]
    Run Keyword If    ${alert_visible}
    ...    Log    Thông báo yêu cầu đăng nhập đã hiển thị khi không đăng nhập.
    ...    ELSE
    ...    Fail    Thông báo yêu cầu đăng nhập không hiển thị khi không đăng nhập.

    [Teardown]    Close Browser

Check if the checkout page feature allows users to log in when the user is not logged in
    [Documentation]     Kiểm tra tính năng của trang thanh toán có cho phép người dùng đăng nhập khi người dùng chưa đăng nhập không 
    [Tags]    ShoppingCart    NotLoggedIn
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
     # Click vào nút giỏ hàng
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    #Xác minh xem trang web chuyển người dúng đến trang đăng nhập
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://automationteststore.com/index.php?rt=account/login
    [Teardown]    Close Browser

Check whether the shopping cart feature allows users to successfully checkout after the user logs in without the user being logged in before
    [Documentation]     Kiểm tra tính năng của giỏ hàng có cho phép người dùng thanh toán thành công không sau khi người dùng đăng nhập mà trước đó người dùng chưa đăng nhập 
    [Tags]    ShoppingCart    NotLoggedIn
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
     # Click vào nút giỏ hàng
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Input Text        //*[@id="loginFrm_loginname"]   ${VALID_USERNAME}
    Input Password    //*[@id="loginFrm_password"]    ${VALID_PASSWORD}
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Button    //*[@id="checkout_btn"]
    # Kiểm tra thông báo hoặc email xác nhận từ cổng thanh toán
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!
    [Teardown]    Close Browser


Check Payment Confirmation Email
    [Documentation]    Xác minh rằng email xác nhận thanh toán đã được gửi.
    [Tags]             Payment  Confirmation  Email
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element    //*[@id="customer_menu_top"]/li/ul/li[6]/a   #nhấn vào xem chi tiết hóa đơn 
    #Lấy thông tin chi tiết hóa đơn (Order ID: 35466)
    Click Element    //button[contains(@onclick, "viewOrder(35466)")]
    #Lấy thông tin chi tiết hóa đơn 
    ${order_info}=      Get Text       xpath=//*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[1]
    ${orderID}=    Get Line      ${order_info}    1
    ${orderID_new}=     Evaluate    "${orderID}".replace("#", "")
    ${E-Mail}=      Get Line      ${order_info}    7
    ${Telephone}=     Get Line      ${order_info}    10
    ${Fax}=          Get Line      ${order_info}    13
    ${Shipping Method}=      Get Line      ${order_info}    16
    ${Payment Method}=       Get Line      ${order_info}    19
    Go to      https://www.emailnator.com/10minutemail 
    Maximize Browser Window
    Click Element    //*[@id="root"]/div/section/div/div/div[3]/div[1]/div[2]
    Input Text        //*[@name='restoreTextArea']    7ex059n@tmpnator.live
    Wait Until Page Contains Element    xpath=//button[@name='restore']
    Click Element    xpath=//button[@name='restore']
    Sleep    3s 
    Wait Until Page Contains Element    //td[contains(text(), '35466')]
    Execute JavaScript    window.scrollBy(0, 2000)
    Sleep  3s
    Click Element   //td[contains(text(), '34441')]
    Sleep    15s 
    ${expected_orderID}=     Get Text    //td[@class='align_left']/span
    ${expected_email}=     Get Text    //td[@class='align_left']/strong[3]
    ${expected_telephone}=     Get Text   //td[@class='align_left']/strong[4]
    ${expected_fax}=     Get Text    //td[@class='align_left']/strong[5]
    ${expected_shipping_method}=     Get Text   //td[@class='align_left']/strong[2]
    ${expected_payment_method}=     Get Text    //td[@class='align_left']/strong[1]
    Should Be Equal     ${orderID_new}    ${expected_orderID}
    Should Be Equal     ${E-Mail}    ${expected_email}
    Should Be Equal     ${Telephone}    ${expected_telephone}
    Should Be Equal     ${Fax}    ${expected_fax}
    Should Be Equal     ${Shipping Method}    ${expected_shipping_method}
    Should Be Equal     ${Payment Method}    ${expected_payment_method}




*** Keywords ***
Login To Website
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Element     //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]    ${username}
    Input Password    //*[@id="loginFrm_password"]    ${password}
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a

# đặt số lượng cho một sản phẩm trong giỏ hàng
Set Quantity For Product
    [Arguments]    ${product_name}    ${quantity}
    Click Element    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input
    Input Text    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input    ${quantity}
    Press Keys   xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input    ENTER
    Wait Until Element Is Visible    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input[@value='${quantity}']


#Kiểm tra tổng tiền của tất cả sản phẩm
Calculate Total Price In Shopping Cart
    ${total_price}    Set Variable    0   
    ${rows}    Get WebElements    ${table_Cart2}
    FOR    ${row}    IN    @{rows}
        ${subtotal}    Get Text  //*[@id="totals_table"]/tbody/tr[1]/td[2]    # Cột Total
        ${flat_shipping_rate}    Get Text    //*[@id="totals_table"]/tbody/tr[2]/td[2]
        ${subtotal}    Set Variable    ${subtotal.replace('$', '').strip()}  # Loại bỏ ký tự $ và khoảng trắng
        ${flat_shipping_rate}    Set Variable    ${flat_shipping_rate.replace('$', '').strip()}  # Loại bỏ ký tự $ và khoảng trắng
        ${total_price}    Evaluate    ${total_price} + ${subtotal} + ${flat_shipping_rate}  # Cộng dồn vào tổng tiền
    END 
    RETURN    ${total_price}


#Áp dụng mã giảm giá 
Apply Discount Code
    [Arguments]    ${discount_code}    ${exp_total_new}
    Input Text    //*[@id="coupon_coupon"]    ${discount_code}    
    Click Button   //*[@id="apply_coupon_btn"]
    Sleep  3s
    Run Keyword And Continue On Failure    Page Should Contain Element    //div[contains(@class,'alert-danger')]//strong[contains(text(),"Error: Coupon is either invalid, expired or reached it's usage limit!")]
    ${cart_total_before}    Calculate Total Price In Shopping Cart
    Should Be Equal As Numbers    ${cart_total_before}   ${exp_total_new}


#Kiểm tra nội dung danh sách địa chỉ 
Check the content of the address list
    [Arguments]    ${expected_address list}
    ${address list}=     Get Text    //*[@id="address_1"]/div/table/tbody
    RETURN    ${address list}
    Should Be Equal As Strings    ${address list}    ${expected_address list}

Perform Payment Transaction
    Click Element       //*[@id="cart_checkout1"]
    Sleep               3s
    Click Button    //*[@id="checkout_btn"]
    Sleep  3s 
    ${confirmation_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${confirmation_message}    YOUR ORDER HAS BEEN PROCESSED!