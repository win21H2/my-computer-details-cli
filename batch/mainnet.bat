ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO.
ECHO [91mMade by 324hz under the GNU General Public License v3.0[0m
ECHO [91mv0.0.3 mainnet release[0m [91mISSYNCEDWITH beta testnet release: FALSE[0m [91mISSYNCEDWITH dev devnet release: FALSE[0m
ECHO.
ECHO [92mhttps://github.com/win21H2/my-computer-details[0m
ECHO.
ECHO 1 { BIOS INFORMATION }
ECHO 2 { HARDWARE INFORMATION }
ECHO 3 { WINDOWS INFORMATION }
ECHO 4 { OTHERS }
ECHO 5 { CLEAR SCREEN }
ECHO 6 { EXIT }
ECHO -------------------------------
ECHO [33m(7)[0m[36m { BETA TESTNET }[0m
ECHO [33m(8)[0m[36m { DEV DEVNET }[0m
ECHO.
ECHO [32mPLEASE ENTER ONE OF THE NUMBERS IN THE INPUT SECTION BELOW[0m
ECHO.
SET /P M=
IF %M%==1 GOTO BIOS
IF %M%==2 GOTO HARDWARE
IF %M%==3 GOTO WINDOWS
IF %M%==4 GOTO OTHERS
IF %M%==5 GOTO CLEARSCREEN
IF %M%==6 GOTO EOF
IF %M%==7 GOTO BETA
IF %M%==8 GOTO DEV
ELSE CLS GOTO MENU

:DEV
    CLS
    ECHO.
    ECHO [91mGOING TO DEV DEVNET PLEASE WAIT...[0m
    CALL dev.bat

:BETA
    CLS
    ECHO.
    ECHO [91mGOING TO BETA TESTNET PLEASE WAIT...[0m
    CALL beta.bat

:BIOS
    ECHO. 
    ECHO [36mBIOS INFORMATION[0m
    ECHO.
    ECHO [34mBIOS[0m 
    ECHO.
    wmic bios get serialnumber, manufacturer, version
    ECHO.
    ECHO [91mMade by 324hz under the MIT license[0m
    ECHO.
    ECHO.
GOTO MENU

:HARDWARE
    ECHO.   
    ECHO [36mHARDWARE INFORMATION[0m  
    ECHO.
    ECHO [34mCPU[0m 
    ECHO.
    wmic cpu get name, manufacturer, threadcount, numberofcores
    wmic computersystem get numberoflogicalprocessors, numberofprocessors
    ECHO.
    ECHO [34mMEMORY[0m 
    ECHO.
    wmic memorychip get manufacturer, capacity, speed
    wmic computersystem get totalphysicalmemory
    ECHO.
    ECHO [34mGPU[0m 
    ECHO.
    wmic path win32_VideoController get name, driverversion, currentrefreshrate
    ECHO.
    ECHO [34mMOTHERBOARD[0m
    ECHO.
    wmic baseboard get product, manufacturer, serialnumber, version
    ECHO.
    ECHO [34mNETWORKING[0m
    ECHO.
    wmic nic get name, macaddress
    ECHO.
    ECHO [34mDISK[0m
    ECHO.
    wmic diskdrive get name, model, size
    wmic partition get name, size
    ECHO.
    ECHO [34mMANUFACTURER[0m
    ECHO.
    wmic computersystem get manufacturer, model, systemfamily
    ECHO.
    ECHO [91mMade by 324hz under the MIT license[0m
    ECHO.
    ECHO.
GOTO MENU

:WINDOWS
    ECHO. 
    ECHO [36mWINDOWS INFORMATION[0m  
    ECHO.
    ECHO [34mWINDOWS BOOT[0m
    ECHO.
    wmic computersystem get bootupstate, chassisbootupstate, bootstatus
    ECHO.
    ECHO [34mWINDOWS STARTUP[0m
    ECHO.
    wmic startup list brief
    ECHO.
    ECHO [91mMade by 324hz under the MIT license[0m
    ECHO.
    ECHO.
GOTO MENU

:OTHERS
    ECHO. 
    ECHO [36mAPPLICATIONS[0m 
    ECHO.
    SET /p choice=Are you sure you want to list out all of your applications? [y/n]
    IF '%choice%'=='y' (
        ECHO [31mPLEASE WAIT WHILST THE LIST OF APPLICATIONS ARE LOADING[0m 
        ECHO [31mDO NOT TYPE ANYTHING ELSE![0m
        wmic product get name,version
    ) ELSE (
        CLS
        GOTO MENU
    )
    ECHO.
    ECHO [91mMade by 324hz under the MIT license[0m
    ECHO.
    ECHO.
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