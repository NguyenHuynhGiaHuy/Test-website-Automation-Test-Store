*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

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


*** Test Cases ***

Add products to cart from the main page
    [Documentation]    Thêm sản phẩm vào giỏ hàng từ trang chính
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Check the number of products in the shopping cart    @id='cart_quantity50'   1
    [Teardown]    Close Browser
    
Add product to cart from product detail page
    [Documentation]    Thêm sản phẩm vào giỏ hàng từ trang chi tiết sản phẩm
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Image    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/a/img   # nhấn vào sản phẩm để vào trang ctsp
    Input Text          xpath=//input[contains(@name, 'quantity')]   2
    Click Element   ${add_to_cart_detail}  #thêm sản phẩm
    Click Element    ${cart}
    Check the number of products in the shopping cart      Absolue Eye Precious Cells   1
    [Teardown]    Close Browser

Add products to cart from any page
    [Documentation]    Thêm sản phẩm vào giỏ hàng từ trang bất kỳ
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element      //*[@id="categorymenu"]/nav/ul/li[4]/a      #vào tran skin care
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[3]/div[2]/div[3]/a/i     #thêm sản phẩm
    Click Element    ${cart}
    Check the number of products in the shopping cart      Creme Precieuse Nuit 50ml    1   
    [Teardown]    Close Browser


Add products to cart by contacting the store owner
    [Documentation]    Thêm sản phẩm vào giỏ hàng bằng cách liên hệ với chủ cửa hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Image    //*[@id="brandcarousal"]/li[4]/div[1]/a/img
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[2]/div[2]/div[3]/a/i     #thêm sản phẩm bẳng cách lh chủ shop
    Sleep  3s
    Page Should Contain    Contact Us Form 
    Input Text    //*[@id="ContactUsFrm_first_name"]  Như
    Input Text    //*[@id="ContactUsFrm_email"]    nguyenquynhnhu12pl@gmail.com
    Input Text    //*[@id="ContactUsFrm_enquiry"]    Tôi muốn mua
    Click Button    //*[@id="ContactUsFrm"]/div[2]/div[2]/button    
    Page Should Contain    Your enquiry has been successfully sent to the store owner!
    [Teardown]    Close Browser

Verify that the cart icon updates the item quantity
    [Documentation]    Xác minh rằng biểu tượng giỏ hàng cập nhật số lượng mặt hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Check the product quantity on the cart icon   1
    [Teardown]    Close Browser

#F 
Check the presence of + and - buttons to change the product quantity
    [Documentation]     Kiểm tra sự hiện diện nút + và - để thay đổi số lượng sản phẩm
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Image    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/a/img
    ${locator}    Set Variable    //*[@id="locator_of_your_element"]
    ${plus_button_visible}    Wait Until Element Is Visible    xpath=${locator}/button[contains(@class, 'fa-plus')]    timeout=10s    error=Nút "+" không được tìm thấy
    ${minus_button_visible}    Wait Until Element Is Visible    xpath=${locator}/button[contains(@class, 'fa-minus')]    timeout=10s    error=Nút "-" không được tìm thấy
    Run Keyword If    "${plus_button_visible}"=="True" and "${minus_button_visible}"=="True"    Log    Nút tăng - giảm số lượng có trên trang web
    ...    ELSE    Fail    Nút tăng - giảm số lượng không có trên trang web
    [Teardown]    Close Browser

#F 
Verify the ability to use the + and - buttons to change product quantities
    [Documentation]     Xác minh khả năng sử dụng nút + và - để thay đổi số lượng sản phẩm
    [Tags]    regression
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Image    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/a/img
    ${locator}    Set Variable    //*[@id="locator_of_your_element"]
    ${quantity_before}    Get Text    xpath=${locator}/td[@class='quantity']
    Click Button    xpath=${locator}//button[contains(@class, 'fa-plus')]
    ${quantity_after_increase}    Get Text    xpath=${locator}/td[@class='quantity']
    Run Keyword If    "${quantity_after_increase}" != "${quantity_before} + 1"    Fail    Số lượng sản phẩm không tăng sau khi nhấn nút "+"
    Click Button    xpath=${locator}//button[contains(@class, 'fa-minus')]
    ${quantity_after_decrease}    Get Text    xpath=${locator}/td[@class='quantity']
    Run Keyword If    "${quantity_after_decrease}" != "${quantity_before}"    Fail    Số lượng sản phẩm không giảm sau khi nhấn nút "-"
    [Teardown]    Close Browser

