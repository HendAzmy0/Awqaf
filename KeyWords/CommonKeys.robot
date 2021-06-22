*** Settings ***
Library     SeleniumLibrary    

*** Variables ***

# ${URL}                           http://awqaf4.staging.t2.sa/en
${URL}                            https://www.awqaf.gov.sa/en
${HomePage_Login_Link}           css=ul[region='navigation_collapsible_top'] li[class='first last'] a
${Login_ID_Field}                id=edit-name
${Login_Password_Field}          id=edit-pass
${Login_Submit_BTN}              id=edit-submit  
 
*** Keywords ***
Navigate_To_Browser
    Open Browser               ${URL}     Chrome
    Maximize Browser Window
    # Click Link                 ${HomePage_Login_Link} 
    # Input Text                 ${Login_ID_Field}            Test_English
    # Input Text                 ${Login_Password_Field}      123 
    # sleep                      60s
    # Click Button               ${Login_Submit_BTN}
    # Page Should Contain        view  
    # # sleep                      20s  