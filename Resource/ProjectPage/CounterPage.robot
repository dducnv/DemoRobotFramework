*** Settings ***
Library          AppiumLibrary
Resource        ../Common/CommonKeyword.robot

*** Variables ***
${COUNTER_INCREMENT_ANDROID}  xpath=//android.widget.Button[@text='Increment Counter']
${COUNTER_LABEL_ANDROID}  xpath=//android.widget.TextView[@content-desc="counterText"]
${BACK_BUTTON_ANDROID}  xpath=//android.widget.Button[@text='Back']

${COUNTER_INCREMENT_IOS}  xpath=//XCUIElementTypeButton[@name='Increment Counter']
${COUNTER_LABEL_IOS}       xpath=//XCUIElementTypeStaticText[contains(@value, 'You have pushed the button this many times:')]/following-sibling::XCUIElementTypeStaticText[1]
${BACK_BUTTON_IOS}  xpath=//XCUIElementTypeButton[@name='Back']


*** Keywords ***
Increment Counter
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Click Element    ${COUNTER_INCREMENT_ANDROID}
    Run Keyword If    '${platform}' == 'ios'    Click Element    ${COUNTER_INCREMENT_IOS}

Get Counter Value
    [Arguments]    ${platform}
    ${counter_value} =    Run Keyword If    '${platform}' == 'android'   Get Text     ${COUNTER_LABEL_ANDROID}
    ...    ELSE IF    '${platform}' == 'ios'    Get Text    ${COUNTER_LABEL_IOS}
    RETURN   ${counter_value}

Counter Back
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Click Element    ${BACK_BUTTON_ANDROID}
    Run Keyword If    '${platform}' == 'ios'    Click Element    ${BACK_BUTTON_IOS}

##click on the increment button when value is 5 and then click on back button
Increment Counter Value Test Case
    [Arguments]    ${platform}  ${counter_value_compare}
    ${counter_value} =    Get Counter Value    ${platform}
    ${int_counter_value} =    Convert To Integer    ${counter_value}
    Log    hello ${counter_value}  level=WARN  console=${True}
    WHILE  ${int_counter_value} < ${counter_value_compare}
        Increment Counter    ${platform}
        Sleep  2s
        ${counter_value} =    Get Counter Value    ${platform}
        ${int_counter_value} =    Convert To Integer    ${counter_value}
    END
    RETURN   ${counter_value}
