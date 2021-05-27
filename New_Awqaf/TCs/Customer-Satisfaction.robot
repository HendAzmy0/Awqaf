*** Settings ***
Library     SeleniumLibrary      
Resource           ../KeyWords/CommonKeys.robot
Suite Setup         Navigate_To_Browser   

*** Variables ***  
${Services_Main_over DDL}                               id=main-menu-link-contentc3200ba2-6248-4662-91c3-ca30fb19fe1d
${Services_Satisfactions_DDL}                           link=رضا العملاء
${Satisfactions_Send_BTN}                               id=edit-actions-submit
${Satisfactions_S.Type_DDL}                             name=type_of_service_other[select]       
${Satisfactions_Authority services_RB}                  id=edit-how-satisfied-are-you-with-the-services-of-the-general-endowment-satisfied                              
${Satisfactions_expectationsLevel_RB}                   id=edit-compared-to-your-expectations-to-what-extent-the-services-you-re-more-than-expected
${Satisfactions_PerfectService_RB}                      id=edit-how-close-your-service-is-to-what-you-think-is-a-perfect-service-close-to-the-ideal
${Satisfactions_SeviceTime_RB}                          id=edit-i-got-the-service-at-the-right-time-totally-agree
${Satisfactions_SericeTrust_RB}                         id=edit-i-trust-the-services-provided-by-the-commission-agree
${Satisfactions_ServiceProvided_RB}                     id=edit-the-service-i-provided-met-my-needs-agree
${Satisfactions_ServiceEasy_RB}                         id=edit-the-service-you-used-is-easy-and-clear-totally-agree
${Satisfactions_ServiceUseful_RB}                       id=edit-the-service-you-used-is-useful-for-me-to-complete-my-transaction-strongly-disagree
${Satisfactions_ServicePersonally_RB}                   id=edit-the-service-you-used-was-me-personally
${Satisfactions_RepresentCategory_RB}                   id=edit-you-represent-any-category-a-follow-up-to-the-commissions-work
                 

*** Test Cases ***
Navigate_To_CustomerSatisfactions
    Mouse Over                    ${Services_Main_over DDL}
    sleep      1s    
    Mouse Over                    ${Services_Satisfactions_DDL} 
    Click Link                    ${Services_Satisfactions_DDL}   
    Page Should Contain Button    ${Satisfactions_Send_BTN}  
    
Submit_CustomerSatisfactions
    Select From List By Index             ${Satisfactions_S.Type_DDL}                  1
    Click Button                          ${Satisfactions_Authority services_RB} 
    Click Button                          ${Satisfactions_expectationsLevel_RB}
    Click Button                          ${Satisfactions_PerfectService_RB}
    Click Button                          ${Satisfactions_SeviceTime_RB}
    Click Button                          ${Satisfactions_SericeTrust_RB}
    Click Button                          ${Satisfactions_ServiceProvided_RB}  
    Click Button                          ${Satisfactions_ServiceEasy_RB} 
    Click Button                          ${Satisfactions_ServiceUseful_RB} 
    Click Button                          ${Satisfactions_ServicePersonally_RB}  
    Click Button                          ${Satisfactions_RepresentCategory_RB}                                           
    sleep                                 70s
    Click Button                          ${Satisfactions_Send_BTN}   
    Page Should Contain                   شكراً على تعاونكم وعلى الإجابة على هذا الاستبيان    