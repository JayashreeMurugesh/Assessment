*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.amazon.in/

*** Test Cases ***
Open Amazon.in web application
#Opening the browser and launching the amazon.in url
    Open chrome browser   ${url}  ${browser}
Click on All drop down and select Electronics from drop down
    select from list by label    url    Electronics
Search for one plus Mobile
    ${searchtxtbox}     set variable    id:twotabsearchtextbox
    ${submitsearch}     set variable    id:nav-search-submit-button
    element should be visible    ${searchtxtbox}
    element should be enabled    ${searchtxtbox}
    input text    ${searchtxtbox}   OnePlus Mobiles
    sleep   2
    click element   ${submitsearch}
    sleep   2
Select the brand as OnePlus checkbox
    ${brand}        set variable    xpath://*[@id="p_89/OnePlus"]/span/a
    click element   ${brand}
    sleep   2
Select one mobile and Fetch the Price of the Mobile
    ${pickTopElementOfResult}  get element attribute   xpath://*[@class="a-size-mini a-spacing-none a-color-base s-line-clamp-2"]/a  href
    log to console     ${pickTopElementOfResult}
    go to    ${pickTopElementOfResult}
    sleep       4
    ${price}   get text    xpath://*[@class="a-offscreen"]
    log to console    ${price}
Add the mobile to CART
    ${addCart}  set variable    xpath://*[@id="add-to-cart-button"]
    click element    ${addCart}
    wait until page contains element    xpath://*[@id="attach-sidesheet-view-cart-button"]/span/input
    sleep   2
    click element    xpath://*[@id="attach-sidesheet-view-cart-button"]/span/input
Click on Save For Later
    wait until page contains element    xpath://input[@value='Save for later']
    sleep   2
    click element    xpath://input[@value='Save for later']
close browser
    close browser
*** Keywords ***
Open chrome browser
    [Arguments]    ${url}  ${browser}
    open browser   ${url}  ${browser}
    maximize browser window