*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${URL}    https://automationteststore.com
${WAIT_TIME}        5s                     # Thời gian chờ 5 giây
${product_image}    xpath=//*[@id="product_details"]/div/div[1]/div[2]/a/img
*** Test Cases ***
Search for the product then at the main image thumbnail location to change the imag    [Documentation]    tìm kiếm sản phẩm sau đó tại vị trí hình thu nhỏ hình ảnh chính để thay đổi hình ảnh
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    # Bước 1: Đợi và click vào các phần tử img
    Log    xem các ảnh img của các màu sản phẩm
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[1]
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[2]
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[3]
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[4]
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[5]
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[6]

    # Bước 1: Đợi và click vào các phần tử img
    Log    click chọn các màu của sản phẩm
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    ${color-1}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    ${color-2}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    ${color-3}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    ${color-4}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]
    ${color-5}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]

    # Bước 1: Click vào phần tử và kiểm tra
    Wait Until Element Is Visible    xpath=//*[@id="product"]/fieldset/div[2]
    ${quantity_value}    Get Element Attribute    id=product_quantity    value
    Log    số lượng sản phẩm : ${quantity_value}
    ${Total_Price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span


    # Bước 1: Click vào phần tử và kiểm tra ảnh detail



    # Bước 5: Đóng trình duyệt
    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser
Search for the product then at the main image thumbnail location to change the image then verify the image is loaded or not
...    [Documentation]    tìm kiếm sản phẩm sau đó tại vị trí hình thu nhỏ hình ảnh chính để thay đổi hình ảnh sau đó xác thực ảnh có load chưa

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    # Bước 1: Đợi và click vào các phần tử img
    Log    xem các ảnh img của các màu sản phẩm 
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[1]
    Wait for Image to Load
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[2]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[3]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[4]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[5]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[6]
    Wait for Image to Load
    Close Browser
    
Click to select the color for the product then verify the color of the product    
    [Documentation]    click chọn màu cho sản phẩm sau đó xác thực màu của sản phẩm 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    # Bước 1: Đợi và click vào các phần tử img
    xem các ảnh img của các màu sản phẩm



 # Bước 1: Đợi và click vào các phần tử img
    Log    click chọn các màu của sản phẩm
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    ${color-1}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    ${color-2}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    ${color-3}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    ${color-4}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]
    ${color-5}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]
    

    Close All Browsers


