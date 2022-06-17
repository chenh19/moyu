@ECHO OFF

@REM set cmd font color
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"


@REM get a script URL
echo %ESC%[32mPlease specify a github script to moyu: %ESC%[0m
echo.

set scripturl=https://raw.githubusercontent.com/chenh19/BRStudio/master/BRStudio.R
curl %scripturl% -o %HOMEPATH%\.moyu.txt
echo.



@REM get running time

echo %ESC%[32mTest%ESC%[0m
echo.
echo %ESC%[33mTest%ESC%[0m
echo.


@REM run



@REM cleanup and exit
del /f %HOMEPATH%\.moyu.txt
echo %ESC%[33mFinalizing and exporting results... %ESC%[0m
timeout /t 15 > nul
echo.
echo %ESC%[32mAll done! %ESC%[0m
timeout /t 1 > nul
echo.
