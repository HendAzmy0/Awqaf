*** Settings ***
Library             SeleniumLibrary          
Library             FakerLibrary    
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser  

*** Variables ***  
${RyadaCenter_Mainover_DDL}                               id=main-menu-link-content99a3ef24-dbb4-4d7c-8565-1c9eba667654
${RyadaCenter_ResearchesAndStudies_Link}                  link=Researches and Studies
${ResearchesAndStudies_ReceivingResearch_Link}            xpath=//strong[normalize-space()='Template for receiving research plans']
${ResearchesAndStudies_ResearchType_RB}                   id=edit-research-type-competition      
${ResearchesAndStudies_NameArabic_Text}                   id=edit-full-name-arabic                         
${ResearchesAndStudies_NameEnglish_Text}                  id=edit-full-name-english
${ResearchesAndStudies_Gender_RB}                         id=edit-gender-female
${ResearchesAndStudies_Major_Text}                        id=edit-major
${ResearchesAndStudies_Degree_Text}                       id=edit-degree
${ResearchesAndStudies_Person_RB}                         id=edit-person-institution-person
${ResearchesAndStudies_ReaeRCHtITLE_Text}                 id=edit-research-title
${ResearchesAndStudies_Mobile_Text}                       id=edit-mobile
${ResearchesAndStudies_Email_Text}                        id=edit-email
${ResearchesAndStudies_ResearchArabic_Text}               id=edit-research-title-arabic
${ResearchesAndStudies_ResearchEnglsih_Text}              id=edit-research-title-english
${ResearchesAndStudies_ResearchField_Text}                id=edit-research-field
${ResearchesAndStudies_AddedValue_Text}                   id=edit-research-added-value
${ResearchesAndStudies_Beneficiaries_Text}                id=edit-beneficiaries-of-research-results
${ResearchesAndStudies_Supporters_RB}                     id=edit-other-supporters-yes
${ResearchesAndStudies_ResearchSummary_Text}              id=edit-research-summary
${ResearchesAndStudies_ResearchGoals_Text}                id=edit-research-goals
${ResearchesAndStudies_CV_Attach}                         id=edit-cv-upload
${ResearchesAndStudies_ID_Attach}                         id=edit-national-id-residency-permit-upload
${ResearchesAndStudies_File_Path}                         C:\\Users\\HAzmy\\Desktop\\Services\\approval.png
${ResearchesAndStudies_CB1_CheckBox}                      id=edit-as-a-researcher-i-acknowledge-that-all-information-provided-is-c
${ResearchesAndStudies_CB2_CheckBox}                      id=edit-i-acknowledge-that-i-have-read-the-terms-and-conditions-to-parti
${ResearchesAndStudies_CB3_CheckBox}                      id=edit-i-acknowledge-and-pledge-as-a-researcher-that-this-research-proj
${ResearchesAndStudies_CB4_CheckBox}                      id=edit-i-acknowledge-that-the-research-should-not-be-part-of-the-master
${ResearchesAndStudies_CB5_CheckBox}                      id=edit-i-agree-that-the-ownership-of-the-study-or-the-scientific-produc
${ResearchesAndStudies_CB6_CheckBox}                      id=edit-i-acknowledge-my-obligation-to-inform-the-authority-of-any-chang
${ResearchesAndStudies_Submit_BTN}                        id=edit-submit
*** Test Cases ***  
Submit_Research_Plans
  Navigate_To_ResearchesAndStudies
  Submit_Request

*** Keywords ***
Navigate_To_ResearchesAndStudies
    Mouse Over                    ${RyadaCenter_Mainover_DDL}   
    Sleep                         1s     
    Click Link                    ${RyadaCenter_ResearchesAndStudies_link} 
    Page Should Contain           Research and Studies
    Sleep                         5s    
    Click Element                 ${ResearchesAndStudies_ReceivingResearch_Link}     
    Page Should Contain           Template for receiving research plans
Submit_Request
    Click Element                 ${ResearchesAndStudies_ResearchType_RB}
    Input Text                    ${ResearchesAndStudies_NameArabic_Text}          اتوميشن تست عربي
    Input Text                    ${ResearchesAndStudies_NameEnglish_Text}         Automation English Test
    Click Element                 ${ResearchesAndStudies_Gender_RB}           
    Input Text                    ${ResearchesAndStudies_Major_Text}               major automatin test  
    Input Text                    ${ResearchesAndStudies_Degree_Text}              5    
    Click Element                 ${ResearchesAndStudies_Person_RB}
    Input Text                    ${ResearchesAndStudies_ReaeRCHtITLE_Text}        research title test   
    Input Text                    ${ResearchesAndStudies_Mobile_Text}              +966500000000          
    ${email} =  FakerLibrary.Email         
    Set Suite Variable           ${email}    
    Input Text                   ${ResearchesAndStudies_Email_Text}                 ${email}  
    Input Text                   ${ResearchesAndStudies_ResearchArabic_Text}        اسم البحث بالعربي تست    
    Input Text                   ${ResearchesAndStudies_ResearchEnglsih_Text}       research english name test
    Input Text                   ${ResearchesAndStudies_ResearchField_Text}         automation test
    Input Text                   ${ResearchesAndStudies_AddedValue_Text}            added value test
    Input Text                   ${ResearchesAndStudies_Beneficiaries_Text}         beneficiaries test    
    Click Element                ${ResearchesAndStudies_Supporters_RB}
    Input Text                   ${ResearchesAndStudies_ResearchSummary_Text}       تست الريسيرش اتوميشن تست الريسيرش اتوميشن تست الريسيرش اتوميشن تست الريسيرش اتوميشن تست البحث اتوميشن      
    Input Text                   ${ResearchesAndStudies_ResearchGoals_Text}         test automatiom research goals
    Choose File                  ${ResearchesAndStudies_CV_Attach}                  C:\\Users\\HAzmy\\Desktop\\Testing tools.docx
    Sleep                        4s
    Choose File                  ${ResearchesAndStudies_ID_Attach}                  ${ResearchesAndStudies_File_Path}  
    Sleep                        4s     
    Click Element                ${ResearchesAndStudies_CB1_CheckBox}     
    Click Element                ${ResearchesAndStudies_CB2_CheckBox}  
    Click Element                ${ResearchesAndStudies_CB3_CheckBox}  
    Click Element                ${ResearchesAndStudies_CB4_CheckBox}  
    Click Element                ${ResearchesAndStudies_CB5_CheckBox}  
    Click Element                ${ResearchesAndStudies_CB6_CheckBox}   
    Click Button                 ${ResearchesAndStudies_Submit_BTN}     
    