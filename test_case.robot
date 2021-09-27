*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
Observer user able to search in mirror application
    Launch the mirron application
    Select lang
    Click on none of the above
    Click on Electronics
    Search Phone
    Scroll to select phone
    Add to cart
    Quit
    Launch Application
    
*** Variables ***
${mir_server}=    http://localhost:4723/wd/hub
${pf_name}=    Android
${version_device}=    9.0
${device_name}=    emulator-5554
${app_loc}=    C:\\Users\\navya\\Documents\\Mobile_Api\\Flipkart-7.18.apk
${cont}    id=com.flipkart.android:id/select_btn  
${X}    id=com.flipkart.android:id/custom_back_icon
${elect}    xpath=//android.widget.ImageView[@bounds='[792,479][973,650]']
${search}    id=com.flipkart.android:id/search_icon
${not}    id=com.flipkart.android:id/not_now_button
${iphone}    xpath=//*[@text='APPLE iPhone 11 (Red, 128 GB)']
${add_t0_cart}    xpath=//*[@text='ADD TO CART']
${cart}    xpath=//android.widget.RelativeLayout[@content-desc="Shopping Cart"]/android.widget.LinearLayout

*** Keywords ***
Launch the mirron application
    Open Application    ${mir_server}    platformName=${pf_name}    platformVersion=${version_device}    deviceName=${device_name}    app=${app_loc}             
    Wait Until Page Contains    English    timeout=180s
    #Log Source
Select lang
    Click Element     xpath=//*[@text='English' and @index=0]
    Wait Until Page Contains    CONTINUE    timeout=90s
    Click Element    ${cont}
    #Log Source
Click on none of the above
    Wait Until Page Contains    Phone Number    timeout=280s
    Click Element    ${X}
    #Log Source
Click on Electronics
    Wait Until Page Contains Element    ${elect}    timeout=190s
    Click Element    ${elect}
    Wait Until Page Contains Element    xpath=//android.widget.ImageView[@bounds='[0,1039][1080,1255]']    timeout=80s
    Swipe By Percent  50  90  50  20
    Swipe By Percent  50  90  50  20
    Swipe By Percent  50  80  50  10
    Swipe By Percent  50  80  50  10
    Swipe By Percent  50  80  50  10
    Swipe  100  700  100  1000
    
Search phone
    Wait Until Page Contains Element    ${search}    timeout=130s
    Click Element    ${search}
    Wait Until Page Contains Element    id=com.flipkart.android:id/search_autoCompleteTextView    timeout=30s
    Input Text    id=com.flipkart.android:id/search_autoCompleteTextView    iphone11

    Wait Until Page Contains Element    xpath=//android.widget.RelativeLayout[@bounds='[0,311][1080,499]']    timeout=20s
    Click Element    xpath=//android.widget.RelativeLayout[@bounds='[0,311][1080,499]']
    Wait Until Page Contains Element    ${not}    timeout=30s
    Click Element    ${not}
    

Scroll to select phone
    
    Wait Until Page Contains Element    ${iphone}    timeout=30s
    Swipe By Percent  50  80  50  10
    Click Element    ${iphone}
Add to cart
    Wait Until Page Contains Element    ${add_t0_cart}    timeout=20s
    Click Element    ${add_t0_cart}   
Quit 
    Quit Application
Launch Application
    Open Application    ${mir_server}    platformName=${pf_name}    platformVersion=${version_device}    deviceName=${device_name}    app=${app_loc}    noReset=true   
    Wait Until Page Contains Element    ${cart}    timeout=40s
    Click Element    ${cart}
    
    
    
