*** Settings ***
Library          AppiumLibrary
Resource        ../Common/CommonKeyword.robot

*** Variables ***
${OPEN_COUNTER_SCREEN_BUTTON_ANDROID}  xpath=//android.widget.Button[@content-desc="Go to Counter Screen"]
${OPEN_DEMO_SCROOL_SCREEN_BUTTON_ANDROID}  xpath=//android.widget.Button[@content-desc="Go to Demo Scroll"]

${OPEN_COUNTER_SCREEN_BUTTON_IOS}  xpath=//XCUIElementTypeButton[@name="Go to Counter Screen"]
${OPEN_DEMO_SCROOL_SCREEN_BUTTON_IOS}  xpath=//XCUIElementTypeButton[@name="Go to Demo Scroll"]


*** Keywords ***
Open Counter Screen
    [Arguments]    ${platform} 
    Run Keyword If    '${platform}' == 'android'    Click Element    ${OPEN_COUNTER_SCREEN_BUTTON_ANDROID} 
    Run Keyword If    '${platform}' == 'ios'    Click Element    ${OPEN_COUNTER_SCREEN_BUTTON_IOS}

Open Demo Scroll Screen
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Click Element    ${OPEN_DEMO_SCROOL_SCREEN_BUTTON_ANDROID}
    Run Keyword If    '${platform}' == 'ios'    Click Element    ${OPEN_DEMO_SCROOL_SCREEN_BUTTON_IOS}

