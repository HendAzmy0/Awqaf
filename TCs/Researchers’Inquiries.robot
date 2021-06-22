*** Settings ***
Library             SeleniumLibrary          
Library             FakerLibrary    
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser  

*** Variables ***  
${RyadaCenter_Mainover_DDL}                                    id=main-menu-link-content99a3ef24-dbb4-4d7c-8565-1c9eba667654
${RyadaCenter_ResearchesAndStudies_Link}                       link=Researches and Studies
${ResearchesAndStudies_Researchers'Inquiries_Link}             xpath=//strong[contains(text(),'To support and assist in the researchers’ inquirie')]
${Researchers'Inquiries_Name_Text}                             id=edit-name
${Researchers'Inquiries_Email_Text}                            id=edit-email
${Researchers'Inquiries_Subject_Text}                          id=edit-subject
${Researchers'Inquiries_Inquiries_Text}                        id=edit-inquiries
${Researchers'Inquiries_ResearcherMission_Atatch}              id=edit-letter-of-facilitation-of-a-researcher-mission-upload
${Researchers'Inquiries_File_Path}                             C:\\Users\\HAzmy\\Desktop\\Services\\approval.png
${Researchers'Inquiries_Submit_BTN}                            id=edit-submit
*** Test Cases ***  
Submit_Research_Plans
  Navigate_To_ResearchesAndStudies
  Submit_Initiative

*** Keywords ***
Navigate_To_ResearchesAndStudies
    Mouse Over                    ${RyadaCenter_Mainover_DDL}   
    Sleep                         1s     
    Click Link                    ${RyadaCenter_ResearchesAndStudies_link} 
    Page Should Contain           Research and Studies
    Sleep                         5s    
    Click Element                 ${ResearchesAndStudies_Researchers'Inquiries_Link} 
    Page Should Contain           Support researchers' inquiries
Submit_Initiative
    Input Text                    ${Researchers'Inquiries_Name_Text}                     Test Automation 
    ${email} =  FakerLibrary.Email         
    Set Suite Variable            ${email}    
    Input Text                    ${Researchers'Inquiries_Email_Text}                    ${email}  
    Input Text                    ${Researchers'Inquiries_Subject_Text}                  Subject Automation Test
    Input Text                    ${Researchers'Inquiries_Inquiries_Text}                Inquiries Automation Test
    Choose File                   ${Researchers'Inquiries_ResearcherMission_Atatch}      ${Researchers'Inquiries_File_Path}
    Click Button                  ${Researchers'Inquiries_Submit_BTN}  
    Page Should Contain           Thank you
        
    