Add product to cart with binding product attributes
    [Documentation]    Thêm sản phẩm vào giỏ hàng với sản phẩm ràng buộc các thuộc tính
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Mouse Over    //*[@id="categorymenu"]/nav/ul/li[2]
    Click Element    //*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[1]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/div[3]/a/i     #thêm sản phẩm bẳng cách lh chủ shop
    Sleep  3s
    Click Element    //*[@id="product"]/fieldset/div[6]/ul/li/a
    Wait Until Page Contains Element    xpath=//div[@class='alert alert-error alert-danger']
    Page Should Contain    UK size: Please select all required options!
    Click Element    id=option344750
    Click Element    //*[@id="product"]/fieldset/div[6]/ul/li/a/i
    Extract Row Data    ${table_cart}     ${table_cart_item1}   https://automationteststore.com/image/thumbnails/18/77/new_ladies_red1_jpg-100216-75x75.jpg    	New Ladies High Wedge Heel Toe Thong Diamante Flip Flop Sandals\n- UK size 6 UK\n- Colour red    ${EMPTY}    $26.00    1    $26.00
    [Teardown]    Close Browser

Add Out of Stock Products To Cart
    [Documentation]    Thêm sản phẩm vào giỏ hàng với sản phẩm đã hết hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${out_of_stock_product}    Run Keyword And Return Status    Click Out of Stock Product
    Click Element    ${cart}
    Wait Until Element Is Visible    //div[contains(@class,'contentpanel') and contains(text(),'Your shopping cart is empty')]
    Page Should Contain Element    //div[contains(@class,'contentpanel') and contains(text(),'Your shopping cart is empty')]
    [Teardown]    Close Browser

Successfully updated the number of products in the shopping cart from 1 to 4
    [Documentation]     Cập nhật số lượng sản phẩm trong giỏ hàng thành công từ 1 lên 4 (bảng danh sách sản phẩm trong giỏ hàng)
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_bestsellers_1771"]/div/div[4]/div[2]/div[3]/a/i
    Click Element    ${cart}
    ${quantity_before}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Input Text          //td[@class='align_center']/div/input   4
    Press Keys        //td[@class='align_center']/div/input    ENTER
    Check the sub-total value of the cart   Absolue Eye Precious Cells    356.00
    [Teardown]    Close Browser
 
Successfully updated the number of products in the shopping cart from 1 to 0
    [Documentation]     Cập nhật số lượng sản phẩm trong giỏ hàng thành công từ 1 xuống 0 (bảng danh sách sản phẩm trong giỏ hàng)
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_bestsellers_1771"]/div/div[4]/div[2]/div[3]/a/i
    Click Element    ${cart}
    ${quantity_before}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Input Text          //td[@class='align_center']/div/input   0
    Press Keys        //td[@class='align_center']/div/input    ENTER
    Wait Until Element Is Visible    //div[contains(@class,'contentpanel') and contains(text(),'Your shopping cart is empty')]
    Page Should Contain Element    //div[contains(@class,'contentpanel') and contains(text(),'Your shopping cart is empty')]
    [Teardown]    Close Browser

Update Cart Quantity Exceeds Stock Quantity
    [Documentation]     Kiểm tra cập nhật số lượng sản phẩm trong giỏ hàng vượt quá số lượng có sẵn trong kho
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_special_1772"]/div/div[4]/div[2]/a/img
    ${Availability}=  Get Text  //li[span[@class='productinfoleft'][contains(text(),'Availability:')]]
    ${quanlity} =  Set Variable  ${Availability.split()[1]}
    ${new_quantity}=  Evaluate  ${quanlity} + 1
    Input Text    //*[@id="product_quantity"]    ${new_quantity}
    Click Element   //*[@id="product"]/fieldset/div[4]/ul/li/a/i
    Sleep   3s
    Run Keyword And Continue On Failure    Page Should Contain Element    //div[contains(@class,'alert-danger')]//strong[contains(text(),'Products marked with *** are not available')]
    [Teardown]    Close Browser
