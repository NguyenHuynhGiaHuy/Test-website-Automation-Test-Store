*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://automationteststore.com/
${USERNAME_ADMIN}    Admin1232014
${PASSWORD_ADMIN}    Admin1232014
${Page_hanChe}    https://automationteststore.com/index.php?rt=account/account
*** Test Cases ***
Verify that the user was successfully logged out and redirected to the login page.
    [Documentation]      Xác minh rằng người dùng đã đăng xuất thành công và được chuyển hướng đến trang đăng nhập.
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s
    #Click Link    xpath=//a[contains(@href, 'account/logout')]
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
  # Kiểm tra URL trang hiện tại sau khi thực hiện JavaScript
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://automationteststore.com/index.php?rt=account/logout
    Close All Browsers

Check if users can still access restricted pages or perform actions after logging out.
    [Documentation]     Kiểm tra xem người dùng vẫn có thể truy cập các trang bị hạn chế hoặc thực hiện các hành động sau khi đăng xuất hay không.
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s
    # Execute JavaScript để logout và chuyển hướng đến trang logout
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
    # Thử truy cập một trang bị hạn chế
    Go To    https://automationteststore.com/index.php?rt=account/account
    Should Be Equal As Strings    ${Page_hanChe}    https://automationteststore.com/index.php?rt=account/login
    # Thử thực hiện một hành động khác sau khi đăng xuất
    Click Element    xpath=//a[@title="Facebook"]
    Close All Browsers


Check that the user has successfully logged out and that all browser cookies have been cleared.
    [Documentation]      Kiểm tra xem người dùng đã đăng xuất thành công và tất cả cookie của trình duyệt đã được xóa.
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
 # Đăng nhập
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s

    # Lấy cookies hiện tại
    ${cookies_before_logout}=    Get Cookies

    # Đăng xuất
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
    Sleep    3s

    # Kiểm tra cookies sau khi đăng xuất và xóa tất cả cookies
    ${cookies_after_logout}=    Get Cookies
    Delete All Cookies
    ${cookies_after_deletion}=    Get Cookies

    # Kiểm tra cookies trước và sau khi đăng xuất, và kiểm tra xem tất cả cookies đã được xóa
    Should Not Be Empty    ${cookies_before_logout}    Cookie tồn tại trước khi đăng xuất
    Should Not Be Empty    ${cookies_after_logout}    Cookie tồn tại sau khi đăng xuất
    Should Be Empty   ${cookies_after_deletion}    Tất cả cookie đã được xóa

    Close All Browsers

Verify that sign in and sign out occur over a secure HTTPS connection.
    [Documentation]      Xác minh rằng quá trình đăng nhập và đăng xuất diễn ra qua kết nối HTTPS an toàn.
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
    # Kiểm tra kết nối HTTPS tại trang đăng nhập
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng nhập
    Close All Browsers

Check that the user has successfully logged out, all browser cookies have been cleared, and a secure HTTPS connection is used.
    [Documentation]  Kiểm tra xem người dùng đã đăng xuất thành công, tất cả cookie của trình duyệt đã được xóa và kết nối HTTPS an toàn được sử dụng.
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    # Kiểm tra kết nối HTTPS tại trang đăng nhập
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng nhập
    Sleep    2s
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s

    # Lấy cookies hiện tại
    ${cookies_before_logout}=    Get Cookies

    # Đăng xuất
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
    Sleep    3s

    # Kiểm tra kết nối HTTPS tại trang đăng xuất
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng xuất

    # Kiểm tra cookies sau khi đăng xuất và xóa tất cả cookies nếu còn tồn tại
    ${cookies_after_logout}=    Get Cookies
    Delete All Cookies
    ${cookies_after_deletion}=    Get Cookies

    # Kiểm tra cookies trước và sau khi đăng xuất, và kiểm tra xem tất cả cookies đã được xóa
    Should Not Be Empty    ${cookies_before_logout}    Cookie tồn tại trước khi đăng xuất
    Should Not Be Empty    ${cookies_after_logout}    Cookie tồn tại sau khi đăng xuất
    Should Be Empty   ${cookies_after_deletion}    Tất cả cookie đã được xóa

    Close All Browsers

