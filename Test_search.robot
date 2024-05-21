*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    DateTime
Library    BuiltIn

*** Variables ***
${URL}    https://automationteststore.com
${search_keyword}    EYE MASTER
${incorrect_keyword}    Ey Mastr    # Từ khóa sai chính tả
${special_keyword}    !@#$%^&*(){}[]|\\;':",.<>?/~_+    # Từ khóa chứa các ký tự đặc biệt bạn muốn tìm kiếm
${search_keyword_low}    acqua di gio pour homme    # Từ khóa tìm kiếm
${expected_result}    ACQUA DI GIO POUR HOMME    # Kết quả mong đợi
${filter1_value}    Apparel & accessories               # Giá trị của bộ lọc 1
${filter2_value}    All Categories               # Giá trị của bộ lọc 2
${filter3_value}    Fragrance               # Giá trị của bộ l
${long_query}       ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE} # Một chuỗi truy vấn dài

*** Test Cases ***


TimKiemSanPham0
    [Documentation]    TÌm kiếm rỗng
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    #Input Text    id=filter_keyword    [ ]
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser

TimKiemSanPham1
    [Documentation]    TÌm kiếm dấu cách
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    [         ]
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
   
    Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser


TimKiemSanPham1.1
    [Documentation]    Tìm kiếm bằng danh mục
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    Men
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    ${message3}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    #Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser


TimKiemSanPham1.2
    [Documentation]    TÌm kiếm kí tự đặc biệt
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    ~!@$&*^*@!
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
   
    Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser

TimKiemSanPham1.3


    [Documentation]    Tìm kiếm bằng số 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    1
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    ${message3}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    #Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser




Search by category and retrieve the quantity in the found category
    [Documentation]    tìm theo danh mục và lấy ra số lượng trong danh mục đã tìm được
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   MEN
    Click Element    xpath=//*[@id="search_form"]/div/div
    ${product_elements}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[*]
    ${number_of_products}    Get Length    ${product_elements}
    Log    Số lượng sản phẩm gồm : ${number_of_products}
    # Bước 3: Tạo số ngẫu nhiên từ 1 đến 16
    ${options}=    Create List    1    2    3    4    6    7    8    9    11    12    13    14    16
    ${length}=    Get Length    ${options}
    ${random_index}=    Evaluate    random.randint(0, ${length}-1)
    ${random_number}=    Get From List    ${options}    ${random_index}

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng


    #${search_input_value}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]

    Log    Chọn 1 sản phẩm bất kì trong list đã search
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[${random_number}]/div[2]/a/img

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser

Kiểm tra tìm kiếm sản phẩm bằng từ khóa hợp lệ 

    [Documentation]    Kiểm tra tìm kiếm sản phẩm bằng từ khóa hợp lệ và những sản phẩm liên quan có chung từ khoá

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    ${search_keyword}
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Kiểm Tra 
    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${search_input_value}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    ${product_elements}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[*]
    ${number_of_products}    Get Length    ${product_elements}
    Should Be Equal As Numbers    ${number_of_products}    2
    Close Browser


Kiểm tra tìm kiếm với từ khóa sai chính tả và kiểm tra đề xuất (Trường Hợp đề xuất = 0)
    [Documentation]    Kiểm tra tìm kiếm với từ khóa sai chính tả và kiểm tra các đề xuất
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm sai chính tả và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    ${incorrect_keyword}
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Kiểm tra đề xuất
    ${suggestion_elements}    Get WebElements    xpath=//*[@id="search_autocomplete"]/div
    ${number_of_suggestions}    Get Length    ${suggestion_elements}
    Run Keyword If    ${number_of_suggestions} == 0    Log    Không có sản phẩm liên quan với từ khoá đã tìm
    Run Keyword If    ${number_of_suggestions} > 0    Log    Đã tìm thấy các đề xuất có chung từ khoá liên quan


Xác minh rằng các trường tìm kiếm trống cung cấp thông báo thích hợp.

    [Documentation]    Xác minh rằng các trường tìm kiếm trống cung cấp thông báo thích hợp.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm 
    Click Element    xpath=//*[@id="filter_keyword"]
    #Input Text    id=filter_keyword    ${search_keyword_empty}
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Kiểm tra đề xuất
    ${suggestion_elements}    Get WebElements    xpath=//*[@id="search_autocomplete"]/div
    ${number_of_suggestions}    Get Length    ${suggestion_elements}
    Run Keyword If    ${number_of_suggestions} == 0    Log    Không có sản phẩm liên quan với từ khoá đã tìm
    Run Keyword If    ${number_of_suggestions} > 0    Log    Đã tìm thấy các đề xuất có chung từ khoá liên quan


Kiểm tra tìm kiếm với các ký tự đặc biệt trong truy vấn
    [Documentation]    Kiểm tra tìm kiếm với các ký tự đặc biệt trong truy vấn
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm chứa các ký tự đặc biệt và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    ${special_keyword}
    Click Element    xpath=//*[@id="search_form"]/div/div
    # Bước 3: Kiểm tra đề xuất
    ${suggestion_elements}    Get WebElements    xpath=//*[@id="search_autocomplete"]/div
    ${number_of_suggestions}    Get Length    ${suggestion_elements}
    Run Keyword If    ${number_of_suggestions} == 0    Log    Không có sản phẩm liên quan với từ khoá đã tìm
    Run Keyword If    ${number_of_suggestions} > 0    Log    Đã tìm thấy các đề xuất có chung từ khoá liên quan

