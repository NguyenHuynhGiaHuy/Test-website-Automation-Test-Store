*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections


*** Variables ***
${BROWSER}             Chrome
${URL}                 https://automationteststore.com
${VALID_USERNAME}      NguyenQuynhNhu
${VALID_PASSWORD}      123456789
${FILTER_DROPDOWN}     xpath=//select[@id='sort']
${FILTER_OPTION}       xpath=//select[@id='sort']/option[text()='Rating Lowest']

*** Test Cases ***

Expand Filter Dropdown
    [Documentation]    Xác minh việc nhấp vào menu thả xuống bộ lọc sẽ mở rộng bộ lọc.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    Click Filter Dropdown   
    Filter Dropdown Should Expand   
    Close Browser

Verify Collapse Filter When Deselecting Filter Area
    [Documentation]    Xác minh rằng bỏ chọn vùng lọc sẽ làm thu gọn bộ lọc.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    # Kiểm tra trạng thái ban đầu của bộ lọc
    ${filter_dropdown_status}    Get Element Attribute    ${FILTER_DROPDOWN}    class
    Should Contain    ${filter_dropdown_status}    form-control     # Bộ lọc đang mở rộng
    # Bỏ chọn vùng lọc
    Click Element    ${FILTER_OPTION}
    # Kiểm tra lại trạng thái của bộ lọc
    ${filter_dropdown_status}    Get Element Attribute    ${FILTER_DROPDOWN}    class
    Should Not Contain    ${filter_dropdown_status}    open    # Bộ lọc đã được thu gọn
    Close Browser


Verify Filter is Optional
    [Documentation]    Đảm bảo rằng lọc là một tùy chọn và không bắt buộc.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    # Kiểm tra xem bộ lọc có tồn tại trên trang web không
    Page Should Contain Element    ${FILTER_DROPDOWN}
    Close Browser


Verify Display of Filter Options Before Search
    [Documentation]    Đảm bảo ứng dụng cho phép hiển thị các tùy chọn bộ lọc trước khi tìm kiếm.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    # Kiểm tra xem bộ lọc có hiển thị trước khi tìm kiếm hay không
    ${filter_dropdown_visibility}    Run Keyword And Return Status    Element Should Be Visible    ${FILTER_DROPDOWN}
    Should Be True    ${filter_dropdown_visibility}
    Close Browser


Verify Filter Selection Returns Correct Results
    [Documentation]    Xác thực việc chọn bộ lọc trả về kết quả phù hợp với bộ lọc đã chọn.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    # Chọn bộ lọc
    Select From List By Value    ${FILTER_DROPDOWN}    rating-DESC
    # Chờ trang tải lại
    Sleep    2s
    # Xác minh rằng bộ lọc đã được chọn thành công
    ${selected_filter}    Get Selected List Value    ${FILTER_DROPDOWN}
    Should Be Equal As Strings    ${selected_filter}    rating-DESC
    # Thu thập các sản phẩm hiển thị
    ${products}    Get WebElements     //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${product_count}    Get Length    ${products}
    # Kiểm tra rằng có ít nhất một sản phẩm được hiển thị
    Should Be True    ${product_count} > 0
    # Kiểm tra xem tên sản phẩm đầu tiên có chứa từ khóa "FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM" không
    ${first_product_name}    Get Text    ${products}[0]
    Should Contain    ${first_product_name}    FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM
    Close Browser

Verify Results Outside Selected Filter Are Not Returned
    [Documentation]    Xác minh kết quả bên ngoài bộ lọc đã chọn không được trả về.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    # Chọn bộ lọc
    Select From List By Value    ${FILTER_DROPDOWN}    rating-DESC
    # Chờ trang tải lại
    Sleep    2s
    # Lấy tên bộ lọc đã chọn
    ${selected_filter}    Get Selected List Value    ${FILTER_DROPDOWN}
    # Thu thập các sản phẩm hiển thị
    ${products}    Get WebElements    //div[@class='container-main']//div[@class='thumbnail']//h4/a
    # Kiểm tra xem tất cả các sản phẩm có chứa từ khóa của bộ lọc không
    FOR    ${product}    IN    @{products}
        ${product_name}    Get Text    ${product}
        # Kiểm tra nếu sản phẩm không chứa từ khóa của bộ lọc, thì in ra tên sản phẩm
        Run Keyword If    "${selected_filter}" in "${product_name}"    Log    Product "${product_name}" is not returned under selected filter "${selected_filter}"
    END
    Close Browser