#F 
Update the number of products in the cart to a negative number
    [Documentation]     Cập nhật số lượng sản phẩm trong giỏ hàng thành số âm
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/div[3]/a/i
    Click Element    ${cart}
    ${quantity_before}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Input Text          //td[@class='align_center']/div/input   -12
    Press Keys        //td[@class='align_center']/div/input    ENTER
    Run Keyword And Continue On Failure    Page Should Contain Element    //div[contains(@class,'alert-danger')]//strong[contains(text(),'Unable to update product quantity to negative')]
    ${quantity_after}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Should Be Equal As Strings    ${quantity_before}    ${quantity_after}
    [Teardown]    Close Browser

#F
Update Quantity With Invalid Input
    [Documentation]     Cập nhật số lượng sản phẩm trong giỏ hàng với dữ liệu đầu vào không hợp lệ
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/div[3]/a/i
    Click Element    ${cart}
    ${quantity_before}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Input Text          //td[@class='align_center']/div/input   Mười hai
    Press Keys        //td[@class='align_center']/div/input    ENTER
    Run Keyword And Continue On Failure    Page Should Contain Element    //div[contains(@class,'alert-danger')]//strong[contains(text(),'Invalid input for quantity')]
    ${quantity_after}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Should Be Equal As Strings    ${quantity_before}    ${quantity_after}
    [Teardown]    Close Browser

Update the quantity of products in the cart for multiple products
    [Documentation]    Người dùng thay đổi số lượng của nhiều sản phẩm trong giỏ hàng cùng một lúc.
    [Tags]    UpdateQuantity    MultipleProducts
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/a/i  # sản phẩm 1 
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/a/i  # sản phẩm 2
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/a/i  # sản phẩm 3
    Click Element    ${cart}
    Set Quantity For Product    	Absolute Anti-Age Spot Replenishing Unifying TreatmentSPF 15    3
    Set Quantity For Product    	Total Moisture Facial Cream    2
    Set Quantity For Product    Absolue Eye Precious Cells    5
    ${expected_total}    Get Expected Total For Products
    Check the sub-total value of the cart    	Absolute Anti-Age Spot Replenishing Unifying TreatmentSPF 15    ${expected_total[0]}
    Check the sub-total value of the cart    	Total Moisture Facial Cream    ${expected_total[1]}
    Check the sub-total value of the cart    Absolue Eye Precious Cells    ${expected_total[2]}
    [Teardown]    Close Browser

Remove product from cart
    [Documentation]    Xóa sản phẩm khỏi giỏ hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/div[3]/a/i
    Click Element    ${cart}
    ${quantity_before}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Click Element    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[7]/a
    Check Product Removal From Cart   Benefit Bella Bamba
    [Teardown]    Close Browser

#F
Check for notifications when adding products
    [Documentation]    Kiểm tra thông báo khi thêm sản phẩm 
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Check Confirmation Message    Thêm sản phẩm thành công 
    [Teardown]    Close Browser

#F
Check the notification when deleting a product
    [Documentation]    Kiểm tra thông báo khi xóa sản phẩm 
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${cart}
    ${quantity_before}=    Get Element Attribute    //td[@class='align_center']/div/input    value
    Click Element    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[7]/a
    Check Confirmation Message    Bạn có muốn xóa sản phẩm này khổng 
    [Teardown]    Close Browser

Check the correctness of the total value in the shopping cart
    [Documentation]    Kiểm tra tính đúng đắn của tổng giá trị trong giỏ hàng
    [Tags]    ShoppingCart    TotalPrice
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/a/i  # Product 1
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/a/i  # Product 2
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/a/i  # Product 3
    Click Element    ${cart}
    Set Quantity For Product    Absolute Anti-Age Spot Replenishing Unifying TreatmentSPF 15    3
    Set Quantity For Product    Total Moisture Facial Cream    2
    Set Quantity For Product    Absolue Eye Precious Cells    5
    ${actual_total}    Calculate Total Price In Shopping Cart
    Should Be Equal As Numbers    ${actual_total}    649.00
    [Teardown]    Close Browser

