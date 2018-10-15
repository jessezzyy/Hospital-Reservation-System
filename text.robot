*** Settings ***
Documentation     A test suite with a single test for valid login.
Library           Selenium2Library
Resource          resource.robot

*** Test Cases ***
sign up
    open Browser    https://hospitalreservationsystem.herokuapp.com/    browser=chrome
    Maximize Browser Window
    sleep    6    Wait for a reply
    Click Link    xpath=//a[@href="index.jsp"]
    sleep    2    Wait for a reply
    Click Button    id=smbtn
    sleep    2    Wait for a reply
    Input Text    id=loginEmail    436080029@qq.com
    Input Text    id=loginPassword    123456
    Input Text    id=lname    Yuri
    Input Text    id=fname    Yuri
    Input Text    id=number    0452365655
    Select Radio Button    gender    sex1
    Click Button    DOB
    Execute Javascript    document.getElementById('DOB').value="2015-10-22"
    sleep    2    Wait for a reply
    Click Button    Sign up
    close Browser

AgileonLogin
    [Tags]    Agileone    # Agileone
    open Browser    https://hospitalreservationsystem.herokuapp.com/index.jsp    browser=chrome
    Maximize Browser Window
    sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="index.jsp"]
    sleep    2    Wait for a reply
    Click Button    id=lgbtn
    Sleep    2    Wait for a reply
    Input Text    id=loginEmail    jujs2010@163.com
    Input Text    id=loginPassword    123123
    Click Button    Log in
    Sleep    5    Wait for a reply
    close Browser

Add Departments' information
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp    browser=chrome
    Maximize Browser Window
    Click Link    xpath=//a[@href="ManageDepartment.jsp"]
    Sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="AdminAddDepart.jsp"]
    Sleep    2    Wait for a reply
    Input Text    id=depart    Surgery department
    Sleep    2    Wait for a reply
    Click Button    xpath=//button[@class="SaveBt"]
    Sleep    2
    close Browser

Add doctors' information
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp    browser=chrome
    Maximize Browser Window
    Click Link    xpath=//a[@href="ManageDoctor.jsp"]
    Sleep    3    Wait for a reply
    Click Link    xpath=//a[@href="AdminAddDoctor.jsp"]
    Sleep    3    Wait for a reply
    Input Text    id=fname    Yuri
    Input Text    id=lname    Yuri
    Input Text    id=number    123456789
    Click Button    dob
    Execute Javascript    document.getElementById('dob').value="2015-10-22"
    Input Text    id=loginEmail    Test@gmail.com
    Input Text    id=loginPassword    hahahanimeia
    Input Text    id=description    12345679
    Sleep    2    Wait for a reply
    Click Button    xpath=//button[@onclick="addDoctor()"]
    close Browser

Admin_Addusers
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp    browser=chrome
    Maximize Browser Window
    Click Link    xpath=//a[@href="ManageUser.jsp"]
    Sleep    3    Wait for a reply
    Click Link    xpath=//a[@href="AdminAddUser.jsp"]
    Sleep    3    Wait for a reply
    Input Text    id=fname    Yuri
    Input Text    id=lname    Yuri
    Input Text    id=number    123456789
    Input Text    id=fname    Yuri
    Input Text    id=loginEmail    456982258@qq.com
    Input Text    id=loginPassword    123456
    Click Button    xpath=//input[@class="SaveBt"]
    Sleep    3    Wait for a reply
    close Browser

Delete doctors' information
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp    browser=chrome
    Maximize Browser Window
    Click Link    xpath=//a[@href="ManageDepartment.jsp"]
    Sleep    5    Wait for a reply
    Click Button    xpath=//input[@value="Delect"]
    Sleep    2    Wait for a reply
    close Browser

Delete Departments' information
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp    browser=chrome
    Maximize Browser Window
    Click Link    xpath=//a[@href="ManageDepartment.jsp"]
    Sleep    5    Wait for a reply
    Click Button    xpath=//input[@onclick="Dedepart('Surgery department')"]
    Sleep    2    Wait for a reply
    close Browser

Delete User
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp    browser=chrome
    Maximize Browser Window
    Click Link    xpath=//a[@href="ManageUser.jsp"]
    Sleep    4    Wait for a reply
    Click element    xpath=/html/body/h1/div/div[2]/div[2]/div[2]/div[3]/div/div/div[2]/div/div/input
    Sleep    3    Wait for a reply
    open Browser    https://hospitalreservationsystem.herokuapp.com/view/Management.jsp
    Sleep    3    Wait for a reply
    Click button    id="logout
    Sleep    3    Wait for a reply
    close Browser

Add appointment
    open Browser    https://hospitalreservationsystem.herokuapp.com/index.jsp    browser=chrome
    Maximize Browser Window
    sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="index.jsp"]
    sleep    2    Wait for a reply
    Click Button    id=lgbtn
    Sleep    2    Wait for a reply
    Input Text    id=loginEmail    436080025@qq.com
    Input Text    id=loginPassword    123456
    Click Button    Log in
    Sleep    5    Wait for a reply
    ${message}    Confirm Action
    Should Be Equal as Strings    ${message}    Log in successfully
    choose ok on next confirmation
    Sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="MakeappointmentHome.jsp"]
    Sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="MakeappointmentDepart.jsp"]
    Sleep    4    Wait for a reply
    Click Element    xpath=//div[@class="h6" and @onclick="selectDepart()"]
    Sleep    4    Wait for a reply
    Click Element    xpath=//*[@id="add"]/div[1]/div/div[1]/div[2]/div/div/p
    Sleep    4    Wait for a reply
    Click Button    Date
    Execute Javascript    document.getElementById('Date').value="22-2-2019"
    Sleep    3
    Click Button    xpath=//button[@class="picker__button--close"]
    Sleep    3
    Click Button    Time
    Click Element    xpath=//*[@id="Time_root"]/div/div/div/div/ul/li[12]
    Sleep    3
    Click Button    id=comfirm
    Sleep    3
    close Browser

Review my appointments
    open Browser    https://hospitalreservationsystem.herokuapp.com/index.jsp    browser=chrome
    Maximize Browser Window
    sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="index.jsp"]
    sleep    2    Wait for a reply
    Click Button    id=lgbtn
    Sleep    2    Wait for a reply
    Input Text    id=loginEmail    436080025@qq.com
    Input Text    id=loginPassword    123456
    Click Button    Log in
    Sleep    5    Wait for a reply
    ${message}    Confirm Action
    Should Be Equal as Strings    ${message}    Log in successfully
    choose ok on next confirmation
    Sleep    2    Wait for a reply
    open Browser    http://localhost:8100/HospitalReservationSystem/view/Homepage.jsp    browser=chrome
    Maximize Browser Window
    Sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="Myappointment.jsp"]
    Sleep    2    Wait for a reply
    close Browser

Check list of appointments
    open Browser    https://hospitalreservationsystem.herokuapp.com/index.jsp    browser=chrome
    Maximize Browser Window
    sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="index.jsp"]
    sleep    2    Wait for a reply
    Click Button    id=lgbtn
    Sleep    2    Wait for a reply
    Input Text    id=loginEmail    yuri@gmail.com
    Input Text    id=loginPassword    123456
    Click Button    Log in
    Sleep    5    Wait for a reply
    ${message}    Confirm Action
    Should Be Equal as Strings    ${message}    Log in successfully
    choose ok on next confirmation
    Sleep    2    Wait for a reply
    Click Link    xpath=//a[@href="DoctorHomepage.jsp"]
    Sleep    2    Wait for a reply
    close Browser

*** Keywords ***
