ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO.
ECHO my-computer-details
ECHO.
ECHO [91mMade by 324hz under the GNU General Public License v3.0[0m
ECHO [33mv0.1.0 dev devnet release[0m [91mSYNCbeta testnet release: FALSE[0m [91mSYNCmainnet release: FALSE[0m
ECHO.
ECHO [91m!NOTE THAT DEV DEVNET IS STILL UNDER DEVELPMENT AND WILL HAVE BUGS![0m
ECHO [91mPlease report any bugs/issues as well as features you want here https://github.com/win21H2/my-computer-details/issues[0m
ECHO.
ECHO [91mWhat's different compared to the mainnet and beta testnet release?[0m
ECHO [92m+ Started working on a mini menu after every section which displays the main menu after the user hits the enter key[0m
ECHO [92m+ Started working on a data saving system which allows the user to choose if they want to save the data to a .txt file[0m
ECHO [91m- Removed most of the sections to reduce code clutter[0m
ECHO [91m- Removed all of the letter selections to reduce code clutter and make the contents section easier to read[0m
ECHO.
ECHO [92mShare the software using the link https://github.com/win21H2/my-computer-details[0m
ECHO.
ECHO [33m(1)[0m[36m { WHAT IS THIS TOOL? }[0m
ECHO -------------------------------
ECHO [33m(2)[0m[36m { BIOS INFORMATION }[0m
ECHO [33m(3)[0m[36m { HARDWARE INFORMATION }[0m
ECHO -------------------------------
ECHO [33m(4)[0m[36m { CLEAR SCREEN }[0m
ECHO [33m(5)[0m[36m { EXIT }[0m
ECHO -------------------------------
ECHO [33m(6)[0m[36m { MAINNET }[0m
ECHO [33m(7)[0m[36m { BETA TESTNET }[0m
ECHO.
ECHO [32mPLEASE ENTER THE MENU NUMBER/LETTER IN THE INPUT SECTION BELOW[0m
ECHO.
SET /P M=
IF %M%==1 GOTO WHATIS 
IF %M%==2 GOTO BIOS
IF %M%==3 GOTO HARDWARE
IF %M%==4 GOTO CLEARSCREEN
IF %M%==5 GOTO EOF
IF %M%==6 GOTO MAINNET
IF %M%==7 GOTO BETA
ELSE CLS GOTO MENU

:BETA
    CLS
    ECHO.
    ECHO [91mGOING TO BETA TESTNET PLEASE WAIT...[0m
    CALL beta.bat

:MAINNET    
    CLS
    ECHO.
    ECHO [91mGOING TO MAINNET PLEASE WAIT...[0m
    CALL mainnet.bat

:WHATIS
    CLS
    ECHO.
    ECHO [34mWHAT IS THIS TOOL?[0m
    ECHO.
    ECHO This tool created by 324hz/win21H2 and is designed to give you a quick overview of your computer's hardware as well as BIOS information and any software that is on your computer.
    ECHO This tool is under the MIT license as followed
    ECHO.
    ECHO.
    SET /p choice=[OK] (hit enter)
    IF '%choice%'=='OK' (
        CLS
        GOTO MENU
    ) ELSE (
        CLS
        GOTO MENU
    )

:BIOS
    CLS
    ECHO. 
    ECHO [36mBIOS INFORMATION[0m
    ECHO.
    ECHO [34mBIOS[0m 
    ECHO.
    wmic bios get serialnumber, manufacturer, version, biosversion, name
    ECHO.
    ECHO.
    ECHO.
    SET /p choice=[OK] (hit enter)
    IF '%choice%'=='OK' (
        CLS
        GOTO MENU
    ) ELSE (
        CLS
        GOTO MENU
    )

:HARDWARE
    CLS
    ECHO.   
    ECHO [36mHARDWARE INFORMATION[0m  
    ECHO.
    ECHO [34mCPU[0m 
    ECHO.
    wmic cpu get name, manufacturer, threadcount, numberofcores, status, loadpercentage
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
    ECHO.
    ECHO.
    SET /p choice=[OK] (hit enter)
    IF '%choice%'=='OK' (
        CLS
        GOTO MENU
    ) ELSE (
        CLS
        GOTO MENU
    )

:CLEARSCREEN
    CLS
GOTO MENU

:EOF
CLS
SET /p choice=[91mAre you sure you want to exit?[0m [y/n]
IF '%choice%'=='y' (
    ECHO [91mEXITING...........[0m
    timeout /t 1
    CLS
    EXIT
) ELSE (
    CLS
    GOTO MENU
)