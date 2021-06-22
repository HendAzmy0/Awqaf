*** Settings ***
Library                SeleniumLibrary            
Resource             ../KeyWords/CommonKeys.robot
Suite Setup           Navigate_To_Browser 
  
*** Variables ***   
${Services_Main_over DDL}                          id=main-menu-link-contentc3200ba2-6248-4662-91c3-ca30fb19fe1d

${Services_Complaint_DDL}                          xpath=//a[@class='sf-depth-2 menuparent'][normalize-space()='Make a Complaint']
${Services_NazerComplaint_DDL}                     xpath=//a[@class='sf-depth-3'][normalize-space()='Complaint against a principal']
${NazerComplaint_ComplaintOwner_DDL}               id=edit-reporter-type
${NazerComplaint_ComplaintAbout_DDL}               id=edit-complaint-about
${NazerComplaint_FirstRB_RB}                       id=edit-is-under-awqaf-authority-cmp-01-02-01
${NazerComplaint_Explanation_Text}                 id=edit-explanation
${NazerComplaint_Required_Text}                    id=edit-requested
${NazerComplaint_SecondRB_RB}                      id=edit-complaint-is-decided-0
${NazerComplaint_ThirdRB_RB}                       id=edit-has-a-legal-ruling-been-issued-0
${NazerComplaint_Accept_CheckBox}                  id=edit-agreement
${NazerComplaint_Submit_BTN}                       id=edit-submit
  
*** Test Cases ***
Complaint_against_principal
    Navigate_To_Complaint
    Submit_Complaint_Nazer 

*** Keywords ***
Navigate_To_Complaint  
     Mouse Over                       ${Services_Main_over DDL}
     sleep                             1s     
     Mouse Over                       ${Services_Complaint_DDL} 
     Click Link                       ${Services_NazerComplaint_DDL}  
Submit_Complaint_Nazer
     Click Element                    ${NazerComplaint_ComplaintOwner_DDL}  
     Select From List By Index        ${NazerComplaint_ComplaintOwner_DDL}             2 
     Click Element                    ${NazerComplaint_ComplaintAbout_DDL}
     Select From List By Index        ${NazerComplaint_ComplaintAbout_DDL}             2
     Click Element                    ${NazerComplaint_FirstRB_RB} 
     Input Text                       ${NazerComplaint_Explanation_Text}            complaint explanation english automation test
     Input Text                       ${NazerComplaint_Required_Text}               required english automation test
     Click Element                    ${NazerComplaint_SecondRB_RB}                    
     Click Element                    ${NazerComplaint_ThirdRB_RB}   
     Click Element                    ${NazerComplaint_Accept_CheckBox}     
     Click Button                     ${NazerComplaint_Submit_BTN}    
     Sleep                            2s
     Page Should Contain             Thank you

             
