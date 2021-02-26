*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${REGISTER URL}    http://${SERVER}/robotframework/EventRegistration.html
${SUCCESS URL}    http://${SERVER}/robotframework/EventRegistration.html/Success.html
${DELAY}          0
${VALID FIRSTNAME}    Somsri
${VALID LASTNAME}    Sodsai
${VALID EMAIL}    somsri@kkumail.com

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${REGISTER URL}    ${BROWSER}
	Location Should Be    ${REGISTER URL}
	Capture Page Screenshot    filename=openpage.png
	Set Selenium Speed    ${DELAY}
	
Register Success
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    email    ${VALID EMAIL}
    Capture Page Screenshot    filename=fillform.png
    Click Button    registerButton
    Location Should Contain    ${SUCCESS URL}
    Wait Until Page Contains    Success
	Wait Until Page Contains    Thank you for participating in our event
    Capture Page Screenshot    filename=successpage.png

	[Teardown]    Close Browser