Check the correctness of the product in the shopping cart
    [Documentation]    Kiểm tra tính đúng đắn của sản phẩm trong giỏ hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/div[3]/a/i
    Click Element    //html/body/div/header/div[2]/div/div[3]/ul
    Extract Row Data    ${table_cart}     ${table_cart_item1}    https://automationteststore.com/image/thumbnails/18/6f/demo_product01_jpg-100089-75x75.jpg     	Skinsheen Bronzer Stick    558003    $29.50    1    $29.50	
    Extract Row Data    ${table_cart}     ${table_cart_item2}    https://automationteststore.com/image/thumbnails/18/6b/demo_product02_3_jpg-100029-75x75.jpg    Benefit Bella Bamba    523755    $28.00	    2    $56.00	
    [Teardown]    Close Browser
#F
Test the cart notification feature when the user is not logged in
    [Documentation]     Kiểm tra tính năng giỏ hàng thông báo khi người dùng chưa đăng nhập
    [Tags]    ShoppingCart    NotLoggedIn
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
     # Click vào nút giỏ hàng
    Click Element   ${cart}
    # Kiểm tra xem thông báo yêu cầu đăng nhập có hiển thị hay không
    ${alert_visible}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(text(),'Your permission to log in or register')]
    Run Keyword If    ${alert_visible}
    ...    Log    A login alert is displayed when attempting to access the shopping cart without being logged in.
    ...    ELSE
    ...    Fail    Expected login alert is not displayed.

    [Teardown]    Close Browser

Test the shopping cart feature that allows users to log in when the user is not logged in
    [Documentation]     Kiểm tra tính năng giỏ hàng cho phép người dùng đăng nhập khi người dùng chưa đăng nhập
    [Tags]    ShoppingCart    NotLoggedIn
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
     # Click vào nút giỏ hàng
    Click Element   ${cart}
    ${Username when not logged in}=     Get Text  //*[@id="customer_menu_top"]/li/a
    Click Element     //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]   ${VALID_USERNAME}
    Input Password    //*[@id="loginFrm_password"]    ${VALID_PASSWORD}
    Click Button      //*[@id="loginFrm"]/fieldset/button
    ${Username after not being logged in}=     Get Text  //*[@id="customer_menu_top"]/li/a
    Should Be Equal As Strings    ${Username after not being logged in}  Welcome back Nhu  
    [Teardown]    Close Browser

Check if the shopping cart feature allows the user to successfully update the cart after the user logs in without the user being logged in before
    [Documentation]     Kiểm tra tính năng của giỏ hàng có cho phép người dùng cập nhật giỏ hàng thành công không sau khi người dùng đăng nhập mà trước đó người dùng chưa đăng nhập 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Click vào nút giỏ hàng
    Click Element   ${cart}
    Click Element     //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]   ${VALID_USERNAME}
    Input Password    //*[@id="loginFrm_password"]    ${VALID_PASSWORD}
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Check the number of products in the shopping cart    @id='cart_quantity50'   1
    [Teardown]    Close Browser

Test Cart Functionality Logged In User
    [Documentation]    Kiểm tra chức năng giỏ hàng với người dùng đã đăng ký
    [Tags]    ShoppingCart    LoggedInUser
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Thêm sản phẩm vào giỏ hàng từ trang chính
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Check the number of products in the shopping cart    Skinsheen Bronzer Stick   1
    # Xóa sản phẩm từ giỏ hàng
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    ${cart}
    Click Element    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[3]/td[7]/a/i    # Click vào nút xóa sản phẩm
    Check Product Removal From Cart    Absolute Anti-Age Spot Replenishing Unifying TreatmentSPF 15
    # Đặt số lượng cho sản phẩm
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    //*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/a/i
    Click Element    ${cart}
    Set Quantity For Product    Total Moisture Facial Cream    2
    Check the total number of products in the shopping cart    3
    # Kiểm tra tổng giá trị của giỏ hàng
    ${actual_total}    Calculate Total Price In Shopping Cart
    Should Be Equal As Numbers    ${actual_total}    107.50
    [Teardown]    Close Browser