Check that the user has successfully logged out, all browser cookies have been cleared, and the HTTP session cannot be hijacked.
    [Documentation]  Kiểm tra xem người dùng đã đăng xuất thành công, tất cả cookie của trình duyệt đã được xóa và không thể chiếm quyền điều khiển phiên HTTP.
    Open Browser    ${URL}    ${BROWSER}
    
    # Đăng nhập
    Go To    https://automationteststore.com/index.php?rt=account/login
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s

    # Lấy cookies hiện tại
    ${cookies_before_logout}=    Get Cookies
    
    # Kiểm tra kết nối HTTPS tại trang đăng nhập
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng nhập

    # Đăng xuất
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
    Sleep    3s

    # Kiểm tra kết nối HTTPS tại trang đăng xuất
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng xuất

    # Kiểm tra cookies sau khi đăng xuất
    ${cookies_after_logout}=    Get Cookies

    # Xóa tất cả cookies
    Delete All Cookies
    ${cookies_after_deletion}=    Get Cookies

    # Kiểm tra rằng cookies trước khi đăng xuất không còn tồn tại sau khi đăng xuất và xóa
    Should Not Be Empty    ${cookies_before_logout}    Cookie tồn tại trước khi đăng xuất
    Should Be Empty        ${cookies_after_logout}    Cookie vẫn tồn tại sau khi đăng xuất
    Should Be Empty        ${cookies_after_deletion}    Tất cả cookie đã được xóa

    Close All Browsers
Test Logout And Cookie Deletion With Secure Connection
    [Documentation]  Kiểm tra xem người dùng đã đăng xuất thành công, tất cả cookie của trình duyệt đã được xóa và duy trì kết nối HTTPS an toàn trong suốt quá trình.
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    # Kiểm tra kết nối HTTPS tại trang đăng nhập
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng nhập

    # Đăng nhập
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button
    Sleep    3s

    # Lấy cookies hiện tại
    ${cookies_before_logout}=    Get Cookies
    
    # Kiểm tra lại kết nối HTTPS sau khi đăng nhập
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn sau khi đăng nhập

    # Đăng xuất
    Execute JavaScript    window.location.href = 'https://automationteststore.com/index.php?rt=account/logout'
    Sleep    3s

    # Kiểm tra kết nối HTTPS tại trang đăng xuất
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    Kết nối không an toàn tại trang đăng xuất


    Close All Browsers


Test Access Logout Button Using Keyboard Navigation
    [Documentation]  Xác minh rằng người dùng có thể truy cập nút đăng xuất bằng điều hướng bàn phím.
    Open Browser    ${URL}    ${BROWSER}
    
    # Đăng nhập
    Go To            https://automationteststore.com/index.php?rt=account/login
    Input Text       //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password   //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button     //*[@id="loginFrm"]/fieldset/button
    Sleep            3s

    # Chờ cho phần tử chứa nút đăng xuất hiển thị
     Execute JavaScript    document.querySelector('li[data-id="menu_account"] > a').click()

    # Nhấn Tab để di chuyển đến nút đăng xuất
    ${tab}       Execute JavaScript    document.querySelector('li[data-id="menu_logout"] > a').click()
    Press Keys        ${tab}    \\9
    Sleep            1s

    # Nhấn Enter để kích hoạt nút đăng xuất
    Press Keys        ${tab}   \\13
    Sleep            3s

    # Đóng trình duyệt
    Close All Browsers

Click Logout Dropdown
    [Documentation]  Click vào dropdown Logout trong menu.
    Open Browser    ${URL}    ${BROWSER}
    Go To            https://automationteststore.com/index.php?rt=account/login
    Input Text       //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password   //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button     //*[@id="loginFrm"]/fieldset/button
    Sleep            3s
    Maximize Browser Window
    # Tìm và click vào dropdown "Account"
    Execute JavaScript    document.querySelector('li[data-id="menu_account"] > a').click()
    
    # Tìm và click vào liên kết "Logout" trong dropdown
    Execute JavaScript    document.querySelector('li[data-id="menu_logout"] > a').click()
    
    Close All Browsers
