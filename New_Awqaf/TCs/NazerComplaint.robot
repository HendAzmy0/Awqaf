*** Settings ***
Library                SeleniumLibrary          
Library                AutoItLibrary   
Resource             ../KeyWords/CommonKeys.robot
Suite Setup           Navigate_To_Browser 
  
*** Variables ***   
${Services_Main_over DDL}                          id=main-menu-link-contentc3200ba2-6248-4662-91c3-ca30fb19fe1d
${Services_Complaint_DDL}                          xpath=//a[@class='sf-depth-2 menuparent'][contains(text(),'تقديم شكوى')]
${Services_NazerComplaint_DDL}                     css=li[id='main-menu-link-contenta155313a-6e24-4bbe-9551-f78d90fe3d55'] a[class='sf-depth-3']
${NazerComplaint_ComplaintOwner_DDL}               id=edit-reporter-type
${NazerComplaint_ComplaintAbout_DDL}               id=edit-complaint-about
${NazerComplaint_FirstRB_RB}                       id=edit-is-under-awqaf-authority-yes
${NazerComplaint_Explanation_Text}                 id=edit-explanation
${NazerComplaint_Required_Text}                    id=edit-requested
${NazerComplaint_SecondRB_RB}                      id=edit-complaint-is-decided-no
${NazerComplaint_ThirdRB_RB}                       id=edit-has-a-legal-ruling-been-issued-no
${NazerComplaint_Accept_CheckBox}                  id=edit-agreement
${NazerComplaint_Submit_BTN}                       id=edit-submit
  
*** Test Cases ***
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
     Input Text                       ${NazerComplaint_Explanation_Text}            شرح الشكوى
     Input Text                       ${NazerComplaint_Required_Text}               المطلوب
     Click Element                    ${NazerComplaint_SecondRB_RB}                    
     Click Element                    ${NazerComplaint_ThirdRB_RB}   
     Click Element                    ${NazerComplaint_Accept_CheckBox}     
     Click Button                     ${NazerComplaint_Submit_BTN}    
     Sleep                            2s
     Page Should Contain              شكرا لك
             