Test Empty Cart Functionality
    [Documentation]    Kiểm tra tính năng giỏ hàng khi giỏ hàng trống
    [Tags]    ShoppingCart    EmptyCart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${cart}
    ${empty_cart_message}    Get Text    //*[@id="maincontainer"]/div/div/div/div
    Should Contain    ${empty_cart_message}    Your shopping cart is empty!
    Should Contain    ${empty_cart_message}    	   Continue	    		
    [Teardown]    Close Browser

Check the shopping cart feature when there are products with limited quantities
    [Documentation]     Kiểm tra tính năng giỏ hàng khi có sản phẩm giới hạn số lượng mua
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Mouse Over    //*[@id="categorymenu"]/nav/ul/li[2]
    Click Element    //*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[2]
    Click Image    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[3]/div[2]/a/img
    ${Availability}=  Get Text  //div[@class='input-group ']
    ${quanlity}=  Set Variable  ${Availability.split()[7]}
    ${new_quantity}=  Evaluate  ${quanlity} + 1
    Input Text    //*[@id="product_quantity"]    ${new_quantity}
    Click Element   //*[@id="product"]/fieldset/div[6]/ul/li/a/i
    Sleep   3s
    Run Keyword And Continue On Failure    Page Should Contain Element    //div[contains(@class,'alert-danger')]//strong[contains(text(),"Allowed product's quantity exceeds. Quantity was set to maximum.")]
    [Teardown]    Close Browser

Check the shopping cart feature when there is an offer or discount code
    [Documentation]      Kiểm tra tính năng giỏ hàng khi có ưu đãi hoặc mã giảm giá
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Apply Discount Code   123     31.50
    [Teardown]    Close Browser

Test shopping cart functionality on multiple devices (computers)
    [Documentation]    Kiểm tra tính năng giỏ hàng trên nhiều thiết bị (máy tính)
    [Tags]             Desktop
    ${discount_code} =    Set Variable    123
    ${expected_total} =   Set Variable    31.50
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Apply Discount Code    ${discount_code}    ${expected_total}
    [Teardown]    Close Browser


Test shopping cart functionality on multiple devices (mobile)
    [Documentation]    Kiểm tra tính năng giỏ hàng trên nhiều thiết bị (Điện thoại)
    [Tags]             Mobile
    ${discount_code} =    Set Variable    123
    ${expected_total} =   Set Variable    31.50
    ${mobile_emulation} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions().add_experimental_option("mobileEmulation", {"deviceName": "iPhone X"})
    Open Browser    ${URL}    ${BROWSER}    chrome_options=${mobile_emulation}
    Click Element     //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]    NguyenQuynhNhu
    Input Password    //*[@id="loginFrm_password"]    123456789
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Apply Discount Code    ${discount_code}    ${expected_total}
    [Teardown]    Close Browser

Check shopping cart functionality when there is a system error
    [Documentation]    Kiểm tra tính năng giỏ hàng khi có lỗi hệ thống
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Extract Row Data    ${table_cart}     ${table_cart_item1}    https://automationteststore.com/image/thumbnails/18/6f/demo_product01_jpg-100089-75x75.jpg     	Skinsheen Bronzer Stick    558003    $29.50    1    $29.50	
    Apply Discount Code   ${EMPTY}     31.50
    Extract Row Data    ${table_cart}     ${table_cart_item1}    https://automationteststore.com/image/thumbnails/18/6f/demo_product01_jpg-100089-75x75.jpg     	Skinsheen Bronzer Stick    558003    $29.50    1    $29.50	
    [Teardown]    Close Browser

Verify Continue Shopping Button Functionality
    [Documentation]    Kiểm tra nút "Tiếp tục mua sắm" trong giỏ hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${cart}
    Click Element    ${continue_shopping} 
    Wait Until Page Contains   https://automationteststore.com/
    Location Should Be    https://automationteststore.com/
    [Teardown]    Close Browser

