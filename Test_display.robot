*** Settings ***
Library    SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library    String

*** Variables ***
${BROWSER}        Chrome
${URL}            https://automationteststore.com/
${USERNAME_ADMIN}    Admin1232014
${PASSWORD_ADMIN}    Admin1232014

${current_url_facebook_check}    http://www.facebook.com/
${current_url_twitter_check}   https://twitter.com/
${current_url_linkedin_check}    https://uk.linkedin.com/
*** Test Cases ***
Check and click on Facebook, Twitter, Linkedin links (Home - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Sleep    5s
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (Home - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Sleep    5s
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (login - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (login - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/login
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (login - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (login - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/login
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR PASSWORD - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR PASSWORD - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SPECIAL OFFERS - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SPECIAL OFFERS - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/special
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SPECIAL OFFERS - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SPECIAL OFFERS - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/special
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SHOPPING CART - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SHOPPING CART - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SHOPPING CART - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SHOPPING CART - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (APPAREL & ACCESSORIES - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (APPAREL & ACCESSORIES - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MAKEUP - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MAKEUP - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MAKEUP - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MAKEUP - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SKINCARE - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SKINCARE - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SKINCARE - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SKINCARE - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FRAGRANCE - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FRAGRANCE - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FRAGRANCE - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FRAGRANCE - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MEN - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MEN - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MEN - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MEN - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (HAIR CARE - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (HAIR CARE - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (HAIR CARE - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (HAIR CARE - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (BOOKS - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (BOOKS - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (BOOKS - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (BOOKS - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (LATEST PRODUCTS - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (LATEST PRODUCTS - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Click Element    xpath=//div[@class="thumbnail"]
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (LATEST PRODUCTS - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (LATEST PRODUCTS - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="thumbnail"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR LOGIN NAME - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR LOGIN NAME - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers


Check and click on Facebook, Twitter, Linkedin links (CONTACT US - header)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (CONTACT US - header)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (CONTACT US - footer)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (CONTACT US - footer)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

#########################################################Kiểm tra khi đã login###########################################
Check and click on Facebook, Twitter, Linkedin links (Home - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Sleep    5s
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (Home - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Sleep    5s
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (login - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (login - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/login
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (login - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (login - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/login
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR PASSWORD - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR PASSWORD - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SPECIAL OFFERS - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SPECIAL OFFERS - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/special
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SPECIAL OFFERS - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SPECIAL OFFERS - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/special
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SHOPPING CART - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SHOPPING CART - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SHOPPING CART - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SHOPPING CART - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (APPAREL & ACCESSORIES - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (APPAREL & ACCESSORIES - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MAKEUP - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MAKEUP - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MAKEUP - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MAKEUP - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SKINCARE - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SKINCARE - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (SKINCARE - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SKINCARE - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FRAGRANCE - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FRAGRANCE - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FRAGRANCE - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FRAGRANCE - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MEN - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MEN - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (MEN - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MEN - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (HAIR CARE - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (HAIR CARE - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (HAIR CARE - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (HAIR CARE - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (BOOKS - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (BOOKS - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (BOOKS - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (BOOKS - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (LATEST PRODUCTS - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (LATEST PRODUCTS - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Click Element    xpath=//div[@class="thumbnail"]
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (LATEST PRODUCTS - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (LATEST PRODUCTS - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="thumbnail"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR LOGIN NAME - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - footer-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR LOGIN NAME - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers


Check and click on Facebook, Twitter, Linkedin links (CONTACT US - header-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (CONTACT US - header-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Click Element    xpath=//a[@title="Facebook"]
    Click Element    xpath=//a[@title="Twitter"]
    Click Element    xpath=//a[@title="Linkedin"]
    [Teardown]    Close All Browsers

Check and click on Facebook, Twitter, Linkedin links (CONTACT US - footer -login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (CONTACT US - footer-login)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Click Element    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    [Teardown]    Close All Browsers


################################## kiểm tra kích thước icon #####################################
Check size icon Facebook, Twitter, Linkedin links (Home - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (Home - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser




Check size icon Facebook, Twitter, Linkedin links (login - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (login - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/login
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (login - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (Trang chủ - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/login
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR PASSWORD - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR PASSWORD -footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser


Check size icon Facebook, Twitter, Linkedin links (SPECIAL OFFERS - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SPECIAL OFFERS - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/special
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SPECIAL OFFERS - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SPECIAL OFFERS - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/special
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SHOPPING CART - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SHOPPING CART - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SHOPPING CARTS - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SHOPPING CART - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (APPAREL & ACCESSORIES - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (APPAREL & ACCESSORIES - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MAKEUP - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MAKEUP - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MAKEUP - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MAKEUP - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SKINCARE - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SKINCARE - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SKINCARE - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (SKINCARE - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FRAGRANCE - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FRAGRANCE - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FRAGRANCE - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FRAGRANCE - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MEN - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MEN - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MEN - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (MEN - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (HAIR CARE - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (HAIR CARE - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (HAIR CARE - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (HAIR CARE - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (BOOKS - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (BOOKS - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (BOOKS - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (BOOKS - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (LATEST PRODUCTS - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (LATEST PRODUCTS - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/product&path=65&product_id=113
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (LATEST PRODUCTS - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (LATEST PRODUCTS - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=product/product&path=65&product_id=113
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR LOGIN NAME - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (FORGOT YOUR LOGIN NAME - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (CONTACT US - header-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (CONTACT US - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (CONTACT US - footer-icon-size)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin (CONTACT US - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

################################## kiểm tra kích thước icon ( khi đã login ) #####################################
Check size icon Facebook, Twitter, Linkedin links (Home - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login (Trang chủ - header-icon-size )
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (Home - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(Trang chủ - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser


Check size icon Facebook, Twitter, Linkedin links (login - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(login - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/login
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (login - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(Trang chủ - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/login
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(FORGOT YOUR PASSWORD - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR PASSWORD - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(FORGOT YOUR PASSWORD -footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser


Check size icon Facebook, Twitter, Linkedin links (SPECIAL OFFERS - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(SPECIAL OFFERS - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/special
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SPECIAL OFFERS - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(SPECIAL OFFERS - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/special
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SHOPPING CART - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(SHOPPING CART - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SHOPPING CARTS - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(SHOPPING CART - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(APPAREL & ACCESSORIES - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (APPAREL & ACCESSORIES - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(APPAREL & ACCESSORIES - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MAKEUP - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(MAKEUP - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MAKEUP - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(MAKEUP - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SKINCARE - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(SKINCARE - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (SKINCARE - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(SKINCARE - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FRAGRANCE - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(FRAGRANCE - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FRAGRANCE - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(FRAGRANCE - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MEN - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(MEN - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (MEN - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(MEN - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (HAIR CARE - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(HAIR CARE - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (HAIR CARE - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(HAIR CARE - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (BOOKS - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(BOOKS - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (BOOKS - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(BOOKS - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (LATEST PRODUCTS - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(LATEST PRODUCTS - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/product&path=65&product_id=113
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (LATEST PRODUCTS - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(LATEST PRODUCTS - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=product/product&path=65&product_id=113
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(FORGOT YOUR LOGIN NAME - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (FORGOT YOUR LOGIN NAME - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(FORGOT YOUR LOGIN NAME - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (CONTACT US - header-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(CONTACT US - header-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Close Browser

Check size icon Facebook, Twitter, Linkedin links (CONTACT US - footer-icon-size-login)
    [Documentation]    Kiểm tra và click vào các liên kết Facebook, Twitter, Linkedin khi đã login(CONTACT US - footer-icon-size)
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Close Browser
################################## tính đúng đắn khi click có vào đúng trang mxh #####################################
Check Social Media Links(Home-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(Home-header)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(Home-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(Home-footer)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(login-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(login-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(login-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(login-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/login
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(FORGOT YOUR PASSWORD-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(FORGOT YOUR PASSWORD-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(FORGOT YOUR PASSWORD-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(FORGOT YOUR PASSWORD-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/password
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(SPECIAL OFFERS-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SPECIAL OFFERS-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/special
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(SPECIAL OFFERS-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SPECIAL OFFERS-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/special
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(SHOPPING CART-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SHOPPING CART-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(SHOPPING CART-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SHOPPING CART-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=checkout/cart
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(APPAREL & ACCESSORIES-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SHOPPING CART-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(APPAREL & ACCESSORIES-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(APPAREL & ACCESSORIES-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=68
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(MAKEUP-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(MAKEUP-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(MAKEUP-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(MAKEUP-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=36
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(SKINCARE-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SKINCARE-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=43
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(SKINCARE-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(SKINCARE-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=product/category&path=43
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(FRAGRANCE-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(FRAGRANCE-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=49
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(FRAGRANCE-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(FRAGRANCE-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=product/category&path=49
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(MEN-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(MEN-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=58
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(MEN-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(MEN-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=product/category&path=58
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(HAIR CARE-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(HAIR CARE-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=52
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(HAIR CARE-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(HAIR CARE-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=product/category&path=52
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(BOOKS-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(BOOKS-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/category&path=65
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(BOOKS-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(BOOKS-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=product/category&path=65
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(LATEST PRODUCTS-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(LATEST PRODUCTS-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/product&path=65&product_id=113
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(LATEST PRODUCTS-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(LATEST PRODUCTS-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=product/product&path=65&product_id=113
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(FORGOT YOUR LOGIN NAME-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(FORGOT YOUR LOGIN NAME-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(FORGOT YOUR LOGIN NAME-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(FORGOT YOUR LOGIN NAME-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser

Check Social Media Links(CONTACT US-header)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(CONTACT US-header)
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=content/contact
    Maximize Browser Window
    Check Social Media Links header
    Close Browser

Check Social Media Links(CONTACT US-footer)
    [Documentation]     Kiểm tra tính đúng đắn khi click có vào đúng trang mxh(CONTACT US-footer)
    Open Browser    ${URL}    ${BROWSER}
    Go To       https://automationteststore.com/index.php?rt=content/contact
    Maximize Browser Window
    Check Social Media Links footer
    Close Browser
  

################################## vị trí icon( header footer)#####################################
Check the image position "Automation Test Store" when shrinking the form(header)
    [Documentation]     Kiểm tra vị trí hình ảnh "Automation Test Store" khi thu nhỏ form 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${image_position_before} =   Execute JavaScript    return document.querySelector('a.logo img').getBoundingClientRect()
    Set Window Size    100    900     # Thu nhỏ cửa sổ trình duyệt
    ${image_position_after} =   Execute JavaScript    return document.querySelector('a.logo img').getBoundingClientRect()
    Log    Vị trí của hình ảnh trước khi thu nhỏ: ${image_position_before}
    Log    Vị trí của hình ảnh sau khi thu nhỏ: ${image_position_after}
    ${left_before} =    Get From Dictionary    ${image_position_before}    left
    ${left_after} =    Get From Dictionary    ${image_position_after}    left
    ${top_before} =    Get From Dictionary    ${image_position_before}    top
    ${top_after} =    Get From Dictionary    ${image_position_after}    top
    ${width_before} =    Get From Dictionary    ${image_position_before}    width
    ${width_after} =    Get From Dictionary    ${image_position_after}    width
    ${height_before} =    Get From Dictionary    ${image_position_before}    height
    ${height_after} =    Get From Dictionary    ${image_position_after}    height
    Run Keyword If    ${left_before} == ${left_after} and ${top_before} == ${top_after} and ${width_before} == ${width_after} and ${height_before} == ${height_after}
    ...    Log    Hình ảnh không thay đổi vị trí khi thu nhỏ trang web
    ...    ELSE    Fail    Hình ảnh đã thay đổi vị trí khi thu nhỏ trang web
    Close Browser

Check the image position icon mxh when shrinking the form(header)
    [Documentation]     Kiểm tra vị trí hình ảnh icon mxh khi thu nhỏ form 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${image_position_before} =   Execute JavaScript   return document.querySelector('.social_icons').getBoundingClientRect()

    Set Window Size    100    900     # Thu nhỏ cửa sổ trình duyệt
    ${image_position_after} =   Execute JavaScript    return document.querySelector('.social_icons').getBoundingClientRect()

    Log    Vị trí của hình ảnh trước khi thu nhỏ: ${image_position_before}
    Log    Vị trí của hình ảnh sau khi thu nhỏ: ${image_position_after}
    ${left_before} =    Get From Dictionary    ${image_position_before}    left
    ${left_after} =    Get From Dictionary    ${image_position_after}    left
    ${top_before} =    Get From Dictionary    ${image_position_before}    top
    ${top_after} =    Get From Dictionary    ${image_position_after}    top
    ${width_before} =    Get From Dictionary    ${image_position_before}    width
    ${width_after} =    Get From Dictionary    ${image_position_after}    width
    ${height_before} =    Get From Dictionary    ${image_position_before}    height
    ${height_after} =    Get From Dictionary    ${image_position_after}    height
    Run Keyword If    ${left_before} == ${left_after} and ${top_before} == ${top_after} and ${width_before} == ${width_after} and ${height_before} == ${height_after}
    ...    Log    Hình ảnh không thay đổi vị trí khi thu nhỏ trang web
    ...    ELSE    Fail    Hình ảnh đã thay đổi vị trí khi thu nhỏ trang web
    Close Browser


Check the image position icon mxh when shrinking the form(footer)
    [Documentation]     Kiểm tra vị trí hình ảnh icon mxh khi thu nhỏ form 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    ${image_position_before} =   Execute JavaScript   return document.querySelector('div.social_icons').getBoundingClientRect()


    Set Window Size    100    900     # Thu nhỏ cửa sổ trình duyệt
    ${image_position_after} =   Execute JavaScript    return document.querySelector('div.social_icons').getBoundingClientRect()


    Log    Vị trí của hình ảnh trước khi thu nhỏ: ${image_position_before}
    Log    Vị trí của hình ảnh sau khi thu nhỏ: ${image_position_after}
    ${left_before} =    Get From Dictionary    ${image_position_before}    left
    ${left_after} =    Get From Dictionary    ${image_position_after}    left
    ${top_before} =    Get From Dictionary    ${image_position_before}    top
    ${top_after} =    Get From Dictionary    ${image_position_after}    top
    ${width_before} =    Get From Dictionary    ${image_position_before}    width
    ${width_after} =    Get From Dictionary    ${image_position_after}    width
    ${height_before} =    Get From Dictionary    ${image_position_before}    height
    ${height_after} =    Get From Dictionary    ${image_position_after}    height
    Run Keyword If    ${left_before} == ${left_after} and ${top_before} == ${top_after} and ${width_before} == ${width_after} and ${height_before} == ${height_after}
    ...    Log    Hình ảnh không thay đổi vị trí khi thu nhỏ trang web
    ...    ELSE    Fail    Hình ảnh đã thay đổi vị trí khi thu nhỏ trang web
    Close Browser
    
*** Keywords ***
LOGIN_ADMIN
    Go To    https://automationteststore.com/index.php?rt=account/login
    Input Text    //*[@id="loginFrm_loginname"]    ${USERNAME_ADMIN}
    Input Password    //*[@id="loginFrm_password"]    ${PASSWORD_ADMIN}
    Click Button    //*[@id="loginFrm"]/fieldset/button

Check size icon Facebook, Twitter, Linkedin links header-icon-size
    Maximize Browser Window
    ${icon_width_facebook}=    Execute Javascript    return document.querySelector('div.social_icons a.facebook').offsetWidth
    ${icon_height_facebook}=    Execute Javascript    return document.querySelector('div.social_icons a.facebook').offsetHeight
    ${icon_width_twitter}=    Execute Javascript    return document.querySelector('div.social_icons a.twitter').offsetWidth
    ${icon_height_twitter}=    Execute Javascript    return document.querySelector('div.social_icons a.twitter').offsetHeight
    ${icon_width_linkedin}=    Execute Javascript    return document.querySelector('div.social_icons a.linkedin').offsetWidth
    ${icon_height_linkedin}=    Execute Javascript    return document.querySelector('div.social_icons a.linkedin').offsetHeight

    Should Be Equal As Numbers    ${icon_width_facebook}    30
    Should Be Equal As Numbers    ${icon_height_facebook}    30
    Should Be Equal As Numbers    ${icon_width_twitter}    30
    Should Be Equal As Numbers    ${icon_height_twitter}    30
    Should Be Equal As Numbers    ${icon_width_linkedin}    30
    Should Be Equal As Numbers    ${icon_height_linkedin}    30

Check size icon Facebook, Twitter, Linkedin links footer-icon-size
    Maximize Browser Window
    Scroll Element Into View    css=.footer_block    # Lướt đến phần footer
    ${icon_width_facebook}=    Execute Javascript    return document.querySelector('.footer_block .social_icons a.facebook').offsetWidth
    ${icon_height_facebook}=    Execute Javascript    return document.querySelector('.footer_block .social_icons a.facebook').offsetHeight
    ${icon_width_twitter}=    Execute Javascript    return document.querySelector('.footer_block .social_icons a.twitter').offsetWidth
    ${icon_height_twitter}=    Execute Javascript    return document.querySelector('.footer_block .social_icons a.twitter').offsetHeight
    ${icon_width_linkedin}=    Execute Javascript    return document.querySelector('.footer_block .social_icons a.linkedin').offsetWidth
    ${icon_height_linkedin}=    Execute Javascript    return document.querySelector('.footer_block .social_icons a.linkedin').offsetHeight

    Should Be Equal As Numbers    ${icon_width_facebook}    30
    Should Be Equal As Numbers    ${icon_height_facebook}    30
    Should Be Equal As Numbers    ${icon_width_twitter}    30
    Should Be Equal As Numbers    ${icon_height_twitter}    30
    Should Be Equal As Numbers    ${icon_width_linkedin}    30
    Should Be Equal As Numbers    ${icon_height_linkedin}    30

Check Social Media Links footer
    ${facebook_link}=    Get Element Attribute    css=.footer_block .social_icons a.facebook    href
    Click Element    css=.footer_block .social_icons a.facebook
    Sleep    3s 
    Should Be Equal    ${current_url_facebook_check}    ${facebook_link}

    Go To    ${URL}
    ${twitter_link}=    Get Element Attribute    css=.footer_block .social_icons a.twitter    href
    Click Element    css=.footer_block .social_icons a.twitter
    Should Be Equal    ${current_url_twitter_check}    ${twitter_link}

    Go To    ${URL}
    ${linkedin_link}=    Get Element Attribute    css=.footer_block .social_icons a.linkedin    href
    Execute JavaScript    document.querySelector('#footer footer section:nth-child(2) div div:nth-child(2) div div a:nth-child(3)').click();
    Should Be Equal    ${current_url_linkedin_check}    ${linkedin_link}

Check Social Media Links header
    ${facebook_link}=    Get Element Attribute    css=.header_block .social_icons a.facebook    href
    Click Element    css=.header_block .social_icons a.facebook
    Sleep    3s 
    Should Be Equal    ${current_url_facebook_check}    ${facebook_link}

    Go To    ${URL}
    ${twitter_link}=    Get Element Attribute    css=.header_block .social_icons a.twitter    href
    Click Element    css=.footer_block .social_icons a.twitter
    Should Be Equal    ${current_url_twitter_check}    ${twitter_link}

    Go To    ${URL}
    ${linkedin_link}=    Get Element Attribute    css=.header_block .social_icons a.linkedin    href
    Click Element    css=.header_block .social_icons a.linkedin
    Should Be Equal    ${current_url_linkedin_check}    ${linkedin_link}