*** Settings ***
Library          AppiumLibrary
Resource        ./CommonKeyword.robot

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub

${ANDROID_DEVICE_NAME}    Android
${ANDROID_PLATFORM_VERSION}    10
${ANDROID_UDID}    emulator-5554
${ANDROID_APP_PACKAGE}    com.example.research_code_push_2
${ANDROID_APP_ACTIVITY}    com.example.research_code_push_2.MainActivity
${ANDROID_AUTOMATION_NAME}    UiAutomator2

${IOS_DEVICE_NAME}    iPhone 16
${IOS_PLATFORM_VERSION}    18.0
${IOS_UDID}    B12CEA02-B5EB-4B7D-AB2D-D0AAD8CCBAE9
${IOS_APP_BUNDLE_ID}    com.example.researchCodePush2
${IOS_AUTOMATION_NAME}    XCUITest

*** Keywords *** 
RunApplication
    [Arguments]    ${platform}
    Run Keyword If    '${platform}' == 'android'    Open Android Application
    Run Keyword If    '${platform}' == 'ios'    Open IOS Application

Open Android Application
    Open Application    ${APPIUM_SERVER}    platformName=Android    deviceName=${ANDROID_DEVICE_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}    udid=${ANDROID_UDID}    appPackage=${ANDROID_APP_PACKAGE}    appActivity=${ANDROID_APP_ACTIVITY}    automationName=${ANDROID_AUTOMATION_NAME}   noReset=${True}

Open IOS Application
    Open Application    ${APPIUM_SERVER}    platformName=iOS    deviceName=${IOS_DEVICE_NAME}    platformVersion=${IOS_PLATFORM_VERSION}    udid=${IOS_UDID}    bundleId=${IOS_APP_BUNDLE_ID}    automationName=${IOS_AUTOMATION_NAME}


