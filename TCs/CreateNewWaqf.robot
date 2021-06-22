*** Settings ***
Library             SeleniumLibrary      
Library             FakerLibrary          
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser    

*** Variables ***  
${Services_Main_over DDL}                      link=Services
${Anonymous_Submit_Link}                       css=a[href='/certificate/add']
${Anonymous_InstrumentID_Text}                 id=edit-field-text-6-0-value
# ${Anonymous_InstrumentDate_Text}               id=edit-field-text-6-0-value
${Anonymous_WaqfName_Text}                     id=edit-title-0-value
${Anonymous_WaqfDate_Text}                     id=edit-field-text-7-0-value
${Anonymous_RecipientOfName_Text}              id=edit-field-beneficiary-0-value
${Anonymous_ExportLocation_Text}               id=edit-field-instrument-export-location-0-value
${Anonymous_WaqfLocation_DDL}                  id=edit-field-waqf-location-list
${Anonymous_WaqfType_DDL}                      id=edit-field-waqf-type
${Anonymous_CountOfBeneficiaries_Text}         id=edit-field-number-of-pages-0-value
${Anonymous_WaqfType_CheckBox}                 id=edit-field-waqf-origins-0-subform-field-waqf-type-real-estate
${Anonymous_EstimatedEvaluation_Text}          id=edit-field-waqf-origins-0-subform-field-estimated-evaluation-0-value
${Anonymous_Information_Text}                  id=edit-field-waqf-origins-0-subform-field-information-0-value
${Anonymous_AddFile_Attach}                    id=edit-field-waqf-origins-0-subform-field-attachments-0-upload
${Anonymous_WaqefName_Text}                    id=edit-field-waqef-group-0-subform-field-name-0-value
${Anonymous_WaqefIDType_DDL}                   id=edit-field-waqef-group-0-subform-field-id-type
${Anonymous_WaqefID_Text}                      id=edit-field-waqef-group-0-subform-field-national-id-0-value
${Anonymous_BeholderName_Text}                 id=edit-field-beholder-group-0-subform-field-name-0-value
${Anonymous_BeholderID_Text}                   id=edit-field-beholder-group-0-subform-field-national-id-0-value
${Anonymous_BeholderMobile_Text}               id=edit-field-beholder-group-0-subform-field-mobile-number-0-value
${Anonymous_AttachSaqWaqf_BTN}                 id=edit-field-attachment-0-upload
${Anonymous_AttachSaqMelk_BTN}                 id=edit-field-owner-instrument-0-upload
${Anonymous_AttachSaqNazer_BTN}                id=edit-field-nazer-instrument-0-upload
${Anonymous_Agree_CheckBox}                    id=edit-aggrement
${Anonymous_Submit_BTN}                        id=edit-workflow-certificate-workflow-new

*** Test Cases *** 
Create_New_Waqf
    Navigate_To_Anonymous
    Upload_Attaches  
    Agree_And_Submit
    
*** Keywords ***
Navigate_To_Anonymous
    Click Link                   ${Services_Main_over DDL}
    Page Should Contain          تسجيل وقف
    Click Link                   ${Anonymous_Submit_Link}      
    ${no} =  FakerLibrary.Random Number      
    Set Suite Variable           ${no}    
    Input Text                   ${Anonymous_InstrumentID_Text}                ${no}
    # Input Text                   ${Anonymous_InstrumentDate_Text}              15/5/1442
    Input Text                   ${Anonymous_WaqfName_Text}                    Englsih automation test
    Input Text                   ${Anonymous_WaqfDate_Text}                    15/5/1442
    Input Text                   ${Anonymous_ExportLocation_Text}              jeddah
    Click Element                ${Anonymous_WaqfLocation_DDL}
    Select From List By Index    ${Anonymous_WaqfLocation_DDL}                 2
    Click Element                ${Anonymous_WaqfType_DDL}
    Select From List By Index    ${Anonymous_WaqfType_DDL}                     2 
    Input Text                   ${Anonymous_CountOfBeneficiaries_Text}        5
    Click Element                ${Anonymous_WaqfType_CheckBox}
    Input Text                   ${Anonymous_EstimatedEvaluation_Text}         15
    Input Text                   ${Anonymous_Information_Text}                 test information    
    Choose File                  ${Anonymous_AddFile_Attach}                   C:\\Users\\HAzmy\\Desktop\\Services\\approval.png
    Input Text                   ${Anonymous_WaqefName_Text}                   waqef name test
    Click Element                ${Anonymous_WaqefIDType_DDL}  
    Select From List By Index    ${Anonymous_WaqefIDType_DDL}                  1   
    Input Text                   ${Anonymous_WaqefID_Text}                     1234567089
    Input Text                   ${Anonymous_BeholderName_Text}                nazer name test
    Input Text                   ${Anonymous_BeholderID_Text}                  1234560789
    Input Text                   ${Anonymous_BeholderMobile_Text}              0500000000
Upload_Attaches  
    Choose File                  ${Anonymous_AttachSaqWaqf_BTN}                C:\\Users\\HAzmy\\Desktop\\Services\\approval.png 
    sleep                         3s
    Choose File                  ${Anonymous_AttachSaqMelk_BTN}                C:\\Users\\HAzmy\\Desktop\\Services\\approval.png   
    sleep                         3s
    Choose File                  ${Anonymous_AttachSaqNazer_BTN}               C:\\Users\\HAzmy\\Desktop\\Services\\approval.png    
    sleep                         3s
Agree_And_Submit
    Click Element                ${Anonymous_Agree_CheckBox}
    Click Button                 ${Anonymous_Submit_BTN}     
    Page Should Contain          تم انشاء طلبك رقم 