Check display filter from oldest date to newest.
    [Documentation]    Kiểm tra hiển thị lọc từ ngày cũ nhất đến mới nhất.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    date_modified-ASC
    Sleep    2s
    Verify Current Sort    date_modified-ASC
    Close Browser

Check display filtering by name from A to Z.
    [Documentation]     Kiểm tra hiển thị lọc theo tên từ A đến Z.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    pd.name-ASC
    Sleep    2s
    Verify Current Sort    pd.name-ASC
    Close Browser

Check display filtering by name from Z to A.
    [Documentation]    Kiểm tra hiển thị lọc theo tên từ Z đến A.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    pd.name-DESC
    Sleep    2s
    Verify Current Sort    pd.name-DESC
    Close Browser


Check the display filtered by price from low to high.
    [Documentation]    Kiểm tra hiển thị lọc theo giá từ thấp đến cao.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    p.price-ASC
    Sleep    2s
    Verify Current Sort    p.price-ASC
    Close Browser

Check the display filtered by price from high to low.
    [Documentation]    Kiểm tra hiển thị lọc theo giá từ cao đến thấp.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    p.price-DESC
    Sleep    2s
    Verify Current Sort    p.price-DESC
    Close Browser


Check the filter display by rating from high to low.
    [Documentation]    Kiểm tra hiển thị lọc theo đánh giá từ cao đến thấp.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    rating-DESC
    Sleep    2s
    Verify Current Sort    rating-DESC
    Close Browser


Check display filter by rating from low to high.
    [Documentation]    Kiểm tra hiển thị lọc theo đánh giá từ thấp đến cao.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    rating-ASC
    Sleep    2s
    Verify Current Sort    rating-ASC
    Close Browser


Check display filter from newest to oldest date.
    [Documentation]    Kiểm tra hiển thị lọc từ ngày mới nhất đến cũ nhất.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    date_modified-DESC
    Sleep    2s
    Verify Current Sort    date_modified-DESC
    Close Browser

Sort By Date Old to New
    [Documentation]    Kiểm tra chức năng sắp xếp từ ngày cũ nhất đến mới nhất.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    date_modified-ASC
    ${expected_product_names}    Create List    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS    WOMENS HIGH HEEL POINT TOE STILETTO SANDALS ANKLE STRAP COURT SHOES    JERSEY COTTON STRIPED POLO SHIRT   PRODUCT WITH OPTIONS AND STOCK LOCATIONS   DESIGNER MEN CASUAL FORMAL DOUBLE CUFFS GRANDAD BAND COLLAR SHIRT ELEGANT TIE    FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM   FIORELLA PURPLE PEEP TOES    RUBY SHOO WOMENS JADA T-BAR
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser
    Close Browser

Test the function of sorting from newest to oldest date.
    [Documentation]    Kiểm tra chức năng sắp xếp từ ngày mới nhất đến cũ nhất.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    date_modified-DESC

    ${expected_product_names}    Create List    FIORELLA PURPLE PEEP TOES    RUBY SHOO WOMENS JADA T-BAR    FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM    DESIGNER MEN CASUAL FORMAL DOUBLE CUFFS GRANDAD BAND COLLAR SHIRT ELEGANT TIE    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS    WOMENS HIGH HEEL POINT TOE STILETTO SANDALS ANKLE STRAP COURT SHOES    JERSEY COTTON STRIPED POLO SHIRT    PRODUCT WITH OPTIONS AND STOCK LOCATIONS
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser

Test the function of sorting by name from A to Z.
    [Documentation]    Kiểm tra chức năng sắp xếp theo tên từ A đến Z.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    pd.name-ASC

    ${expected_product_names}    Create List    DESIGNER MEN CASUAL FORMAL DOUBLE CUFFS GRANDAD BAND COLLAR SHIRT ELEGANT TIE    FIORELLA PURPLE PEEP TOES    FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM    JERSEY COTTON STRIPED POLO SHIRT    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS    PRODUCT WITH OPTIONS AND STOCK LOCATIONS    RUBY SHOO WOMENS JADA T-BAR    WOMENS HIGH HEEL POINT TOE STILETTO SANDALS ANKLE STRAP COURT SHOES
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser


