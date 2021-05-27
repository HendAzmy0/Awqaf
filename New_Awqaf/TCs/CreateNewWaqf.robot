*** Settings ***
Library             SeleniumLibrary      
Library             FakerLibrary    
Library             AutoItLibrary        
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser    

*** Variables ***  
${Services_Main_over DDL}                   link=الخدمات
${Anonymous_Submit_Link}                    css=a[href='/certificate/add']
${Anonymous_SaqNo_Text}                     id=edit-field-text-4-0-value
${Anonymous_Saqdate_Text}                   id=edit-field-text-6-0-value
${Anonymous_WaqfName_Text}                  id=edit-title-0-value 
${Anonymous_WaqfDate_Text}                  id=edit-field-text-7-0-value
${Anonymous_RecipientOfName_Text}           id=edit-field-beneficiary-0-value
${Anonymous_WaqfLocation_Text}              id=edit-field-waqf-location-0-value
${Anonymous_WaqfType_DDL}                   id=edit-field-waqf-type
${Anonymous_MainWaqf_DDL}                   id=edit-field-waqf-activity
${Anonymous_WaqefName_Text}                 id=edit-field-waqef-group-0-subform-field-name-0-value
${Anonymous_WaqefID_Text}                   id=edit-field-waqef-group-0-subform-field-national-id-0-value
${Anonymous_NazerName_Text}                 id=edit-field-beholder-group-0-subform-field-name-0-value
${Anonymous_NazerID_Text}                   id=edit-field-beholder-group-0-subform-field-national-id-0-value
${Anonymous_AttachSaqWaqf_BTN}              id=edit-field-attachment-0-upload
${Anonymous_AttachSaqMelk_BTN}              id=edit-field-owner-instrument-0-upload
${Anonymous_AttachSaqNazer_BTN}             id=edit-field-nazer-instrument-0-upload
${Anonymous_Agree_CheckBox}                 id=edit-aggrement
${Anonymous_Submit_BTN}                     id=edit-workflow-certificate-workflow-new
*** Test Cases *** 
Navigate_To_Anonymous
 
    Click Link                   ${Services_Main_over DDL}
    Page Should Contain          تسجيل وقف
    Click Link                   ${Anonymous_Submit_Link}      
    ${no} =  FakerLibrary.Random Number      
    Set Suite Variable           ${no}    
    Input Text                   ${Anonymous_SaqNo_Text}             ${no}
    Input Text                   ${Anonymous_Saqdate_Text}           15/5/1442
    Input Text                   ${Anonymous_WaqfName_Text}          تست
    Input Text                   ${Anonymous_WaqfDate_Text}          15/5/1442
    Input Text                   ${Anonymous_RecipientOfName_Text}   المستفيد من الوقف
    Input Text                   ${Anonymous_WaqfLocation_Text}      جدة
    Click Element                ${Anonymous_WaqfType_DDL}
    Select From List By Index    ${Anonymous_WaqfType_DDL}            2 
    Click Element                ${Anonymous_MainWaqf_DDL} 
    Select From List By Index    ${Anonymous_MainWaqf_DDL}            2
    Input Text                   ${Anonymous_WaqefName_Text}        اسم الواقف
    Input Text                   ${Anonymous_WaqefID_Text}          1234567089
    Input Text                   ${Anonymous_NazerName_Text}        اسم الناظر
    Input Text                   ${Anonymous_NazerID_Text}          1234560789

Upload_Attaches 
    Double Click Element         ${Anonymous_AttachSaqWaqf_BTN}  
    Wait For Active Window        Open
    Win Activate                  Open
    Send                          C:\\Users\\HAzmy\\Desktop\\Services
    sleep                         3s
    Control Click                 strTitle=Open     strText=            strControl=[CLASS:Button; INSTANCE:1]   
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]  
    sleep                         3s
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]      
    Sleep                         2s    
    Double Click Element         ${Anonymous_AttachSaqMelk_BTN}  
    Wait For Active Window        Open
    Win Activate                  Open
    Send                          C:\\Users\\HAzmy\\Desktop\\Services
    sleep                         3s
    Control Click                 strTitle=Open     strText=            strControl=[CLASS:Button; INSTANCE:1]   
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]  
    sleep                         3s
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1] 
    Sleep                         3s      
    Double Click Element         ${Anonymous_AttachSaqNazer_BTN} 
    Wait For Active Window        Open
    Win Activate                  Open
    Send                          C:\\Users\\HAzmy\\Desktop\\Services
    sleep                         3s
    Control Click                 strTitle=Open     strText=            strControl=[CLASS:Button; INSTANCE:1]   
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]  
    sleep                         3s
    Win Activate                  Open
    send                          \approval.png
    Control Click                 strTitle=Open      strText=           strControl=[CLASS:Button; INSTANCE:1]     
    sleep                         3s
Agree_And_Submit
    Click Element                ${Anonymous_Agree_CheckBox}
    Click Button                 ${Anonymous_Submit_BTN}     
    Page Should Contain          تم انشاء طلبك رقم 