*** Settings ***
Library          AppiumLibrary
Resource       ../Resource/Common/CommonKeyword.robot
Resource       ../Resource/ProjectPage/CounterPage.robot
Resource       ../Resource/ProjectPage/HomePage.robot
Resource       ../Resource/ProjectPage/ScroollPage.robot

*** Variables ***

*** Test Cases ***
Test Case Android 1
    [Documentation]    Test case for Android
    RunApplication    android
    Open Counter Screen    android
    Increment Counter Value Test Case    android    5
    Counter Back    android
    Sleep    2s
    Open Demo Scroll Screen    android
    Run Test Scroll    android
    Sleep    2s
    Scoll Back    android
    Close Application

Test Case IOS 1
    [Documentation]    Test case for IOS
    RunApplication    ios
    Open Counter Screen    ios
    Increment Counter Value Test Case    ios    5
    Counter Back    ios
    Sleep    2s
    Open Demo Scroll Screen    ios
    Run Test Scroll    ios
    Sleep    2s
    Scoll Back    ios
    Close Application
