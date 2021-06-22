*** Settings ***
Library                SeleniumLibrary            
Resource             ../KeyWords/CommonKeys.robot
Suite Setup           Navigate_To_Browser 
  
*** Variables ***   
${Services_Main_over DDL}                          id=main-menu-link-contentc3200ba2-6248-4662-91c3-ca30fb19fe1d
${Services_Complaint_DDL}                          xpath=//a[@class='sf-depth-2 menuparent'][normalize-space()='Make a Complaint']
${Services_WaqfComplaint_DDL}                      css=li[id='main-menu-link-content5a853347-3e97-4c60-82ac-99e5e82644c2'] a[class='sf-depth-3']
${WaqfComplaint_ComplaintOwner_DDL}                id=edit-reporter-type
${WaqfComplaint_ComplaintAbout_DDL}                id=edit-complaint-about
${WaqfComplaint_FirstRB_RB}                        id=edit-is-under-awqaf-authority-cmp-01-01-01
${WaqfComplaint_Address_Text}                      id=edit-address
${WaqfComplaint_WaqfType_DDL}                      id=edit-waqf-type-select
${WaqfComplaint_WaqfStatus_DDL}                    id=edit-waqf-status-select
${WaqfComplaint_Explain_Text}                      id=edit-explanation
${WaqfComplaint_Required_Text}                     id=edit-requested
${WaqfComplaint_SecondRB_RB}                       id=edit-complaint-is-decided-0
${WaqfComplaint_ThirdRB_RB}                        id=edit-has-a-legal-ruling-been-issued-0
${WaqfComplaint_Accept_CheckBox}                   id=edit-agreement
${WaqfComplaint_Submit_BTN}                        id=edit-submit
   
*** Test Cases ***
Complaint_against_endowment
    Navigate_To_Complaint 
    Submit_Waqf_Complaint
    
*** Keywords ***
Navigate_To_Complaint  
     Mouse Over                       ${Services_Main_over DDL}
     sleep                             1s     
     Mouse Over                       ${Services_Complaint_DDL} 
     Click Link                       ${Services_WaqfComplaint_DDL}   
Submit_Waqf_Complaint
     Click Element                    ${WaqfComplaint_ComplaintOwner_DDL}  
     Select From List By Index        ${WaqfComplaint_ComplaintOwner_DDL}              2 
     Click Element                    ${WaqfComplaint_ComplaintAbout_DDL} 
     Select From List By Index        ${WaqfComplaint_ComplaintAbout_DDL}              2
     Click Element                    ${WaqfComplaint_FirstRB_RB} 
     Input Text                       ${WaqfComplaint_Address_Text}                   جدة
     Click Element                    ${WaqfComplaint_WaqfType_DDL}   
     Select From List By Index        ${WaqfComplaint_WaqfType_DDL}                    2      
     Click Element                    ${WaqfComplaint_WaqfStatus_DDL}  
     Select From List By Index        ${WaqfComplaint_WaqfStatus_DDL}                  2
     Input Text                       ${WaqfComplaint_Explain_Text}                   explanation englsih automation test
     Input Text                       ${WaqfComplaint_Required_Text}                  the required english automation test
     Click Element                    ${WaqfComplaint_SecondRB_RB}                    
     Click Element                    ${WaqfComplaint_ThirdRB_RB}    
     Click Element                    ${WaqfComplaint_Accept_CheckBox}    
     Click Button                     ${WaqfComplaint_Submit_BTN}     
     Sleep                            2s
     Page Should Contain              Thank you

             
