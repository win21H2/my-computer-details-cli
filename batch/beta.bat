ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO.
ECHO [91mMade by 324hz under the GNU General Public License v3.0[0m
ECHO [91mv0.0.7 beta testnet release[0m [91mISSYNCEDWITH dev devnet release: FALSE[0m [32mISSYNCEDWITH mainnet release: TRUE[0m
ECHO.
ECHO [91m!NOTE THAT BETA TESTNET IS STILL UNDER DEVELPMENT AND WILL HAVE BUGS![0m
ECHO [91mPlease report any bugs/issues as well as features you want here https://github.com/win21H2/my-computer-details/issues[0m
ECHO.
ECHO [91mWhat's different compared to the mainnet release?[0m
ECHO [92m+ Started testing out and adding more WMIC commands[0m
ECHO [92m+ Changed the format of the contents page[0m
ECHO [92m+ Added a "what is this tool" section with an overview of the tool[0m
ECHO [92m+ Reformatted the menu, adding color to the contents page and removing the input section[0m
ECHO [91m- Removed the credits under each section (because it shows at the top of the menu anyways)[0m
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

:DEV
    CLS
    ECHO.
    ECHO [91mGOING TO DEV DEVNET PLEASE WAIT...[0m
    CALL dev.bat

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
    ECHO Copyright (c) 2022 324hz
    ECHO.
    ECHO Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files my-computer-details, to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    ECHO.
    ECHO The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    ECHO.
    ECHO THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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

:WINDOWS
    CLS
    ECHO. 
    ECHO [36mWINDOWS INFORMATION[0m  
    ECHO.
    ECHO [34mWINDOWS BOOT[0m
    ECHO.
    wmic computersystem get bootupstate, chassisbootupstate, bootstatus, systemtype, dnshostname
    ECHO.
    ECHO [34mWINDOWS STARTUP[0m
    ECHO.
    wmic startup list brief
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

:APPLICATIONS
    CLS
    ECHO. 
    ECHO [36mAPPLICATIONS[0m 
    ECHO.
    SET /p choice=Are you sure you want to list out all of your applications? [y/n]
    IF '%choice%'=='y' (
        ECHO [31mPLEASE WAIT WHILST THE LIST OF APPLICATIONS ARE LOADING[0m 
        ECHO [31mDO NOT TYPE ANYTHING ELSE![0m
        ECHO.
        wmic product get name,version
    ) ELSE (
        CLS
        GOTO MENU
    )
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

:STARTUP 
    CLS
    ECHO.
    ECHO [36mSTARTUP[0m
    ECHO.
    SET /p choice=Are you sure you want to list out all of your startup applications? [y/n]
    IF '%choice%'=='y' (
        ECHO [31mPLEASE WAIT WHILST THE LIST OF STARTUP APPLICATIONS ARE LOADING[0m 
        ECHO [31mDO NOT TYPE ANYTHING ELSE![0m
        ECHO.
        wmic startup list
    ) ELSE (
        CLS
        GOTO MENU
    )
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