Verify Proceed to Checkout Button Functionality
    [Documentation]    Xác minh rằng nút "Tiến hành thanh toán" hoạt động
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://automationteststore.com/index.php?rt=checkout/confirm
    [Teardown]    Close Browser

Verify Cart Persistence Across User Sessions
    [Documentation]    Kiểm tra tính bền vững của giỏ hàng qua các phiên của người dùng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Sleep   3s
    Extract Row Data    ${table_cart}     ${table_cart_item1}    https://automationteststore.com/image/thumbnails/18/6f/demo_product01_jpg-100089-75x75.jpg     	Skinsheen Bronzer Stick    558003    $29.50    1    $29.50
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element    //*[@id="customer_menu_top"]/li/ul/li[10]/a
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    Input Text        //*[@id="loginFrm_loginname"]    NguyenQuynhNhu
    Input Password    //*[@id="loginFrm_password"]    123456789
    Click Button      //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    Click Element    ${cart}
    Extract Row Data    ${table_cart}     ${table_cart_item1}    https://automationteststore.com/image/thumbnails/18/6f/demo_product01_jpg-100089-75x75.jpg     	Skinsheen Bronzer Stick    558003    $29.50    1    $29.50
    [Teardown]    Close Browser

Verify Cart is Empty After Placing Order
    [Documentation]    Xác minh rằng giỏ hàng đã trống sau khi đặt hàng
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Click Element    //*[@id="cart_checkout1"]
    Sleep  3s 
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://automationteststore.com/index.php?rt=checkout/confirm
    Click Button    //*[@id="checkout_btn"]
    Sleep  3s 
    Click Element    ${cart}
    Wait Until Element Is Visible    //div[contains(@class,'contentpanel') and contains(text(),'Your shopping cart is empty')]
    Page Should Contain Element    //div[contains(@class,'contentpanel') and contains(text(),'Your shopping cart is empty')]
    [Teardown]    Close Browser

Verify Synchronization Between Interface and Data Update
    [Documentation]    Kiểm tra tính đồng bộ giữa giao diện và dữ liệu cập nhật
    Login To Website   ${URL}     Chrome   ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${add_to_Cart}
    Click Element    ${cart}
    Input Text          //td[@class='align_center']/div/input   10
    Press Keys        //td[@class='align_center']/div/input    ENTER
    ${quantity_Chrome}=  Get Element Attribute    //td[@class='align_center']/div/input    value  
    Login To Website      ${URL}  Edge    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element    ${cart}
    ${quantity_Edge}=  Get Element Attribute    //td[@class='align_center']/div/input    value  
    Run Keyword If    ${quantity_Edge} == ${quantity_Chrome}
    ...    Log    Hệ thống đồng bộ giữa giao diện và dữ liệu cập nhật
    ...    ELSE
    ...    Fail    Hệ thống không đồng bộ giữa giao diện và dữ liệu cập nhật
    [Teardown]    Close Browser

Verify Hover Functionality on Add to Cart Icon
    [Documentation]    Kiểm tra tính năng hover khi di chuột vào icon "Thêm vào giỏ hàng"
    Login To Website   ${URL}     Chrome   ${VALID_USERNAME}    ${VALID_PASSWORD}
    Mouse Over    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    ${tooltip_text}=    Get Element Attribute    //a[@class='productcart']    title
    Should Be Equal As Strings    ${tooltip_text}    Add to Cart
    [Teardown]    Close Browser

Verify Mouse Out Functionality on Add to Cart Icon
    [Documentation]    Kiểm tra tính năng khi di chuột ra ngoài icon "Thêm vào giỏ hàng"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Mouse Over    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i 
    Wait Until Element Is Visible    //a[@class='productcart'] 
    Mouse Out    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i 
    ${element_visible}=    Run Keyword And Return Status    Wait Until Element Is Not Visible    //a[@class='productcart'] 
    Should Not Be True    ${element_visible}   
    [Teardown]    Close Browser


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

