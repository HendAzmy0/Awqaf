*** Settings ***
Library             SeleniumLibrary          
Library             FakerLibrary    
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser  

*** Variables ***  
${RyadaCenter_Mainover_DDL}                                    id=main-menu-link-content99a3ef24-dbb4-4d7c-8565-1c9eba667654
${RyadaCenter_ResearchesAndStudies_Link}                       link=Researches and Studies
${ResearchesAndStudies_InitiativesAndProposal_Link}            xpath=//strong[normalize-space()='Receiving research initiatives and proposals']
${InitiativesAndProposal_Name_Text}                            id=edit-name
${InitiativesAndProposal_Email_Text}                           id=edit-email
${InitiativesAndProposal_Subject_Text}                         id=edit-subject
${InitiativesAndProposal_AboutResearch_Text}                   id=edit-about-the-research
${InitiativesAndProposal_Submit_BTN}                           id=edit-submit
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
    Click Element                 ${ResearchesAndStudies_InitiativesAndProposal_Link} 
    Page Should Contain           Receive research initiatives and proposals
Submit_Initiative
    Input Text                    ${InitiativesAndProposal_Name_Text}                Test Automation
    ${email} =  FakerLibrary.Email         
    Set Suite Variable            ${email}    
    Input Text                    ${InitiativesAndProposal_Email_Text}                ${email}  
    Input Text                    ${InitiativesAndProposal_Subject_Text}             Subject Automation Test
    Input Text                    ${InitiativesAndProposal_AboutResearch_Text}       About Research Automation Test
    Click Button                  ${InitiativesAndProposal_Submit_BTN}  
    Page Should Contain           Thank you
        
    