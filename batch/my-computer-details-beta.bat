ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO [91mMade by 324hz under the MIT license[0m
ECHO [91mv0.0.5 beta testnet[0m
ECHO.
ECHO [91m!NOTE THAT BETA TESTNET IS STILL UNDER DEVELPMENT AND WILL HAVE BUGS![0m
ECHO [91mPlease report any bugs/issues as well as features you want here https://github.com/win21H2/my-computer-details/issues[0m
ECHO.
ECHO [91mWhat's different to the official release?[0m
ECHO [92m+ Started testing out and adding more WMIC commands[0m
ECHO [92m+ Changed the format of the contents page[0m
ECHO [92m+ Added a "what is this tool" section with an overview of the tool[0m
ECHO [92m+ Added letters to the menu for if the user wants to type out the first letter[0m
ECHO [92m+ Reformatted the menu, adding color to the contents page and removing the input section[0m
ECHO [91m- Removed the credits under each section (because it shows at the top of the menu anyways)[0m
ECHO.
ECHO [92mShare the software using the link https://github.com/win21H2/my-computer-details[0m
ECHO.
ECHO [33m(1 whatis)[0m[36m { WHAT IS THIS TOOL? }[0m
ECHO [33m(2 b)[0m[36m { BIOS INFORMATION }[0m
ECHO [33m(3 h)[0m[36m { HARDWARE INFORMATION }[0m
ECHO [33m(4 w)[0m[36m { WINDOWS INFORMATION }[0m
ECHO [33m(5 a)[0m[36m { APPLICATIONS }[0m
ECHO [33m(6 s)[0m[36m { STARTUP }[0m
ECHO [33m(7 c)[0m[36m { CLEAR SCREEN }[0m
ECHO [33m(8 e)[0m[36m { EXIT }[0m
ECHO.
ECHO [32mPLEASE ENTER THE MENU NUMBER/LETTER IN THE INPUT SECTION BELOW[0m
ECHO.
SET /P M=
IF %M%==1 GOTO WHATIS
IF %M%==whatis GOTO WHATIS
IF %M%==2 GOTO BIOS
IF %M%==B GOTO BIOS
IF %M%==3 GOTO HARDWARE
IF %M%==H GOTO HARDWARE
IF %M%==4 GOTO WINDOWS
IF %M%==W GOTO WINDOWS
IF %M%==5 GOTO APPLICATIONS
IF %M%==O GOTO APPLICATIONS
IF %M%==6 GOTO STARTUP
IF %M%==S GOTO STARTUP
IF %M%==7 GOTO CLEARSCREEN
IF %M%==C GOTO CLEARSCREEN
IF %M%==8 GOTO EOF
IF %M%==E GOTO EOF
ELSE CLS GOTO MENU

:WHATIS
    ECHO.
    ECHO [34mWHAT IS THIS TOOL?[0m
    ECHO.
    ECHO [36mThis tool created by 324hz/win21H2 and is
    ECHO designed to give you a quick overview of your
    ECHO computer's hardware as well as BIOS information
    ECHO and any software that is on your computer.[0m
    ECHO [36mThis tool is under the MIT license as followed[0m
    ECHO.
    ECHO.
    ECHO Copyright 2022 324hz
    ECHO.
    ECHO Permission is hereby granted, free of charge,
    ECHO to any person obtaining a copy of this software
    ECHO and associated documentation files (the "Software"),
    ECHO to deal in the Software without restriction,
    ECHO including without limitation the rights to use,
    ECHO copy, modify, merge, publish, distribute,
    ECHO sublicense, and/or sell copies of the Software,
    ECHO and to permit persons to whom the Software is
    ECHO furnished to do so, subject to the following conditions:
    ECHO.
    ECHO The above copyright notice and this permission notice
    ECHO shall be included in all copies or substantial portions
    ECHO of the Software.
    ECHO.
    ECHO THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
    ECHO ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
    ECHO TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
    ECHO PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
    ECHO THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    ECHO DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    ECHO TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    ECHO WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    ECHO.
    ECHO.
    ECHO.
GOTO MENU

:: ADD SOME TYPE OF SYSTEM WHICH EITHER KEEPS THE USER ON THE PAGE OR SHOWS UP THE MENU!

:BIOS
    ECHO. 
    ECHO [36mBIOS INFORMATION[0m
    ECHO.
    ECHO [34mBIOS[0m 
    wmic bios get serialnumber, manufacturer, version, biosversion, name
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
    wmic computersystem get bootupstate, chassisbootupstate, bootstatus, systemtype, dnshostname
    ECHO.
    ECHO [34mWINDOWS STARTUP[0m
    wmic startup list brief
    ECHO.
    ECHO.
    ECHO.
GOTO MENU

:APPLICATIONS
    ECHO. 
    ECHO [36mAPPLICATIONS[0m 
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
GOTO MENU

:STARTUP 
    ECHO.
    ECHO [36mSTARTUP[0m
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
GOTO MENU

:CLEARSCREEN
    CLS
GOTO MENU

:EOF
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