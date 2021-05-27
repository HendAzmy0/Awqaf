*** Settings ***
Library     SeleniumLibrary    

*** Variables ***

${URL}                           http://awqaf2.staging.t2.sa/ar
${HomePage_Login_Link}           css=ul[region='navigation_collapsible_top'] a
${Login_ID_Field}                id=edit-name
${Login_Password_Field}          id=edit-pass
${Login_Submit_BTN}              id=edit-submit  
 
*** Keywords ***
Navigate_To_Browser
    Open Browser              ${URL}     Chrome
    Maximize Browser Window
    Click Link                ${HomePage_Login_Link} 
    Input Text                ${Login_ID_Field}            testt
    Input Text                ${Login_Password_Field}      testt 
    sleep                     60s
    Click Button              ${Login_Submit_BTN}
    Page Should Contain       عرض    
    sleep                       20s  