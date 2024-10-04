*** Settings ***
Library          AppiumLibrary
Resource        ../Common/CommonKeyword.robot

*** Variables ***
${SCROLL_VIEW_ANDROID}  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View
${SCROLL_VIEW_IOS}  xpath=//XCUIElementTypeScrollView

${BACK_BUTTON_ANDROID}  xpath=//android.widget.Button[@text='Back']
${BACK_BUTTON_IOS}  xpath=//XCUIElementTypeButton[@name='Back']

*** Keywords ***
Scroll Down
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Scroll Down    ${SCROLL_VIEW_ANDROID}
    Run Keyword If    '${platform}' == 'ios'    Scroll Down    ${SCROLL_VIEW_IOS}

Scroll Up
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Scroll Up    ${SCROLL_VIEW_ANDROID}
    Run Keyword If    '${platform}' == 'ios'    Scroll Up    ${SCROLL_VIEW_IOS}

Scoll Back
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Click Element    ${BACK_BUTTON_ANDROID}
    Run Keyword If    '${platform}' == 'ios'    Click Element    ${BACK_BUTTON_IOS}

Run Test Scroll
    [Arguments]    ${platform}
    Scroll Up    ${platform}
    Sleep    2s
    Scroll Down    ${platform}
    Sleep    2s
