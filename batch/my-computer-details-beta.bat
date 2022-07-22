ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO [91mMade by 324hz under the MIT license[0m
ECHO [91mv0.0.5 beta testnet[0m
ECHO.
ECHO [91m!NOTE THAT BETA TESTNET IS STILL UNDER DEVELPMENT AND WILL HAVE BUGS![0m
ECHO.
ECHO [91mWhat's different?[0m
ECHO [92m+ Added the refresh button for testing stages so quickly refresh the screen[0m
ECHO [92m+ Started testing out more WMIC commands[0m
ECHO [92m+ Reformatted the menu, adding color to the contents page and removing the input section[0m
ECHO [91m- Removed the credits under each section (because it shows at the top of the menu anyways)[0m
ECHO.
ECHO [92mhttps://github.com/win21H2/my-computer-details[0m
ECHO.
ECHO [36m1 { BIOS INFORMATION }[0m
ECHO [36m2 { HARDWARE INFORMATION }[0m
ECHO [36m3 { WINDOWS INFORMATION }[0m
ECHO [36m4 { OTHERS }[0m
ECHO [36m5 { CLEAR SCREEN }[0m
ECHO [36m6 { REFRESH SCREEN }[0m
ECHO [36m7 { EXIT }[0m
ECHO.
ECHO [32mPLEASE ENTER ONE OF THE NUMBERS IN THE INPUT SECTION BELOW[0m
ECHO.
SET /P M=
IF %M%==1 GOTO BIOS
IF %M%==2 GOTO HARDWARE
IF %M%==3 GOTO WINDOWS
IF %M%==4 GOTO OTHERS
IF %M%==5 GOTO CLEARSCREEN
IF %M%==6 GOTO REFRESHSCREEN
IF %M%==7 GOTO EOF
ELSE CLS GOTO MENU

:BIOS
    ECHO [31mPLEASE WAIT WHILST BIOS INFORMATION IS LOADING[0m 
    ECHO [31mDO NOT TYPE ANYTHING ELSE![0m
    ECHO. 
    ECHO [36mBIOS INFORMATION[0m
    ECHO.
    ECHO [34mBIOS[0m 
    wmic bios get serialnumber, manufacturer, version
    ECHO.
    ECHO.
    ECHO.
GOTO MENU

:HARDWARE
    ECHO.   
    ECHO [36mHARDWARE INFORMATION[0m  
    ECHO.
    ECHO [34mCPU[0m 
    wmic cpu get name, manufacturer, threadcount, numberofcores, status, loadpercentage
    wmic computersystem get numberoflogicalprocessors, numberofprocessors
    ECHO.
    ECHO [34mMEMORY[0m 
    wmic memorychip get manufacturer, capacity, speed
    wmic computersystem get totalphysicalmemory
    ECHO.
    ECHO [34mGPU[0m 
    wmic path win32_VideoController get name, driverversion, currentrefreshrate
    ECHO.
    ECHO [34mMOTHERBOARD[0m
    wmic baseboard get product, manufacturer, serialnumber, version
    ECHO.
    ECHO [34mNETWORKING[0m
    wmic nic get name, macaddress
    ECHO.
    ECHO [34mDISK[0m
    wmic diskdrive get name, model, size
    wmic partition get name, size
    ECHO.
    ECHO [34mMANUFACTURER[0m
    wmic computersystem get manufacturer, model, systemfamily
    ECHO.
    ECHO.
    ECHO.
GOTO MENU

:WINDOWS
    ECHO. 
    ECHO [36mWINDOWS INFORMATION[0m  
    ECHO.
    ECHO [34mWINDOWS BOOT[0m
    wmic computersystem get bootupstate, chassisbootupstate, bootstatus
    ECHO.
    ECHO [34mWINDOWS STARTUP[0m
    wmic startup list brief
    ECHO.
    ECHO.
    ECHO.
GOTO MENU

:OTHERS
    ECHO. 
    ECHO [36mAPPLICATIONS[0m 
    SET /p choice=Are you sure you want to list out all of your applications? [y/n]
    IF '%choice%'=='y' (
        ECHO [31mPLEASE WAIT WHILST THE LIST OF APPLICATIONS ARE LOADING[0m 
        ECHO [31mDO NOT TYPE ANYTHING ELSE![0m
        ECHO.
        wmic product get name,version
    ) ELSE (
        ECHO [91mCANCELLING[0m
        CLS
        GOTO MENU
    )
    ECHO.
    ECHO.
    ECHO.
GOTO MENU

:REFRESHSCREEN 
    CLS
GOTO MENU

:CLEARSCREEN
    CLS
GOTO MENU

:EOF
SET /p choice=Are you sure you want to exit? [y/n]
IF '%choice%'=='y' (
    ECHO [91mEXITING...........[0m
    timeout /t 1
    CLS
    EXIT
) ELSE (
    CLS
    GOTO MENU
)