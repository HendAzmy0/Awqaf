*** Settings ***
Library             SeleniumLibrary          
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser  

*** Variables ***  
${Services_Main_over DDL}                             id=main-menu-link-contentc3200ba2-6248-4662-91c3-ca30fb19fe1d
${Services_Suggestions_DDL}                           link=Suggestions
${Suggestions_Send_BTN}                               id=edit-actions-submit
${Suggestions_FirstName_Text}                         id=edit-name-first       
${Suggestions_MiddleName_Text}                        id=edit-name-middle                              
${Suggestions_LastName_Text}                          id=edit-name-last
${Suggestions_Nationality_Text}                       id=edit-nationality
${Suggestions_ProposalType_RB}                        id=edit-the-complainant-s-type-private-sector
${Suggestions_Address_Text}                           id=edit-reporter-address
${Suggestions_Mobile_Text}                            id=edit-mobile-number
${Suggestions_SuggestionType_RB}                      id=edit-suggestion-type-developing-practices
${Suggestions_Beneficiaries_Text}                     id=edit-beneficiaries-from-the-suggestion
${Suggestions_SuggestionSubject_Text}                 id=edit-report-subject
${Suggestions_SuggestionMessage_Text}                 id=edit-report-message
${Suggestions_attach_file}                            id=edit-attachments-upload
${Suggestions_attach_CheckBox}                        name=attachments[file_117674][selected]


*** Test Cases ***  
Submit_Suggesstion  
  Navigate_To_Suggestion
  Submit_Suggestion  
  Attach_File


*** Keywords ***
Navigate_To_Suggestion
    Mouse Over                    ${Services_Main_over DDL}
    sleep                         1s     
    Mouse Over                    ${Services_Suggestions_DDL}
    Click Link                    ${Services_Suggestions_DDL}   
    Page Should Contain Button    ${Suggestions_Send_BTN}  
    
Submit_Suggestion
    Input Text                    ${Suggestions_FirstName_Text}              Hend  
    Input Text                    ${Suggestions_MiddleName_Text}             Mohamed                                  
    Input Text                    ${Suggestions_LastName_Text}               Azmy
    Input Text                    ${Suggestions_Nationality_Text}            Egyption     
    Click Button                  ${Suggestions_ProposalType_RB}
    Input Text                    ${Suggestions_Address_Text}                Cairo,Egypt
    Input Text                    ${Suggestions_Mobile_Text}                 0500000000
    Click Button                  ${Suggestions_SuggestionType_RB}
    Input Text                    ${Suggestions_Beneficiaries_Text}          Beneficiaries from the suggestion
    Input Text                    ${Suggestions_SuggestionSubject_Text}      Suggestion subject
    Input Text                    ${Suggestions_SuggestionMessage_Text}      Suggestion message
    
Attach_File
     Choose File                  ${Suggestions_attach_file}                /UploadedFiles/test.png
      # C:\\Users\\HAzmy\\Desktop\\Services\\approval.png
     Sleep                         60s
     Click Button                  ${Suggestions_Send_BTN} 
  
 