Check the product quantity bar and product value    
    [Documentation]    kiểm tra thanh số lượng sản phầm và giá trị của sản phẩm 

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    # Bước 1: Đợi và click vào các phần tử img
    xem các ảnh img của các màu sản phẩm



     # Bước 1: Đợi và click vào các phần tử img
    click chọn các màu của sản phẩm


    # Bước 1: Click vào phần tử và kiểm tra
    Wait Until Element Is Visible    xpath=//*[@id="product"]/fieldset/div[2]
    ${quantity_value}    Get Element Attribute    id=product_quantity    value
    Log    số lượng sản phẩm : ${quantity_value}
    ${Total_Price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span

    Close All Browsers





Check the product quantity and product value bars after both values ​​have been changed    
    [Documentation]    kiểm tra thanh số lượng sản phẩm và giá trị của sản phẩm sau khi cả 2 bị thay đổi giá trị 

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    # Bước 1: Đợi và click vào các phần tử img
    xem các ảnh img của các màu sản phẩm



     # Bước 1: Đợi và click vào các phần tử img
    click chọn các màu của sản phẩm


    # Bước 1: Click vào phần tử và kiểm tra
    Wait Until Element Is Visible    xpath=//*[@id="product"]/fieldset/div[2]
    ${quantity_value_before}    Get Element Attribute    id=product_quantity    value
    Log    số lượng sản phẩm : ${quantity_value_before}
    ${Total_Price_before}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span


    Input Text    xpath=//*[@id="product_quantity"]    50
    ${quantity_value_after}    Get Element Attribute    id=product_quantity    value
    Log    số lượng sản phẩm : ${quantity_value_after}
    ${Total_Price_after}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span


    Run Keyword If    '${quantity_value_before}' != '${quantity_value_after}'    Log    chính xác !!! số lượng sản phẩm đã thay đổi
    Run Keyword If    '${Total_Price_before}' != '${Total_Price_after}'    Log    chính xác !!! tổng giá sản phẩm đã thay đổi

    Close All Browsers



Check whether the product has a description or not, then retrieve the information    [Documentation]    kiểm tra sản phẩm có phần miêu tả hay không sau đó lấy thông tin ra
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    ${nav}    Get Text    xpath=//*[@id="productdesc"]/div/div/div

Check if the product has a Reviews section or not then retrieve the information    [Documentation]    kiểm tra sản phẩm có phần Reviews hay không sau đó lấy thông tin ra
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    Click Element    xpath=//*[@id="myTab"]/li[2]
    ${nav}    Get Text    xpath=//*[@id="productdesc"]/div/div/div



write a review with a rating of 5 stars and submit without entering the remaining inputs then get the error message    [Documentation]    viết 1 bài đánh giá với rating là 5 sao  và submit submit mà không nhập các input còn lại sau đó lấy ra thông báo lỗi
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    Click Element    xpath=//*[@id="myTab"]/li[2]
    #rating 5stars
    Click Element    xpath=//*[@id="rating5"]/a
    #submit
    Click Element    xpath=//*[@id="review_submit"]
    

    Wait Until Element Is Visible    xpath=//*[@id="review"]/div[3]    timeout=5s
    ${error}    Get Text    xpath=//*[@id="review"]/div[3]




write a review with a rating of 5 stars and name, submit without entering the remaining inputs then get the error message    [Documentation]    viết 1 bài đánh giá với rating là 5 sao  và tên submit submit mà không nhập các input còn lại sau đó lấy ra thông báo lỗi
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    Click Element    xpath=//*[@id="myTab"]/li[2]
    #rating 5stars
    Click Element    xpath=//*[@id="rating5"]/a
    Input Text    xpath=//*[@id="name"]    Thinhdepzai
    #submit
    Click Element    xpath=//*[@id="review_submit"]
    

    Wait Until Element Is Visible    xpath=//*[@id="review"]/div[3]    timeout=5s
    ${error}    Get Text    xpath=//*[@id="review"]/div[3]







Write a review with a rating of 5 stars, name, Your Review and submit without entering the remaining inputs then get the error message    [Documentation]    viết 1 bài đánh giá với rating là 5 sao , Name, Your Review  và submit mà không nhập các input còn lại sau đó lấy ra thông báo lỗi
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    Click Element    xpath=//*[@id="myTab"]/li[2]
    #rating 5stars
    Click Element    xpath=//*[@id="rating5"]/a
    Input Text    xpath=//*[@id="name"]    Thinhdepzai
    Input Text    xpath=//*[@id="text"]    sản phẩm này thật là tuyệt

    #submit
    Click Element    xpath=//*[@id="review_submit"]
    

    Wait Until Element Is Visible    xpath=//*[@id="review"]/div[3]    timeout=5s
    ${error}    Get Text    xpath=//*[@id="review"]/div[3]



Write a review with a rating of 5 stars, name, Your Review and Code    [Documentation]    viết 1 bài đánh giá với rating là 5 sao , tên, Your Review  và  Code  
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    Click Element    xpath=//*[@id="myTab"]/li[2]
    #rating 5stars
    Click Element    xpath=//*[@id="rating5"]/a
    Input Text    xpath=//*[@id="name"]    Thinhdepzai
    Input Text    xpath=//*[@id="text"]    sản phẩm này thật là tuyệt
    ${capcha}    Get Text    xpath=//*[id="captcha_img"]
    Input Text    xpath=//*[@id="captcha"]    ${capcha}

    #submit
    Click Element    xpath=//*[@id="review_submit"]
    

    Wait Until Element Is Visible    xpath=//*[@id="review"]/div[3]    timeout=5s
    ${error}    Get Text    xpath=//*[@id="review"]/div[3]










Check if the product has a Related Products section or not then retrieve the information    [Documentation]    kiểm tra sản phẩm có phần Related Products hay không sau đó lấy thông tin ra
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    Wait Until Element Is Visible   xpath=//*[@id="myTab"]

    ${nav}    Get Text    xpath=//*[@id="myTab"]
    Click Element    xpath=//*[@id="myTab"]/li[3]
    ${nav}    Get Text    xpath=//*[@id="productdesc"]/div/div/div

    ${product_elements}    Get WebElements    xpath=//*[@id="relatedproducts"]/ul/li
    ${number_of_products}    Get Length    ${product_elements}
    Should Be Equal As Numbers    ${number_of_products}    2
    Run Keyword If   '${number_of_products} == 2'    Log     Related Products chính xác 



Check if the product has a Latest Products section or not then retrieve the information    [Documentation]    kiểm tra sản phẩm có phần Latest Products hay không sau đó lấy thông tin ra

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    ${Latest Products}    Get Text    xpath=//*[@id="maincontainer"]/div/div[1]

    ${product_elements}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div[1]/div[1]/ul/li
    ${number_of_products}    Get Length    ${product_elements}
    Should Be Equal As Numbers    ${number_of_products}    4
    Run Keyword If   '${number_of_products} == 4'    Log    Latest Products chính xác 

    Close Browser







Check if the product has an Add to Cart section and then get information (for products in stock)    [Documentation]    Kiểm tra xem sản phẩm có phần Thêm vào giỏ hàng hay không rồi lấy thông tin(đối với sản phẩm còn hàng)

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    ${Get_infor}    Get Text    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Wait Until Element Is Visible    xpath=//*[@id="cart"]/div/div[1]/table    timeout=5s
    Should Be Equal    ${Get_infor}        Add to Cart
    Run Keyword If    '${Get_infor}' == 'Add to Cart'    Log    Sản phẩm vẫn còn
    ${Get_infor_in_ Shopping Cart}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table


    Close Browser



Check if the product has an Add to Cart section and then get information (for out of stock products)    [Documentation]    Kiểm tra xem sản phẩm có phần Thêm vào giỏ hàng hay không rồi lấy thông tin(đối với sản phẩm hết hàng)

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   BeneFit Girl Meets Pearl
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    #lấy thông tin phần nav
    ${Get_infor}    Get Text    xpath=//*[@id="product"]/fieldset/div[4]/ul
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul
    Wait Until Element Is Not Visible    xpath=//*[@id="cart"]/div/div[1]/table    timeout=5s
    Should Be Equal    ${Get_infor}        Out of Stock
    Run Keyword If    '${Get_infor}' == 'Out of Stock'    Log    Sản phẩm đã hết rồi


    Close Browser


Check if the product is on sale or not if getting information and vice versa    [Documentation]    Kiểm tra xem sản phẩm đang giảm giá hay không nếu lấy thông tin và ngược lại

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Absolue Eye Precious Cells
    Click Element    xpath=//*[@id="search_form"]/div/div
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    ${Get_infor}    Get Text    xpath=//*[@id="product_details"]/div/div[2]
    ${productpageoldprice}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/span
    ${productfilneprice}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    
    ${productpageoldprice}    Set Variable    ${productpageoldprice}[1:]
    ${productfilneprice}    Set Variable    ${productfilneprice}[1:]
    ${productpageoldprice}    Convert To Number    ${productpageoldprice}
    ${productfilneprice}    Convert To Number    ${productfilneprice}
    Run Keyword If   ${productpageoldprice} > ${productfilneprice}    Log    Giá sản phẩm đã thay đổi !!! giá cũ lớn hơn giá mới, tức là sản phẩm này là sản phẩm giảm giá

    ...    ELSE    Log    mơ đi 



#phân trang


#address book


*** Keywords ***
Wait and Click Element
    [Arguments]    ${xpath}
    Wait Until Page Contains Element    ${xpath}    timeout=${WAIT_TIME}
    Click Element    ${xpath}


Wait and Check img
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[1]/div[1]
Wait for Image to Load
    Wait Until Element Is Visible    xpath=//img    timeout=${WAIT_TIME}
    Log    Ảnh đã load thành công

xem các ảnh img của các màu sản phẩm
    Log    xem các ảnh img của các màu sản phẩm
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[1]
    Wait for Image to Load
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[2]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[3]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[4]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[5]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[6]
    Wait for Image to Load

click chọn các màu của sản phẩm
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    ${color-1}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    ${color-2}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    ${color-3}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    ${color-4}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]
    ${color-5}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]