Kiểm tra tính không phân biệt chữ hoa chữ thường trong truy vấn tìm kiếm

    [Documentation]    Kiểm tra tính không phân biệt chữ hoa chữ thường trong truy vấn tìm kiếm
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chuyển đổi từ khóa tìm kiếm và thực hiện tìm kiếm
    ${search_keyword_lower}    Convert To Lower Case    ${search_keyword_low}
    Input Text    id=filter_keyword    ${search_keyword_lower}
    Log    lấy ra giá trị của biến lower: ${search_keyword_lower}
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Chuyển đổi kết quả tìm kiếm và xác nhận
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[1]
    ${search_input_value}    Get Text    xpath=//*[@id="product_details"]/div/div[2]
    # Bước 2: Chuyển đổi từ khóa tìm kiếm và thực hiện tìm kiếm
    ${search_keyword_upper}    Convert To Lower Case    ${expected_result}
    Input Text    id=filter_keyword    ${expected_result}
    Log    lấy ra giá trị của biến upper: ${expected_result}
    Click Element    xpath=//*[@id="search_form"]/div/div
    # Bước 3: Chuyển đổi kết quả tìm kiếm và xác nhận
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[1]
    ${search_input_value}    Get Text    xpath=//*[@id="product_details"]/div/div[2]


    Log    so sánh giá trị của lower và upper
    Log     ${search_keyword_lower}
    Log     ${expected_result}
    #Kết quả tìm kiếm không chứa từ khóa không phân biệt chữ hoa chữ thường
    Run Keyword If    '${search_keyword_lower}' != '${expected_result}'    Log    Kết quả tìm kiếm chứa từ khóa không phân biệt chữ hoa chữ thường


Kiểm tra tìm kiếm với các bộ lọc

    [Documentation]    Kiểm tra tìm kiếm bằng cách kết hợp các bộ lọc
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm
    Click Element    id=filter_keyword
    ${messgase}    Get Text    id=filter_keyword
    Input Text    id=filter_keyword    ${search_keyword}

    # Bước 3: Chọn các bộ lọc 
    Log    tìm sản phẩm với danh muc: Fragrance
    Click Element    xpath=//*[@id="search-category"]/li[7]
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 4: Kiểm tra kết quả tìm kiếm
    # Thêm các bước kiểm tra kết quả tìm kiếm ở đây
    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    #${search_input_value}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    ${product_elements}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[*]
    ${number_of_products}    Get Length    ${product_elements}
    Should Be Equal As Numbers    ${number_of_products}    0
    
    
    Log    tìm sản phẩm với danh muc: All Categories
    Click Element    id=filter_keyword
    ${messgase}    Get Text    id=filter_keyword
    Input Text    id=filter_keyword    ${search_keyword}
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 4: Kiểm tra kết quả tìm kiếm
    # Thêm các bước kiểm tra kết quả tìm kiếm ở đây
    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${search_input_value}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    ${product_elements}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[*]
    ${number_of_products}    Get Length    ${product_elements}
    Should Be Equal As Numbers    ${number_of_products}    2.0
    
    
    Close Browser


Kiểm tra tìm kiếm các sản phẩm hết hàng
    [Documentation]    Kiểm tra tìm kiếm các sản phẩm hết hàng
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm sản phẩm hết hàng và thực hiện tìm kiếm
    Input Text    id=filter_keyword    BeneFit Girl Meets Pearl
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Kiểm tra xem có thông báo hoặc biểu tượng nào để chỉ ra rằng sản phẩm đã hết hàng
    ${out_of_stock_message}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div
    ${address_Out of Stock}    Get Text    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/span
    Run Keyword If    '${address_Out of Stock}' == 'Out of Stock'    Log    thông báo sản phẩm hết hàng
    ...    ELSE    Log    Sản Phẩm còn hàng
    ...    

Kiểm tra khả năng phản hồi của trang kết quả tìm kiếm
    [Documentation]    Kiểm tra khả năng phản hồi của trang kết quả tìm kiếm
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    # Bước 1: Thực hiện tìm kiếm và đo thời gian phản hồi
    ${start_time}    Get Time
    Input Text    id=filter_keyword    ${search_keyword}
    Click Element    xpath=//*[@id="search_form"]/div/div
    ${end_time}    Get Time
    ${response_time}    Convert To String    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang kết quả tìm kiếm là: ${response_time}

Kiểm tra tìm kiếm với chuỗi truy vấn rất dài
    [Documentation]    Kiểm tra tìm kiếm với chuỗi truy vấn rất dài
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập chuỗi truy vấn rất dài và thực hiện tìm kiếm
    Input Text    id=filter_keyword    ${long_query}
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Kiểm tra kết quả tìm kiếm
    # Thêm các bước kiểm tra kết quả tìm kiếm ở đây
    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    #${search_input_value}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    ${product_elements}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[*]
    ${number_of_products}    Get Length    ${product_elements}
    Should Be Equal As Numbers    ${number_of_products}    0

