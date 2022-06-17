@ECHO OFF

@REM pause function
echo ms = WScript.Arguments(0) >> %HOMEPATH%\SLEEP.VBS
echo WScript.Sleep ms >> %HOMEPATH%\SLEEP.VBS

@REM set cmd font color
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo.

@REM get a script URL
:loop
   echo %ESC%[33mPlease specify a github script to moyu: %ESC%[0m
   set /p scripturl=""
   echo %scripturl% | findstr /r "https://raw.githubusercontent.com/">nul
if errorlevel 1 goto loop
curl %scripturl% -o %HOMEPATH%\.moyu.txt
echo.


@REM get running time
:loop
   echo %ESC%[33mPlease specify a time duration to moyu (minutes): %ESC%[0m
   set /p runningmin=""
   echo %runningmin% | findstr /r "^[1-9][0-9]*$">nul
if %errorlevel% equ 0 goto loop
echo %runningmin%
timeout /t 15 >nul

@REM run
echo %ESC%[33mProceeding to the next step... %ESC%[0m
echo.
for /f "tokens=*" %%s in (%HOMEPATH%\.moyu.txt) do (
  echo %%s
  CSCRIPT %HOMEPATH%\SLEEP.VBS 10 //Nologo
)
echo.
echo %ESC%[32mFinished! %ESC%[0m
echo.


@REM cleanup and exit
echo %ESC%[33mFinalizing and exporting results... %ESC%[0m
timeout /t 15 >nul
echo.
echo %ESC%[32mAll done! %ESC%[0m
CSCRIPT %HOMEPATH%\SLEEP.VBS 300 //Nologo
echo.
del /f %HOMEPATH%\.moyu.txt %HOMEPATH%\SLEEP.VBS