#Kiểm tra tổng số lượng sản phẩm trong giỏ hàng 
Check the total number of products in the shopping cart
    [Arguments]    ${expected_quantity}
    ${total_quantity}    Get Total Quantity In Shopping Cart
    Should Be Equal As Numbers    ${total_quantity}    ${expected_quantity}

#Kiểm tra số lượng sản phẩm trong giỏ hàng 
Check the number of products in the shopping cart
    [Arguments]    ${item_name}    ${expected_quantity}
    ${quantity}    Get Element Attribute     xpath=//td[@class='align_left'][a='${item_name}']/following-sibling::td[@class='align_center']/div/input   value 
    Should Be Equal As Strings    ${quantity}    ${expected_quantity}


#Kiểm tra nội dung sản phẩm trong giỏ hàng 
Get Product Content From Shopping Cart
    [Arguments]    ${row_locator}   ${item}     ${expected_image_src}    ${expected_name}    ${expected_model}    ${expected_unit_price}    ${expected_quantity}    ${expected_total}
    ${rows}    Get WebElements    ${row_locator}
    FOR    ${row}    IN    @{rows}
        ${image_src}    Get Element Attribute    xpath=${item}//td[@class='align_center']/a/img    src
        ${name}    Get Text    xpath=${item}//td[@class='align_left'][1]
        ${model}    Get Text    xpath=${item}//td[@class='align_left'][2]
        ${unit_price}    Get Text    xpath=${item}//td[@class='align_right'][1]
        ${quantity}    Get Element Attribute    xpath=${item}//td[@class='align_center']/div/input    value
        ${total}    Get Text    xpath=${item}//td[@class='align_right'][2]

        Should Be Equal As Strings    ${image_src}    ${expected_image_src}
        Should Be Equal As Strings    ${name}    ${expected_name}
        Should Be Equal As Strings    ${model}    ${expected_model}
        Should Be Equal As Strings    ${unit_price}    ${expected_unit_price}
        Should Be Equal As Strings    ${quantity}    ${expected_quantity}
        Should Be Equal As Strings    ${total}    ${expected_total}
    END

