ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO [91mMade by 324hz under the MIT license[0m
ECHO.
ECHO [92mhttps://github.com/win21H2/my-computer-details[0m
ECHO.
ECHO [32mENTER 1, 2, 3 OR 4 TO SELECT YOUR TASK, OR 5 TO EXIT[0m
ECHO.
ECHO 1 { BIOS INFORMATION }
ECHO 2 { HARDWARE INFORMATION }
ECHO 3 { WINDOWS INFORMATION }
ECHO 4 { OTHERS }
ECHO 5 { EXIT }
ECHO.
SET /P M=TYPE 1, 2, 3, 4 OR 5, THEN PRESS ENTER:
IF %M%==1 GOTO BIOS
IF %M%==2 GOTO HARDWARE
IF %M%==3 GOTO WINDOWS
IF %M%==4 GOTO OTHERS
IF %M%==5 GOTO EOF
ELSE CLS GOTO MENU

:BIOS
    ECHO. 
    ECHO [36mBIOS INFORMATION[0m
    ECHO.
    ECHO [34mBIOS[0m 
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
    wmic cpu get name, manufacturer, threadcount, numberofcores
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
    ECHO [91mMade by 324hz under the MIT license[0m
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
    ECHO [91mMade by 324hz under the MIT license[0m
    ECHO.
    ECHO.
:: NUMBER OF INSTALLED UPDATES
:: LIST OF INSTALLED APPLICATIONS IN WINDOWS
:: http://net-informations.com/q/mis/wmic.html#:~:text=WMIC%20is%20the%20abbreviation%20of,interfaces%20and%20through%20batch%20scripts.
GOTO MENU

:OTHERS
    ECHO. 
    ECHO [36mAPPLICATIONS[0m 
    ECHO [31mPLEASE WAIT WHILST THE LIST OF APPLICATIONS ARE LOADING[0m 
    ECHO [31mDO NOT TYPE ANYTHING ELSE![0m
    wmic product get name,version
    ECHO.
    ECHO [91mMade by 324hz under the MIT license[0m
    ECHO.
    ECHO.
GOTO MENU

:EOF
SET /p choice=Are you sure you want to exit? [y/n]
IF '%choice%'=='y' (
    CLS
    EXIT
) ELSE (
    CLS
    GOTO MENU
)