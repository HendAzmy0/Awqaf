*** Settings ***
Library              SeleniumLibrary            
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser   

*** Variables ***    
${Services_Main_over DDL}               link=Services
${Services_Anonymous_DDL}               link=Report Unknown Endowment
${Anonymous_Adsress_Text}               id=edit-address
${Anonymous_Location_Text}              id=search-edit-location
${Anonymous_Description_Text}           id=edit-explanation
${Anonymous_WaqfType_DDL}               id=edit-waqf-type-select
${Anonymous_WaqfStatus_DDL}             id=edit-waqf-status-select
${Anonymous_attach_BTN}                 id=edit-attachments-upload
${Anonymous_File_Path}                  C:\\Users\\HAzmy\\Desktop\\Services\\approval.png
${Anonymous_Agreement_BTN}              id=edit-agreement
${Anonymous_Submit_BTN}                 id=edit-submit
                                     
  
*** Test Cases ***
Report_Anonymous_Waqf
    Navigate_To_Anonymous
    Submit_Anonymous 
    Attach_File
*** Keywords ***
Navigate_To_Anonymous
    Mouse Over                           ${Services_Main_over DDL}
    Set Selenium Implicit Wait           1     
    Mouse Over                           ${Services_Anonymous_DDL} 
    Click Link                           ${Services_Anonymous_DDL}  
    Page Should Contain Button           ${Anonymous_Submit_BTN}       
Submit_Anonymous   
    Input Text                           ${Anonymous_Adsress_Text}            jeddah
    Input Text                           ${Anonymous_Location_Text}           jeddah Saudi Arabai
    Press Keys                           ${Anonymous_Location_Text}           ENTER
    Input Text                           ${Anonymous_Description_Text}        TestAutomation
    select From List By Index            ${Anonymous_WaqfType_DDL}            1
    select From List By Index            ${Anonymous_WaqfStatus_DDL}          1   
Attach_File      
    Choose File                          ${Anonymous_attach_BTN}         ${Anonymous_File_Path} 
    sleep                                4s
    Click Element                        ${Anonymous_Agreement_BTN}  
    Click Button                         ${Anonymous_Submit_BTN}
    Page Should Contain                  Thank you
    