ECHO OFF
CLS
:MENU
ECHO.
ECHO.
ECHO.
ECHO [91mMade by 324hz under the MIT license[0m
ECHO [91mv0.0.6 dev devnet[0m
ECHO.
ECHO [91m!NOTE THAT DEV DEVNET IS STILL UNDER DEVELPMENT AND WILL HAVE BUGS![0m
ECHO [91mPlease report any bugs/issues as well as features you want here https://github.com/win21H2/my-computer-details/issues[0m
ECHO.
ECHO [91mWhat's different to the mainnet and beta testnet release?[0m
ECHO [92m+ Started working on a mini menu after every section which displays the main menu after the user inputs "y"[0m
ECHO [91m- Removed most of the sections to reduce code clutter[0m
ECHO [91m- Removed the letter selections to reduce code clutter[0m
ECHO.
ECHO [92mShare the software using the link https://github.com/win21H2/my-computer-details[0m
ECHO.
ECHO [33m(1)[0m[36m { WHAT IS THIS TOOL? }[0m
ECHO [33m(7)[0m[36m { CLEAR SCREEN }[0m
ECHO [33m(8)[0m[36m { EXIT }[0m
ECHO.
ECHO [32mPLEASE ENTER THE MENU NUMBER/LETTER IN THE INPUT SECTION BELOW[0m
ECHO.
ECHO.
SET /P M=
IF %M%==1 GOTO WHATIS
IF %M%==7 GOTO CLEARSCREEN
IF %M%==8 GOTO EOF
ELSE CLS GOTO MENU

:WHATIS
    ECHO.
    ECHO [34mWHAT IS THIS TOOL?[0m
    ECHO.
    ECHO This tool created by 324hz/win21H2 and is
    ECHO designed to give you a quick overview of your
    ECHO computer's hardware as well as BIOS information
    ECHO and any software that is on your computer.
    ECHO This tool is under the MIT license as followed
    ECHO.
    ECHO.
    ECHO Copyright 2022 324hz
    ECHO.
    ECHO Permission is hereby granted, free of charge,
    ECHO to any person obtaining a copy of this software
    ECHO and associated documentation files my-computer-details,
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
    SET /p choice=[OK]
    IF '%choice%'=='OK' (
        GOTO MENU
    ) ELSE (
        
    )
GOTO MENU

:: ADD SOME TYPE OF SYSTEM WHICH EITHER KEEPS THE USER ON THE PAGE OR SHOWS UP THE MENU!

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