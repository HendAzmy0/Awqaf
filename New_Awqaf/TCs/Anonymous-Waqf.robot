*** Settings ***
Library              SeleniumLibrary         
Library              AutoItLibrary   
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser   
*** Variables ***    
${Services_Main_over DDL}               id=main-menu-link-contentc3200ba2-6248-4662-91c3-ca30fb19fe1d
${Services_Anonymous_DDL}               link=بلاغ عن وقف مجهول
${Anonymous_Submit_BTN}                 id=edit-submit
${Anonymous_Adsress_Text}               id=edit-field-plain-long-0-value
${Anonymous_Location_Text}              id=search-edit-field-location-0-value
${Anonymous_Description_Text}           name=field_description[0][value]
${Anonymous_WaqfType_DDL}               xpath=//select[@id='edit-field-anonymous-waqf-type']
${Anonymous_WaqfStatus_DDL}             xpath=//select[@id='edit-field-anonymous-waqf-status']
${Anonymous_attach_BTN}                 name=files[field_attachments_0][]
${Anonymous_File_Path}                  C:\Users\HAzmy\Downloads\Test.png
${Anonymous_Save_BTN}                   xpath=button button--primary js-form-submit form-submit btn-success btn icon-before
                                        
  
*** Test Cases ***
Navigate_To_Anonymous
    Mouse Over                    ${Services_Main_over DDL}
    Set Selenium Implicit Wait    1     
    Mouse Over                    ${Services_Anonymous_DDL} 
    Click Link                    ${Services_Anonymous_DDL}  
    Page Should Contain Button    ${Anonymous_Submit_BTN}       
Submit_Anonymous   
    Input Text                       ${Anonymous_Adsress_Text}            جدة
    Input Text                       ${Anonymous_Location_Text}           جدة السعودية
   Press Keys                        ${Anonymous_Location_Text}           ENTER
    Input Text                       ${Anonymous_Description_Text}        TestAutomation
    select From List By Index        ${Anonymous_WaqfType_DDL}            1
    select From List By Index        ${Anonymous_WaqfStatus_DDL}          1
    
Attach_File                    
    Double Click Element          ${Anonymous_attach_BTN}  
    Wait For Active Window        Open
    Win Activate                  Open
    Send                          C:\\Users\\HAzmy\\Desktop\\Services
    sleep                          3s
    Control Click                 strTitle=Open     strText=            strControl=[CLASS:Button; INSTANCE:1]   
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]  
    sleep                         4s
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]      
    sleep                        4s
    Click Button                 ${Anonymous_Submit_BTN}
    Page Should Contain          تم إنشاء البلاغ عن وقف مجهول‏     