Test the function of sorting by name from Z to A.
    [Documentation]    Kiểm tra chức năng sắp xếp theo tên từ Z đến A.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    pd.name-DESC

    ${expected_product_names}    Create List   WOMENS HIGH HEEL POINT TOE STILETTO SANDALS ANKLE STRAP COURT SHOES    RUBY SHOO WOMENS JADA T-BAR    PRODUCT WITH OPTIONS AND STOCK LOCATIONS    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS    JERSEY COTTON STRIPED POLO SHIRT    FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM    FIORELLA PURPLE PEEP TOES    DESIGNER MEN CASUAL FORMAL DOUBLE CUFFS GRANDAD BAND COLLAR SHIRT ELEGANT TIE
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser

Check out the sorting of functions by price from low to high.
    [Documentation]    Kiểm tra chức năng sắp xếp theo giá từ thấp đến cao.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    p.price-ASC

    ${expected_product_names}    Create List    $6.75   $9.99    $21.00    $26.00    $26.00    $32.00    $78.00    $110.00
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//div[@class='price']//div[@class='oneprice']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser

Test the function of sorting by price from high to low
    [Documentation]    Kiểm tra chức năng sắp xếp theo giá từ cao đến thấp
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    p.price-DESC

    ${expected_product_names}    Create List    $110.00     $78.00     $32.00     $26.00     $26.00     $21.00     $9.99     $6.75
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//div[@class='price']//div[@class='oneprice']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser

Test the sorting function by rating from high to low.
    [Documentation]    Kiểm tra chức năng sắp xếp theo đánh giá từ cao đến thấp.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    rating-DESC
    ${expected_product_names}    Create List   FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM    FIORELLA PURPLE PEEP TOES    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS    RUBY SHOO WOMENS JADA T-BAR    WOMENS HIGH HEEL POINT TOE STILETTO SANDALS ANKLE STRAP COURT SHOES   JERSEY COTTON STRIPED POLO SHIRT    DESIGNER MEN CASUAL FORMAL DOUBLE CUFFS GRANDAD BAND COLLAR SHIRT ELEGANT TIE     PRODUCT WITH OPTIONS AND STOCK LOCATIONS    
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser

Check the sorting function by rating from low to high.
    [Documentation]     Kiểm tra chức năng sắp xếp theo đánh giá từ thấp đến cao.
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Value    id=sort    rating-ASC
    ${expected_product_names}    Create List       FIORELLA PURPLE PEEP TOES    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS    RUBY SHOO WOMENS JADA T-BAR    WOMENS HIGH HEEL POINT TOE STILETTO SANDALS ANKLE STRAP COURT SHOES   JERSEY COTTON STRIPED POLO SHIRT    DESIGNER MEN CASUAL FORMAL DOUBLE CUFFS GRANDAD BAND COLLAR SHIRT ELEGANT TIE     PRODUCT WITH OPTIONS AND STOCK LOCATIONS    FRUIT OF THE LOOM T-SHIRTS 5 PACK - SUPER PREMIUM
    ${actual_product_names}    Get WebElements    //div[contains(@class, 'col-md-3') and contains(@class, 'col-sm-6') and contains(@class, 'col-xs-12')]//a[@class='prdocutname']
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser


Test Filter Presence on Each Page
    [Documentation]    Kiểm tra sự hiện diện của bộ lọc trên mỗi trang phân trang
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    Select From List By Value    id=limit    50
    Element Should Be Visible    ${FILTER_DROPDOWN}
    Close Browser


Test Filter Preservation Across Pages
    [Documentation]    Kiểm tra lựa chọn bộ lọc có được duy trì qua các trang hay không
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Maximize Browser Window
    Select From List By Value    id=limit    50
    Select From List By Value    ${FILTER_DROPDOWN}    rating-DESC
    ${selected_filter}    Get Selected List Value    ${FILTER_DROPDOWN}
    Should Be Equal As Strings    ${selected_filter}    rating-DESC
    Close Browser

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
    Click Element    //*[@id="categorymenu"]/nav/ul/li[2]/a

#Kiểm tra hiển thị lọc xem đúng không 
Verify Current Sort
    [Arguments]    ${expected_sort}
    ${current_sort}=    Get Selected List Value    id=sort
    Should Be Equal    ${current_sort}    ${expected_sort}

Click Filter Dropdown
    [Documentation]    Nhấp vào menu thả xuống bộ lọc
    Click Element    xpath=//select[@id='sort']
   

Filter Dropdown Should Expand
    [Documentation]    Xác nhận rằng menu thả xuống bộ lọc đã mở rộng
    ${dropdown_expanded}    Get Element Attribute    xpath=//select[@id='sort']   class   
    Should Contain    ${dropdown_expanded}    form-control    