#Kiểm tra số lượng sản phẩm trên biểu tượng giỏ hàng 
Check the product quantity on the cart icon
    [Arguments]    ${expected_quantityincart}
    ${actual_quantity}    Get Text    xpath=(//span[@class='label label-orange font14'])[2]
    Should Be Equal As Numbers    ${actual_quantity}    ${expected_quantityincart}

Get Total Quantity In Shopping Cart
    ${total_quantity}    Set Variable    0
    @{quantity_elements}    Get WebElements    //input[contains(@name, 'quantity')]
    FOR    ${element}    IN    @{quantity_elements}
        ${quantity}    Get Element Attribute    ${element}    value
        ${quantity}    Convert To Integer    ${quantity}
        ${total_quantity}    Evaluate    ${total_quantity} + ${quantity}
    END
    RETURN    ${total_quantity}

#Kiểm tra tổng giá trị của riêng sản phẩm của giỏ hàng  
Check the sub-total value of the cart
    [Arguments]    ${item_name}    ${expected_total}
    ${quantity}    Get Element Attribute    xpath=//td[@class='align_left']/a[contains(text(),'${item_name}')]/../following-sibling::td[@class='align_center']/div/input    value
    ${unit_price}    Get Text    xpath=//td[@class='align_left']/a[contains(text(),'${item_name}')]/../following-sibling::td[@class='align_right'][1]
    ${unit_price_num}    Evaluate    round(float("${unit_price}".replace('$', '')), 2)
    ${total}    Evaluate    round(${quantity} * ${unit_price_num}, 2)
    Should Be Equal As Numbers    ${total}    ${expected_total}

# đặt số lượng cho một sản phẩm trong giỏ hàng
Set Quantity For Product
    [Arguments]    ${product_name}    ${quantity}
    Click Element    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input
    Input Text    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input    ${quantity}
    Press Keys   xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input    ENTER
    Wait Until Element Is Visible    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input[@value='${quantity}']

# tính tổng giá trị dự kiến của các sản phẩm trong giỏ hàng
Get Expected Total For Products
    ${expected_totals}    Create List
    ${products}    Get WebElements    //td[@class='align_left']/a
    FOR    ${product}    IN    @{products}
        ${product_name}    Get Text    ${product}
        ${quantity}    Get Element Attribute    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_center']/div/input    value
        ${unit_price}    Get Text    xpath=//td[@class='align_left'][a='${product_name}']/following-sibling::td[@class='align_right'][1]
        ${unit_price_num}    Evaluate    round(float("${unit_price}".replace('$', '')), 2)
        ${total}    Evaluate    round(${quantity} * ${unit_price_num}, 2)
        Append To List    ${expected_totals}    ${total}
    END
    RETURN    ${expected_totals}

#Kiểm tra sản phẩm trong giỏ hàng còn tồn tại không 
Check Product Removal From Cart
    [Arguments]    ${product_name}
    ${row_locator}    Set Variable    xpath=//td[@class='align_left']/a[contains(text(),'${product_name}')]/ancestor::tr
    ${row_exists}    Run Keyword And Return Status    Element Should Be Visible    ${row_locator}
    Run Keyword If    '${row_exists}' == 'PASS'
    ...    Log    Product '${product_name}' is still in the cart.
    ...    ELSE IF    '${row_exists}' == 'FAIL'
    ...    Log    Product '${product_name}' has been removed from the cart.
    ...    ELSE
    ...    Log    Unable to determine the status of product '${product_name}'.

#Kiểm tra thông báo khi thêm / xóa sản phẩm
Check Confirmation Message
    [Arguments]    ${expected_message}
    ${actual_message}    Get Text    xpath=//div[@class='alert alert-success']
    Run Keyword If    '${actual_message}' == ''    Fail    Expected confirmation message not found
    Should Be Equal As Strings    ${actual_message}    ${expected_message}

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

#Kiểm tra thông tin giỏ hàng 
Extract Row Data
    [Arguments]    ${row_locator}   ${item}     ${expected_image_src}    ${expected_name}    ${expected_model}    ${expected_unit_price}    ${expected_quantity}    ${expected_total}
    ${rows}    Get WebElements    ${row_locator}
    FOR    ${row}    IN    @{rows}
        ${image_src}    Get Element Attribute    xpath=${item}//td[@class='align_center']/a/img    src
        ${name}    Get Text    xpath=${item}//td[@class='align_left'][1]
        ${model}    Get Text    xpath=${item}//td[@class='align_left'][2]
        ${unit_price}    Get Text    xpath=${item}//td[@class='align_right'][1]
        ${quantity}    Get Element Attribute    xpath=${item}//td[@class='align_center']/div/input    value
        ${total}    Get Text    xpath=${item}//td[@class='align_right'][2]

        Should Be Equal As Strings    ${image_src}    ${expected_image_src}
        Should Be Equal As Strings    ${name}    ${expected_name}
        Should Be Equal As Strings    ${model}    ${expected_model}
        Should Be Equal As Strings    ${unit_price}    ${expected_unit_price}
        Should Be Equal As Strings    ${quantity}    ${expected_quantity}
        Should Be Equal As Strings    ${total}    ${expected_total}
    END

#Áp dụng mã giảm giá 
Apply Discount Code
    [Arguments]    ${discount_code}    ${exp_total_new}
    Input Text    //*[@id="coupon_coupon"]    ${discount_code}    
    Click Button   //*[@id="apply_coupon_btn"]
    Sleep  3s
    Run Keyword And Continue On Failure    Page Should Contain Element    //div[contains(@class,'alert-danger')]//strong[contains(text(),"Error: Coupon is either invalid, expired or reached it's usage limit!")]
    ${cart_total_before}    Calculate Total Price In Shopping Cart
    Should Be Equal As Numbers    ${cart_total_before}   ${exp_total_new}

#Thêm sản phẩm hết hàng 
Click Out of Stock Product
    ${out_of_stock_product}    Run Keyword And Return Status    Click Element    //span[@class='nostock']
    RETURN    ${out_of_stock_product}